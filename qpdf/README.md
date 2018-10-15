# qpdf

(QPDF)[http://qpdf.sourceforge.net/] is a command-line program that does structural, content-preserving transformations on PDF files. 

Usage:

```
docker run --user $UID:$GROUPS --rm -v $(pwd):/work mgodlewski/qpdf --decrypt input.pdf output.pdf
```
