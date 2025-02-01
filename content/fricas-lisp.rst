FriCAS+LISP
###########

:date: 2025-02-01 10:50
:tags: fricas, common-lisp, scite
:category: FRICAS
:slug: FriCAS-CL
:author: kfp
:summary: FriCAS LISP (demo)

FriCAS CL interaction examples (\*.input):

.. code-block:: shell

	lisp s == EVAL(READ_-FROM_-STRING(s)$Lisp)$Lisp

	r:=lisp "(list 1 2 3 'a)" --> (1 2 3 A), Type: SExpression
	car r --> 1
	cdr r --> (2 3 A)
	#r --> 4

	destruct r -->  [1, 2, 3, A]
	list? r --> true

	map(integer?$SEX,destruct r) --> [true, true, true, false]
 
	map(integer, destruct r)

	map(integer, [i for i in destruct r | integer? i]) -->  [1, 2, 3]
	-->  conversion to Type: List(Integer) !!

	f:=lisp "(defun f(x y) (- (+ (* x x) (* y y)) (* x y)))" --> F
	symbol? f --> true

	F(1,2)$Lisp --> 3
	F(10,20)$Lisp --> 300

	-- notice the difference f vs. |f|
	ff:=lisp "(defun |f|(x y) (- (+ (* x x) (* y y)) (* x y)))" --> f
	f(20,30)$Lisp --> 700

	FORMAT('NIL,"Hello")$Lisp --> "Hello", Type: SExpression
	FORMAT('T,"Hello")$Lisp --> (), but prints --  Hello -- to stdout
	FORMAT('NIL,"Hello ~A",123)$Lisp --> "Hello 123"
	(FORMAT$Lisp) ('NIL,"Hello") --> works as well

	lisp "*package*" -->  #<PACKAGE "BOOT">
	lisp "(get-universal-time)" -->  3947354723


SExpression
-----------

.. code-block:: python

	(7) -> )sh SEX
	SExpression is a domain constructor.
 	Abbreviation for SExpression is SEX
 	This constructor is not exposed in this frame.
 	25 Names for 30 Operations in this Domain.
	------------------------------- Operations --------------------------------

 	#? : % -> Integer                     ?=? : (%, %) -> Boolean
 	atom? : % -> Boolean                  car : % -> %
 	cdr : % -> %                          coerce : % -> OutputForm
 	convert : DoubleFloat -> %            convert : Integer -> %
 	convert : List(%) -> %                convert : String -> %
 	convert : Symbol -> %                 destruct : % -> List(%)
 	elt : (%, Integer) -> %               elt : (%, List(Integer)) -> %
 	eq : (%, %) -> Boolean                float : % -> DoubleFloat
 	float? : % -> Boolean                 hash : % -> SingleInteger
 	integer : % -> Integer                integer? : % -> Boolean
 	latex : % -> String                   list? : % -> Boolean
 	null? : % -> Boolean                  pair? : % -> Boolean
 	string : % -> String                  string? : % -> Boolean
 	symbol : % -> Symbol                  symbol? : % -> Boolean
 	?~=? : (%, %) -> Boolean
 	hashUpdate! : (HashState, %) -> HashState



.. image:: content/fricas-lisp-scite.jpg


