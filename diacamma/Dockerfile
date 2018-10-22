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

COPY entrypoint.d/ /entrypoint.d/
COPY bin/backup.sh /usr/local/bin/backup
COPY bin/restore.sh /usr/local/bin/restore
COPY bin/version.sh /usr/local/bin/version

RUN chmod +x /entrypoint.d/entrypoint.sh \
    /usr/local/bin/backup \
    /usr/local/bin/restore \
    /usr/local/bin/version

VOLUME [ "/backups" ]

ENTRYPOINT [ "/entrypoint.d/entrypoint.sh" ]
CMD [ "run" ]
