FROM wordpress

RUN curl -L -o /tmp/amapress.tar.gz https://github.com/comptoirdesappli/amapress/archive/0.68.15.tar.gz \
  && mkdir -p /var/www/html/wp-content/plugins \
  && tar zxf /tmp/amapress.tar.gz -C /usr/src/wordpress/wp-content/plugins \
  && rm /tmp/amapress.tar.gz

#RUN wp plugin install https://github.com/comptoirdesappli/amapress/archive/0.68.15.zip

