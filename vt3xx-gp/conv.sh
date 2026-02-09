#!/bin/bash

for a in *.html; do 
  pandoc --from=html --to=rst $a > ./rst/$(basename $a .html).rst;
done