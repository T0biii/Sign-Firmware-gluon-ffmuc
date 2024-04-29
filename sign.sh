#!/bin/sh

print_branch_separator() {
    local branch_length=${#1}  # Länge des Branch-Namens
    local separator_length=128  # Länge der Trennlinie ohne Branch-Namen

    if [ -z "$1" ]; then
        # Wenn der Branch-Name leer ist, erzeuge eine Trennlinie ohne Branch-Namen
        local separator=$(printf '%*s' $separator_length | tr ' ' '-')
    else
        # Berechne die Länge der Trennlinie
        local total_length=$(( (separator_length - branch_length) - 2 ))
        local half_length=$((total_length / 2))

        # Erzeuge die Trennlinie mit dem Branch-Namen in der Mitte
        local separator=$(printf '%*s' $half_length | tr ' ' '-')
        separator="$separator $1 $separator"
    fi

    echo "$separator"
}

#branches
branches="next stable testing experimental"

# "First arg: private key"
secret=$1
echo $secret > secret
#generate publickey out of private key
publickey=$(ecdsakeygen -p < secret)
echo $publickey > publickey

echo "$(print_branch_separator "Public-Key")"
echo $publickey
echo "$(print_branch_separator)" 
ls
for branch in $branches
do
    url=$(cat "url.txt")
    wget "$url/$branch.manifest" >/dev/null 2>&1
    contrib/sigtest.sh $publickey $branch.manifest
    if [ $? -eq 0 ]; then
        echo "$(print_branch_separator $branch)"    
        echo "Der Branch $branch wurde bereits signiert"
        echo "$(print_branch_separator)"
    else
        contrib/sign.sh secret $branch.manifest >/dev/null 2>&1
        contrib/sigtest.sh $publickey $branch.manifest
        if [ $? -eq 0 ]; then
            echo "$(print_branch_separator $branch)"    
            echo $(cat $branch.manifest | tail -1)
            echo "$(print_branch_separator)"   
        else
            echo "$(print_branch_separator $branch)"    
            echo "Fehler beim Signen des Branches $branch"
            echo "$(print_branch_separator)"
        fi
    fi
done
