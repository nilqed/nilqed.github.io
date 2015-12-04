
(SDEFUN |IO;writeCodeCell| ((|f| |TextFile|) (|s| |String|) ($ |String|))
        (SPROG ((|h| (|String|)))
               (SEQ (SPADCALL |f| "{" (QREFELT $ 8))
                    (SPADCALL |f| "\"cell_type\" : \"code\"," (QREFELT $ 8))
                    (SPADCALL |f| "\"execution_count\": null," (QREFELT $ 8))
                    (SPADCALL |f| "\"metadata\" : {" (QREFELT $ 8))
                    (SPADCALL |f| "    \"collapsed\" : false" (QREFELT $ 8))
                    (SPADCALL |f| "}," (QREFELT $ 8))
                    (LETT |h|
                          (SPADCALL (LIST "\"source\" : [\"" |s| "\"],")
                                    (QREFELT $ 10))
                          |IO;writeCodeCell|)
                    (SPADCALL |f| |h| (QREFELT $ 8))
                    (SPADCALL |f| "\"outputs\": []" (QREFELT $ 8))
                    (SPADCALL |f| "}" (QREFELT $ 8)) (EXIT |s|)))) 

(SDEFUN |IO;writeMarkdownCell| ((|f| |TextFile|) (|s| |String|) ($ |String|))
        (SPROG ((|h| (|String|)))
               (SEQ (SPADCALL |f| "{" (QREFELT $ 8))
                    (SPADCALL |f| "\"cell_type\" : \"markdown\","
                              (QREFELT $ 8))
                    (SPADCALL |f| "\"metadata\" : {}," (QREFELT $ 8))
                    (LETT |h|
                          (SPADCALL (LIST "\"source\" : [\"" |s| "\"]")
                                    (QREFELT $ 10))
                          |IO;writeMarkdownCell|)
                    (SPADCALL |f| |h| (QREFELT $ 8))
                    (SPADCALL |f| "}" (QREFELT $ 8)) (EXIT |s|)))) 

