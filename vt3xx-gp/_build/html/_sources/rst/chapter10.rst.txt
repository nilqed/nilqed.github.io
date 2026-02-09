.. container:: navbar

   |VT100.net| VT330/VT340 Programmer Reference Manual Volume 2:
   Graphics Programming

   +----------------------+
   | `Chapter             |
   | 9 <chapter9.html>`__ |
   +----------------------+

   --------------

.. _S10:

10 Report Command
=================

You can use report commands to perform two basic functions.

-  Request the current status of ReGIS operations.
-  Enter graphics input mode (to use a mouse or graphics tablet).

.. _S10.1:

Report Options
--------------

Your application can request information about the following ReGIS
operations.

-  Cursor position
-  Macrograph contents
-  Macrograph storage status
-  Character set
-  Error condition
-  Input mode

When your application requests information, make sure the system does
not display the information on the screen. The data could affect your
graphic images. There is no ReGIS control to prevent this action. All
information returned by the VT300 ends with a carriage return (CR).

.. _S10.1.1:

Cursor Position
~~~~~~~~~~~~~~~

This option tells ReGIS to report the absolute screen coordinates of the
current output cursor position. The report format is as an absolute,
bracketed extent in screen coordinates. You use the following format for
the report cursor position option.

R(P)

where

.. container:: example

   **R** identifies a report command.

   **P** identifies the report active position option.

.. _S10.1.2:

Macrograph Contents
~~~~~~~~~~~~~~~~~~~

This option tells ReGIS to report the contents of a specified
macrograph. You use the following format for the report macrograph
contents option.

NOTE: Reporting the contents of a macrograph may be a security risk in
some environments. The VT300 has a Graphics Set-Up feature that lets the
user disable this report command option.

R(M(<call letter>))

where

.. container:: example

   **M** identifies a report macrograph option.

   **<call letter>** is the letter of the alphabet that identifies the
   requested macrograph. The call letter is not case sensitive. For
   example, 'a' and 'A' identify the same macrograph.

The macrograph contents report starts with a macrograph report
indicator.

@=<call letter>

The **<call letter>** is the letter of the alphabet used to identify the
requested macrograph. The report ends with a macrograph terminator and a
carriage return.

@;<CR>

The terminal also reports any control characters saved as part of the
macrograph. If there is no macrograph defined for <call letter>, the
terminal reports a null macrograph (no characters) enclosed in the
indicator and terminator.

.. _S10.1.3:

Macrograph Storage Status
~~~~~~~~~~~~~~~~~~~~~~~~~

This option tells ReGIS to report how much storage space can be used for
macrographs, and how much of that space is free. You use the following
format for the report macrograph storage option.

R(M(=))

where

.. container:: example

   **M** identifies a report macrograph option.

   **=** identifies the report macrograph storage suboption.

The terminal reports this information as two integer strings, separated
by a comma and enclosed in double quotes.

"aaaa, tttt"

where

.. container:: example

   **aaaa** is the amount of space still available for macrographs.

   **tttt** is the total amount of storage space that can be used for
   macrographs.

You can find the amount of storage space in current use by subtracting
the available space from the total allocated.

Macrograph space in use = tttt - aaaa

.. _S10.1.4:

Character Set
~~~~~~~~~~~~~

This option tells ReGIS to report the name of the character set
currently selected for load command operations. You use the following
format for the report character set option.

R(L)

where

**L** identifies the report character set option.

The terminal reports the name of the character set in the following
format.

A'<name>'

The **<name>** is the name assigned to the character set by the specify
name option for the load command.

.. _S10.1.5:

Error Condition
~~~~~~~~~~~~~~~

This option tells ReGIS to report the last error detected by the parser.
You can use the resynchronization character (;) to clear errors. You use
the following format for the report error condition option.

R(E)

where

**E** identifies the report error option.

The terminal reports the last error in the following format.

"<N>,<M>"

where

.. container:: example

   **<N>** is a decimal integer error code.

   **<M>** is the decimal ASCII code of the character flagged as the
   cause of the error or 0, as noted for each error code. `Table
   10-1 <#T10-1>`__ describes the possible error codes reported by the
   error condition option.

