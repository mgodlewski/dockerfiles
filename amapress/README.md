# Amapress

[Amapress](https://amapress.fr/) est une extension Wordpress qui permet de gérer une amap

[Wordpress](https://docs.docker.com/samples/library/wordpress/) nécessite une base Mysql pour fonctionner. Voici un docker-compose.yml permettant d'instancier l'ensemble :

```yaml
version: '3.1'

services:

  amapress:
    image: mgodlewski/amapress
    restart: always
    ports:
      - 8080:80
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: exampleuser
      WORDPRESS_DB_PASSWORD: examplepass
      WORDPRESS_DB_NAME: exampledb

  db:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_DATABASE: exampledb
      MYSQL_USER: exampleuser
      MYSQL_PASSWORD: examplepass
      MYSQL_RANDOM_ROOT_PASSWORD: '1'
```

Il faut activer l'extension dans l'interface d'administration.
