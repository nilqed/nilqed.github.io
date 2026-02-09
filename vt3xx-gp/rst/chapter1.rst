.. container:: navbar

   |VT100.net| VT330/VT340 Programmer Reference Manual Volume 2:
   Graphics Programming

   +----------------------+
   | `A                   |
   | bout <about.html>`__ |
   +----------------------+

   --------------

.. _S1:

1 Introduction to ReGIS
=======================

.. _S1.1:

What is ReGIS?
--------------

ReGIS is a graphics instruction set from Digital. This chapter describes
how to use ReGIS with the VT300. You can use ReGIS to create graphics
for display or printing.

ReGIS is a symbol system describing the parts of an image. You build an
image by combining standard geometric forms: dots, lines, curves,
circles, and arcs. You can also define text characters and add shading
to your images.

ReGIS lets you describe each geometric form with a few command
characters. For example, ReGIS lets you draw a circle of any size, at
any point on the screen. You simple specify (1) the command to draw the
circle, (2) the location of the center of the circle, and (3) any point
on the circumference of the circle.

ReGIS has 10 basic commands (`Table 1-1 <#T1-1>`__). Each command has
several options. The following chapters describe each command and its
options.

.. table:: Table 1-1 ReGIS Command Summary

   +----------------+-------------------+-------------------------------+
   | Command Letter | ReGIS Command     | Description                   |
   +================+===================+===============================+
   | S              | Screen            | Provides screen controls,     |
   |                |                   | such as erasing the screen.   |
   +----------------+-------------------+-------------------------------+
   | W              | Write             | Provides writing controls,    |
   |                |                   | such as writing shades.       |
   +----------------+-------------------+-------------------------------+
   | P              | Position          | Moves the graphics cursor     |
   |                |                   | without performing any        |
   |                |                   | writing.                      |
   +----------------+-------------------+-------------------------------+
   | V              | Vector            | Draws vectors (straight       |
   |                |                   | lines) between the screen     |
   |                |                   | locations you specify in the  |
   |                |                   | command.                      |
   +----------------+-------------------+-------------------------------+
   | C              | Curve             | Draws circles and arcs, using |
   |                |                   | the screen locations you      |
   |                |                   | specify in the command.       |
   +----------------+-------------------+-------------------------------+
   | T              | Text              | Controls the display of text  |
   |                |                   | strings in graphics, and lets |
   |                |                   | you specify characters to     |
   |                |                   | display.                      |
   +----------------+-------------------+-------------------------------+
   | L              | Load              | Defines and loads alternate   |
   |                |                   | characters you can display    |
   |                |                   | with the text command.        |
   +----------------+-------------------+-------------------------------+
   | @              | Macrograph        | Defines a command string as a |
   |                |                   | macrograph. You use           |
   |                |                   | macrographs to store and      |
   |                |                   | recall other ReGIS command    |
   |                |                   | strings.                      |
   +----------------+-------------------+-------------------------------+
   | R              | Report            | Reports information such as   |
   |                |                   | the active position and error |
   |                |                   | codes.                        |
   +----------------+-------------------+-------------------------------+
   | F              | Polygon Fill      | Fills in a single closed      |
   |                |                   | figure, such as a circle or   |
   |                |                   | square.                       |
   +----------------+-------------------+-------------------------------+
   | ;              | Resynchronization | Resynchronizes the flow of    |
   |                |                   | ReGIS command strings to the  |
   |                |                   | beginning of a new command.   |
   +----------------+-------------------+-------------------------------+

.. _S1.2:

Conventions
-----------

The following conventions apply to the ReGIS commands in this manual.

-  You can use uppercase and lowercase letters with ReGIS commands
   (except text in a quoted string). This manual uses uppercase letters
   for clarity.

-  Angle brackets **< >** indicate that you can select different values.
   The <values> in the angle brackets define what type of information
   you can use, but the angles are not part of the ReGIS syntax.

-  **[X,Y]** indicates you can select screen position values. The
   brackets are part of the ReGIS command syntax. You can use both
   values (X and Y) or just one value (X or Y).

.. _S1.3:

ReGIS Command Syntax
--------------------

This section describes the format you use for ReGIS commands. The
section also describes the numeric values you can use and the order that
ReGIS performs commands in.

.. _S1.3.1:

Command Key Letter
~~~~~~~~~~~~~~~~~~

