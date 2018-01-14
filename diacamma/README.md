Docker image for diacamma
===

http://www.diacamma.org/


To run a syndic instance:
```
organisation=your_syndic
mkdir $organisation
docker run -v $(pwd)/${organisation}:/var/lucterios2/${organisation} diacamma ${organisation} syndic
```

The second parameter is optionnal and may be "syndic" or "asso"
