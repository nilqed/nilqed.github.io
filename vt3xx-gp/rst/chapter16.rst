.. container:: navbar

   |VT100.net| VT330/VT340 Programmer Reference Manual Volume 2:
   Graphics Programming

   +----------------------+
   | `Chapter             |
   | 15                   |
   |  <chapter15.html>`__ |
   +----------------------+

   --------------

.. _S16:

16 Printing Graphics
====================

This chapter describes the control functions you use to format and print
graphics on a local printer connected to the VT300. You can also print
graphics directly from the terminal, by pressing **Shift-Local Print**.
See Chapter 11 of Installing and Using the VT330/VT340 Video Terminal.

.. _S16.1:

Selecting a Format for Printing
-------------------------------

This section describes the control functions you use to format graphics
before printing them from the screen. These control functions affect
print screen commands. If you do not have a printer connected to the
terminal, the terminal ignores these functions.

.. _S16.1.1:

Graphics Expanded Print Mode (DECGEPM)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This control function selects whether the terminal sends a compressed or
expanded graphics image to the printer. The compressed image fits on A4
or 8½ inch wide paper. The expanded image fits on 13 inch wide paper.

Default: Compressed

+-------------+---------------------------+---------------------------+
| Mode        | Sequence                  | Action                    |
+=============+===========================+===========================+
| Set         | ==== ==== === === ===     | Selects an expanded image |
| (Expanded)  | CSI  ?    4   3   h       | of about 300 × 200 mm (12 |
|             | 9/11 3/15 3/4 3/3 6/8     | × 8 in), for a graphics   |
|             | ==== ==== === === ===     | print screen operation.   |
+-------------+---------------------------+---------------------------+
| Reset       | ==== ==== === === ====    | Selects a compressed      |
| (           | CSI  ?    4   3   l       | image of about 150 × 75   |
| Compressed) | 9/11 3/15 3/4 3/3 6/12    | mm (6 × 3 in) for a       |
|             | ==== ==== === === ====    | graphics print screen     |
|             |                           | operation.                |
+-------------+---------------------------+---------------------------+

.. _S16.1.2:

Graphics Print Color Mode (DECGPCM)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This control function selects whether the terminal sends a color or
black and white image to the printer. You should only use the color
setting with the VT340.

Default: Black and white

+-------------+---------------------------+---------------------------+
| Mode        | Sequence                  | Action                    |
+=============+===========================+===========================+
| Set         | ==== ==== === === ===     | Sends a color image to    |
| (Color)     | CSI  ?    4   4   h       | the printer during a      |
|             | 9/11 3/15 3/4 3/4 6/8     | graphics print screen     |
|             | ==== ==== === === ===     | operation.                |
+-------------+---------------------------+---------------------------+
| Reset       | ==== ==== === === ====    | Sends a black and white   |
| (Black and  | CSI  ?    4   4   l       | image to the printer      |
| white)      | 9/11 3/15 3/4 3/4 6/12    | during a graphics print   |
|             | ==== ==== === === ====    | screen operation.         |
+-------------+---------------------------+---------------------------+

.. _S16.1.3:

Graphics Print Color Syntax (DECGPCS)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This control function selects which color coordinate system the terminal
uses in print color mode (DECGPCM). You should only use this function
with a VT340.

You can select one of two universal color coordinate systems, HLS (hue,
lightness, and saturation) or RGB (red, green, and blue).

Default: HLS

+-------------+---------------------------+---------------------------+
| Mode        | Sequence                  | Action                    |
+=============+===========================+===========================+
| Set         | ==== ==== === === ===     | Selects RGB color format  |
| (RGB)       | CSI  ?    4   5   h       | for a graphics print      |
|             | 9/11 3/15 3/4 3/5 6/8     | screen operation.         |
|             | ==== ==== === === ===     |                           |
+-------------+---------------------------+---------------------------+
| Reset       | ==== ==== === === ====    | Selects HLS color format  |
| (HLS)       | CSI  ?    4   5   l       | for a graphics print      |
|             | 9/11 3/15 3/4 3/5 6/12    | screen operation.         |
|             | ==== ==== === === ====    |                           |
+-------------+---------------------------+---------------------------+

.. _S16.1.4:

Graphics Print Background Mode (DECGPBM)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This control function selects whether the terminal sends the background
area to the printer during a graphics print screen operation. This
control function only works when print color mode (DECGPCM) is set
(color).

Default: No background

