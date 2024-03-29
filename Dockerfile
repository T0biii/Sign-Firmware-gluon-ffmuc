FROM ghcr.io/freifunk-gluon/gluon-build:v2023.2.2
ARG version=v2023.2.2

#Download contrib Items
RUN mkdir contrib && cd contrib && wget https://github.com/freifunk-gluon/gluon/blob/$version/contrib/sign.sh && wget https://github.com/freifunk-gluon/gluon/blob/$version/contrib/sigtest.sh && chmod +x sign.sh && chmod +x sigtest.sh

COPY ./sign.sh /
ENTRYPOINT ["/sign.sh"]