ReGIS commands begin with a single character that identifies the command
type, followed by any selected options and arguments for that command.
This character is called a command key letter. For example, an S
indicates a screen control command.

S <option> <option>

You only have to use one command key letter for a series of arguments,
until you select a new command type. For example, here is a sequence of
screen (S) and position (P) commands.

S <option> <argument> <argument> P <argument> S <argument>

If you use an argument without a command key letter, ReGIS links that
argument to the last identified command.

.. _S1.3.2:

Argument and Option Formats
~~~~~~~~~~~~~~~~~~~~~~~~~~~

An argument is any variable you include in a command to modify the
action of that command. There are four types of arguments used in ReGIS.

-  | Options and suboptions
   | Are always enclosed in parentheses.

-  | Digit strings
   | Define numeric parameters for command and options.

-  | Bracketed extents
   | Define position coordinates, or height and width values for text
     characters.

-  | Quoted text strings
   | Define text for display or printing.

All ReGIS data is enclosed in parentheses, brackets, or quotes, except
for the following.

-  Command key letters
-  Macrograph command options that are defined by the @ sign as a
   command's key lettter
-  Pixel vector (PV) offset values
-  Hex values used to define the contents of a character cell

This section describes the meaning of parentheses, brackets, and quotes
in ReGIS commands. The section also describes how commas and spaces
affect commands.

.. _S1.3.2.1:

Parentheses
^^^^^^^^^^^

You use parentheses to enclose options and suboptions.

Command(Option(Suboption))

The left parenthesis, (, defines the beginning of the option or
suboption. The right parenthesis, ), defines the end. ReGIS assumes that
any letter not enclosed in parentheses or quotes is a command key
letter.

You must enclose each suboption in a separate nested set of parentheses.
Otherwise, ReGIS tries to process the suboption as an option. This could
cause errors in your program.

Here are some examples of various ReGIS command with options and
suboptions in parentheses.

.. container:: example

   +-----------------+-----------------------------------------------------+
   | Command         | Meaning of Parentheses                              |
   +=================+=====================================================+
   | S(E)            | **E** is an erase option to the **S** screen        |
   |                 | control command.                                    |
   +-----------------+-----------------------------------------------------+
   | W(I0,F3)        | **I** and **F** are foreground intensity and plane  |
   |                 | select options to the **W** write control command.  |
   |                 |                                                     |
   |                 | The **0** and **3** are numeric arguments to the    |
   |                 | options. A comma separates the options. You can     |
   |                 | also use spaces to separate options. (See the       |
   |                 | `section on commas and spaces <#S1.3.2.4>`__.)      |
   +-----------------+-----------------------------------------------------+
   | P(W(M100))      | This is a pixel vector (PV) multiplication          |
   |                 | temporary write option to the **P** position        |
   |                 | command.                                            |
   |                 |                                                     |
   |                 | The **W** write command is used as an option.       |
   |                 |                                                     |
   |                 | The **M** multiplication option of the write        |
   |                 | control command is used as a suboption.             |
   +-----------------+-----------------------------------------------------+
   | V(W(I(R)))      | This example defines a temporary write option       |
   |                 | affecting the value of the foreground intensity for |
   |                 | a vector command.                                   |
   |                 |                                                     |
   |                 | The **W** write command is used as an option.       |
   |                 |                                                     |
   |                 | The **I** foreground intensity option to the write  |
   |                 | control command is used as a suboption.             |
   |                 |                                                     |
   |                 | The **R** argument to the I suboption is enclosed   |
   |                 | in a third set of parentheses, since this argument  |
   |                 | is a letter value.                                  |
   +-----------------+-----------------------------------------------------+

As these examples show, you must use an equal number of opening and
closing parentheses. For example, take the command

V(W(I(R)))

The outer set of parentheses define the W option. The second set of
parentheses define the I suboption. The inner set of parentheses define
the R sub-suboption.

.. _S1.3.2.2:

Brackets
^^^^^^^^

You use brackets to enclose two types of numeric values.

-  Coordinate position values
-  Height and width values

Coordinate position values are arguments to commands, options, and
suboptions. The coordinates can represent a specific point on the screen
(known as an absolute value), some amount of displacement (known as a
relative value), or a combination of the two.

Height and width values are arguments to text commands only. These
values represent relative displacement values for text options.

