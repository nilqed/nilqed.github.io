.. container:: navbar

   |VT100.net| VT330/VT340 Programmer Reference Manual Volume 2:
   Graphics Programming

   +----------------------+
   | `Chapter             |
   | 10                   |
   |  <chapter10.html>`__ |
   +----------------------+

   --------------

.. _S11:

11 Polygon Fill Command
=======================

You use the polygon fill command to draw filled-in, closed objects such
as circles, ellipses, triangles, and squares. Polygon fill commands
start with the key letter F. There are four basic options to the F
command.

-  Vector
-  Curve and arc
-  Position
-  Temporary write controls

The polygon fill command uses the current foreground color specified to
fill in figures (Chapters `2 <chapter2.html>`__ and
`3 <chapter3.html>`__).

.. _S11.1:

Vector Option
-------------

The polygon fill command accepts all vector command options and
arguments. This feature lets you draw filled-in objects such as squares,
rectangles, and diamonds. `Chapter 5 <chapter5.html>`__ describes all
the vector command options.

You use the following basic format of a polygon fill command with a
vector option.

F(V<positions>)

where

.. container:: example

   **F** identifies a polygon fill command.

   **V** identifies the vector option.

   **<positions>** are the positions of the polygon's vertices.

`Figure 11-1 <#F11-1>`__ shows a filled-in square and a filled-in
diamond. These objects are drawn with a polygon fill command using the
vector option and B suboption.

.. table:: Figure 11-1 Vector Option Example

   +------------------------------+------+------------------------------+
   | |image3|                     |      |                              |
   +------------------------------+------+------------------------------+
   | .. table:: FILLED SQUARE     |      | .. table:: FILLED DIAMOND    |
   |                              |      |                              |
   |                              |      |                              |
   |  +-------------------------+ |      |  +-------------------------+ |
   |                              |      |                              |
   |  | COMMANDS                | |      |  | COMMANDS                | |
   |                              |      |                              |
   |  +-------------------------+ |      |  +-------------------------+ |
   |                              |      |                              |
   |  | P[50,200]               | |      |  | P[400,300]              | |
   |                              |      |                              |
   |  | F(V(B)[+100]            | |      |  | F(V(B)[300,200]         | |
   |                              |      |                              |
   |  |       [,+100]           | |      |  |       [200,300]         | |
   |                              |      |                              |
   |  |       [-100]            | |      |  |       [300,400]         | |
   |                              |      |                              |
   |  |       (E))              | |      |  |       (E))              | |
   |                              |      |                              |
   |  +-------------------------+ |      |  +-------------------------+ |
   +------------------------------+------+------------------------------+

.. _S11.2:

Curve and Arc Option
--------------------

The polygon fill command accepts all curve command options and
arguments. This feature lets you draw filled-in circles, arcs, and other
curved objects. `Chapter 6 <chapter6.html>`__ describes all the curve
command options.

You use the following basic format for a polygon fill command with curve
options.

F(C<positions>)

where

.. container:: example

   **C** identifies the curve option.

   **<positions>** are coordinate values for a curve or circle. To use a
   curve, you include the (B) and (E) options. See `Chapter
   6 <chapter6.html>`__ for the format of curve command options.

`Figure 11-2 <#F11-2>`__ shows a filled-in ellipse and a filled-in
circle. The circle is drawn using the polygon fill command with the
circle option. The ellipse is drawn using the polygon fill command with
the closed curve option.

.. table:: Figure 11-2 Curve Option Example

   +------------------------------+------+------------------------------+
   | |image6|                     |      |                              |
   +------------------------------+------+------------------------------+
   | .. table:: FILLED ELLIPSE    |      | .. table:: FILLED CIRCLE     |
   |                              |      |                              |
   |                              |      |                              |
   |  +-------------------------+ |      |  +-------------------------+ |
   |                              |      |                              |
   |  | COMMANDS                | |      |  | COMMANDS                | |
   |                              |      |                              |
   |  +-------------------------+ |      |  +-------------------------+ |
   |                              |      |                              |
   |  | P[100,200]              | |      |  | P[500,300]              | |
   |                              |      |                              |
   |  | F(C(B)                  | |      |  | F(C[+100])              | |
   |                              |      |                              |
   |  |       [+200]            | |      |  |                         | |
   |                              |      |                              |
   |  |       [,+100]           | |      |  |                         | |
   |                              |      |                              |
   |  |       [-200]            | |      |  |                         | |
   |                              |      |                              |
   |  |       (E))              | |      |  |                         | |
   |                              |      |                              |
   |  +-------------------------+ |      |  +-------------------------+ |
   +------------------------------+------+------------------------------+

