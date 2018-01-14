from debian:jessie

RUN apt-get update && apt-get install curl -y
RUN curl -o /tmp/Diacamma_setup.tar.gz http://www.sd-libre.fr/download/Diacamma_setup.tar.gz
RUN cd /tmp && tar zxvf /tmp/Diacamma_setup.tar.gz
RUN /tmp/Diacamma/install.sh
COPY var/lucterios2/manage_any.py /var/lucterios2/manage_any.py
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
