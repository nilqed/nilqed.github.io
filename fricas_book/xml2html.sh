#!/bin/bash

for a in *.xhtml;  do b=$(basename $a .xhtml); 
  pandoc -f html -t html5 -s $a > $b.html ; done