.. _S11.3:

Position Option
---------------

The polygon fill command accepts all position command options and
arguments. Remember, position options do not draw graphic images as do
the curve and vector options. You can use the position option to connect
vectors, curves, and arcs. `Chapter 3 <chapter3.html>`__ describes the
position command. `Chapter 6 <chapter6.html>`__ describes the curve
command and its options.

You can use the P option (with the open curve function of the curve
option) to set the slope at the two endpoints of an open curve. You can
also use the P option to reset the cursor position before and after an
arc with its center at the current position.

You use the following basic format for a polygon fill command with the
position and curve options.

F(C(A+<degrees>)<position1>P<position2>...)

where

.. container:: example

   **C** identifies a curve option.

   **A** identifies an arc suboption.

   **<degrees>** specifies the number of degrees and the direction to
   draw the arc in.

   **<position1>** is the point where the arc will start.

   **P** identifies a position option.

   **<position2>** is the new active position.

`Figure 11-3 <#F11-3>`__ shows filled-in, connected arcs and a
filled-in, connected arc and rectangle. The connected arcs are drawn
with the polygon fill command, position option, and open curve option.
The connected arc and rectangle are drawn with the polygon fill command,
position option, vector option, and open curve option.

.. table:: Figure 11-3 Position Option Example

   +------------------------------+------+------------------------------+
   | |image9|                     |      |                              |
   +------------------------------+------+------------------------------+
   | .. ta                        |      | .. t                         |
   | ble:: FILLED, CONNECTED ARCS |      | able:: FILLED, CONNECTED ARC |
   |                              |      | AND RECTANGLE                |
   |                              |      |                              |
   |  +-------------------------+ |      |                              |
   |                              |      |  +-------------------------+ |
   |  | COMMANDS                | |      |                              |
   |                              |      |  | COMMANDS                | |
   |  +-------------------------+ |      |                              |
   |                              |      |  +-------------------------+ |
   |  | P[200,200]              | |      |                              |
   |                              |      |  | P[450,300]              | |
   |  | F(C(A+270)              | |      |                              |
   |                              |      |  | F(C(C,A+270)            | |
   |  |       [+50,-50]         | |      |                              |
   |                              |      |  |       [-50]             | |
   |  | P[+100]                 | |      |                              |
   |                              |      |  | V[,+50]                 | |
   |  | C(A+270)                | |      |                              |
   |                              |      |  |       [+100]            | |
   |  |       [-50,+50])        | |      |                              |
   |                              |      |  |       [,-100]           | |
   |  |                         | |      |                              |
   |                              |      |  |       [-50])            | |
   |  +-------------------------+ |      |                              |
   |                              |      |  +-------------------------+ |
   +------------------------------+------+------------------------------+

.. _S11.4:

Temporary Write Controls Option
-------------------------------

The polygon fill command accepts all write command options and
arguments. There are two ways to use temporary write controls with the
polygon fill command.

-  as an option of the F command
-  as a suboption of the C and V options

`Chapter 3 <chapter3.html>`__ describes the write control command and
its options.

**Temporary Write Control as an Option of the F Command**

F(W(<suboption>)<options>)

where

.. container:: example

   **W** identifies a temporary write control option.

   **<suboptions>** are the temporary write control values to use.

   **<options>** are polygon fill command options that will use the
   temporary write control values.

**Temporary Write Control as a Suboption of the C or V options**

F(C(W(<sub-suboptions>)<suboptions>)<options>)

where

.. container:: example

   **C** identifies a curve option. You could also use a vector (V)
   option.

   **W** identifies a temporary write control suboption.

   **<sub-suboptions>** are the temporary write control values to use.

   **<suboptions>** are the curve options and values that will use the
   temporary write control values.

   **<options>** are any other polygon fill command options.

