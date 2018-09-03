# Docker image for diacamma

http://www.diacamma.org/

Here are environment possible values

| var                   | possible values               | default              | description                                        |
|:----------------------|:------------------------------|:---------------------|:---------------------------------------------------|
| DIACAMMA_TYPE         | syndic, asso                  | asso                 | run a diacamma-syndic or diacamma-asso instance    |
| DIACAMMA_ORGANISATION | any string (no space allowed) | N/A                  | name for your Diacamma instance                                 |
| DIACAMMA_DATABASE     | Refer to Database Section     | SQLite used if empty | connection string to the database used by DIACAMMA |

## Building with sticked version

You can build an image with forced version of each component.
| Component         | default constaint | package                                              |
|:------------------|:------------------|:-----------------------------------------------------|
|diacamma-asso      | empty (latest)    | https://pypi.org/project/diacamma-asso/#history      |
|diacamma-syndic    | empty (latest)    | https://pypi.org/project/diacamma-syndic/#history    |
|lucterios-standard | empty (latest)    | https://pypi.org/project/lucterios-standard/#history |

Constraint have to be compatible with pip install syntax (refer to https://www.python.org/dev/peps/pep-0440/#version-specifiers for more infos)

### Example
```bash
docker build -e ASSO_VERSION_CONSTRAINT="==2.3.0.18070322" -e SYNDIC_VERSION_CONSTRAINT="==2.3.0.18073020" LUCTERIOS_VERSION_CONSTRAINT="==2.3.0.18070322" .
```

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
