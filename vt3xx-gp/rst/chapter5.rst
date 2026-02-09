.. container:: navbar

   |VT100.net| VT330/VT340 Programmer Reference Manual Volume 2:
   Graphics Programming

   +----------------------+
   | `Chapter             |
   | 4 <chapter4.html>`__ |
   +----------------------+

   --------------

.. _S5:

5 Vector Command
================

You use vector commands to draw lines. The terminal draws a line between
the cursor position and the position you specify in a vector command.
Usually, the terminal draws solid lines that are 1 pixel wide. However,
you can change the appearance of lines by using the options for the
write control command (`Chapter 3 <chapter3.html>`__).

There are four basic options for the vector command.

-  Draw dot arguments
-  Draw line arguments
-  Position stack options
-  Temporary writing controls

.. _S5.1:

About the Examples
------------------

This chapter includes several examples of figures drawn with vector
commands. The following write control and screen command values are in
effect for these examples.

**Write Controls in Effect**

W(N0,I0,F3,P1(M2),V,M1,S0)

where

.. container:: example

   **W** identifies the write control command.

   ========== =
   **N0**     =
   **I0**     =
   **F3**     =
   **P1(M2)** =
   **V**      =
   **M1**     =
   **S0**     =
   ========== =

**Screen Controls in Effort**

S(I3,T0,A[0,0][799,479])

where

.. container:: example

   **S** identifies the screen control command.

   =================== =
   **I3**              =
   **A[0,0][799,479]** =
   =================== =

.. _S5.2:

Draw Dot
--------

This argument lets you draw a dot at the cursor position. The dot is a
single pixel. You use the following format for the draw dot argument.

V[]

where

.. container:: example

   **V** identifies the vector command.

   **[]** is a null position argument that tells ReGIS to draw a dot.

.. _S5.3:

Draw Line
---------

This argument draws a straight line from the cursor position to a
position you specify. ReGIS draws each line in the currently selected
pattern (`Chapter 3 <chapter3.html>`__). The pattern repeats every 8
pixels. The default pattern is a solid line (P1).

If you use dotted or dashed lines, the results are unpredictable where
lines intersect. However, you can start any line at the first position
of the pattern by repeating the V command key letter.

You can specify the endpoint of a line in four different ways.

-  absolute position
-  relative position
-  absolute/relative position
-  PV offset position

The arguments above are the same arguments used for the position
command. See "`Set Position Arguments <chapter4.html#S4.1>`__" in
`Chapter 4 <chapter4.html>`__ for the command format. For draw line
commands, you would begin with a **V** instead of a **P**.

NOTE: You do not have to start a new vector command when you change
argument types.

`Figure 5-1 <#F5-1>`__ shows a simple bar graph drawn using absolute,
relative, and absolute/relative positions. `Figure 5-2 <#F5-2>`__ shows
a graphic image of the PV directions used in the pixel vector system.
The image was drawn using PV multiplication.

.. table:: Figure 5-1 Bar Graph Using Vector Draw Line Arguments

   +----------------------+
   | |image1|             |
   +----------------------+
   | ======== =========== |
   | COMMANDS             |
   | (1)      P[100,100]  |
   | (2)      V[,400]     |
   | (3)      [500]       |
   | (4)      P[-400,200] |
   | (5)      V[200]      |
   | (6)      [,400]      |
   | (7)      [,-100]     |
   | (8)      [+100]      |
   | (9)      [,+100]     |
   | (10)     [,-150]     |
   | (11)     [+100]      |
   | (12)     [,+150]     |
   | (13)     [,-20]      |
   | (14)     [+100]      |
   | (15)     [,+20]      |
   | ======== =========== |
   +----------------------+

.. table:: Figure 5-2 Image of PV Directions, Drawn with PV Offset and
PV Multiplication Options

   +----------------------------------+----------------------------------+
   | +-----------------------------+  | |image4|                         |
   | | COMMANDS                    |  |                                  |
   | +-----------------------------+  |                                  |
   | | P[400,200]                  |  |                                  |
   | | V(W(M100))                  |  |                                  |
   | | 622637731551044             |  |                                  |
   | +-----------------------------+  |                                  |
   +----------------------------------+----------------------------------+
   |                                  | NOTE:                            |
   |                                  | Cursor is shown at an arbitrary  |
   |                                  | starting position [100,100], and |
   |                                  | at ending position [300,200].    |
   |                                  |                                  |
   +----------------------------------+----------------------------------+

