#!/bin/sh
#branches
branches="next stable testing experimental"

# "First arg: private key"
secret=$1
echo $secret > secret
#generate publickey out of private key
publickey=$(ecdsakeygen -p < secret)
echo $publickey > publickey

for branch in $branches
do
    wget "https://firmware.ffmuc.net/$branch/sysupgrade/$branch.manifest" >/dev/null 2>&1
    contrib/sign.sh secret $branch.manifest >/dev/null 2>&1
    contrib/sigtest.sh publickey $branch.manifest >/dev/null 2>&1
    echo ------------------------------------------------------------ $branch ------------------------------------------------------------
    echo $(cat $branch.manifest | tail -1)
    echo ------------------------------------------------------------------------------------------------------------------------
done