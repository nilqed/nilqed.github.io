#!/bin/sh
#version: Di 14 Apr 2026 15:28:08 CEST

# after "make book"
# in $build/src/doc/tmp
# one *has* to copy fricas/src/doc/*.tex and *.sty to $build/src/doc/tmp
# e.g. cp -v *.tex ~/devel/fricas-build/src/doc/tmp/ 

# if: Command 'pstoimg' not found, but can be installed with:
# sudo apt install latex2html

# If you have dark mode your OS will provoke in book.css:
# @media (prefers-color-scheme: dark) { img[src^="book"]{filter: invert(1); } }
# , so that you
# probably will se the svg images blank (only apparently, they aren't):
# Remove this, or choose 'light' instead of 'dark'.


# convert the image(s).ps to png
#for a in *.VIEW; do 
#  pstoimg -type png -crop a -scale 3 $a/image.ps -out $(basename $a .VIEW)-.png ;
#done

# create 'phtml' dir for output
mkdir -p ./phtml

# make the html files from book.tex
make4ht -f html5+dvisvgm_hashes -c fbook.cfg -d ./phtml book.tex "pic-m,pic-equation,svg,frames,section+,Gin-percent" 


# save this script to ./phtml where book.html is.
cp -v pbook2html_hashes.sh ./phtml
cp -v ./phtml/book.css ./phtml/book.css_backup

sed -i 's/dark/\blight/g' ./phtml/book.css 
echo =========> opening book ...
open ./phtml/book.html

