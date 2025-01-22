FriCAS SIXEL OUTPUT
###################

:date: 2025-01-04 13:18
:tags: fricas, sixel
:category: FRICAS
:slug: FriCAS SIXEL
:author: kfp
:summary: FriCAS to SIXEL (posix).

This new script `fricas2sixel` should be posix compliant now
(see the PR on  https://github.com/nilqed/sixelSPAD)

.. code-block:: shell

        #!/bin/sh
        
        usage()
        {
        printf '%s\n' "This is fricas2sixel V 1.0.2 :: (posix, TeX Live)
        
        Usage: $0 [OPTION]... TEXSTRING
        Options are chosen to be similar to dvips' options where possible:
        
          -D #         Output resolution
          -O c         Image offset
          -T c         Image size (also accepts '-T bbox' and '-T tight')
        
          -bg s        Background color (TeX-style color or 'Transparent')
          -fg s        Foreground color (TeX-style color)
        
          -h | --help  Help
        
          # = number   s = string
          c = comma-separated dimension pair (e.g., 3.2in,-32.1cm)
        
          TEXSTRING is a LaTeX expression betweeen apostrophes (not quotes).
          Examples: '\$\alpha\$' | '\LaTeX' | 'This is math: \$x+y\$'.
        
        Required applications: latex, dvipng, img2sixel.
        Terminals supporting sixel graphics: xterm -ti vt340, mintty, mlterm and more."
        }
        
        [ $# -eq 0 ] && { usage;exit; };
        [ "$1" = -h ] || [ "$1" = --help ] && { usage;exit; };
        
        #
        # config (default)
        #
        pt=11pt
        fg=Green
        bg=Black
        D=150  #120
        T=bbox  #bbox,tight ...
        O=-1.0cm,-2.0cm
        img="$(mktemp latex2sixel_XXXXXX)"
        jobname="$(mktemp latex2sixel_XXXXXX)"
        
        trap 'rm "$img" "$jobname" "$jobname.aux" "$jobname.dvi" "$jobname.log"' EXIT INT
        
        #
        # option parsing
        #
        while [ $# -gt 1 ]; do
        arg="$1"
        
        case $arg in
            -D|--resolution)
            D="$2"
            shift # past argument
            ;;
            -O|--offset)
            O="$2"
            shift # past argument
            ;;
            -T|--size)
            T="$2"
            shift # past argument
            ;;
            -fg|--forecolor)
            fg="$2"
            ;;
            -bg|--backcolor)
            bg="$2"
            ;;
            *)
                    # unknown option
            ;;
        esac
        shift # past argument or value
        done
        
        
        #
        # TeX
        #
        
        texsrc="$1"
        
        TEX="\documentclass[$pt]{article}
        \usepackage{amsmath,amssymb}
        \usepackage{breqn}
        \pagestyle{empty}
        \def\sp{^}\def\sb{_}\def\leqno(#1){}
        \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
        \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
        \def\csch{\mathrm{csch}}
        \begin{document}
         \begin{math} $texsrc \end{math}
        \end{document}"
        TEX="$(printf '%s\n' "$TEX" | tr '\n' ' ')"
        
        LATEX="latex -jobname=$jobname -interaction=nonstopmode"
        DVIPNG="dvipng -T $T -D $D -O $O -fg $fg -bg $bg -q -o $img"
        
        printf '%s\n' "$TEX" | $LATEX > /dev/null 2>&1
        $DVIPNG "$jobname.dvi" > /dev/null 2>&1
        img2sixel "$img"
        

The following function can then be used to display sixel graphics in a 
FriCAS session (e.g. including in `.fricas.input`):

.. code-block:: python

    sixel(x:TexFormat):Void == 
      cmd:="system fricas2sixel -T 10,0.8 -bg Black -D 120 -fg Orange '"
      systemCommand(cmd tex(x).1 "'")

Note that one has to use `)frame next` when in x-mode and the function
is included in  `.fricas.input`.  (not necessary with `-nosman`).


.. image:: content/fricas2sixel0.png

It also works in `domterm` for example, however, one should adjust the
parameters like size and color for nicer output:

.. image:: content/domterm_sixel.png

How this can accomplished is described at
https://github.com/nilqed/latex2sixel.





