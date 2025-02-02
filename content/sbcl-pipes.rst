SBCL PIPES
##########

:date: 2025-02-02 15:52
:tags: common-lisp, sbcl, pipes
:category: COMMON-LISP
:slug: SBCL-PIPES
:author: kfp
:summary: SBCL PIPES (demo: REDUCE server, psl)

This is an example REDUCE web server using `Hunchentoot` and `SBCL`'s
`sb-ext:run-program` : 

.. code-block:: lisp

        #+SBCL
        (load "~/quicklisp/setup")
        (ql:quickload :hunchentoot)
        
        (defpackage redsrv
            (:use common-lisp)
            (:documentation "see docs"))
        
        (in-package :redsrv)
        
        (defparameter itups internal-time-units-per-second)
        
        (defun delta-time (timestamp)
          "Delta time <== internal-real-time - timestamp in seconds"
          (/ (- (get-internal-real-time) timestamp) itups))
        
        
        
        (defun makepipe (app &optional args)
          (let ((proc (sb-ext:run-program app args
                             :input :stream
                             :output :stream
                             :wait nil
                             :search t)))
          (when proc
            (make-two-way-stream (sb-ext:process-output proc)
                                 (sb-ext:process-input proc)))))
        
        
        (defun readpipe (stream)
          (force-output stream)
          (with-output-to-string (out)
            (loop
               for c = (read-char-no-hang stream)
               while c do (write-char c out))))
        
        (defun readpipe-complete (stream)
          "Read pipe until empty."
          (setq c (readpipe stream))
          (setq cc c)
          (loop until (equal c "") do 
            (progn
              (sleep 0.1)
              (setq c (readpipe stream))
              (setq cc (concatenate 'string cc c))
              (force-output stream)))
             cc)
        
        (defun readpipe-timeout (stream timeout)
          "Read pipe until empty or timeout in seconds."
          (setq c (readpipe stream))
          (setq cc c)
          (setq timestamp (get-internal-real-time))
          (loop until (or (equal c "") (> (delta-time timestamp) timeout)) do 
            (progn
              (sleep 0.1)
              (setq c (readpipe stream))
              (setq cc (concatenate 'string cc c))
              (force-output stream)))
             (if (equal c "") cc nil))
        
        
        (defun writepipe (stream data)
            (format stream "~a~%" data)
            (finish-output stream))
        
        
        (defun take-from-end (str n)
          "Return the last n characters or nil"
          (let ((l (length str)))
            (if (> l n) (subseq str (- l n)) nil)))
        
        ;;; REDUCE (psl)
        (defvar red nil)
        (defparameter *timeout* 5)
        (defparameter *port* 4242)
        
        (defun redget ()
          (readpipe-timeout red *timeout*))
        
        (defun redput (data)
          (writepipe red data))
        
        (defun redeval (code)
          (writepipe red code)
          (readpipe-timeout red *timeout*))
        
        
        (setq red (makepipe "redpsl.bat"))
        
        (hunchentoot:define-easy-handler (reduce-eval :uri "/eval") (code)
          (setf (hunchentoot:content-type*) "text/plain")
          (format nil "~A~%" (redeval code)))
        
        (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port *port*))
        
        
        
        ;;;; TEST
        ;;(setq cmd (makepipe "cmd"))
        ;;(readpipe cmd)
        ;;(writepipe cmd "dir")
        ;;(readpipe-complete cmd)
        ;;(readpipe-timeout cmd 1)
        ;;  (SETQ CMD (MAKEPIPE "redpsl.bat"))
        ;; http://localhost:4242/eval?code=df(y**4*sin%20y,y,2);
        
        
        #|
        * (redget)
        "Loading image file: C:\\Program Files\\Reduce\\bin\\..\\lib\\psl\\red\\reduce.img 
        Reduce (Free PSL version, revision 5847), 16-Jul-2021 ...
        
        1: "
        * (redget)
        ""
        * (redput "x:=123456;")
        NIL
        * (redget)
        "
        x := 123456
        
        2: "
        * (redput "load_package \"tri\"; ")
        NIL
        * (redget)
        "% TeX-REDUCE-Interface 0.71
        % set greek asserted
        % set lowercase asserted
        % set Greek asserted
        % set Uppercase asserted
        % \\tolerance 10
        % \\hsize=150mm
        
        3: "
        * (redput "on tex;")
        NIL
        * (redget)
        "
        4: "
        * (redput "x;")
        NIL
        * (redget)
        "$$
        123456
        $$
        
        5: "
        * (redput "bye;")
        NIL
        * (redget)
        
        debugger invoked on a END-OF-FILE in thread
        #<THREAD "main thread" RUNNING {10012E0613}>:
          end of file on #<SB-SYS:FD-STREAM for "descriptor 212" {10044A2A83}>
        
        Type HELP for debugger help, or (SB-EXT:EXIT) to exit from SBCL.
        
        restarts (invokable by number or by possibly-abbreviated name):
          0: [ABORT] Exit debugger, returning to top level.
        
        (SB-IMPL::INPUT-CHAR/CP1252 #<SB-SYS:FD-STREAM for "descriptor 212" {10044A2A83}> T NIL)
        0] 0
        
        * (quit)
        |#
        
        
        

Jupyter (juCL)
==============

Also working in the `juCL <https://github.com/nilqed/juCL>`_ Jupyter kernel or 
the `TeXmacs plugin <https://github.com/nilqed/sbcl>`_.

        
.. image:: content/jucl-redpsl-pipe.jpg