+-------------+---------------------------+---------------------------+
| Mode        | Sequence                  | Action                    |
+=============+===========================+===========================+
| Set         | ==== ==== === === ===     | Sends all screen data for |
| (           | CSI  ?    4   6   h       | the graphic, *including*  |
| Background) | 9/11 3/15 3/4 3/6 6/8     | the background.           |
|             | ==== ==== === === ===     |                           |
+-------------+---------------------------+---------------------------+
| Reset       | ==== ==== === === ====    | Sends all screen data for |
| (No         | CSI  ?    4   6   l       | the graphic, *except* the |
| background) | 9/11 3/15 3/4 3/6 6/12    | background.               |
|             | ==== ==== === === ====    |                           |
+-------------+---------------------------+---------------------------+

.. _S16.1.5:

Graphics Rotated Print Mode (DECGRPM)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This control function selects whether the terminal sends a compressed or
rotated graphics image to the printer.

+-------------+---------------------------+---------------------------+
| Mode        | Sequence                  | Action                    |
+=============+===========================+===========================+
| Set         | ==== ==== === === ===     | Selects an image of about |
| (Rotated)   | CSI  ?    4   7   h       | 200 × 300 mm (8 × 12 in), |
|             | 9/11 3/15 3/4 3/7 6/8     | rotated 90 degrees.       |
|             | ==== ==== === === ===     |                           |
+-------------+---------------------------+---------------------------+
| Reset       | ==== ==== === === ====    | Selects a compressed      |
| (           | CSI  ?    4   7   l       | image of about 150 × 75   |
| Compressed) | 9/11 3/15 3/4 3/7 6/12    | mm (6 × 3 in).            |
|             | ==== ==== === === ====    |                           |
+-------------+---------------------------+---------------------------+

.. _S16.2:

Sending Graphics to the Host or Printer
---------------------------------------

This section describes the control functions you use to send graphics to
the host or a local printer.

.. _S16.2.1:

Graphics to Host (MC)
~~~~~~~~~~~~~~~~~~~~~

This control function causes ReGIS hard copy commands to send screen
images to the active host session. See Part 1 of this volume for details
on ReGIS. The terminal ignores this function if the printer is assigned
to the inactive session. See Volume 1, Chapter 14 of this manual for
details on session management.

.. container:: example

   ==== ==== === ===
   CSI  ?    2   i
   9/11 3/15 3/2 6/9
   ==== ==== === ===

After receiving this command, the terminal sends the complete graphics
bitmap to the host.

.. _S16.2.2:

Graphics to Printer (MC)
~~~~~~~~~~~~~~~~~~~~~~~~

This control function causes ReGIS hard copy commands to send screen
images to the printer. See Part 1 of this volume for details on ReGIS.
The printer prints the ReGIS images as they appear on the screen. You
can use either of the following sequences.

+-----------------------+-----------------------+-----------------------+
| ==== ==== ===         | or                    | ==== ==== === ===     |
| CSI  ?    i           |                       | CSI  ?    0   i       |
| 9/11 3/15 6/9         |                       | 9/11 3/15 3/0 6/9     |
| ==== ==== ===         |                       | ==== ==== === ===     |
+-----------------------+-----------------------+-----------------------+

After receiving this command, the terminal sends the complete graphics
bitmap to the printer.

.. _S16.3:

Sixel Graphics Levels – Matching Your Printer
---------------------------------------------

Different printers produce different output quality. This section
describes the sixel graphics levels you can use to match the
capabilities of the printer connected to your terminal.

A sixel is a group of six pixels in a vertical column. A pixel is the
smallest displayable unit on the screen. A sixel is represented by 6
bits in a character code. Each pixel in the sixel corresponds to each
bit in the character code. A value of 1 for a bit indicates that a pixel
is on, a 0 value indicates a pixel is off. `Chapter
14 <chapter14.html>`__ describes sixel graphics in detail.

Sixel printing is the printing of each defined sixel in left-to-right,
top-to-bottom order.

There are two ways to send sixel information to a local printer, press
**Local Print** or send a media copy command.

-  | **Local Print Key**
   | When you press **Local Print**, the VT300 sends a carriage return
     (CR) to the printer to reset the printing position to the left
     margin. Then the terminal sends the sixel device control string.

-  | **Media Copy Command**
   | When an application sends a media copy command to the VT300 (such
     as Graphics to Printer), the terminal does not send a carriage
     return to the printer. The terminal sends only the sixel device
     control string. Omitting the carriage return lets the application
     initialize the starting sixel position.

The VT300 supports different levels of the sixel graphics protocol to
match the capabilities of the local printer used. The user can select
the sixel graphics level from the Printer Set-Up screen.

The sixel graphics level determines how the terminal matches the
printer's aspect ratio, horizontal grid size, background printing, and
color printing capabilities. The VT300 has a pixel aspect ratio of 1 to
1.

