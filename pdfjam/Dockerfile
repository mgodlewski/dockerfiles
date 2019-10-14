FROM debian:stretch

RUN apt update && apt install -y texlive-extra-utils

WORKDIR /work

ENTRYPOINT /usr/bin/pdfjam $*