(SDEFUN |IO;writeHeader| ((|f| |TextFile|) (|nb| |String|) ($ |Boolean|))
        (SPROG ((|h| (|String|)))
               (SEQ (SPADCALL |f| "\"metadata\": {" (QREFELT $ 8))
                    (SPADCALL |f| " \"kernelspec\": {" (QREFELT $ 8))
                    (SPADCALL |f| "  \"display_name\": \"FriCAS\","
                              (QREFELT $ 8))
                    (SPADCALL |f| "  \"language\": \"spad\"," (QREFELT $ 8))
                    (SPADCALL |f| "  \"name\": \"ifricas\"" (QREFELT $ 8))
                    (SPADCALL |f| " }," (QREFELT $ 8))
                    (SPADCALL |f| " \"language_info\": {" (QREFELT $ 8))
                    (SPADCALL |f| "  \"codemirror_mode\": \"spad\","
                              (QREFELT $ 8))
                    (SPADCALL |f| "  \"mimetype\": \"text/x-spad\","
                              (QREFELT $ 8))
                    (SPADCALL |f| "  \"name\": \"SPAD\"," (QREFELT $ 8))
                    (SPADCALL |f| "  \"pygments_lexer\": \"spad\","
                              (QREFELT $ 8))
                    (SPADCALL |f| "  \"version\": \"1.2.6\"" (QREFELT $ 8))
                    (SPADCALL |f| " }," (QREFELT $ 8))
                    (LETT |h|
                          (SPADCALL (LIST " \"name\": \"" |nb| "\"")
                                    (QREFELT $ 10))
                          |IO;writeHeader|)
                    (SPADCALL |f| |h| (QREFELT $ 8))
                    (SPADCALL |f| "}," (QREFELT $ 8))
                    (SPADCALL |f| "\"nbformat\": 4," (QREFELT $ 8))
                    (SPADCALL |f| "\"nbformat_minor\": 0" (QREFELT $ 8))
                    (EXIT 'T)))) 

(SDEFUN |IO;isComment?;SB;4| ((|s| |String|) ($ |Boolean|))
        (COND
         ((OR (< (QCSIZE |s|) 2)
              (NULL
               (OR
                (EQUAL
                 (SPADCALL |s| (SPADCALL 1 2 (QREFELT $ 13)) (QREFELT $ 14))
                 "--")
                (EQUAL
                 (SPADCALL |s| (SPADCALL 1 2 (QREFELT $ 13)) (QREFELT $ 14))
                 "++"))))
          'NIL)
         ('T 'T))) 

(SDEFUN |IO;isContinuation?;SB;5| ((|s| |String|) ($ |Boolean|))
        (SEQ
         (LETT |s| (SPADCALL |s| (SPADCALL 32 (QREFELT $ 18)) (QREFELT $ 19))
               |IO;isContinuation?;SB;5|)
         (EXIT
          (COND
           ((OR (EQUAL |s| "")
                (NULL
                 (|eql_SI| (SPADCALL |s| (QCSIZE |s|) (QREFELT $ 20))
                           (|STR_to_CHAR| "_"))))
            'NIL)
           ('T 'T))))) 

(SDEFUN |IO;combineCont;LS;6| ((|l| |List| (|String|)) ($ |String|))
        (SPROG
         ((|ll| (|List| (|String|))) (|cnt| (|Mapping| (|String|) (|String|))))
         (SEQ
          (LETT |cnt| (CONS #'|IO;combineCont;LS;6!0| $)
                . #1=(|IO;combineCont;LS;6|))
          (LETT |ll| (SPADCALL |cnt| |l| (QREFELT $ 25)) . #1#)
          (EXIT (SPADCALL |ll| (QREFELT $ 10)))))) 

(SDEFUN |IO;combineCont;LS;6!0| ((|x| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (SPADCALL 32 (QREFELT $ 18)) (QREFELT $ 19))
                  "\\n" (QREFELT $ 22))) 

(SDEFUN |IO;escapeQM| ((|s| |String|) ($ |String|))
        (SPROG
         ((|r| (|List| (|String|))) (#1=#:G656 NIL) (|i| NIL) (#2=#:G655 NIL)
          (|esc| (|Mapping| (|String|) (|Character|))))
         (SEQ (LETT |esc| (CONS #'|IO;escapeQM!0| $) . #3=(|IO;escapeQM|))
              (LETT |r|
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |i| 1 . #3#) (LETT #1# (QCSIZE |s|) . #3#) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL (SPADCALL |s| |i| (QREFELT $ 20))
                                             |esc|)
                                   #2#)
                                  . #3#)))
                          (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (EXIT (SPADCALL |r| (QREFELT $ 10)))))) 

(SDEFUN |IO;escapeQM!0| ((|x| NIL) ($ NIL))
        (COND
         ((SPADCALL |x| (SPADCALL "\"" (QREFELT $ 27)) (QREFELT $ 28)) "\\\"")
         ('T (SPADCALL |x| (QREFELT $ 29))))) 

(SDEFUN |IO;inputToNotebook;2S;8| ((|f| |String|) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|l| (|List| (|String|))) (|f2| #1=(|TextFile|))
          (|fo| (|FileName|)) (|f1| #1#) (|fi| (|FileName|)))
         (SEQ
          (LETT |fi| (SPADCALL (STRCONC |f| ".input") (QREFELT $ 31))
                . #2=(|IO;inputToNotebook;2S;8|))
          (EXIT
           (COND
            ((NOT (SPADCALL |fi| (QREFELT $ 32))) (|error| "No such file."))
            (#3='T
             (SEQ (LETT |f1| (SPADCALL |fi| "input" (QREFELT $ 33)) . #2#)
                  (LETT |fo| (SPADCALL (STRCONC |f| ".ipynb") (QREFELT $ 31))
                        . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL |fo| (QREFELT $ 32))
                     (|error| "File already exists."))
                    (#3#
                     (SEQ
                      (LETT |f2| (SPADCALL |fo| "output" (QREFELT $ 33)) . #2#)
                      (SPADCALL |f2| "{" (QREFELT $ 8))
                      (SPADCALL |f2| " \"cells\": [" (QREFELT $ 8))
                      (LETT |l| NIL . #2#)
                      (SEQ G190
                           (COND
                            ((NULL
                              (COND ((SPADCALL |f1| (QREFELT $ 34)) 'NIL)
                                    ('T 'T)))
                             (GO G191)))
                           (SEQ (LETT |s| (SPADCALL |f1| (QREFELT $ 35)) . #2#)
                                (SEQ G190
                                     (COND
                                      ((NULL
                                        (COND
                                         ((SPADCALL |s| (QREFELT $ 21))
                                          (NOT (SPADCALL |f1| (QREFELT $ 34))))
                                         ('T 'NIL)))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |l|
                                            (SPADCALL |l| |s| (QREFELT $ 36))
                                            . #2#)
                                      (EXIT
                                       (LETT |s| (SPADCALL |f1| (QREFELT $ 35))
                                             . #2#)))
                                     NIL (GO G190) G191 (EXIT NIL))
                                (COND
                                 ((SPADCALL |l| NIL (QREFELT $ 37))
                                  (SEQ
                                   (LETT |s|
                                         (SPADCALL
                                          (SPADCALL |l| |s| (QREFELT $ 36))
                                          (QREFELT $ 26))
                                         . #2#)
                                   (EXIT (LETT |l| NIL . #2#)))))
                                (LETT |s| (|IO;escapeQM| |s| $) . #2#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |s| (QREFELT $ 16))
                                   (SEQ
                                    (LETT |s|
                                          (SPADCALL |s|
                                                    (SPADCALL 3 (QCSIZE |s|)
                                                              (QREFELT $ 13))
                                                    (QREFELT $ 14))
                                          . #2#)
                                    (LETT |s|
                                          (|IO;writeMarkdownCell| |f2| |s| $)
                                          . #2#)
                                    (EXIT (SPADCALL |f2| "," (QREFELT $ 8)))))
                                  ((SPADCALL |s| "" (QREFELT $ 38))
                                   (SEQ
                                    (LETT |s| (|IO;writeCodeCell| |f2| |s| $)
                                          . #2#)
                                    (EXIT
                                     (SPADCALL |f2| "," (QREFELT $ 8))))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (|IO;writeCodeCell| |f2| "" $)
                      (SPADCALL |f2| " ]," (QREFELT $ 8))
                      (|IO;writeHeader| |f2| (SPADCALL |fo| (QREFELT $ 39)) $)
                      (SPADCALL |f2| "}" (QREFELT $ 8))
                      (SPADCALL |f1| (QREFELT $ 40))
                      (SPADCALL |f2| (QREFELT $ 40))
                      (EXIT (SPADCALL |fo| (QREFELT $ 39)))))))))))))) 

(DECLAIM (NOTINLINE |InputOutput;|)) 

(DEFUN |InputOutput| ()
  (SPROG NIL
         (PROG (#1=#:G681)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|InputOutput|)
                    . #2=(|InputOutput|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|InputOutput|
                             (LIST (CONS NIL (CONS 1 (|InputOutput;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|InputOutput|)))))))))) 

(DEFUN |InputOutput;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|InputOutput|) . #1=(|InputOutput|))
          (LETT $ (GETREFV 42) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|InputOutput| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|InputOutput| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|String|) (|TextFile|)
              (0 . |writeLine!|) (|List| $) (6 . |concat|) (|Integer|)
              (|UniversalSegment| 11) (11 . SEGMENT) (17 . |elt|) (|Boolean|)
              |IO;isComment?;SB;4| (|Character|) (23 . |char|)
              (28 . |rightTrim|) (34 . |elt|) |IO;isContinuation?;SB;5|
              (40 . |concat|) (|Mapping| 6 6) (|List| 6) (46 . |map|)
              |IO;combineCont;LS;6| (52 . |char|) (57 . =) (63 . |coerce|)
              (|FileName|) (68 . |coerce|) (73 . |exists?|) (78 . |open|)
              (84 . |endOfFile?|) (89 . |readLine!|) (94 . |concat|) (100 . ~=)
              (106 . ~=) (112 . |coerce|) (117 . |close!|)
              |IO;inputToNotebook;2S;8|)
           '#(|isContinuation?| 122 |isComment?| 127 |inputToNotebook| 132
              |combineCont| 137)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 41
                                                 '(2 7 6 0 6 8 1 6 0 9 10 2 12
                                                   0 11 11 13 2 6 0 0 12 14 1
                                                   17 0 11 18 2 6 0 0 17 19 2 6
                                                   17 0 11 20 2 6 0 0 0 22 2 24
                                                   0 23 0 25 1 17 0 6 27 2 17
                                                   15 0 0 28 1 6 0 17 29 1 30 0
                                                   6 31 1 30 15 0 32 2 7 0 30 6
                                                   33 1 7 15 0 34 1 7 6 0 35 2
                                                   24 0 0 6 36 2 24 15 0 0 37 2
                                                   6 15 0 0 38 1 30 6 0 39 1 7
                                                   0 0 40 1 0 15 6 21 1 0 15 6
                                                   16 1 0 6 6 41 1 0 6 24
                                                   26)))))
           '|lookupComplete|)) 

(MAKEPROP '|InputOutput| 'NILADIC T) 
