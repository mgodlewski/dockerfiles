FROM wordpress

RUN curl -L -o /tmp/amapress.tar.gz https://github.com/comptoirdesappli/amapress/archive/0.68.15.tar.gz \
  && tar zxf /tmp/amapress.tar.gz -C /usr/src/wordpress/wp-content/plugins \
  && rm /tmp/amapress.tar.gz

