from debian:stretch

RUN apt-get update && apt-get install curl -y
RUN curl -o /tmp/Diacamma_setup.tar.gz http://www.sd-libre.fr/download/Diacamma_setup.tar.gz
RUN cd /tmp && tar zxvf /tmp/Diacamma_setup.tar.gz
RUN /tmp/Diacamma/install.sh
RUN cd /var/lucterios2 \
    && . virtual_for_lucterios/bin/activate \
    && pip install gunicorn psycopg2-binary
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
