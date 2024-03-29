FROM ghcr.io/freifunk-gluon/gluon-build:v2023.2.2

#Download contrib Items
RUN git clone https://github.com/freifunk-gluon/gluon/ && cd gluon && git checkout v2023.2.2 && cd .. && cp gluon/contrib . -R && rm gluon/ -R -f

COPY ./sign.sh /
ENTRYPOINT ["/sign.sh"]