.. table:: Table 10-1 Report Command Error Codes (Error Condition Codes)

   +------+-------------------+-------------------+-------------------+
   | Code | Condition         | <M> Error         | Meaning           |
   |      |                   | Character         |                   |
   +======+===================+===================+===================+
   | 0    | No error          | Always 0          | No error detected |
   |      |                   |                   | since the last    |
   |      |                   |                   | resynchronization |
   |      |                   |                   | character (;).    |
   +------+-------------------+-------------------+-------------------+
   | 1    | Ignore character  | The ignored       | An unexpected     |
   |      |                   | character         | character was     |
   |      |                   |                   | found and         |
   |      |                   |                   | ignored.          |
   +------+-------------------+-------------------+-------------------+
   | 2    | Extra option      | Always 0          | The syntax        |
   |      | coordinates       |                   | S(H[X,Y][X,Y])    |
   |      |                   |                   | contained more    |
   |      |                   |                   | than two          |
   |      |                   |                   | coordinate pairs. |
   |      |                   |                   | The extra pairs   |
   |      |                   |                   | were ignored.     |
   +------+-------------------+-------------------+-------------------+
   | 3    | Extra coordinate  | Always 0          | The syntax [X,Y]  |
   |      | values            |                   | contained more    |
   |      |                   |                   | than two          |
   |      |                   |                   | coordinate        |
   |      |                   |                   | values. The extra |
   |      |                   |                   | values were       |
   |      |                   |                   | ignored.          |
   +------+-------------------+-------------------+-------------------+
   | 4    | Alphabet out of   | Always 0          | The syntax L(A<0  |
   |      | range             |                   | to 3>) contained  |
   |      |                   |                   | a number less     |
   |      |                   |                   | than 0 or greater |
   |      |                   |                   | than 3.           |
   +------+-------------------+-------------------+-------------------+
   | 5    | Reserved          | –                 | –                 |
   +------+-------------------+-------------------+-------------------+
   | 6    | Reserved          | –                 | –                 |
   +------+-------------------+-------------------+-------------------+
   | 7    | Begin/start       | (B) or (S)        | The stacking      |
   |      | overflow          |                   | limit of 16 (B)   |
   |      |                   |                   | and (S) options   |
   |      |                   |                   | for position and  |
   |      |                   |                   | vector commands   |
   |      |                   |                   | was exceeded.     |
   |      |                   |                   | Extra (B) or (S)  |
   |      |                   |                   | options were      |
   |      |                   |                   | ignored.          |
   +------+-------------------+-------------------+-------------------+
   | 8    | Begin/start       | (E)               | A position or     |
   |      | underflow         |                   | vector command    |
   |      |                   |                   | contained an (E)  |
   |      |                   |                   | option without a  |
   |      |                   |                   | corresponding (B) |
   |      |                   |                   | option. The (E)   |
   |      |                   |                   | option was        |
   |      |                   |                   | ignored.          |
   +------+-------------------+-------------------+-------------------+
   | 9    | Text standard     | Always 0          | A text command    |
   |      | size error        |                   | selected a        |
   |      |                   |                   | standard          |
   |      |                   |                   | character size    |
   |      |                   |                   | number of less    |
   |      |                   |                   | than 0 or greater |
   |      |                   |                   | than 16.          |
   +------+-------------------+-------------------+-------------------+

.. _S10.2:

Graphics Input Modes – I
------------------------

This option lets you set ReGIS to one of two graphics input modes,
one-shot or multiple. In a graphics input mode, you can use a locator
device (mouse or graphics tablet) to move the graphics input cursor and
send position reports.

.. _S10.2.1:

One-Shot Graphics Input Mode
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is the default input mode. In one-shot mode, the terminal suspends
processing of new data from the application until ReGIS sends a position
report. The terminal buffers any data received from the application in
this mode.

.. _S10.2.1.1:

Entering One-Shot Mode
^^^^^^^^^^^^^^^^^^^^^^

You use the input mode option to enter one-shot mode. You use the
following format for this option.

R(I0)

where

.. container:: example

   **I** identifies the input mode option.

   **0** identifies the input mode as one-shot.

After the terminal receives a one-shot mode option, the input cursor
appears on the screen.

NOTE: When the terminal receives R(I), it returns a carriage return
(CR). Applications can use the CR for synchronization.

.. _S10.2.1.2:

Input Cursor Movement
^^^^^^^^^^^^^^^^^^^^^

When you use a mouse or graphics tablet, the input cursor moves as you
move the locator device. See `Chapter 15 <chapter15.html>`__ for details
on using a locator device. You can also move the cursor by pressing one
of the four arrow keys.

+-----------------+---------------------------------------------------+
| Press           | To move                                           |
+=================+===================================================+
| arrow key       | The cursor moves one pixel in the direction of    |
|                 | the arrow – up, down, left or right.              |
+-----------------+---------------------------------------------------+
| Shift-arrow key | The cursor moves 10 pixels in the direction of    |
|                 | the arrow.                                        |
+-----------------+---------------------------------------------------+

If you move the cursor past a screen boundary, the cursor wraps to the
other side of the screen.

.. _S10.2.1.3:

Requesting a Report
^^^^^^^^^^^^^^^^^^^

To request a position report in one-shot mode, the application must send
a report position interactive option to the terminal. The format of this
option is as follows.

R(P(I))

where

**P(I)** identifies the report position interactive option.

After the application sends the request, it must wait for the terminal
to send the report.

.. _S10.2.1.4:

Sending a Report
^^^^^^^^^^^^^^^^

The terminal sends a position report when you press any non-arrow key
that is not dead, or a button on the locator device. After you press the
key or button, the following occurs.

-  The terminal sends the ASCII code of the key pressed to the host.

-  The terminal sends the current position coordinates of the input
   cursor to the host. These position coordinates are absolute X and Y
   values, such as [X,Y].

-  The input cursor disappears from the screen, and the terminal exits
   one-shot mode.

`Chapter 15 <chapter15.html>`__ describes the format of the report and
provides more information on one-shot graphics input mode.

