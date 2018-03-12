Docker image for diacamma
===

http://www.diacamma.org/


To run a syndic instance:
```
organisation=your_syndic
mkdir $organisation
docker run -v $(pwd)/${organisation}:/var/lucterios2/${organisation} \
       -e DIACAMMA_TYPE=syndic \
       -e DIACAMMA_ORGANISATION=$organisation \
       -e DIACAMMA_DATABASE="PostGreSQL:name=<dbname>,user=<dbuser>,password=<dbpass>,host=<dbhost>" \
       -p  8100 \
       mgodlewski/diacamma
```

DIACAMMA_TYPE is optional, may be "syndic" or "asso" (default value: "asso")
DIACAMMA_DATABASE is optional, sqlite database is created if undefined

