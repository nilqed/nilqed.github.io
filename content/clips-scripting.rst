CLIPS scripting
###############

:date: 2024-12-28 11:20
:modified: 2024-12-28 12:50
:tags: clips
:category: CLIPS
:slug: CLIPS scripting
:author: kfp
:summary: CLIPS scripting with -f2 option.

CLIPS scripting is (limited) possible when using the `-f2` option:

.. code-block:: scheme

    #!/usr/bin/clips -f2

    (printout t Hello crlf)
    (progn (bind ?A (+ 23 2455)) (bind ?B (* ?A  123))
       (printout t Result: ?A ::  ?B crlf))
    (progn (printout t Input "(type something):")
       (bind ?inp (read)) (printout t you_typed: ?inp crlf))
    (exit)



However, binding works only when including the commands in a
`progn` block! 

Recall:  Some operating systems allow additional arguments to be 
specified to a program when it begins execution. When the CLIPS 
executable is started under such an operating system, CLIPS can 
be made to automatically execute a series of commands read directly 
from a file or to load constructs from a file. The command-line 
syntax for starting CLIPS and automatically reading commands or 
loading constructs from a file is as follows

.. code-block:: scheme


   Syntax 
   clips <option>* 
   <option> ::= -f <filename> | -f2 <filename> | -l <filename> 


For the `-f` option, <filename> is a file that contains CLIPS commands. 
If the exit command is included in the file, CLIPS will halt and the 
user is returned to the operating system after executing the commands 
in the file. If an exit command is not in the file, CLIPS will enter 
in its interactive state after executing the commands in the file. 
Commands in the file should be entered exactly as they would be 
interactively (i.e. opening and closing parentheses must be included 
and a carriage return must be at the end of the command). 

The `-f` command line option is equivalent to interactively entering 
a batch command as the first command to the CLIPS prompt.

The `-f2` option is similar to the `-f` option, but is equivalent to 
interactively entering a `batch*` command. The commands stored in 
<filename> are immediately executed, but the commands and their 
return values are not displayed as they would be for a batch command. 
For the `-l` option, <filename> should be a file containing CLIPS constructs. 
This file will be loaded into the environment. The `-l` command line option 
is equivalent to interactively entering a `load` command. Files specified 
using the `–f` option are not processed until the command prompt appears, 
so these files will always be processed after files specified using 
the `–f2` and `–l` options.

