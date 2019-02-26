FROM openjdk:8

RUN wget -q http://amapj.fr/dist/amapj-dist-V024.zip -O /tmp/amapj.zip \
  && unzip /tmp/amapj.zip -d /opt/test-amapj/ \
  && rm /tmp/amapj.zip

ENV JRE_HOME=/docker-java-home/jre

RUN chmod 755 /opt/test-amapj/apache-tomcat/bin/*.sh
WORKDIR /opt/test-amapj/apache-tomcat/bin

EXPOSE 8080/tcp

CMD sh catalina.sh run