.. _S5.4:

Position Stack Options
----------------------

A position stack is a set of coordinates that ReGIS uses in sequence.
These options let you process a group of vectors as a unit. Both options
use at least one start (or begin) option and one end option. You can
embed position (P) and curve (C) commands in the options.

There are two types of position stack options.

-  Bounded stack
-  Unbounded stack

.. _S5.4.1:

Bounded Position Stack
~~~~~~~~~~~~~~~~~~~~~~

You can use bounded position stacks to connect the last vector of a
command to the starting position of the command. For example, you can
use bounded position stacks to draw closed polygons.

The bounded position stack option for the vector command works in the
same as in a position command (`Chapter 4 <chapter4.html>`__). At the
beginning of the option, ReGIS saves the current active position by
pushing the position onto the stack. At the end of the option, ReGIS
returns the cursor to the saved position by popping the position off the
stack.

You use the following format for a bounded position stack.

V(B)<embedded options>(E)

where

.. container:: example

   **(B)** saves the current active position by pushing the position
   onto the stack. This is the starting point for a line.

   **<embedded options>** are the position, vector, curve, and other
   command options you use in the position stack option.

   **(E)** returns the cursor to the position saved by the previous (B)
   option. (Pops the position off the stack.) ReGIS draws a line from
   the (B) position to the position specified before (E).

A bounded position stack option has at least one begin (B) option and
one end (E) option. Each (B) option stores the coordinates of the
current cursor position on the stack. Each (E) option returns the cursor
to the position stored by the previous (B) option. A position stack can
have up to 16 (B) options. For each (B) option, there must be a
corresponding (E) option.

NOTE: The terminal saves cursor positions during bounded and unbounded
stack options for vector (V) commands and position (P) commands
(`Chapter 4 <chapter4.html>`__). The limit for unended, saved positions
(including all save commands) is 16. However, for compatibility with
other ReGIS products, use a maximum of eight.

`Figure 5-3 <#F5-3>`__ shows an example of a graphic image drawn using a
bounded position stack option. The stack has two (B) and (E) options,
with embedded curve (C) commands. `Figure 5-4 <#F5-4>`__ shows examples
of simple graphic images drawn using bounded position stacks.

.. table:: Figure 5-3 Bounded Position Stack Example, Using Multiple (B)
Options

   +----------------------------------------------------------------------+
   | |image6|                                                             |
   +----------------------------------------------------------------------+
   | +-----------------------------------------------------------------+  |
   | | COMMANDS                                                        |  |
   | +-----------------------------------------------------------------+  |
   | | P[200,100]                                                      |  |
   | | V(B)                                                            |  |
   | | [200,200]                                                       |  |
   | | (B)                                                             |  |
   | | [400,300]                                                       |  |
   | | [300,400]                                                       |  |
   | | (E)                                                             |  |
   | | C[+20]                                                          |  |
   | | V[100,50]                                                       |  |
   | | (E)                                                             |  |
   | | C[+20]                                                          |  |
   | +-----------------------------------------------------------------+  |
   +----------------------------------------------------------------------+

.. table:: Figure 5-4 Bounded Position Stack Examples

   +-------------------------------------------------------------------------+
   | |image7|                                                                |
   +-------------------------------------------------------------------------+
   | +-------------+-------------+-------------+-------------+-------------+ |
   | | COMMANDS    |             |             |             |             | |
   | +-------------+-------------+-------------+-------------+-------------+ |
   | | (A)         | (B)         | (C)         | (D)         | (E)         | |
   | +-------------+-------------+-------------+-------------+-------------+ |
   | | P[100,100]  | P[350,100]  | P[650,150]  | P[400,340]  | V(B)        | |
   | | V(B)        | V(B)        | V(B)        | V(B)        | [350,250]   | |
   | | [+100]      | [+100]      | [700,200]   | [450,400]   | [+100]      | |
   | | [,+100]     | [,+100]     | [,-100]     | [-100]      | (E)         | |
   | | [-100]      | (E)         | [-100]      | (E)         |             | |
   | | (E)         |             | [,+100]     |             |             | |
   | |             |             | (E)         |             |             | |
   | +-------------+-------------+-------------+-------------+-------------+ |
   +-------------------------------------------------------------------------+