NOTE: For more information on screen coordinate values, see "`Screen
Coordinates <#...>`__" in this chapter.

.. _S1.3.2.3:

Quotes
^^^^^^

You use quotes to enclose any of the following ReGIS elements.

-  Text to display on the screen (Used with text commands.)
-  A printable character to use for shading
-  A name for a character set selected by a load command
-  A single ASCII character used as a call letter for load cell
   arguments to a load command

In all cases, you can use double quotes ("), or single quotes ('). The
quote mark is the first character of the argument, so you do not need
parentheses. The first quote mark defines the start of the argument,
while the second defines the end.

.. _S1.3.2.4:

Commas and Spaces
^^^^^^^^^^^^^^^^^

You can use commas and spaces to separate option values in ReGIS
commands. The commas and spaces make command strings easier to read.

There are two cases where you must use commas: (1) to separate numeric
values in brackets such as [100,200]; (2) when you have an E command
(such as an erase screen to specified background) that follows a numeric
value. ReGIS can handle exponential values, so you must insert a comma
between the numeric value and the E command letter. This comma prevents
ReGIS from assuming that the numeric value is exponential.

ReGIS does not include commas and spaces as part of a graphic image,
unless you use them in a quoted text string for a text command.

.. _S1.3.3:

Numeric Values
~~~~~~~~~~~~~~

You send numeric values as decimal integer strings to the VT300. You can
use signed values where appropriate. The VT300 is an integer-oriented
device. However, it accepts floating point specifiers, truncating those
values to 16-bit signed integers for internal use.

The VT300 also accepts exponential values. You define an exponential
value by using the letter E and the power of 10 after a decimal integer
string. This feature lets you run ReGIS commands written in higher level
languages (such as FORTRAN and Pascal) on the VT300.

.. _S1.3.4:

When Does ReGIS Perform Commands?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ReGIS performs commands and options immediately. ReGIS acts on each
option, suboption, and argument as soon as ReGIS receives the command.

.. _S1.4:

Control Characters
------------------

ReGIS recognizes only four control characters.

-  CR (carriage return)
-  LF (line feed)
-  BS (backspace)
-  HT (horizontal tab)

You can only use these control characters in a quoted string. Since
ReGIS ignores control characters outside a quoted string, you can use
line feeds and carriage returns to separate command strings. This makes
your command strings easier to read, without affecting the graphic
image.

.. _S1.5:

VT300 Screen
------------

The VT300 screen has 384,000 pixels arranged in 800 vertical columns by
480 horizontal rows. A pixel (picture element) is the smallest unit the
terminal can display.

ReGIS lets you draw lines, curves, and text by turning on specific
pixels on the screen. For example, when you turn on several pixels in a
row, a line appears on the screen. You can turn any one of the 384,000
individual pixels on or off, by using an X-Y coordinate system.

.. _S1.6:

X-Y Coordinate System
---------------------

You can select any pixel on the screen by specifying its location. You
use an [X,Y] coordinate to specify the location of the pixel. The
X-coordinate specifies the horizontal position value. The Y-coordinate
specifies the vertical position value. The pixel is at the intersection
of the X and Y values.

`Figure 1-1 <#F1-1>`__ shows a typical coordinate system. The [X,Y]
coordinates specify a point in the coordinate system.

.. table:: Figure 1-1 Typical X-Y Coordinate System

   +----------+
   | |image1| |
   +----------+

.. _S1.6.1:

Syntax
~~~~~~

ReGIS commands use a specific syntax for X- and Y-coordinates in ReGIS
commands. There are three simple rules for specifying a coordinate
position.

-  Enclose the coordinates in brackets.
-  Specify the X-coordinate (if any) first.
-  Put a comma before any Y-coordinate, even if there is no
   X-coordinate.

You do not have to specify both an X and Y value in all cases. In fact,
you only have to specify an X or Y value that is changing from the
current value.

If you only change the X value, simple specify the new X value in
brackets. ReGIS recognizes [X] as meaning the Y value is unchanged. If
you only change the Y value, use a comma before the new Y value in the
brackets. ReGIS recognizes [,Y] as meaning the X value is unchanged. The
comma indicates that the next coordinate is a Y value.

You specify coordinate values as numeric values assigned to points on
the screen. This method is called display addressing. You can use a
default value, embedded decimal values, or exponential values. See the
display addressing option to the screen command (`Chapter
2 <chapter2.html>`__).

You can use absolute values (referring to a specific point), relative
values (referring to a point as it relates to the current active
position), or a combination of the two. Here are some examples of
coordinate values.

+--------------------+-------------------------------------------------+
| Coordinate         | Meaning                                         |
+====================+=================================================+
| [10,86]            | Absolute value for X and Y                      |
+--------------------+-------------------------------------------------+
| [52]               | Absolute value for X, with Y unchanged          |
+--------------------+-------------------------------------------------+
| [,121]             | Absolute value for Y, with X unchanged          |
+--------------------+-------------------------------------------------+
| [+15,-10]          | Relative values for X and Y                     |
+--------------------+-------------------------------------------------+
| [+10,100]          | Relative value for X, absolute value for Y      |
+--------------------+-------------------------------------------------+
| [100,-25]          | Absolute value for X, relative value for Y      |
+--------------------+-------------------------------------------------+
| [6.25,10.4]        | Absolute embedded decimal values for X and Y    |
+--------------------+-------------------------------------------------+
| [.1E3,1000E-1]     | Absolute exponential values for X and Y         |
+--------------------+-------------------------------------------------+

.. _S1.6.2:

Screen Coordinates
~~~~~~~~~~~~~~~~~~

The VT300 starts counting [X,Y] coordinates at the upper-left corner of
the screen. The first pixel is at location [0,0], called the screen
origin.

X-coordinates range from 0 (the left edge of the screen), through 799
(the right edge). Y-coordinates range from 0 (the top of the screen),
through 479 (the bottom). This provides an 800 (0 to 799) by 480 (0 to
479) array of specific screen locations.

.. _S1.7:

Graphics Cursors
----------------

The VT300 has two types of graphics cursors, an output cursor and input
cursor.

.. _S1.7.1:

Output Cursor
~~~~~~~~~~~~~

The output cursor only appears when the terminal is in ReGIS mode and
waiting for ReGIS input from the host. You can select whether or not to
display the output cursor by using the **Graphics Cursor** feature in
the Graphics Set-Up screen, or by using the ReGIS S(C) command
("`Graphics Cursor Control <chapter2.html#...>`__" in `Chapter
2 <chapter2.html>`__). You can select the style of the output cursor by
using the ReGIS S(C(H)) command ("`Graphics Output
Cursor <chapter2.html#...>`__" in `Chapter 2 <chapter2.html>`__). See
the "`Cursor Styles <#S1.7.4>`__" section that follows.

.. _S1.7.2:

Input Cursor
~~~~~~~~~~~~

The input cursor appears when the terminal is in ReGIS graphics input
mode. You can move the input cursor by using the arrow keys on the
keyboard, or by using a locator device such as a mouse. You can select
the style of input cursor by using the ReGIS S(C(I)) command ("`Graphics
Input Cursor <chapter2.html#...>`__" in `Chapter 2 <chapter2.html>`__).

.. _S1.7.3:

Cursor Position
~~~~~~~~~~~~~~~

The graphics cursor (input or output) indicates the active screen
location. This location is either the screen origin [0,0] or the point
most recently moved or drawn to.

The graphics cursor is at the screen origin when you enter ReGIS mode
after a power-up or reset condition. If you exit ReGIS, then enter ReGIS
again, the cursor is at the last position drawn or moved to during the
previous ReGIS activity.

.. _S1.7.4:

Cursor Styles
~~~~~~~~~~~~~

There are four built-in graphics cursor styles you can use with ReGIS.
You can also define your own input cursor. You select a built-in cursor
style by using an index number with the ReGIS screen command. See
"`Graphics Cursor Control <chapter2.html#...>`__" in `Chapter
2 <chapter2.html>`__.

.. _S1.7.4.1:

Diamond
^^^^^^^

This cursor is a 21 × 21 pixel diamond. You can use this cursor for
input and output operations. The diamond is the default output cursor.

.. _S1.7.4.2:

Crosshair
^^^^^^^^^

This cursor is a horizontal and a vertical line. The horizontal line is
the width of the screen, and the vertical line is the height of the
screen. The two lines intersect at the active position. You can use this
cursor for input and output operations. The crosshair is the default
input cursor.

.. _S1.7.4.3:

Rubber Band Line
^^^^^^^^^^^^^^^^

This cursor is a single line, with its origin fixed at the current
drawing (output) position and its endpoint at the current cursor
position. You can only use this cursor as an input cursor.

.. _S1.7.4.4:

Rubber Band Rectangle
^^^^^^^^^^^^^^^^^^^^^

This cursor is a rectangle, with one corner fixed at the current drawing
(output) position and the opposite corner at the current cursor
position. You can only use this cursor as an input cursor.

.. _S1.7.4.5:

User-Defined
^^^^^^^^^^^^

You can define your own input cursor by using the cursor option to the
screen control command (`Chapter 2 <chapter2.html>`__).

.. _S1.8:

Entering and Exiting ReGIS
--------------------------

You use device control strings to enter and exit ReGIS.

+-----------------+-----------------------------------+
| 8-Bit Device    | 7-Bit Equivalent Escape Sequence  |
| Control String  |                                   |
+=================+===================================+
| DCS p or        | ESC Pp or                         |
| DCS 0p          | ESC P0p                           |
+-----------------+-----------------------------------+
| DCS 1p          | ESC P1p                           |
+-----------------+-----------------------------------+
| DCS 2p          | ESC P2p                           |
+-----------------+-----------------------------------+
| DCS 3p          | ESC P3p                           |
+-----------------+-----------------------------------+
| ST              | ESC \\                            |
+-----------------+-----------------------------------+

NOTE: You can enter ReGIS from VT100 or VT300 mode.

You can display ReGIS commands by entering ReGIS with a DCS 2p or DCS 3p
sequence. In command display mode, the terminal displays ReGIS commands
as they are performed. The last line of ReGIS commands received appears
on the bottom line of the screen.

In command display mode, the VT300 processes characters as follows.

-  A line feed character makes the terminal erase the ReGIS command
   display line, along with any graphic image previously drawn there.
-  The terminal interprets each character as part of a ReGIS command and
   performs the command. Depending on the command, the graphic image
   changes.
-  Command characters appear as normal intensity, nonblinking text (not
   reverse video).

This processing continues until you leave ReGIS mode with an escape
sequence.

**Notes on ReGIS Command Display Mode**

-  Characters appear as the terminal receives them (no case conversion,
   syntax checking, or macrograph expansion).

-  The terminal does not display characters that are not part of the
   ReGIS character set (8-bit characters and control characters).

-  The appearance of the characters is based only on the output map
   settings and the image that the characters are drawn over. Other
   ReGIS-settable states have no effect.

-  You can display up to 80 characters on the command line. If the
   terminal receives more than 80 characters without a line feed
   character, the terminal erases the text line before displaying the
   next character.

-  Command display mode slows down performance, because the system must
   process the command characters for display.

.. _S1.9:

ReGIS Default Values
--------------------

Several ReGIS command arguments have default values. ReGIS always uses
these values after you power up or reset the terminal. The default
values let the terminal draw graphic images as soon as you enter ReGIS
mode. You can change these values in ReGIS. The new values remain in
effect until you change them, or until you power up or reset the
terminal again.

`Table 1-2 <#T1-2>`__ lists the default values for ReGIS commands.

.. table:: Table 1-2 ReGIS Power-Up/Reset Default Values Summary

   +-------------+---------------------------+
   | Type        | Default Command           |
   +=============+===========================+
   | Screen      |                           |
   | Controls    |                           |
   +-------------+---------------------------+
   | Screen      | S(A[0,0][799,479])        |
   | coordinates |                           |
   +-------------+---------------------------+
   | Scrolling   | S[0,0]                    |
   +-------------+---------------------------+
   | Printing    | S(H(P[50,0]))             |
   | offset      |                           |
   +-------------+---------------------------+
   | Monochrome  | S(M0(L0) 1(L33) 2(L67)    |
   | output      | 3(L100))                  |
   | mapping     |                           |
   +-------------+---------------------------+
   |             | S(M0(L0) 1(L4) 2(L10)     |
   |             | 3(L17) 4(L24) 5(L30)      |
   |             | 6(L37) 7(L44) 8(L50)      |
   |             | 9(L57) 10(L64) 11(L70)    |
   |             | 12(L77) 13(L84) 14(L90)   |
   |             | 15(L97))                  |
   +-------------+---------------------------+
   | Color       | S(M0(AD) 1(AB) 2(AR)      |
   | output      | 3(AG) 4(AM) 5(AC) 6(AY)   |
   | mapping     | 7(AW) 8(AD) 9(AB) 10(AR)  |
   |             | 11(AG) 12(AM) 13(AC)      |
   |             | 14(AY) 15(AW))            |
   +-------------+---------------------------+
   | Background  | S(I0)                     |
   | intensity   |                           |
   +-------------+---------------------------+
   | Write       |                           |
   | Controls    |                           |
   +-------------+---------------------------+
   | Pixel       | W(M1)                     |
   | vector      |                           |
   | multiplier  |                           |
   +-------------+---------------------------+
   | Writing     | W(P1)                     |
   | pattern     |                           |
   +-------------+---------------------------+
   | Pattern     | W(P(M2))                  |
   | multiplier  |                           |
   +-------------+---------------------------+
   | Negative    | W(N0)                     |
   | pattern     |                           |
   +-------------+---------------------------+
   | Bitmap      | VT330: W(F3)              |
   | planes      | VT340: W(F15)             |
   +-------------+---------------------------+
   | Foreground  | VT330: W(I3)              |
   | intensity   | VT340: W(I7)              |
   +-------------+---------------------------+
   | Overlay     | W(V)                      |
   | writing     |                           |
   +-------------+---------------------------+
   | Shading     | W(S0)                     |
   +-------------+---------------------------+
   | Text        |                           |
   +-------------+---------------------------+
   | Character   | T(A0)                     |
   | set         |                           |
   +-------------+---------------------------+
   | Character   | T(S1)                     |
   | cell        |                           |
   +-------------+---------------------------+
   | Display     | T(S[9,20])                |
   | cell        |                           |
   +-------------+---------------------------+
   | Unit cell   | T(U[8,20])                |
   +-------------+---------------------------+
   | Character   | T[+9,+0]                  |
   | positioning |                           |
   +-------------+---------------------------+
   | Height      | T(H2)                     |
   | multiplier  |                           |
   +-------------+---------------------------+
   | Tilt        | T(D0 S1 D0)               |
   +-------------+---------------------------+
   | Italics     | T(I0)                     |
   +-------------+---------------------------+
   | Size        | T(M[1,2])                 |
   | multiplier  |                           |
   +-------------+---------------------------+
   | Load        |                           |
   +-------------+---------------------------+
   | Character   | L(A1)                     |
   | set         |                           |
   +-------------+---------------------------+

.. _S1.10:

Preventing Transmission Errors
------------------------------

When transmission errors occur, the terminal may lose some data for
ReGIS text and commands. These errors can change the meaning of command
strings. You can reduce the effect of some transmission errors by
resynchronizing the flow of data between the host and terminal.

.. _S1.10.1:

Resynchronization Command (;)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ReGIS recognizes a semicolon (;) as a command to resynchronize. If you
think errors are occurring in your program, you can use the semicolon
between command strings. The semicolon ensures that the previous command
string is correctly closed, even if the closing character (a bracket or
parenthesis) is lost in transmission.

The semicolon cannot fix a garbled message, but may reduce the effect of
a single transmission error.

The terminal does not recognize the semicolon as a resynchronization
character in two cases.

-  in a quoted text string
-  as part of a macrograph definition

.. _S1.11:

Pixel Vector (PV) System
------------------------

You can control the direction of many ReGIS drawing or movement commands
by using the pixel vector (PV) system. You can select eight different
directions with PV numbers (`Figure 1-2 <#F1-2>`__). Each direction is
at a different 45-degree interval. Each direction has a specific number
assigned.

The PV system also lets you specify how far to move in one direction.
Each PV number tells the terminal to move one coordinate in that
direction.

To move horizontally or vertically, you use one PV number for each
pixel. For example, you use a PV string of 444 to move three pixels to
the left. You use a 000 string to move three pixels to the right.

If you want to move several coordinates, you can use a pixel vector
multiplier. The next section describes PV multiplication.

`Figure 1-3 <#F1-3>`__ shows some examples that use PV numbers. The PV
numbers used show the simplest method of movement. You could use
combinations of different PV values to achieve the same effects.

.. table:: Figure 1-2 Pixel Vector Dimensions

   +----------+
   | |image2| |
   +----------+

.. table:: Figure 1-3 Pixel Vector Examples

   +-------------------------------------------------------+
   | |image3|                                              |
   +-------------------------------------------------------+
   | ========= =========================================== |
   | PV VALUES                                             |
   | A.        MOVEMENT FROM CENTER BY SIX 2s AND THREE 4s |
   | B.        MOVEMENT FROM CENTER BY TWO 2s AND FIVE 4s  |
   | C.        MOVEMENT FROM CENTER BY THREE 6s            |
   | D.        MOVEMENT FROM CENTER BY SIX 6s AND TWO 0s   |
   | E.        MOVEMENT FROM CENTER BY FIVE 1s             |
   | ========= =========================================== |
   +-------------------------------------------------------+

.. _S1.11.1:

PV Multiplication
~~~~~~~~~~~~~~~~~

In some PV applications, entering all the PV numbers required would be
tedious. In such cases, you can use a PV multiplier command to simplify
the task.

The PV multiplier command lets you specify the number of times to repeat
each PV number. For example, suppose you use a multiplier of 10. Then
each PV number in later commands specifies movement for 10 coordinates,
not just 1.

`Figure 1-4 <#F1-4>`__ shows a graphic image drawn using PV
multiplication. In this figure, a write command (defined by W) first
sets a PV multiplier of 100 (defined by M100). Then vector commands
(defined by V) draw the image. Each PV value in the vector commands is
multiplied by 100.

.. container:: centrefig

   .. table:: Figure 1-4 PV Multiplication Example

      +----------------------------------------------------------------------+
      | |image5|                                                             |
      +----------------------------------------------------------------------+
      | NOTE:                                                                |
      | The active position at the start is (400,100).                       |
      | The active position at the end is (400,400).                         |
      |                                                                      |
      +----------------------------------------------------------------------+
      | +-----------------------------------------------------------------+  |
      | | COMMANDS                                                        |  |
      | +-----------------------------------------------------------------+  |
      | | W(M100)                                                         |  |
      | | V642446064600206                                                |  |
      | +-----------------------------------------------------------------+  |
      +----------------------------------------------------------------------+

.. _S1.12:

ReGIS Examples in this Manual
-----------------------------

The following chapters contain examples of images drawn with ReGIS
commands. For simplicity, most examples are based on the VT330
monochrome terminal rather than the VT340 color graphics terminal. All
the examples shown also work on the VT340. However, make sure you are
aware of the main differences between the two terminals.

+-----------------------------------+
| VT330                             |
+===================================+
| -  Monochrome terminal            |
| -  2-plane bitmap                 |
| -  Can use up to 4 shades of      |
|    gray, defined in gray map      |
|    locations 0 through 3.         |
+-----------------------------------+

.. _S1.12.1:

Running the Examples
~~~~~~~~~~~~~~~~~~~~

As you read about a command, you can draw the examples on your own
screen. Before you run an example, perform these steps.

#. Press **Set-Up** to enter set-up. The Set-Up Directory screen
   appears.

#. Select the **Clear Display** feature. This will clear the screen
   after you leave set-up.

#. Select the Global Set-Up screen.

#. Set the **On Line/Local** feature to "local".

#. Press **Set-Up** to leave set-up.

#. To enter ReGIS mode, hold down the **Ctrl** key and press **3**, then
   type **P2p**.

   **Ctrl-3 P2p**

   This sequence tells ReGIS to display the commands you enter. The
   commands appear on line 24 at the bottom of the screen.

You can now run any of the ReGIS examples in this manual. ReGIS
immediately performs each command you enter, so you can see both the
drawing and the command you entered.

When you finish running examples, perform the following steps to return
the terminal to its normal operating mode.

#. Type the following sequence to exit ReGIS mode.

   **Ctrl-3 \\**

#. Enter set-up and set the **On Line/Local** feature to "on line".

.. container:: navbar

   --------------

   +----------------------+
   | `A                   |
   | bout <about.html>`__ |
   +----------------------+

   .. container:: navbot

      http://vt100.net/docs/vt3xx-gp/chapter1.html

.. |VT100.net| image:: ../../vt100.net-logo
   :class: button
   :width: 102px
   :height: 16px
   :target: ../../
.. |image1| image:: ma-0653-83
.. |image2| image:: ma-0655-83
.. |image3| image:: ma-0411-86
.. |image4| image:: ma-0657-83r
.. |image5| image:: ma-0657-83r
