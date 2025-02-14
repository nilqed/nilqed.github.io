SBCL SCRIPTING
##############

:date: 2025-02-14 16:17
:tags: common-lisp, sbcl, scripts, shebang
:category: COMMON-LISP
:slug: SBCL-SCRIPTING
:author: kfp
:summary: SBCL SCRIPTING 

This is an example of a `SBCL` script:


.. code-block:: lisp


    #!/usr/bin/env -S sbcl --script

    (require :uiop)
    (load "~/.sbclrc")

    ;; Load a quicklisp dependency silently.
    (ql:quickload "str" :silent t)

    (format t "~a ~%"  (str:concat "Hello " (uiop:getenv "USER") "!"))

    (defvar arg1 (nth 1 sb-ext:*posix-argv*))
    (defvar arg2 (nth 2 sb-ext:*posix-argv*))

    (format t "First argument: ~a ~%"  arg1 )
    (format t "Second one is : ~a ~%"  arg2 )

    (format t "sb-ext:*posix-argv* ... : ~a ~%"   sb-ext:*posix-argv*)



    ; kfp@omega:~/devel/sbcl-scripts$ ./test1.sh vv 12344
    ; Hello kfp!
    ; First argument: vv
    ; Second one is : 12344
    ; sb-ext:*posix-argv* ... : (sbcl vv 12344)
    
    
        
        
.. image:: content/sbcl-scripting.jpg