.. _S5.4.2:

Unbounded Position Stack
~~~~~~~~~~~~~~~~~~~~~~~~

An unbounded position stack works the same as a bounded one, except the
active position does not move at the end of an unbounded stack. An
unbounded stack begins with an (S) option rather than a (B) option.

The (S) option saves a dummy, or nonexistent position by pushing it onto
the stack. When ReGIS comes to an (E) option, the cursor stays at the
position specified before the (E) option. You use the following format
for an unbounded position stack.

V(S)<embedded options>(E)

where

.. container:: example

   **(S)** saves a dummy position by pushing the position onto the
   stack.

   **<embedded options>** are the position, vector, curve and other
   command options you use in the position stack option.

   **(E)** pops the dummy position saved by the last (S) off the stack.
   The cursor does not move.

The unbounded position stack serves little purpose for images drawn with
vector commands. This stack provides symmetry with the unbounded
position stack of the curve command.

`Figure 5-5 <#F5-5>`__ shows an image drawn with an unbounded position
stack. The commands are the same ones used in the bounded position stack
for `Figure 5-3 <#F5-3>`__. You can compare the results.

.. table:: Figure 5-5 Unbounded Position Stack Example

   +----------------------------------+----------------------------------+
   | +-----------------------------+  | |image10|                        |
   | | COMMANDS                    |  |                                  |
   | +-----------------------------+  |                                  |
   | | P[200,100]                  |  |                                  |
   | | V(S)                        |  |                                  |
   | | [200,200]                   |  |                                  |
   | | (B)                         |  |                                  |
   | | [400,300]                   |  |                                  |
   | | [300,400]                   |  |                                  |
   | | (E)                         |  |                                  |
   | | C[+20]                      |  |                                  |
   | | V[100,50]                   |  |                                  |
   | | (E)                         |  |                                  |
   | | C[+20]                      |  |                                  |
   | +-----------------------------+  |                                  |
   +----------------------------------+----------------------------------+
   |                                  | NOTE:                            |
   |                                  | Cursor is shown at arbitrary     |
   |                                  | starting position of [300,100],  |
   |                                  | and at starting [200,100] and    |
   |                                  | ending [100,50] positions for    |
   |                                  | sequence.                        |
   |                                  |                                  |
   +----------------------------------+----------------------------------+

.. _S5.5:

Temporary Write Control
-----------------------

The write control options in `Chapter 3 <chapter3.html>`__ control the
appearance of the images you draw. For example, these options control
the shade or color of images. When you use vector commands, ReGIS uses
the current settings for the write control options.

You can use a temporary write control option to temporarily change one
or more of these settings for a vector command. The temporary values
remain in effect until you use one of the following commands.

-  another temporary write control option
-  any command that begins with a command key letter, such as a vector
   (V) command or another curve (C) command
-  a resynchronization command (semicolon)

When you use one of the above commands, the writing control options
return to their previous values.

You include the temporary write control option in your vector command.
You can use any write control option from `Chapter 3 <chapter3.html>`__.

-  PV multiplication
-  Pattern control
-  Foreground intensity
-  Plane select control
-  Overlay writing
-  Replace writing
-  Complement writing
-  Erase writing
-  Negative pattern control

You use the following format for the temporary write control option.

V(W(<suboptions>)<arguments>)

where

.. container:: example

   **W** identifies a temporary write control option.

   **<suboptions>** are the temporary write control values selected.

   **<arguments>** are vector command arguments that will use the
   temporary write control values.

`Figure 5-6 <#F5-6>`__ shows some images that use temporary write
control options to change the drawing pattern used. For more complex
examples, see the "`Shading Control <chapter3.html#S3.7>`__" section in
`Chapter 3 <chapter3.html>`__.

