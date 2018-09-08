# Nginx docker always returning 503

This image run an nginx server listening:
* on port 80, always returning a http code 503 (Service temporarly unavailable)
* on port 8080, always returning a http code 200 (for health check)

  docker run -p 80:80 -p 8080:8080 -d mgodlewski/503

