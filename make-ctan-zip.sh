l3build clean

mkdir tlc3-examples
mkdir tlc3-examples/book-pdfs
mkdir tlc3-examples/example-sources

cp BOOK-PDFS/*.pdf tlc3-examples/book-pdfs
cp NORMAL/*  tlc3-examples/example-sources
cp SPECIAL/* tlc3-examples/example-sources
cp SUPPORT/* tlc3-examples/example-sources
cp README.md tlc3-examples

zip -r tlc3-examples-ctan.zip tlc3-examples

rm -r tlc3-examples
