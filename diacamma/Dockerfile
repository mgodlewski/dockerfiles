FROM debian:stretch

RUN apt-get update && \
    apt-get install -y \
        curl \
        default-libmysqlclient-dev \
        locales \
        locales-all && \
    rm -rf /var/lib/apt/lists/*

RUN locale-gen fr_FR.UTF-8

ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR:fr
ENV LC_ALL fr_FR.UTF-8

ENV ASSO_VERSION_CONSTRAINT=""
ENV SYNDIC_VERSION_CONSTRAINT=""
ENV LUCTERIOS_VERSION_CONSTRAINT=""

RUN curl --location -o /tmp/Diacamma_setup.tar.gz http://www.sd-libre.fr/download/Diacamma_setup.tar.gz && \
    cd /tmp && \
    tar zxvf /tmp/Diacamma_setup.tar.gz && \
    apt-get update && \
    /tmp/Diacamma/install.sh -p "diacamma-asso${ASSO_VERSION_CONSTRAINT} diacamma-syndic${SYNDIC_VERSION_CONSTRAINT} lucterios-standard${LUCTERIOS_VERSION_CONSTRAINT}" && \
    rm -rf /var/lib/apt/lists/*

RUN cd /var/lucterios2 && \
    . virtual_for_lucterios/bin/activate && \
    pip install gunicorn psycopg2-binary mysqlclient

COPY entrypoint.sh /
COPY getCurrentVersion.sh /
ENTRYPOINT ["/entrypoint.sh"]