Only the last W option in a polygon fill command affects the graphic
image. Other W options have no effect, because ReGIS does not draw the
image until the end of the polygon fill command. The one exception is
when you use pixel vector multiplication as a suboption of the W option.

`Figure 11-4 <#F11-4>`__ shows a pie segment filled with Xs, and a
filled-in box with rounded corners. The pie segment is drawn with the
polygon fill command, temporary write control option (with the S
suboption), vector option, and open curve option. The box with rounded
corners is drawn with the polygon fill command, temporary write control
option (with the I suboption), vector option, and open curve option.

.. table:: Figure 11-4 Temporary Write Control Option Example

   +------------------------------+------+------------------------------+
   | |image12|                    |      |                              |
   +------------------------------+------+------------------------------+
   | .. table:: FILLED WHITE BOX  |      | .                            |
   | WITH ROUNDED CORNERS         |      | . table:: PIE SEGMENT FILLED |
   |                              |      | WITH Xs                      |
   |                              |      |                              |
   |  +-------------------------+ |      |                              |
   |                              |      |  +-------------------------+ |
   |  | COMMANDS                | |      |                              |
   |                              |      |  | COMMANDS                | |
   |  +-------------------------+ |      |                              |
   |                              |      |  +-------------------------+ |
   |  | P[200,100]              | |      |                              |
   |                              |      |  | P[400,300]              | |
   |  | F(W(I(W)),              | |      |                              |
   |                              |      |  | F(W(S"X"),              | |
   |  | V[+100]                 | |      |                              |
   |                              |      |  | V(B)[+200,-100]         | |
   |  | C(C,A-90)[,+50]         | |      |                              |
   |                              |      |  | C(C,A+30)               | |
   |  | V[,+100]                | |      |                              |
   |                              |      |  |       [-200,+100]       | |
   |  | C(C,A-90)[-50]          | |      |                              |
   |                              |      |  | V(E))                   | |
   |  | V[-100]                 | |      |                              |
   |                              |      |  |                         | |
   |  | C(C,A-90)[,-50]         | |      |                              |
   |                              |      |  |                         | |
   |  | V[,-100]                | |      |                              |
   |                              |      |  |                         | |
   |  | C(C,A-90)[+50])         | |      |                              |
   |                              |      |  |                         | |
   |  +-------------------------+ |      |                              |
   |                              |      |  +-------------------------+ |
   +------------------------------+------+------------------------------+

.. _S11.5:

Filling Complex Polygons
------------------------

You can use the commands in this chapter to fill simple or complex
polygons. However, a complex polygon requires more planning. You should
build your command string in steps. The following method is one example.

#. Build a ReGIS command string that draws the outline of the desired
   polygon. This command string may use vector, curve, and position
   commands. The outline should be a single, closed figure. The outline
   must not have any gaps or cross over itself.

#. Enclose the command string from step 1 in an F command.

   **F(<ReGIS command string>)**

#. If you want your polygon to have a contrasting outline, you can use a
   macrograph.

   ========================= ==================
   **@:A<ReGIS commands>@;** ;Loads macrograph.
   **F(@A)**                 ;Fills polygon.
   **@A**                    ;Draws outline.
   ========================= ==================

   `Chapter 9 <chapter9.html>`__ describes the macrograph command and
   its options.

`Figure 11-5 <#F11-5>`__ shows a filled paper icon with a dotted
outline. This image is drawn with a polygon fill command using the curve
option, vector option, temporary write control option, and macrographs.

