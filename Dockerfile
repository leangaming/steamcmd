FROM vimalathithen/alpine-glibc-x86:latest
LABEL maintainer "Karolis Stasaitis <contact@carlossless.io>"

RUN adduser steam -D

WORKDIR /home/steam

RUN \
    apk add --no-cache curl bash ca-certificates libstdc++ && \
    su steam -c "\
    curl -sSL \"https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\" | tar zxvf - && \
    ./steamcmd.sh +quit\
    " && \
    apk del curl

USER steam
