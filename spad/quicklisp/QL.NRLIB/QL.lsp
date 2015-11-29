
(PUT '|QL;quickLoad;SSe;1| '|SPADreplace| 'QUICKLOAD) 

(SDEFUN |QL;quickLoad;SSe;1| ((|s| |String|) ($ |SExpression|)) (QUICKLOAD |s|)) 

(PUT '|QL;qlApropos;SSe;2| '|SPADreplace| 'SYSTEM-APROPOS) 

(SDEFUN |QL;qlApropos;SSe;2| ((|s| |String|) ($ |SExpression|))
        (SYSTEM-APROPOS |s|)) 

(PUT '|QL;qlUninstall;SSe;3| '|SPADreplace| 'UNINSTALL) 

(SDEFUN |QL;qlUninstall;SSe;3| ((|s| |String|) ($ |SExpression|))
        (UNINSTALL |s|)) 

(PUT '|QL;qlUpdateAll;Se;4| '|SPADreplace| 'UPDATE-ALL-DISTS) 

(SDEFUN |QL;qlUpdateAll;Se;4| (($ |SExpression|)) (UPDATE-ALL-DISTS)) 

(PUT '|QL;qlUpdateClient;Se;5| '|SPADreplace| 'UPDATE-CLIENT) 

(SDEFUN |QL;qlUpdateClient;Se;5| (($ |SExpression|)) (UPDATE-CLIENT)) 

(PUT '|QL;qlWhoDependsOn;SSe;6| '|SPADreplace| 'WHO-DEPENDS-ON) 

(SDEFUN |QL;qlWhoDependsOn;SSe;6| ((|s| |String|) ($ |SExpression|))
        (WHO-DEPENDS-ON |s|)) 

(DECLAIM (NOTINLINE |QuickLisp;|)) 

(DEFUN |QuickLisp| ()
  (SPROG NIL
         (PROG (#1=#:G709)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|QuickLisp|)
                    . #2=(|QuickLisp|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|QuickLisp|
                             (LIST (CONS NIL (CONS 1 (|QuickLisp;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|QuickLisp|)))))))))) 

(DEFUN |QuickLisp;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|QuickLisp|) . #1=(|QuickLisp|))
          (LETT $ (GETREFV 14) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|QuickLisp| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|QuickLisp| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|SExpression|) (|String|)
              |QL;quickLoad;SSe;1| |QL;qlApropos;SSe;2| |QL;qlUninstall;SSe;3|
              |QL;qlUpdateAll;Se;4| |QL;qlUpdateClient;Se;5|
              |QL;qlWhoDependsOn;SSe;6|)
           '#(|quickLoad| 0 |qlWhoDependsOn| 5 |qlUpdateClient| 10
              |qlUpdateAll| 14 |qlUninstall| 18 |qlApropos| 23)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 13
                                                 '(1 0 6 7 8 1 0 6 7 13 0 0 6
                                                   12 0 0 6 11 1 0 6 7 10 1 0 6
                                                   7 9)))))
           '|lookupComplete|)) 

(MAKEPROP '|QuickLisp| 'NILADIC T) 
