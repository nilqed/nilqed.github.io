#!/bin/sh
#version: 13-APR-2026 13:50

# after "make book"
# in $build/src/doc/tmp

# convert the image(s).ps to png
for a in *.VIEW; do 
  pstoimg -type png -crop a -scale 3 $a/image.ps -out $(basename $a .VIEW)-.png ;
done

# create 'html' dir for output
mkdir -p ./html


# write the mathjax config file (needed by make4ht)
cat <<'CFG' > ht_mathjax.cfg
\Preamble{xhtml} 
\Configure{MathJaxConfig}{{ 
    output: {
      displayOverflow: 'linebreak',  
      linebreaks: {                  
      automatic: true,                  
      width: 'container',                  
    }, scale: 0.7}
}} 
\Configure{MathJaxMacros}{mathjax_macros.tex} 
\begin{document} 
\EndPreamble
CFG

# write the mathjax macros file
cat <<'MJM' > mathjax_macros.tex
%%%% mathjax needs its own macros / 12-APR-2026 
\def\relax{}
\def\linebreak{}
\def\setcounter{}
\def\ensuremath{}
\def\FUNCTION#1#2{#1\mathopen{}\PAREN{#2}\mathclose{}}
\def\EulerE{e}
\def\ImaginaryI{i}
\def\csch{\operatorname{csch}}
\def\erf{\operatorname{erf}}
\def\coloneqq{\mathrel{:\mkern-1.2mu=}}
\def\embrace#1#2#3{\left#1\relax#3\right#2\relax}
\def\BRACE{\embrace{\{}{\}}}
\def\BRACKET{\embrace{[}{]}}
\def\PAREN{\embrace{(}{)}}
\def\ZAG#1#2{\frac{\left.{#1}\right|}{\left|{#2}\right.}}
\def\QUOTE#1{\texttt{'}#1}
\def\BOX#1{\boxed{#1}}
\def\SEGMENTi#1{{#1}\operatorname{..}}
\def\SEGMENTii#1#2{{#1}\operatorname{..}{#2}}
\def\SUB#1#2{{{#1}_{#2}}}
\def\SUPER#1#2{{{#1}^{#2}}}
\def\SLASH#1#2{\left.#1\vphantom{{#1}{#2}}\right/ #2}
\def\PRIMEx#1{{#1}\endgroup}
\def\OVERLABEL#1{\FUN{OVERLABEL}(#1)}
\def\REM#1#2{{#1}\mathbin{\mathrm{rem}}{#2}}
\def\QUO#1#2{{#1}\mathbin{\mathrm{quo}}{#2}}
\def\EXQUO#1#2{{#1}\mathbin{\mathrm{exquo}}{#2}}
\def\EQUATNUM#1#2{(#1)\qquad #2}
\def\COMMA{,\linebreak\:}
\def\SEMICOLON{;\:}
\def\TIMES{\,}
\def\theMap#1{\FUN{theMap}(\FUN{#1})}
\def\ALTSUPERSUB#1#2{\tensor*{#1}{*#2}}
\def\SCRIPTS#1#2#3#4#5{\tensor*[^{#4}_{#5}]{#1}{_{#2}^{#3}}}
\def\PRIME#1{\begingroup% redefinitions are only local
     {#1}%
     % for the second parameter redefine \STRING and \PAREN
     \def\PAREN{\def\STRING{\embrace{(}{)}}}%
     \def\STRING{\begingroup\lccode`\~=`\,\lowercase{\endgroup\def~{\prime}}}%
     ^\PRIMEx}
\def\DefSpecialChars{
     \def\^{{\tiny\ensuremath{^{\wedge}}}}
     \def\\{\ensuremath{\backslash}}
     \def\~{\char`~}}
\def\FUN#1{{\DefSpecialChars\DEFOPNAME#1\ENDDEFOPNAME\OPNAME{#1}}}%
\def\DEFOPNAME#1#2\ENDDEFOPNAME{\def\arg{#2}
   \ifx\arg\empty\def\OPNAME{}\else\def\OPNAME{\operatorname}\fi}
%\def\STRING#1{\texttt{\DefSpecialChars #1}}
%\def\SYMBOL#1{{\DefSpecialChars #1}}
\def\STRING#1{\text{#1}}
\def\SYMBOL#1{#1}


\newenvironment{MATRIX}[1]
     {\setcounter{MaxMatrixCols}{#1}\begin{bmatrix}}{\end{bmatrix}}
\newenvironment{PILE}{\begin{array}[t]{l}}{\end{array}}
\newenvironment{VCONCAT}{\begin{array}{c}}{\end{array}}

%\newenvironment{equation}{}{}
\newenvironment{displaymath}{}{}
MJM


# make the html files from book.tex
make4ht -d ./html  -c ./ht_mathjax.cfg book.tex "mathjax"

# cd html / open book.html