.. container:: centrefig

   .. table:: Figure 5-6 Temporary Write Control Example

      +----------------------------------------------------------------------+
      | |image12|                                                            |
      +----------------------------------------------------------------------+
      | NOTE:                                                                |
      | Cursor is shown at arbitrary start position of screen origin [0,0],  |
      | and at start and end positions for each graphic. Writing controls in |
      | effect are: W(N0,I0,V,P1(M2)), with I0 at default value of dark,     |
      | background specifier at S(I3), and I3 at default value of white.     |
      |                                                                      |
      +----------------------------------------------------------------------+
      | +---------------------+---------------------+---------------------+  |
      | | COMMANDS            |                     |                     |  |
      | +---------------------+---------------------+---------------------+  |
      | | (A)                 | (B)                 | (C)                 |  |
      | +---------------------+---------------------+---------------------+  |
      | | P[100,100]          | P[300,100]          | P[500,150]          |  |
      | | V(W(P2(M5)))        | V(W(P4(M5)))        | V(W(P2(M5)))        |  |
      | | [+100]              | [+100]              | [,-75]              |  |
      | | [,+100]             | V[,+100]            | [+200]              |  |
      | | [-100]              | [300,100]           | [,+75]              |  |
      | | [,-100]             |                     | V[-200]             |  |
      | +---------------------+---------------------+---------------------+  |
      +----------------------------------------------------------------------+

.. _S5.6:

Vector Command Summary
----------------------

`Table 5-1 <#T5-1>`__ is a summary of the **V** command options. There
are no default values for these options.

.. table:: Table 5-1 Vector Command Summary

   +-----------------+-----------------------------------------------------+
   | Option          | Description                                         |
   +=================+=====================================================+
   | []              | | **Draw dot**                                      |
   |                 | | Draws one dot (a single pixel at the current      |
   |                 |   active position. Does not move the cursor.        |
   +-----------------+-----------------------------------------------------+
   | [X,Y]           | | **Draw line (with coordinate)**                   |
   |                 | | Draws a line from the current active position to  |
   |                 |   the [X,Y] position. You can use absolute,         |
   |                 |   relative, or absolute/relative values for [X,Y].  |
   +-----------------+-----------------------------------------------------+
   | <PV>            | | **Draw line (with PV value)**                     |
   |                 | | Draws a line from the current active position to  |
   |                 |   a relative position defined by <PV>. The PV value |
   |                 |   defines a direction.                              |
   +-----------------+-----------------------------------------------------+
   | (B)             | | **Begin a bounded position stack**                |
   |                 | | Saves the current active position by pushing it   |
   |                 |   on the stack. This is the starting point for a    |
   |                 |   line.                                             |
   +-----------------+-----------------------------------------------------+
   | (S)             | | **Start an unbounded position stack**             |
   |                 | | Saves a dummy position, by pushing it onto the    |
   |                 |   stack.                                            |
   +-----------------+-----------------------------------------------------+
   | (E)             | | **End of bounded position stack**                 |
   |                 | | Draws a line to the position saved by the         |
   |                 |   previous (B) option from the position specified   |
   |                 |   before the (E) option. Then pops the saved        |
   |                 |   position off the stack.                           |
   |                 |                                                     |
   |                 | | **End of unbounded position stack**               |
   |                 | | Ends a position stack started by an (S) option.   |
   |                 |   No line is drawn, and the active position does    |
   |                 |   not move.                                         |
   +-----------------+-----------------------------------------------------+
   | (W              | | **Temporary write control**                       |
   | (<suboptions>)) | | Lets you use temporary write control values with  |
   |                 |   one vector command. Temporary values only remain  |
   |                 |   in effect for the selected command.               |
   +-----------------+-----------------------------------------------------+

.. container:: navbar

   --------------

   +----------------------+
   | `Chapter             |
   | 4 <chapter4.html>`__ |
   +----------------------+

   .. container:: navbot

      http://vt100.net/docs/vt3xx-gp/chapter5.html

.. |VT100.net| image:: ../../vt100.net-logo
   :class: button
   :width: 102px
   :height: 16px
   :target: ../../
.. |image1| image:: ma-0704-83
.. |image2| image:: ma-0705-83r
.. |image3| image:: ma-0705-83r
.. |image4| image:: ma-0705-83r
.. |image5| image:: ma-0706-83
.. |image6| image:: ma-0706-83
.. |image7| image:: ma-0708-83
.. |image8| image:: ma-0707-83
.. |image9| image:: ma-0707-83
.. |image10| image:: ma-0707-83
.. |image11| image:: ma-0709-83
.. |image12| image:: ma-0709-83
