# Docker image for diacamma

http://www.diacamma.org/

Here are environment possible values

| var                   | possible values               | default              | description                                        |
|:----------------------|:------------------------------|:---------------------|:---------------------------------------------------|
| DIACAMMA_TYPE         | syndic, asso                  | asso                 | run a diacamma-syndic or diacamma-asso instance    |
| DIACAMMA_ORGANISATION | any string (no space allowed) | N/A                  | name for your Diacamma instance                                 |
| DIACAMMA_DATABASE     | Refer to Database Section     | SQLite used if empty | connection string to the database used by DIACAMMA |

## Databases

### Use SQLite Database
This is the default behaviour for Diacamma
```bash
organisation=your_syndic
mkdir $organisation
docker run -v $(pwd)/${organisation}:/var/lucterios2/${organisation} \
       -e DIACAMMA_TYPE=syndic \
       -e DIACAMMA_ORGANISATION=$organisation \
       -p 8100 \
       mgodlewski/diacamma
```

### Use PostgreSQL Database
```bash
organisation=your_syndic
mkdir $organisation
docker run -v $(pwd)/${organisation}:/var/lucterios2/${organisation} \
       -e DIACAMMA_TYPE=syndic \
       -e DIACAMMA_ORGANISATION=$organisation \
       -e DIACAMMA_DATABASE="PostGreSQL:name=<dbname>,user=<dbuser>,password=<dbpass>,host=<dbhost>" \
       -p 8100 \
       mgodlewski/diacamma
```

### Use MySQL Database
```bash
organisation=your_syndic
mkdir $organisation
docker run -v $(pwd)/${organisation}:/var/lucterios2/${organisation} \
       -e DIACAMMA_TYPE=syndic \
       -e DIACAMMA_ORGANISATION=$organisation \
       -e DIACAMMA_DATABASE="MySQL:name=<dbname>,user=<dbuser>,password=<dbpass>,host=<dbhost>" \
       -p 8100 \
       mgodlewski/diacamma
```
