docker build --no-cache -t gluon:sign .
#pass private key
docker run --rm -it gluon:sign $1