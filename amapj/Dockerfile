FROM openjdk:8

RUN wget -q http://amapj.fr/dist/amapj-dist-V024.zip -O /tmp/amapj.zip \
  && unzip /tmp/amapj.zip -d /opt/amapj/ \
  && mkdir /opt/amapj/backup \
  && rm /tmp/amapj.zip

ENV JRE_HOME=/docker-java-home/jre

RUN chmod 755 /opt/amapj/apache-tomcat/bin/*.sh


RUN apt-get update && apt-get install -y xvfb wkhtmltopdf \
  && echo -e '#!/bin/bash\nxvfb-run -a --server-args="-screen 0, 1024x768x24" /usr/bin/wkhtmltopdf -q $*' > /usr/bin/wkhtmltopdf-headless \
  && chmod a+x /usr/bin/wkhtmltopdf-headless \
  && sed -i '8i <Parameter name="wkhtmltopdf" value="/usr/bin/wkhtmltopdf-headless"  />' /opt/amapj/apache-tomcat/conf/Catalina/localhost/amapj.xml


WORKDIR /opt/amapj/apache-tomcat/bin

EXPOSE 8080/tcp

CMD sh catalina.sh run