.. table:: Figure 11-5 Example of Filling a Complex Polygon

   +------------------------------+------+------------------------------+
   | |image15|                    |      |                              |
   +------------------------------+------+------------------------------+
   | .. table:: FILLED PAPER ICON |      | .                            |
   |                              |      | . table:: PAPER ICON OUTLINE |
   |                              |      |                              |
   |  +-------------------------+ |      |                              |
   |                              |      |  +-------------------------+ |
   |  | COMMANDS I              | |      |                              |
   |                              |      |  | COMMANDS II             | |
   |  +-------------------------+ |      |                              |
   |                              |      |  +-------------------------+ |
   |  | P[200,200]              | |      |                              |
   |                              |      |  | P[200,200]              | |
   |  | @:X                     | |      |                              |
   |                              |      |  | W(P4) @X W(P1)          | |
   |  | V[+100]                 | |      |                              |
   |                              |      |  |                         | |
   |  |       [,+70]            | |      |                              |
   |                              |      |  |                         | |
   |  | P[-25,-10]              | |      |                              |
   |                              |      |  |                         | |
   |  | C(S)[+25,+10]           | |      |                              |
   |                              |      |  |                         | |
   |  |       [-25,+10]         | |      |                              |
   |                              |      |  +-------------------------+ |
   |  |       [-50,-20]         | |      |                              |
   |                              |      |                              |
   |  |       [-25,+10]         | |      |                              |
   |                              |      |                              |
   |  |       [+25,+10]         | |      |                              |
   |                              |      |                              |
   |  | P[-25,-10]              | |      |                              |
   |                              |      |                              |
   |  | V[,-70] @;              | |      |                              |
   |                              |      |                              |
   |  |                         | |      |                              |
   |                              |      |                              |
   |  | F(W(I1),@X)             | |      |                              |
   |                              |      |                              |
   |  +-------------------------+ |      |                              |
   +------------------------------+------+------------------------------+

.. _S11.6:

Some Points on Using the Polygon Fill Command
---------------------------------------------

You should consider the following points when you use the polygon fill
command.

-  | **Vertices**
   | You must specify at least three different vertices, or ReGIS will
     not draw an image. You can use up to 256 vertices. ReGIS ignores
     additional vertices. If you map two consecutive vertices to the
     same pixel, they count as one vertex.

   NOTE: Each argument for the vector option creates one vertex. Each
   argument for the curve option can create more than one vertex.

-  | **Closed Figures**
   | If your commands do not create a closed polygon, the results of the
     polygon fill command are unpredictable.

-  | **Perimeter**
   | In some cases, the outline of the filled polygon may not line up
     exactly with the vectors that connect the same vertices. You should
     draw a border after the filled area.

-  | **Single Closed Figures**
   | You should only use the polygon fill command to fill single closed
     figures. The F command is not designed to fill polygons made of
     intersecting groups of single closed figures. Although the F
     command can fill these polygons, the results are unpredictable.

-  | **Current Position**
   | ReGIS saves the cursor position at the beginning of any polygon
     fill command. The cursor returns to this position at the end of the
     command (whether or not any drawing takes place). This feature
     provides some compatibility with devices that do not have the F
     command.

-  | **Position Stack Options (B and E)**
   | Any polygon fill command string that changes the position stack is
     not compatible with ReGIS devices that do not have the F command.

.. _S11.7:

Polygon Fill Command Summary
----------------------------

`Table 11-1 <#T11-1>`__ is a summary of the **F** command options. There
are no default values for these options.

.. table:: Table 11-1 Polygon Fill Command Summary

   +-----------------------------------+
   | Option                            |
   +===================================+
   | F(V<positions>)                   |
   +-----------------------------------+
   | F(C<positions>)                   |
   +-----------------------------------+
   | F(C(A+<degrees>) <position1>      |
   | P<position2>...)                  |
   +-----------------------------------+
   | F(W(<suboptions>) <options>)      |
   +-----------------------------------+
   | F(C(W<sub-suboptions>)            |
   | <suboptions>) <options>)          |
   +-----------------------------------+

.. container:: navbar

   --------------

   +----------------------+
   | `Chapter             |
   | 10                   |
   |  <chapter10.html>`__ |
   +----------------------+

   .. container:: navbot

      http://vt100.net/docs/vt3xx-gp/chapter11.html

.. |VT100.net| image:: ../../vt100.net-logo
   :class: button
   :width: 102px
   :height: 16px
   :target: ../../
.. |image1| image:: ma-1213-84r
.. |image2| image:: ma-1213-84r
.. |image3| image:: ma-1213-84r
.. |image4| image:: ma-1212-84r
.. |image5| image:: ma-1212-84r
.. |image6| image:: ma-1212-84r
.. |image7| image:: ma-1214-84r
.. |image8| image:: ma-1214-84r
.. |image9| image:: ma-1214-84r
.. |image10| image:: ma-1220-84
.. |image11| image:: ma-1220-84
.. |image12| image:: ma-1220-84
.. |image13| image:: ma-1211-84
.. |image14| image:: ma-1211-84
.. |image15| image:: ma-1211-84
