FROM debian:stretch-slim

RUN apt update && apt install -y qpdf

WORKDIR /work

ENTRYPOINT ["/usr/bin/qpdf"]

