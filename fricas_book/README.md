# fricas_book #

This is a *converted* version of the Axiom book adapted to the **FriCAS** environment. The format is XHTML + a style file *graphicstyle.css* which can be edited to set colors and so on.

The .xhtml files can be edited with **W3C's Amaya** editor: http://www.w3.org/Amaya/. Moreover, using its "makebook* function a single file can be generated which can be converted to the *epub* format for instance.


#### Revision

1. FriCAS uses `^` for exponentiation instead of `**`
2. Section 9.10, Clifford Algebra: `quadraticForm` must not be used
   anymore in the contructor: e.g. `H  := CliffordAlgebra(2, K, m)`
   instead of `H  := CliffordAlgebra(2, K, quadraticForm m)`
   All examples verified. Note: do a `)clear all` between examples.

---