.. _S10.2.2:

Multiple Graphics Input Mode
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This mode lets you send more than one cursor position report without
exiting graphics input mode. The terminal immediately processes
characters it receives from the host, instead of buffering them as in
one-shot mode.

.. _S10.2.2.1:

Entering Multiple Mode
^^^^^^^^^^^^^^^^^^^^^^

You use the input mode option to enter multiple mode. You use the
following format for this option.

R(I1)

where

.. container:: example

   **I** identifies the input mode option.

   **1** identifies the input mode as multiple.

When the terminal receives the multiple graphics input mode option, the
input cursor appears on the screen. Unlike one-shot mode, the terminal
continues to process received data.

.. _S10.2.2.2:

Input Cursor Movement
^^^^^^^^^^^^^^^^^^^^^

When you use a mouse or graphics tablet, the cursor moves as you move
the locator device. See `Chapter 15 <chapter15.html>`__ for details on
using a locator device. In multiple mode, you can also move the cursor
by pressing an arrow key.

.. _S10.2.2.3:

Sending a Report
^^^^^^^^^^^^^^^^

There are two ways to make the terminal send a position report in
multiple mode.

-  | **Request a report by sending R(P(I)) to the terminal.**
   | When the terminal receives R(P(I)) (report position interactive
     option) in multiple mode, it immediately returns a position report
     to the application. The terminal remains in multiple mode.

-  | **Press a locator button.**
   | When you press a locator button, the terminal immediately sends the
     cursor position in absolute [X,Y] coordinates. You can continue to
     send reports to the application without exiting multiple mode.

`Chapter 15 <chapter15.html>`__ describes the format of a position
report and provides more information on multiple mode.

.. _S10.2.2.4:

Exiting Multiple Mode
^^^^^^^^^^^^^^^^^^^^^

The terminal stays in multiple mode until the applications sends the
R(I0) option. This option makes the terminal exit multiple mode and
enter one-shot mode. See "`One-Shot Graphics Input Mode <#S10.2.1>`__
for more information.

.. _S10.2.3:

Report Position Interactive – P(I)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This option lets an application request an input cursor position report
at any time. You only use this option when the terminal is in a graphics
input mode (one-shot or multiple). You use the following format for this
option.

R(P(I))

where

**P(I)** identifies the report position interactive option.

When an application sends R(P(I)), the following occurs.

-  | **In one-shot mode**
   | The terminal does not return an input cursor position report until
     you press an active nonarrow key or a button on the locator device.
     The report contains this ASCII keystroke, followed by the cursor
     position in absolute [X,Y] coordinates.

-  | **In multiple mode**
   | The terminal immediately returns an input cursor position report.
     The report contains only the cursor position in absolute [X,Y]
     coordinates.

See `Chapter 15 <chapter15.html>`__ for information on the report
format.

.. _S10.3:

Report Command Summary
----------------------

`Table 10-2 <#T10-2>`__ is a summary of **R** command options, including
any default values.

.. table:: Table 10-2 Report Command Summary

   +--------------------+-------------+-----------------------------------+
   | Option             | Default     | Description                       |
   +====================+=============+===================================+
   | (P)                | None        | | **Cursor position**             |
   |                    |             | | Reports the current active      |
   |                    |             |   position.                       |
   +--------------------+-------------+-----------------------------------+
   | (M(<call letter>)) | None        | | **Macrograph contents**         |
   |                    |             | | Reports the contents of the     |
   |                    |             |   macrograph identified by <call  |
   |                    |             |   letter>.                        |
   +--------------------+-------------+-----------------------------------+
   | (M(=))             | None        | | **Macrograph storage status**   |
   |                    |             | | Reports how much space the      |
   |                    |             |   terminal has assigned to        |
   |                    |             |   macrograph storage, and how     |
   |                    |             |   much of that space is currently |
   |                    |             |   free.                           |
   +--------------------+-------------+-----------------------------------+
   | (L)                | None        | | **Character set**               |
   |                    |             | | Reports which character set (1  |
   |                    |             |   to 3) is selected for loading.  |
   +--------------------+-------------+-----------------------------------+
   | (E)                | None        | | **Error**                       |
   |                    |             | | Reports the last error found by |
   |                    |             |   the parser.                     |
   +--------------------+-------------+-----------------------------------+
   | (In)               | 0           | | **Graphics input mode**         |
   |                    |             | | Selects one-shot mode (0) or    |
   |                    |             |   multiple mode (1).              |
   +--------------------+-------------+-----------------------------------+
   | (P(I))             | None        | | **Report position interactive** |
   |                    |             | | Requests an input cursor        |
   |                    |             |   position report.                |
   +--------------------+-------------+-----------------------------------+

.. container:: navbar

   --------------

   +----------------------+
   | `Chapter             |
   | 9 <chapter9.html>`__ |
   +----------------------+

   .. container:: navbot

      http://vt100.net/docs/vt3xx-gp/chapter10.html

.. |VT100.net| image:: ../../vt100.net-logo
   :class: button
   :width: 102px
   :height: 16px
   :target: ../../