.. _S16.3.1:

Level 1 Sixel Devices
~~~~~~~~~~~~~~~~~~~~~

Level 1 sixel devices do not support the following sixel protocol
commands.

-  Set raster attributes
-  Background select
-  Horizontal grid size
-  Macro parameter

Level 1 devices have a fixed aspect ratio of 2 to 1 (2 horizontal pixels
to 1 vertical pixel), and a horizontal grid size of approximately 188 ×
0.025 mm (7.5 × 0.001 in). Level 1 is the factory-default for the VT300.

At level 1, the terminal always sends sixel device control strings to
the printer in a 7-bit format as follow.

ESC P 1 q S...S ESC \\

where

**S...S** is the sixel data defining the image.

A typical level 1 device is Digital's LA50 printer.

.. _S16.3.2:

Level 2 Sixel Devices
~~~~~~~~~~~~~~~~~~~~~

Level 2 sixel devices support the following sixel protocol commands.

-  Set raster attributes
-  Background select
-  Horizontal grid size
-  Macro parameter

At level 2, the VT300 sends sixel data to the printer in the following
format.

ESC P Pn1; Pn2; Pn3; q " Pn4; Pn5; Pn6; Pn7 S...S ESC \\

where

.. container:: example

   **Pn1** is the macro parameter. Pn1 is always 0 for level 2 print
   operations.

   | **Pn2** is the background select parameter.
   | 1 = background printing disabled.
   | 2 = background printing enabled.

   **Pn3** is the horizontal grid size. By default, the horizontal grid
   size is 6 for compressed images, and 9 for expanded or rotated
   images.

   **Pn4** is the pixel aspect ratio numerator. By default, Pn4 is set
   to 1.

   **Pn5** is the pixel aspect ratio denominator. By default, Pn5 is set
   to 1.

   **Pn6** is the horizontal extent parameter. Pn6 represents the number
   of pixels in an image horizontally.

   **Pn7** is the vertical extent parameter. Pn7 represents the number
   of pixels in an image vertically.

   **S...S** is the sixel data defining the image.

Typical level 2 printers are Digital's LA75 and LN03 printers.

NOTE: You must use level 1 to print expanded or rotated images on an
LA75. This selection compensates for firmware differences between the
printer and terminal.

.. _S16.3.3:

LA210 Printer
~~~~~~~~~~~~~

Digital's LA210 printer is a special case. The LA210 is similar to a
level 2 device, but does not recognize the set raster attributes
command. At the LA210 level, the VT300 uses macro parameter 9 to specify
a 1 to 1 aspect ratio with a grid size of 338 × 0.025 mm (13.5 × 0.001
in).

For compressed print operations, the VT300 uses the same sixel device
control string format as in level 1.

For expanded and rotated print operations, the VT300 uses the following
sixel device control string format.

ESC P 9 q S...S ESC \\

where

.. container:: example

   **9** is the macro parameter. This parameter specifies a 1 to 1
   aspect ratio with a grid size of 338 × 0.025 mm (13.5 × 0.001 in).

   **S...S** is the sixel data defining the image.

.. _S16.3.4:

Program Example for Printing a ReGIS Image on the LN03
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following program prints an expanded ReGIS image on an LN03 laser
printer. To print an expanded ReGIS image from your VT300 terminal to a
local LN03 printer, perform the following steps.

#. In the Printer Set-Up screen, set the **Sixel Print Option** feature
   to "expanded".

#. Use the following escape sequences in your program (ESC = escape
   character).

+-------------+-------------+-------------+-------------+-------------+
| Enable      | Initialize  | Landscape   | Clear       | Disable     |
| Printer     | Printer     | Format      | Margins     | Printer     |
| Port        | Settings    |             |             | Port        |
+=============+=============+=============+=============+=============+
|             | (DECSTR)    | (PFS)       | (DECSHORP)  |             |
+-------------+-------------+-------------+-------------+-------------+
| ESC[5i      | ESC[!p      | ESC[?21 SP  | ESC[w       | ESC[4i      |
|             |             | J           |             |             |
+-------------+-------------+-------------+-------------+-------------+

ReGIS display addressing command sets the terminal to full screen
addressing. ReGIS hard copy command sends the image to the printer.

ESCPp S(A[0,0][799,499]H) ESC\\

For more information, see `Chapter 2 <chapter2.html>`__.

.. _S16.4:

Summary
-------

`Table 16-1 <#T16-1>`__ is a summary of the graphics printing control
sequences in this chapter.

.. table:: Table 16-1 Graphics Printing Control Sequences

   +--------------------+-------------+-------------+--------------------+
   | Name               | Mnemonic    | Sequence    | Comments           |
   +====================+=============+=============+====================+
   | Printing Formats   |             |             |                    |
   +--------------------+-------------+-------------+--------------------+
   | Graphic expanded   | DECGEPM     | **CSI ? 43  | Expanded           |
   | print mode         |             | h**         |                    |
   +--------------------+-------------+-------------+--------------------+
   |                    |             | **CSI ? 43  | Compressed         |
   |                    |             | l**         |                    |
   +--------------------+-------------+-------------+--------------------+
   | Graphic print      | DECGPCM     | **CSI ? 44  | Color              |
   | color mode         |             | h**         |                    |
   +--------------------+-------------+-------------+--------------------+
   |                    |             | **CSI ? 44  | Black and white    |
   |                    |             | l**         |                    |
   +--------------------+-------------+-------------+--------------------+
   | Graphic print      | DECGPCS     | **CSI ? 45  | RGB                |
   | color syntax       |             | h**         |                    |
   +--------------------+-------------+-------------+--------------------+
   |                    |             | **CSI ? 45  | HLS                |
   |                    |             | l**         |                    |
   +--------------------+-------------+-------------+--------------------+
   | Graphic print      | DECGPBM     | **CSI ? 46  | Background         |
   | background mode    |             | h**         |                    |
   +--------------------+-------------+-------------+--------------------+
   |                    |             | **CSI ? 46  | No background      |
   |                    |             | l**         |                    |
   +--------------------+-------------+-------------+--------------------+
   | Graphic rotated    | DECGRPM     | **CSI ? 47  | Rotated            |
   | print mode         |             | h**         |                    |
   +--------------------+-------------+-------------+--------------------+
   |                    |             | **CSI ? 47  | Compressed         |
   |                    |             | l**         |                    |
   +--------------------+-------------+-------------+--------------------+
   | Sending Graphics   |             |             |                    |
   | to the Host or     |             |             |                    |
   | Printer            |             |             |                    |
   +--------------------+-------------+-------------+--------------------+
   | Graphics to host   | MC          | **CSI ? 2   |                    |
   |                    |             | i**         |                    |
   +--------------------+-------------+-------------+--------------------+
   | Graphics to        | MC          | **CSI ? i** |                    |
   | printer            |             | or          |                    |
   +--------------------+-------------+-------------+--------------------+
   |                    |             | **CSI ? 0   |                    |
   |                    |             | i**         |                    |
   +--------------------+-------------+-------------+--------------------+
   | Sixel Levels for   |             |             |                    |
   | Printers           |             |             |                    |
   +--------------------+-------------+-------------+--------------------+
   | Level 1            | ESC P 1 q   |             |                    |
   |                    | S...S ESC   |             |                    |
   |                    | \\          |             |                    |
   |                    |             |             |                    |
   |                    | where       |             |                    |
   |                    |             |             |                    |
   |                    | **S...S**   |             |                    |
   |                    | is the      |             |                    |
   |                    | sixel data  |             |                    |
   |                    | defining    |             |                    |
   |                    | the image.  |             |                    |
   |                    |             |             |                    |
   |                    | Example:    |             |                    |
   |                    | Digital's   |             |                    |
   |                    | LA50        |             |                    |
   |                    | printer.    |             |                    |
   +--------------------+-------------+-------------+--------------------+
   | Level 2            | ESC P Pn1;  |             |                    |
   |                    | Pn2; Pn3; q |             |                    |
   |                    | " Pn4; Pn5; |             |                    |
   |                    | Pn6; Pn7    |             |                    |
   |                    | S...S ESC   |             |                    |
   |                    | \\          |             |                    |
   |                    |             |             |                    |
   |                    | where       |             |                    |
   |                    |             |             |                    |
   |                    | **Pn1** is  |             |                    |
   |                    | the macro   |             |                    |
   |                    | parameter.  |             |                    |
   |                    | Pn1 is      |             |                    |
   |                    | always 0    |             |                    |
   |                    | for level 2 |             |                    |
   |                    | print       |             |                    |
   |                    | operations. |             |                    |
   |                    |             |             |                    |
   |                    | | **Pn2**   |             |                    |
   |                    |   is the    |             |                    |
   |                    |             |             |                    |
   |                    |  background |             |                    |
   |                    |   select    |             |                    |
   |                    |             |             |                    |
   |                    |  parameter. |             |                    |
   |                    | | 1 =       |             |                    |
   |                    |             |             |                    |
   |                    |  background |             |                    |
   |                    |   printing  |             |                    |
   |                    |   disabled. |             |                    |
   |                    | | 2 =       |             |                    |
   |                    |             |             |                    |
   |                    |  background |             |                    |
   |                    |   printing  |             |                    |
   |                    |   enabled.  |             |                    |
   |                    |             |             |                    |
   |                    | **Pn3** is  |             |                    |
   |                    | the         |             |                    |
   |                    | horizontal  |             |                    |
   |                    | grid size.  |             |                    |
   |                    | Default is  |             |                    |
   |                    | 6 for       |             |                    |
   |                    | compressed  |             |                    |
   |                    | images, and |             |                    |
   |                    | 9 for       |             |                    |
   |                    | expanded or |             |                    |
   |                    | rotated     |             |                    |
   |                    | images.     |             |                    |
   |                    |             |             |                    |
   |                    | **Pn4** is  |             |                    |
   |                    | the pixel   |             |                    |
   |                    | aspect      |             |                    |
   |                    | ratio       |             |                    |
   |                    | numerator.  |             |                    |
   |                    | Default =   |             |                    |
   |                    | 1.          |             |                    |
   |                    |             |             |                    |
   |                    | **Pn5** is  |             |                    |
   |                    | the pixel   |             |                    |
   |                    | aspect      |             |                    |
   |                    | ratio       |             |                    |
   |                    | d           |             |                    |
   |                    | enominator. |             |                    |
   |                    | Default =   |             |                    |
   |                    | 1.          |             |                    |
   |                    |             |             |                    |
   |                    | **Pn6** is  |             |                    |
   |                    | the         |             |                    |
   |                    | horizontal  |             |                    |
   |                    | extent      |             |                    |
   |                    | parameter.  |             |                    |
   |                    |             |             |                    |
   |                    | **Pn7** is  |             |                    |
   |                    | the         |             |                    |
   |                    | vertical    |             |                    |
   |                    | extent      |             |                    |
   |                    | parameter.  |             |                    |
   |                    |             |             |                    |
   |                    | **S...S**   |             |                    |
   |                    | is the      |             |                    |
   |                    | sixel data  |             |                    |
   |                    | defining    |             |                    |
   |                    | the image.  |             |                    |
   |                    |             |             |                    |
   |                    | Examples:   |             |                    |
   |                    | Digital's   |             |                    |
   |                    | LA75 and    |             |                    |
   |                    | LN03        |             |                    |
   |                    | printers.   |             |                    |
   +--------------------+-------------+-------------+--------------------+
   | LA210 printer      | *For        |             |                    |
   |                    | compressed  |             |                    |
   |                    | print       |             |                    |
   |                    | operations* |             |                    |
   |                    |             |             |                    |
   |                    | Uses the    |             |                    |
   |                    | same sixel  |             |                    |
   |                    | device      |             |                    |
   |                    | control     |             |                    |
   |                    | string      |             |                    |
   |                    | format as   |             |                    |
   |                    | in level 1. |             |                    |
   |                    |             |             |                    |
   |                    | *For        |             |                    |
   |                    | expanded    |             |                    |
   |                    | and rotated |             |                    |
   |                    | print       |             |                    |
   |                    | operations* |             |                    |
   |                    |             |             |                    |
   |                    | ESC P 9 q   |             |                    |
   |                    | S...S ESC   |             |                    |
   |                    | \\          |             |                    |
   |                    |             |             |                    |
   |                    | where       |             |                    |
   |                    |             |             |                    |
   |                    | **9** is    |             |                    |
   |                    | the macro   |             |                    |
   |                    | parameter.  |             |                    |
   |                    | This        |             |                    |
   |                    | parameter   |             |                    |
   |                    | specifies a |             |                    |
   |                    | 1 to 1      |             |                    |
   |                    | aspect      |             |                    |
   |                    | ratio with  |             |                    |
   |                    | a grid size |             |                    |
   |                    | of 338 ×    |             |                    |
   |                    | 0.025 mm    |             |                    |
   |                    | (13.5 ×     |             |                    |
   |                    | 0.001 in).  |             |                    |
   |                    |             |             |                    |
   |                    | **S...S**   |             |                    |
   |                    | is the      |             |                    |
   |                    | sixel data  |             |                    |
   |                    | defining    |             |                    |
   |                    | the image.  |             |                    |
   +--------------------+-------------+-------------+--------------------+

.. container:: navbar

   --------------

   +----------------------+
   | `Chapter             |
   | 15                   |
   |  <chapter15.html>`__ |
   +----------------------+

   .. container:: navbot

      http://vt100.net/docs/vt3xx-gp/chapter16.html

.. |VT100.net| image:: ../../vt100.net-logo
   :class: button
   :width: 102px
   :height: 16px
   :target: ../../
