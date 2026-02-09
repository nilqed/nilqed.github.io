.. container:: navbar

   |VT100.net| VT330/VT340 Programmer Reference Manual Volume 2:
   Graphics Programming

   +----------------------+
   | `Chapter             |
   | 12                   |
   |  <chapter12.html>`__ |
   +----------------------+

   --------------

.. _S13:

13 4010/4014 Mode
=================

The VT300 can support industry-standard Tektronix 4010/4014 software
packages. This chapter describes how to select and use 4010/4014 mode.
The chapter assumes you have a working knowledge of Tektronix 4010/4014
capabilities.

The 4010/4014 terminals use direct-view storage tube technology. The
VT300 uses raster-scan technology. The 4010/4014 mode supports those
features that can migrate to a raster terminal.

NOTE: Tektronix software may run differently on the VT300 than on other
terminals, due to differences in terminal design.

.. _S13.1:

Supported Features
------------------

The 4010/4014 mode supports the following modes and functions. This
chapter has a section on each feature.

+--------------------+-------------------------------------------------+
| Alpha mode         | Processes text characters.                      |
+--------------------+-------------------------------------------------+
| Graph mode         | Processes vectors from endpoints defined by     |
|                    | absolute coordinates.                           |
+--------------------+-------------------------------------------------+
| Incremental plot   | Similar to graph mode, but plots points         |
| mode               | relative to the current cursor position.        |
+--------------------+-------------------------------------------------+
| Point plot mode    | Similar to graph mode, but does not draw        |
|                    | vectors. Only plots the points specified by     |
|                    | absolute coordinates.                           |
+--------------------+-------------------------------------------------+
| Graphics input     | A local mode, similar to report position        |
| (GIN) mode         | interactive in ReGIS. You can use the keyboard, |
|                    | a mouse, or graphics tablet to move the cursor  |
|                    | and send position reports to the host.          |
+--------------------+-------------------------------------------------+
| Strap options      | Supported as set-up mode options. See the       |
|                    | Graphics Set-Up screen in Installing and Using  |
|                    | the VT330/VT340 Video Terminal.                 |
+--------------------+-------------------------------------------------+
| Control characters | Supports some control characters to control     |
|                    | terminal actions in 4010/4014 mode.             |
+--------------------+-------------------------------------------------+
| Escape sequences   | Supports some escape sequences to control       |
|                    | 4010/4014 functions only. The way escape        |
|                    | sequences work in 4010/4014 mode is independent |
|                    | of the way they work in text mode.              |
+--------------------+-------------------------------------------------+
| Bypass condition   | Prevents the terminal from responding to data   |
|                    | sent by the terminal and echoed by the host.    |
+--------------------+-------------------------------------------------+

.. _S13.2:

Restrictions
------------

The VT300 cannot support some 4010/4014 features, due to the differences
between direct-view storage tube and raster-scan display technologies.
The following sections describe these limitations.

.. _S13.2.1:

Write-Through Mode
~~~~~~~~~~~~~~~~~~

With 4010/4014 terminals, you can draw images and characters on the tube
without storing them. The application must refresh these images to keep
them visible. The intensity level of the images depends on the refresh
rate.

The VT300 can simulate write-through functions by using raster writing
modes. The "`Escape Sequences <#S13.8>`__" section in this chapter
describes the capabilities and limitations of raster writing modes.

.. _S13.2.2:

Character Sizes
~~~~~~~~~~~~~~~

In 4010/4014 mode, the VT300 uses one of two character modes, aligned or
enlarged.

+-----------------+-----------------------------------------------------+
| Aligned mode    | The terminal uses four character sizes. The         |
|                 | characters in all four sizes are small, but conform |
|                 | to the Tektronix terminal.                          |
+-----------------+-----------------------------------------------------+
| Enlarged mode   | The terminal uses two character sizes. The enlarged |
|                 | characters are larger and easier to read than the   |
|                 | smaller aligned characters.                         |
+-----------------+-----------------------------------------------------+

In enlarged mode, Tektronix software that relies on strict registration
of characters to pixels creates character distortion on the VT300. This
problem does not occur with aligned characters. Although the smaller
aligned characters are more difficult to read, they are not subject to
pixel distortion.

NOTE: You can select the aligned or enlarged characters from the
Graphics Set-Up screen.

.. _S13.2.3:

Fonts
~~~~~

Loadable fonts and alternate hard fonts are not available in 4010/4014
mode.

.. _S13.2.4:

Enhanced Graphics Module (EGM)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Tektronix enhanced graphics module (EGM) is a 4014 option that
provides a number of special features. The VT300 supports a number of
features available through the EGM option. See "`Graph
Mode <#S13.14>`__" in this chapter.

.. _S13.3:

Screen Addressing
-----------------

The 4010/4014 series terminals use Tekpoints as their unit of screen
addressing. By default, there is a 1024 × 768 Tekpoint matrix. Graphics
input (GIN) mode uses this default matrix. Other operating modes use the
12-bit addressing capability of the EGM option, increasing the visible
matrix to a 4096 × 3072 array.

By contrast, the VT300 has an 800 × 480 pixel matrix. In 4010/4014 mode,
the VT300 uses a 623 × 480 pixel array that is centered on the screen.
In vector drawing, the VT300 uses a 614 × 460 pixel array. The extra
space is used for character drawing.

Because the VT300 has a lower pixel resolution, several Tekpoints map to
one pixel. The VT300 maps Tekpoints to the nearest pixel in the 623 ×
480 array.

.. _S13.4:

Set-Up Support
--------------

The 4010/4014 terminals have four strap options you can select by moving
jumper wires on the terminal's circuit cards.

-  CR effect
-  LF effect
-  Graphics input terminators
-  DEL implies LO Y

On the VT300, you can select these strap options from the Graphics
Set-Up screen. See Installing and Using the VT330/VT340 Video Terminal
for details.

.. _S13.5:

Communication
-------------

In 4010/4014 mode, the terminal uses 7-bit character codes to
communicate with the host. `Figure 13-1 <#F13-1>`__ shows the standard
7-bit ASCII character set. Not all ASCII characters have a valid
function in 4010/4014 mode.

.. table:: Figure 13-1 7-Bit ASCII Character Set

   +-----------------------------------------------------------------------+
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   | | R | COLU                                                            |
   | MN  | 0 |   | 1 |   | 2 |   | 3 |   | 4 |   | 5 |   | 6 |   | 7 |   | |
   | | O |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | | W |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | +===+=====                                                            |
   | ====+===+===+===+===+===+===+===+===+===+===+===+===+===+===+===+===+ |
   | |   | +-                                                              |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   | ---+                                                            |
   | --- | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   | -+--                                                            |
   | --- | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   | -+--                                                            |
   | --+ | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   | |                                                               |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |    |                                                            |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |  | B                                                            |
   | ITS | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |  |                                                              |
   |   | | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   | +-                                                              |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   | ---+                                                            |
   | --- | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   | -+--                                                            |
   | --- | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   | -+--                                                            |
   | --+ | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   | |                                                               |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |    |                                                            |
   |  b7 | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |  |                                                              |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |  |                                                              |
   |   | | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   | +-                                                              |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   | ---+                                                            |
   | --- | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   | -+--                                                            |
   | --- |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   | -+--                                                            |
   | --+ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   | |                                                               |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |    |                                                            |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |  | b                                                            |
   | 6   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |  |                                                              |
   |   | |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   | +-                                                              |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   | ---+                                                            |
   | --- | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   | -+--                                                            |
   | --- |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   | -+--                                                            |
   | --+ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   | |                                                               |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |    |                                                            |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |  |                                                              |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |  | b                                                            |
   | 5 | |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   | +-                                                              |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   | ---+                                                            |
   | --- | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   | -+--                                                            |
   | --- | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   | -+--                                                            |
   | --+ | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   | |                                                               |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   | b4 |                                                            |
   |  b3 | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |  | b                                                            |
   | 2   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |  | b                                                            |
   | 1 | | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   | +-                                                              |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   | ---+                                                            |
   | --- | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   | -+--                                                            |
   | --- | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   | -+--                                                            |
   | --+ | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | 0 |   | 0 |   | 0 |   | 0 |   | 1 |   | 1 |   | 1 |   | 1 |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | 0 |   | 0 |   | 1 |   | 1 |   | 0 |   | 0 |   | 1 |   | 1 |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | 0 |   | 1 |   | 0 |   | 1 |   | 0 |   | 1 |   | 0 |   | 1 |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | |   |                                                                 |
   |     | | |   | | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | - |   | - |   | - |   | - |   | - |   | - |   | - |   | - |   | |
   | |   |                                                                 |
   |     | + |   | + |   | + |   | + |   | + |   | + |   | + |   | + |   | |
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   | | 0 | +--                                                             |
   |     | N | 0 | D | 2 | S | 4 | 0 | 6 | @ | 1 | P | 1 | \ | 1 | p | 1 | |
   | |   | -+--                                                            |
   | -+- | U | 0 | L | 0 | P | 0 |   | 0 |   | 0 |   | 2 | ` | 4 |   | 6 | |
   | |   | --+-                                                            |
   | --+ | L | 0 | E | 1 |   | 3 |   | 4 |   | 0 |   | 0 |   | 0 |   | 0 | |
   | |   | | 0                                                             |
   |     |   |   |   | 6 |   | 2 |   | 8 |   | 6 |   | 8 |   | 9 |   | 1 | |
   | |   |  | 0                                                            |
   |  |  |   |   |   | 1 |   | 2 |   | 3 |   | 4 |   | 0 |   | 6 |   | 1 | |
   | |   | 0 |                                                             |
   | 0 | |   |   |   | 0 |   | 0 |   | 0 |   | 4 |   | 5 |   | 6 |   | 2 | |
   | |   | +--                                                             |
   |     |   |   |   |   |   |   |   |   |   | 0 |   | 0 |   | 0 |   | 7 | |
   | |   | -+--                                                            |
   | -+- |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | 0 | |
   | |   | --+-                                                            |
   | --+ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   | | 1 | +--                                                             |
   |     | S | 1 | D | 2 | ! | 4 | 1 | 6 | A | 1 | Q | 1 | a | 1 | q | 1 | |
   | |   | -+--                                                            |
   | -+- | O | 1 | C | 1 |   | 1 |   | 1 |   | 0 |   | 2 |   | 4 |   | 6 | |
   | |   | --+-                                                            |
   | --+ | H | 1 | 1 | 1 |   | 3 |   | 4 |   | 1 |   | 1 |   | 1 |   | 1 | |
   | |   | | 0                                                             |
   |     |   |   | ( | 7 |   | 3 |   | 9 |   | 6 |   | 8 |   | 9 |   | 1 | |
   | |   |  | 0                                                            |
   |  |  |   |   | X | 1 |   | 2 |   | 3 |   | 5 |   | 1 |   | 7 |   | 1 | |
   | |   | 0 |                                                             |
   | 1 | |   |   | O | 1 |   | 1 |   | 1 |   | 4 |   | 5 |   | 6 |   | 3 | |
   | |   | +--                                                             |
   |     |   |   | N |   |   |   |   |   |   | 1 |   | 1 |   | 1 |   | 7 | |
   | |   | -+--                                                            |
   | -+- |   |   | ) |   |   |   |   |   |   |   |   |   |   |   |   | 1 | |
   | |   | --+-                                                            |
   | --+ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   | | 2 | +--                                                             |
   |     | S | 2 | D | 2 | " | 4 | 2 | 6 | B | 1 | R | 1 | b | 1 | r | 1 | |
   | |   | -+--                                                            |
   | -+- | T | 2 | C | 2 |   | 2 |   | 2 |   | 0 |   | 2 |   | 4 |   | 6 | |
   | |   | --+-                                                            |
   | --+ | X | 2 | 2 | 1 |   | 3 |   | 5 |   | 2 |   | 2 |   | 2 |   | 2 | |
   | |   | | 0                                                             |
   |     |   |   |   | 8 |   | 4 |   | 0 |   | 6 |   | 8 |   | 9 |   | 1 | |
   | |   |  | 0                                                            |
   |  |  |   |   |   | 1 |   | 2 |   | 3 |   | 6 |   | 2 |   | 8 |   | 1 | |
   | |   | 1 |                                                             |
   | 0 | |   |   |   | 2 |   | 2 |   | 2 |   | 4 |   | 5 |   | 6 |   | 4 | |
   | |   | +--                                                             |
   |     |   |   |   |   |   |   |   |   |   | 2 |   | 2 |   | 2 |   | 7 | |
   | |   | -+--                                                            |
   | -+- |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | 2 | |
   | |   | --+-                                                            |
   | --+ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   | | 3 | +--                                                             |
   |     | E | 3 | D | 2 | # | 4 | 3 | 6 | C | 1 | S | 1 | c | 1 | s | 1 | |
   | |   | -+--                                                            |
   | -+- | T | 3 | C | 3 |   | 3 |   | 3 |   | 0 |   | 2 |   | 4 |   | 6 | |
   | |   | --+-                                                            |
   | --+ | X | 3 | 3 | 1 |   | 3 |   | 5 |   | 3 |   | 3 |   | 3 |   | 3 | |
   | |   | | 0                                                             |
   |     |   |   | ( | 9 |   | 5 |   | 1 |   | 6 |   | 8 |   | 9 |   | 1 | |
   | |   |  | 0                                                            |
   |  |  |   |   | X | 1 |   | 2 |   | 3 |   | 7 |   | 3 |   | 9 |   | 1 | |
   | |   | 1 |                                                             |
   | 1 | |   |   | O | 3 |   | 3 |   | 3 |   | 4 |   | 5 |   | 6 |   | 5 | |
   | |   | +--                                                             |
   |     |   |   | F |   |   |   |   |   |   | 3 |   | 3 |   | 3 |   | 7 | |
   | |   | -+--                                                            |
   | -+- |   |   | F |   |   |   |   |   |   |   |   |   |   |   |   | 3 | |
   | |   | --+-                                                            |
   | --+ |   |   | ) |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   | | 4 | +--                                                             |
   |     | E | 4 | D | 2 | $ | 4 | 4 | 6 | D | 1 | T | 1 | d | 1 | t | 1 | |
   | |   | -+--                                                            |
   | -+- | O | 4 | C | 4 |   | 4 |   | 4 |   | 0 |   | 2 |   | 4 |   | 6 | |
   | |   | --+-                                                            |
   | --+ | T | 4 | 4 | 2 |   | 3 |   | 5 |   | 4 |   | 4 |   | 4 |   | 4 | |
   | |   | | 0                                                             |
   |     |   |   |   | 0 |   | 6 |   | 2 |   | 6 |   | 8 |   | 1 |   | 1 | |
   | |   |  | 1                                                            |
   |  |  |   |   |   | 1 |   | 2 |   | 3 |   | 8 |   | 4 |   | 0 |   | 1 | |
   | |   | 0 |                                                             |
   | 0 | |   |   |   | 4 |   | 4 |   | 4 |   | 4 |   | 5 |   | 0 |   | 6 | |
   | |   | +--                                                             |
   |     |   |   |   |   |   |   |   |   |   | 4 |   | 4 |   | 6 |   | 7 | |
   | |   | -+--                                                            |
   | -+- |   |   |   |   |   |   |   |   |   |   |   |   |   | 4 |   | 4 | |
   | |   | --+-                                                            |
   | --+ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   | | 5 | +--                                                             |
   |     | E | 5 | N | 2 | % | 4 | 5 | 6 | E | 1 | U | 1 | e | 1 | u | 1 | |
   | |   | -+--                                                            |
   | -+- | N | 5 | A | 5 |   | 5 |   | 5 |   | 0 |   | 2 |   | 4 |   | 6 | |
   | |   | --+-                                                            |
   | --+ | Q | 5 | K | 2 |   | 3 |   | 5 |   | 5 |   | 5 |   | 5 |   | 5 | |
   | |   | | 0                                                             |
   |     |   |   |   | 1 |   | 7 |   | 3 |   | 6 |   | 8 |   | 1 |   | 1 | |
   | |   |  | 1                                                            |
   |  |  |   |   |   | 1 |   | 2 |   | 3 |   | 9 |   | 5 |   | 0 |   | 1 | |
   | |   | 0 |                                                             |
   | 1 | |   |   |   | 5 |   | 5 |   | 5 |   | 4 |   | 5 |   | 1 |   | 7 | |
   | |   | +--                                                             |
   |     |   |   |   |   |   |   |   |   |   | 5 |   | 5 |   | 6 |   | 7 | |
   | |   | -+--                                                            |
   | -+- |   |   |   |   |   |   |   |   |   |   |   |   |   | 5 |   | 5 | |
   | |   | --+-                                                            |
   | --+ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   | | 6 | +--                                                             |
   |     | A | 6 | S | 2 | & | 4 | 6 | 6 | F | 1 | V | 1 | f | 1 | v | 1 | |
   | |   | -+--                                                            |
   | -+- | C | 6 | Y | 6 |   | 6 |   | 6 |   | 0 |   | 2 |   | 4 |   | 6 | |
   | |   | --+-                                                            |
   | --+ | K | 6 | N | 2 |   | 3 |   | 5 |   | 6 |   | 6 |   | 6 |   | 6 | |
   | |   | | 0                                                             |
   |     |   |   |   | 2 |   | 8 |   | 4 |   | 7 |   | 8 |   | 1 |   | 1 | |
   | |   |  | 1                                                            |
   |  |  |   |   |   | 1 |   | 2 |   | 3 |   | 0 |   | 6 |   | 0 |   | 1 | |
   | |   | 1 |                                                             |
   | 0 | |   |   |   | 6 |   | 6 |   | 6 |   | 4 |   | 5 |   | 2 |   | 8 | |
   | |   | +--                                                             |
   |     |   |   |   |   |   |   |   |   |   | 6 |   | 6 |   | 6 |   | 7 | |
   | |   | -+--                                                            |
   | -+- |   |   |   |   |   |   |   |   |   |   |   |   |   | 6 |   | 6 | |
   | |   | --+-                                                            |
   | --+ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   | | 7 | +--                                                             |
   |     | B | 7 | E | 2 | ' | 4 | 7 | 6 | G | 1 | W | 1 | g | 1 | w | 1 | |
   | |   | -+--                                                            |
   | -+- | E | 7 | T | 7 |   | 7 |   | 7 |   | 0 |   | 2 |   | 4 |   | 6 | |
   | |   | --+-                                                            |
   | --+ | L | 7 | B | 2 |   | 3 |   | 5 |   | 7 |   | 7 |   | 7 |   | 7 | |
   | |   | | 0                                                             |
   |     |   |   |   | 3 |   | 9 |   | 5 |   | 7 |   | 8 |   | 1 |   | 1 | |
   | |   |  | 1                                                            |
   |  |  |   |   |   | 1 |   | 2 |   | 3 |   | 1 |   | 7 |   | 0 |   | 1 | |
   | |   | 1 |                                                             |
   | 1 | |   |   |   | 7 |   | 7 |   | 7 |   | 4 |   | 5 |   | 3 |   | 9 | |
   | |   | +--                                                             |
   |     |   |   |   |   |   |   |   |   |   | 7 |   | 7 |   | 6 |   | 7 | |
   | |   | -+--                                                            |
   | -+- |   |   |   |   |   |   |   |   |   |   |   |   |   | 7 |   | 7 | |
   | |   | --+-                                                            |
   | --+ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   | | 8 | +--                                                             |
   |     | B | 1 | C | 3 | ( | 5 | 8 | 7 | H | 1 | X | 1 | h | 1 | x | 1 | |
   | |   | -+--                                                            |
   | -+- | S | 0 | A | 0 |   | 0 |   | 0 |   | 1 |   | 3 |   | 5 |   | 7 | |
   | |   | --+-                                                            |
   | --+ |   | 8 | N | 2 |   | 4 |   | 5 |   | 0 |   | 0 |   | 0 |   | 0 | |
   | |   | | 1                                                             |
   |     |   | 8 |   | 4 |   | 0 |   | 6 |   | 7 |   | 8 |   | 1 |   | 1 | |
   | |   |  | 0                                                            |
   |  |  |   |   |   | 1 |   | 2 |   | 3 |   | 2 |   | 8 |   | 0 |   | 2 | |
   | |   | 0 |                                                             |
   | 0 | |   |   |   | 8 |   | 8 |   | 8 |   | 4 |   | 5 |   | 4 |   | 0 | |
   | |   | +--                                                             |
   |     |   |   |   |   |   |   |   |   |   | 8 |   | 8 |   | 6 |   | 7 | |
   | |   | -+--                                                            |
   | -+- |   |   |   |   |   |   |   |   |   |   |   |   |   | 8 |   | 8 | |
   | |   | --+-                                                            |
   | --+ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   | | 9 | +--                                                             |
   |     | H | 1 | E | 3 | ) | 5 | 9 | 7 | I | 1 | Y | 1 | i | 1 | y | 1 | |
   | |   | -+--                                                            |
   | -+- | T | 1 | M | 1 |   | 1 |   | 1 |   | 1 |   | 3 |   | 5 |   | 7 | |
   | |   | --+-                                                            |
   | --+ |   | 9 |   | 2 |   | 4 |   | 5 |   | 1 |   | 1 |   | 1 |   | 1 | |
   | |   | | 1                                                             |
   |     |   | 9 |   | 5 |   | 1 |   | 7 |   | 7 |   | 8 |   | 1 |   | 1 | |
   | |   |  | 0                                                            |
   |  |  |   |   |   | 1 |   | 2 |   | 3 |   | 3 |   | 9 |   | 0 |   | 2 | |
   | |   | 0 |                                                             |
   | 1 | |   |   |   | 9 |   | 9 |   | 9 |   | 4 |   | 5 |   | 5 |   | 1 | |
   | |   | +--                                                             |
   |     |   |   |   |   |   |   |   |   |   | 9 |   | 9 |   | 6 |   | 7 | |
   | |   | -+--                                                            |
   | -+- |   |   |   |   |   |   |   |   |   |   |   |   |   | 9 |   | 9 | |
   | |   | --+-                                                            |
   | --+ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   | | 1 | +--                                                             |
   |     | L | 1 | S | 3 | \ | 5 | : | 7 | J | 1 | Z | 1 | j | 1 | z | 1 | |
   | | 0 | -+--                                                            |
   | -+- | F | 2 | U | 2 | * | 2 |   | 2 |   | 1 |   | 3 |   | 5 |   | 7 | |
   | |   | --+-                                                            |
   | --+ |   | 1 | B | 2 |   | 4 |   | 5 |   | 2 |   | 2 |   | 2 |   | 2 | |
   | |   | | 1                                                             |
   |     |   | 0 |   | 6 |   | 2 |   | 8 |   | 7 |   | 9 |   | 1 |   | 1 | |
   | |   |  | 0                                                            |
   |  |  |   | A |   | 1 |   | 2 |   | 3 |   | 4 |   | 0 |   | 0 |   | 2 | |
   | |   | 1 |                                                             |
   | 0 | |   |   |   | A |   | A |   | A |   | 4 |   | 5 |   | 6 |   | 2 | |
   | |   | +--                                                             |
   |     |   |   |   |   |   |   |   |   |   | A |   | A |   | 6 |   | 7 | |
   | |   | -+--                                                            |
   | -+- |   |   |   |   |   |   |   |   |   |   |   |   |   | A |   | A | |
   | |   | --+-                                                            |
   | --+ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   | | 1 | +--                                                             |
   |     | V | 1 | E | 3 | + | 5 | ; | 7 | K | 1 | [ | 1 | k | 1 | { | 1 | |
   | | 1 | -+--                                                            |
   | -+- | T | 3 | S | 3 |   | 3 |   | 3 |   | 1 |   | 3 |   | 5 |   | 7 | |
   | |   | --+-                                                            |
   | --+ |   | 1 | C | 2 |   | 4 |   | 5 |   | 3 |   | 3 |   | 3 |   | 3 | |
   | |   | | 1                                                             |
   |     |   | 1 |   | 7 |   | 3 |   | 9 |   | 7 |   | 9 |   | 1 |   | 1 | |
   | |   |  | 0                                                            |
   |  |  |   | B |   | 1 |   | 2 |   | 3 |   | 5 |   | 1 |   | 0 |   | 2 | |
   | |   | 1 |                                                             |
   | 1 | |   |   |   | B |   | B |   | B |   | 4 |   | 5 |   | 7 |   | 3 | |
   | |   | +--                                                             |
   |     |   |   |   |   |   |   |   |   |   | B |   | B |   | 6 |   | 7 | |
   | |   | -+--                                                            |
   | -+- |   |   |   |   |   |   |   |   |   |   |   |   |   | B |   | B | |
   | |   | --+-                                                            |
   | --+ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   | | 1 | +--                                                             |
   |     | F | 1 | F | 3 | , | 5 | < | 7 | L | 1 | \ | 1 | l | 1 | \ | 1 | |
   | | 2 | -+--                                                            |
   | -+- | F | 4 | S | 4 |   | 4 |   | 4 |   | 1 | \ | 3 |   | 5 | | | 7 | |
   | |   | --+-                                                            |
   | --+ |   | 1 |   | 2 |   | 4 |   | 6 |   | 4 |   | 4 |   | 4 |   | 4 | |
   | |   | | 1                                                             |
   |     |   | 2 |   | 8 |   | 4 |   | 0 |   | 7 |   | 9 |   | 1 |   | 1 | |
   | |   |  | 1                                                            |
   |  |  |   | C |   | 1 |   | 2 |   | 3 |   | 6 |   | 2 |   | 0 |   | 2 | |
   | |   | 0 |                                                             |
   | 0 | |   |   |   | C |   | C |   | C |   | 4 |   | 5 |   | 8 |   | 4 | |
   | |   | +--                                                             |
   |     |   |   |   |   |   |   |   |   |   | C |   | C |   | 6 |   | 7 | |
   | |   | -+--                                                            |
   | -+- |   |   |   |   |   |   |   |   |   |   |   |   |   | C |   | C | |
   | |   | --+-                                                            |
   | --+ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   | | 1 | +--                                                             |
   |     | C | 1 | G | 3 | - | 5 | = | 7 | M | 1 | ] | 1 | m | 1 | } | 1 | |
   | | 3 | -+--                                                            |
   | -+- | R | 5 | S | 5 |   | 5 |   | 5 |   | 1 |   | 3 |   | 5 |   | 7 | |
   | |   | --+-                                                            |
   | --+ |   | 1 |   | 2 |   | 4 |   | 6 |   | 5 |   | 5 |   | 5 |   | 5 | |
   | |   | | 1                                                             |
   |     |   | 3 |   | 9 |   | 5 |   | 1 |   | 7 |   | 9 |   | 1 |   | 1 | |
   | |   |  | 1                                                            |
   |  |  |   | D |   | 1 |   | 2 |   | 3 |   | 7 |   | 3 |   | 0 |   | 2 | |
   | |   | 0 |                                                             |
   | 1 | |   |   |   | D |   | D |   | D |   | 4 |   | 5 |   | 9 |   | 5 | |
   | |   | +--                                                             |
   |     |   |   |   |   |   |   |   |   |   | D |   | D |   | 6 |   | 7 | |
   | |   | -+--                                                            |
   | -+- |   |   |   |   |   |   |   |   |   |   |   |   |   | D |   | D | |
   | |   | --+-                                                            |
   | --+ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   | | 1 | +--                                                             |
   |     | S | 1 | R | 3 | . | 5 | > | 7 | N | 1 | ^ | 1 | n | 1 | ~ | 1 | |
   | | 4 | -+--                                                            |
   | -+- | O | 6 | S | 6 |   | 6 |   | 6 |   | 1 |   | 3 |   | 5 |   | 7 | |
   | |   | --+-                                                            |
   | --+ |   | 1 |   | 3 |   | 4 |   | 6 |   | 6 |   | 6 |   | 6 |   | 6 | |
   | |   | | 1                                                             |
   |     |   | 4 |   | 0 |   | 6 |   | 2 |   | 7 |   | 9 |   | 1 |   | 1 | |
   | |   |  | 1                                                            |
   |  |  |   | E |   | 1 |   | 2 |   | 3 |   | 8 |   | 4 |   | 1 |   | 2 | |
   | |   | 1 |                                                             |
   | 0 | |   |   |   | E |   | E |   | E |   | 4 |   | 5 |   | 0 |   | 6 | |
   | |   | +--                                                             |
   |     |   |   |   |   |   |   |   |   |   | E |   | E |   | 6 |   | 7 | |
   | |   | -+--                                                            |
   | -+- |   |   |   |   |   |   |   |   |   |   |   |   |   | E |   | E | |
   | |   | --+-                                                            |
   | --+ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   | | 1 | +--                                                             |
   |     | S | 1 | U | 3 | / | 5 | ? | 7 | O | 1 | \ | 1 | o | 1 | D | 1 | |
   | | 5 | -+--                                                            |
   | -+- | I | 7 | S | 7 |   | 7 |   | 7 |   | 1 | _ | 3 |   | 5 | E | 7 | |
   | |   | --+-                                                            |
   | --+ |   | 1 |   | 3 |   | 4 |   | 6 |   | 7 |   | 7 |   | 7 | L | 7 | |
   | |   | | 1                                                             |
   |     |   | 5 |   | 1 |   | 7 |   | 3 |   | 7 |   | 9 |   | 1 |   | 1 | |
   | |   |  | 1                                                            |
   |  |  |   | F |   | 1 |   | 2 |   | 3 |   | 9 |   | 5 |   | 1 |   | 2 | |
   | |   | 1 |                                                             |
   | 1 | |   |   |   | F |   | F |   | F |   | 4 |   | 5 |   | 1 |   | 7 | |
   | |   | +--                                                             |
   |     |   |   |   |   |   |   |   |   |   | F |   | F |   | 6 |   | 7 | |
   | |   | -+--                                                            |
   | -+- |   |   |   |   |   |   |   |   |   |   |   |   |   | F |   | F | |
   | |   | --+-                                                            |
   | --+ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | |
   | +---+-----                                                            |
   | ----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+ |
   +-----------------------------------------------------------------------+
   | +------------+-----+---------------------------------------------+    |
   | | KEY        |     |                                             |    |
   | +============+=====+=============================================+    |
   | | CHARACTER  | +-- |  OCTAL                                      |    |
   | |            | -+- |  DECIMAL                                    |    |
   | |            | --+ |  HEX                                        |    |
   | |            | | E |                                             |    |
   | |            |  |  |                                             |    |
   | |            | 3 | |                                             |    |
   | |            | | S |                                             |    |
   | |            |  |  |                                             |    |
   | |            | 3 | |                                             |    |
   | |            | | C |                                             |    |
   | |            |  |  |                                             |    |
   | |            | 2 | |                                             |    |
   | |            | |   |                                             |    |
   | |            |  |  |                                             |    |
   | |            | 7 | |                                             |    |
   | |            | |   |                                             |    |
   | |            |  |  |                                             |    |
   | |            | 1 | |                                             |    |
   | |            | |   |                                             |    |
   | |            |  |  |                                             |    |
   | |            | B | |                                             |    |
   | |            | +-- |                                             |    |
   | |            | -+- |                                             |    |
   | |            | --+ |                                             |    |
   | +------------+-----+---------------------------------------------+    |
   +-----------------------------------------------------------------------+

The function of a valid ASCII character may depend on (1) which
4010/4014 operating mode the terminal is using when the character is
received, and (2) whether or not the ASCII character is part of an
escape sequence.

`Table 13-1 <#T13-1>`__ lists the valid ASCII codes for 4010/4014 mode
and briefly describes their different functions. Later sections on
control characters, escape sequences, and 4010/4014 operating modes
provide more details.

.. table:: Table 13-1 ASCII Character Code Functions

   +-------------+-------------+-------------+-------------+-------------+
   | ASCII       | Operating   |             |             |             |
   | Character   | Mode Value  |             |             |             |
   +=============+=============+=============+=============+=============+
   |             | Alpha       | Graph       | Bypass/GIN  | LCE Flag\*  |
   +-------------+-------------+-------------+-------------+-------------+
   | NUL         | –           | –           | –           | Set LCE.    |
   +-------------+-------------+-------------+-------------+-------------+
   | SOH         | –           | –           | –           | –           |
   +-------------+-------------+-------------+-------------+-------------+
   | STX         | –           | –           | –           | –           |
   +-------------+-------------+-------------+-------------+-------------+
   | ETX         | –           | –           | –           | –           |
   +-------------+-------------+-------------+-------------+-------------+
   | EOT         | –           | –           | –           | –           |
   +-------------+-------------+-------------+-------------+-------------+
   | ENQ         | –           | –           | –           | Return      |
   |             |             |             |             | terminal    |
   |             |             |             |             | status.     |
   +-------------+-------------+-------------+-------------+-------------+
   | ACK         | –           | –           | –           | –           |
   +-------------+-------------+-------------+-------------+-------------+
   | BEL         | Ring bell.  | Ring bell.  | Ring bell.  | Ring bell.  |
   +-------------+-------------+-------------+-------------+-------------+
   | BS          | Left 1      | –           | –           | Left 1      |
   |             | space.      |             |             | space.      |
   +-------------+-------------+-------------+-------------+-------------+
   | HT          | Right 1     | –           | –           | Right 1     |
   |             | space.      |             |             | space.      |
   +-------------+-------------+-------------+-------------+-------------+
   | LF          | Down 1      | –           | Down 1      | Set LCE.†   |
   |             | line.       |             | line.       |             |
   +-------------+-------------+-------------+-------------+-------------+
   | VT          | Up 1 line.  | –           | –           | Up 1 line.  |
   +-------------+-------------+-------------+-------------+-------------+
   | FF          | –           | –           | –           | Erase and   |
   |             |             |             |             | home        |
   |             |             |             |             | (page).     |
   +-------------+-------------+-------------+-------------+-------------+
   | CR          | Move to     | Set alpha   | Set alpha   | Set LCE.†   |
   |             | left        | and left.   | and left.   |             |
   |             | margin.     |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | SO          | –           | –           | –           | –           |
   +-------------+-------------+-------------+-------------+-------------+
   | SI          | –           | –           | –           | –           |
   +-------------+-------------+-------------+-------------+-------------+
   | DLE         | –           | –           | –           | –           |
   +-------------+-------------+-------------+-------------+-------------+
   | DC1         | –           | –           | –           | –           |
   +-------------+-------------+-------------+-------------+-------------+
   | DC2         | –           | –           | –           | –           |
   +-------------+-------------+-------------+-------------+-------------+
   | DC3         | –           | –           | –           | –           |
   +-------------+-------------+-------------+-------------+-------------+
   | DC4         | –           | –           | –           | –           |
   +-------------+-------------+-------------+-------------+-------------+
   | NAK         | –           | –           | –           | –           |
   +-------------+-------------+-------------+-------------+-------------+
   | SYN         | –           | –           | –           | –           |
   +-------------+-------------+-------------+-------------+-------------+
   | ETB         | –           | –           | –           | Make hard   |
   |             |             |             |             | copy.       |
   +-------------+-------------+-------------+-------------+-------------+
   | CAN         | –           | –           | –           | Set bypass. |
   +-------------+-------------+-------------+-------------+-------------+
   | EM          | –           | –           | –           | –           |
   +-------------+-------------+-------------+-------------+-------------+
   | SUB         | –           | –           | –           | Set GIN and |
   |             |             |             |             | bypass.     |
   +-------------+-------------+-------------+-------------+-------------+
   | ESC         | Set LCE.    | Set LCE.    | Set LCE.    | Set LCE.    |
   +-------------+-------------+-------------+-------------+-------------+
   | FS          | Set point   | Set point   | Set point   | Set point   |
   |             | plot.       | plot.       | plot.       | plot.       |
   +-------------+-------------+-------------+-------------+-------------+
   | GS          | Set graph   | Do a dark   | Set graph   | Set graph   |
   |             | and dark    | vector.     | and dark    | and dark    |
   |             | vector.     |             | vector.     | vector.     |
   +-------------+-------------+-------------+-------------+-------------+
   | RS          | Set         | Set         | Set         | Set         |
   |             | incremental | incremental | incremental | incremental |
   |             | plot.       | plot.       | plot.       | plot.       |
   +-------------+-------------+-------------+-------------+-------------+
   | US          | –           | Set alpha   | Set alpha   | Set alpha   |
   |             |             | mode.       | mode.       | mode.       |
   +-------------+-------------+-------------+-------------+-------------+
   | Space       | Right 1     | High X or   | –           | –           |
   |             | space.      | high Y.     |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | !           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | "           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | #           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | $           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | %           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | '           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | (           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | )           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | \*          | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | +           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | ,           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | -           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | .           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | /           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | Aligned     |             |             |             |             |
   | Mode        |             |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | 0           | Print       | High X or   | –           | Smallest    |
   |             | character   | high Y      |             | size‡       |
   +-------------+-------------+-------------+-------------+-------------+
   | 1           | Print       | High X or   | –           | Largest     |
   |             | character   | high Y      |             | size‡       |
   +-------------+-------------+-------------+-------------+-------------+
   | 2           | Print       | High X or   | –           | Largest     |
   |             | character   | high Y      |             | size‡       |
   +-------------+-------------+-------------+-------------+-------------+
   | 3           | Print       | High X or   | –           | Largest     |
   |             | character   | high Y      |             | size‡       |
   +-------------+-------------+-------------+-------------+-------------+
   | 4           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | 5           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | 6           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | 7           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | 8           | Print       | High X or   | –           | Largest     |
   |             | character   | high Y      |             | size        |
   +-------------+-------------+-------------+-------------+-------------+
   | 9           | Print       | High X or   | –           | Large size  |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | :           | Print       | High X or   | –           | Smallest    |
   |             | character   | high Y      |             | size        |
   +-------------+-------------+-------------+-------------+-------------+
   | ;           | Print       | High X or   | –           | Small size  |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | Enlarged    |             |             |             |             |
   | Mode        |             |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | 0           | Print       | High X or   | –           | Small size‡ |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | 1           | Print       | High X or   | –           | Large size‡ |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | 2           | Print       | High X or   | –           | Large size‡ |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | 3           | Print       | High X or   | –           | Large size‡ |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | 4           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | 5           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | 6           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | 7           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | 8           | Print       | High X or   | –           | Large size  |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | 9           | Print       | High X or   | –           | Large size  |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | :           | Print       | High X or   | –           | Small size  |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | ;           | Print       | High X or   | –           | Small size  |
   |             | character   | high Y.     |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   |             |             |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | <           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | =           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | >           | Print       | High X or   | –           | –           |
   |             | character   | high Y      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | ?           | Print       | High X or   | –           | Low Y for   |
   |             | character   | high Y      |             | graph       |
   +-------------+-------------+-------------+-------------+-------------+
   | @           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | A           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | B           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | C           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | D           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | E           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | F           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | G           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | H           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | I           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | J           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | K           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | L           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | M           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | N           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | O           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | P           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | Q           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | R           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | S           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | T           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | U           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | V           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | W           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | X           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | Y           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | Z           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | [           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | \\          | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | ]           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | ^           | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | \_          | Print       | Low X       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | \`          | Print       | Low Y       | –           | (N) solid   |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | a           | Print       | Low Y       | –           | (N) dotted  |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | b           | Print       | Low Y       | –           | (N)         |
   |             | character   |             |             | dot-dash    |
   +-------------+-------------+-------------+-------------+-------------+
   | c           | Print       | Low Y       | –           | (N) short   |
   |             | character   |             |             | dash        |
   +-------------+-------------+-------------+-------------+-------------+
   | d           | Print       | Low Y       | –           | (N) long    |
   |             | character   |             |             | dash        |
   +-------------+-------------+-------------+-------------+-------------+
   | e           | Print       | Low Y       | –           | (N) solid   |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | f           | Print       | Low Y       | –           | (N) solid   |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | g           | Print       | Low Y       | –           | (N) solid   |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | h           | Print       | Low Y       | –           | (B) solid   |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | i           | Print       | Low Y       | –           | (B) dotted  |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | j           | Print       | Low Y       | –           | (B)         |
   |             | character   |             |             | dot-dash    |
   +-------------+-------------+-------------+-------------+-------------+
   | k           | Print       | Low Y       | –           | (B) short   |
   |             | character   |             |             | dash        |
   +-------------+-------------+-------------+-------------+-------------+
   | l           | Print       | Low Y       | –           | (B) long    |
   |             | character   |             |             | dash        |
   +-------------+-------------+-------------+-------------+-------------+
   | m           | Print       | Low Y       | –           | (B) solid   |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | n           | Print       | Low Y       | –           | (B) solid   |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | o           | Print       | Low Y       | –           | (B) solid   |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | p           | Print       | Low Y       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | q           | Print       | Low Y       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | r           | Print       | Low Y       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | s           | Print       | Low Y       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | t           | Print       | Low Y       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | u           | Print       | Low Y       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | v           | Print       | Low Y       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | w           | Print       | Low Y       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | x           | Print       | Low Y       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | y           | Print       | Low Y       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | z           | Print       | Low Y       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | {           | Print       | Low Y       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | \|          | Print       | Low Y       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | }           | Print       | Low Y       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | ~           | Print       | Low Y       | –           | –           |
   |             | character   |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | DEL         | –           | Low Y or    | –           | Set LCE.    |
   |             |             | no-op§      |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | \* The      |             |             |             |             |
   | ASCII       |             |             |             |             |
   | character   |             |             |             |             |
   | performs    |             |             |             |             |
   | the         |             |             |             |             |
   | function    |             |             |             |             |
   | listed when |             |             |             |             |
   | used as     |             |             |             |             |
   | part of an  |             |             |             |             |
   | escape      |             |             |             |             |
   | sequence.   |             |             |             |             |
   | The LCE     |             |             |             |             |
   | flag is an  |             |             |             |             |
   | escape      |             |             |             |             |
   | sequence    |             |             |             |             |
   | introducer  |             |             |             |             |
   | condition.  |             |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | † Filler    |             |             |             |             |
   | CRs and     |             |             |             |             |
   | filler LFs  |             |             |             |             |
   | have no     |             |             |             |             |
   | effect.     |             |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | ‡ ESC 0,    |             |             |             |             |
   | ESC 1, ESC  |             |             |             |             |
   | 2, and ESC  |             |             |             |             |
   | 3 are not   |             |             |             |             |
   | r           |             |             |             |             |
   | ecommended. |             |             |             |             |
   | These       |             |             |             |             |
   | sequences   |             |             |             |             |
   | may not be  |             |             |             |             |
   | supported   |             |             |             |             |
   | in future   |             |             |             |             |
   | terminals.  |             |             |             |             |
   | Use ESC 8,  |             |             |             |             |
   | ESC 9, ESC  |             |             |             |             |
   | :, or ESC ; |             |             |             |             |
   | for         |             |             |             |             |
   | character   |             |             |             |             |
   | size        |             |             |             |             |
   | selection.  |             |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | § In graph  |             |             |             |             |
   | mode, you   |             |             |             |             |
   | can disable |             |             |             |             |
   | the effect  |             |             |             |             |
   | of DEL as a |             |             |             |             |
   | low Y       |             |             |             |             |
   | character   |             |             |             |             |
   | by          |             |             |             |             |
   | selecting   |             |             |             |             |
   | the "DEL    |             |             |             |             |
   | implies low |             |             |             |             |
   | Y" field in |             |             |             |             |
   | the         |             |             |             |             |
   | Graphics    |             |             |             |             |
   | Set-Up      |             |             |             |             |
   | screen. If  |             |             |             |             |
   | DEL cannot  |             |             |             |             |
   | be used,    |             |             |             |             |
   | the program |             |             |             |             |
   | can         |             |             |             |             |
   | substitute  |             |             |             |             |
   | ESC ?,      |             |             |             |             |
   | which       |             |             |             |             |
   | performs    |             |             |             |             |
   | the same    |             |             |             |             |
   | function as |             |             |             |             |
   | DEL.        |             |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+
   | (N) =       |             |             |             |             |
   | normal, (B) |             |             |             |             |
   | = bold.     |             |             |             |             |
   +-------------+-------------+-------------+-------------+-------------+

.. _S13.6:

Locator Device (Mouse or Graphics Tablet)
-----------------------------------------

You can use a mouse or graphics tablet in 4010/4014 mode. You can use
the mouse, tablet, or keyboard arrow keys to move the cursor and send
reports in 4010/4014 graphics input (GIN) mode. `Chapter
15 <chapter15.html>`__ describes how to use a mouse or tablet in GIN
mode.

.. _S13.7:

Control Characters
------------------

`Table 13-2 <#T13-2>`__ describes the ASCII control characters that the
VT300 recognizes in 4010/4014 mode. The terminal ignores other ASCII
control characters in this mode. These characters can come from the host
or the VT300 keyboard.

NOTE: Tables `13-2 <#T13-2>`__ and `13-3 <#T13-3>`__ list the location
(column and row) of each control character in the ASCII character set
(`Figure 13-1 <#F13-1>`__). The character set provides the octal,
decimal, and hex values for each ASCII code.

.. table:: Table 13-2 Valid ASCII Control Characters in 4010/4014 Mode

   +----------+-------------+------------------+--------------------+
   | Mnemonic | Column/ Row | Name             | Action             |
   +==========+=============+==================+====================+
   | BEL      | 0/7         | Bell             | Rings the bell     |
   |          |             |                  | tone (if the bell  |
   |          |             |                  | is enabled),       |
   |          |             |                  | clears the bypass  |
   |          |             |                  | condition, and     |
   |          |             |                  | clears the         |
   |          |             |                  | condition that     |
   |          |             |                  | prevents the       |
   |          |             |                  | terminal from      |
   |          |             |                  | responding to      |
   |          |             |                  | carriage returns.  |
   +----------+-------------+------------------+--------------------+
   | BS       | 0/8         | Backspace        | Moves the cursor   |
   |          |             |                  | left one position. |
   |          |             |                  | If the current     |
   |          |             |                  | position is at the |
   |          |             |                  | left margin, no    |
   |          |             |                  | action occurs.     |
   +----------+-------------+------------------+--------------------+
   | HT       | 0/9         | Horizontal tab   | Moves the cursor   |
   |          |             |                  | one tab space to   |
   |          |             |                  | the right. If the  |
   |          |             |                  | current position   |
   |          |             |                  | is already at the  |
   |          |             |                  | end of the line,   |
   |          |             |                  | HT causes an       |
   |          |             |                  | automatic line     |
   |          |             |                  | feed and carriage  |
   |          |             |                  | return.            |
   +----------+-------------+------------------+--------------------+
   | LF       | 0/10        | Line feed        | Moves the cursor   |
   |          |             |                  | down one line. If  |
   |          |             |                  | the cursor is      |
   |          |             |                  | already on the     |
   |          |             |                  | bottom row of the  |
   |          |             |                  | screen, LF moves   |
   |          |             |                  | the cursor to the  |
   |          |             |                  | top of the screen  |
   |          |             |                  | and switches       |
   |          |             |                  | margins. Clears    |
   |          |             |                  | the bypass         |
   |          |             |                  | condition.         |
   +----------+-------------+------------------+--------------------+
   | VT       | 0/11        | Vertical tab     | Moves the cursor   |
   |          |             |                  | up one line. The   |
   |          |             |                  | cursor stops at    |
   |          |             |                  | the top line.      |
   +----------+-------------+------------------+--------------------+
   | CR       | 0/13        | Carriage return  | Moves the cursor   |
   |          |             |                  | to the current     |
   |          |             |                  | left margin.       |
   |          |             |                  | Resets the         |
   |          |             |                  | terminal from      |
   |          |             |                  | graph mode to      |
   |          |             |                  | alpha mode.        |
   |          |             |                  | Cancels the        |
   |          |             |                  | crosshair cursor   |
   |          |             |                  | when setting alpha |
   |          |             |                  | mode, but leaves   |
   |          |             |                  | the terminal with  |
   |          |             |                  | an undefined       |
   |          |             |                  | margin and page    |
   |          |             |                  | full status.       |
   |          |             |                  | Clears the bypass  |
   |          |             |                  | condition.         |
   +----------+-------------+------------------+--------------------+
   | ESC      | 1/11        | Escape           | Escape sequence    |
   |          |             |                  | introducer.        |
   +----------+-------------+------------------+--------------------+
   | FS       | 1/12        | File separator   | Selects point plot |
   |          |             |                  | mode.              |
   +----------+-------------+------------------+--------------------+
   | GS       | 1/13        | Group separator  | Selects graph      |
   |          |             |                  | mode.              |
   +----------+-------------+------------------+--------------------+
   | RS       | 1/14        | Record separator | Selects            |
   |          |             |                  | incremental plot   |
   |          |             |                  | mode.              |
   +----------+-------------+------------------+--------------------+
   | US       | 1/15        | Unit separator   | Resets terminal    |
   |          |             |                  | from graph mode to |
   |          |             |                  | alpha mode. Clears |
   |          |             |                  | the bypass         |
   |          |             |                  | condition.         |
   +----------+-------------+------------------+--------------------+

To send control characters from the keyboard, you hold down the **Ctrl**
key and press another key. `Table 13-3 <#T13-3>`__ lists the keys you
use to send ASCII control characters from the keyboard.

The terminal buffers and stores control characters received in GIN mode,
until the terminal leaves GIN mode.

.. table:: Table 13-3 Keys Used to Send ASCII Control Characters

   ======== =========== =====================
   Mnemonic Column/ Row Key Pressed with Ctrl
   ======== =========== =====================
   ENQ      0/5         E
   BEL      0/7         G
   BS       0/8         H
   HT       0/9         I
   LF       0/10        J
   VT       0/11        K
   FF       0/12        L
   CR       0/13        M
   ETB      1/7         W
   CAN      1/8         X
   SUB      1/10        Z
   ESC      1/11        3
   FS       1/12        4
   GS       1/13        5
   RS       1/14        6
   US       1/15        7
   ======== =========== =====================

.. _S13.8:

Escape Sequences
----------------

The following sections describe the escape sequences you can use in
4010/4014 mode. The terminal ignores any other escape sequences received
in this mode. The valid escape sequences can come from the host or the
VT300 keyboard.

The sequences contain control characters. To send the control character
codes from the keyboard, you hold down the **Ctrl** key and press
another key. `Table 13-3 <#T13-3>`__ lists the keys to press for each
control character.

In GIN mode, the terminal buffers and stores escape sequences, until the
terminal exits GIN mode. After exiting GIN mode, the terminal performs
the buffered escape sequences.

.. _S13.8.1:

Available Functions
~~~~~~~~~~~~~~~~~~~

You can perform the following functions with escape sequences in
4010/4014 mode.

-  Request terminal status.
-  Print hard copy of the bitmap.
-  Set bypass condition.
-  Set alpha mode.
-  Set GIN mode.
-  Set point plot mode.
-  Select raster writing mode features.
-  Select character sizes.
-  Select vector patterns.
-  Prevent response to carriage returns (CRs) or line feeds (LFs).
-  Set LCE flag. (Indicates an escape sequence introduction condition.)
-  Delete character.

.. _S13.8.2:

Request Terminal Status
~~~~~~~~~~~~~~~~~~~~~~~

This sequence sets the terminal to the bypass condition and requests the
status of the terminal.

.. container:: example

   ==== ===
   ESC  ENQ
   1/11 0/5
   ==== ===

The response of the terminal depends on the current operating mode. In
alpha mode, the terminal sends status information and the address of the
lower-left corner of the alpha cursor. In graph mode, the terminal sends
status information and the address of the current cursor position.

.. _S13.8.3:

Print Hard Copy of the Bitmap
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This sequence prints a hard copy of the terminal's bitmap by using the
sixel protocol (`Chapter 16 <chapter16.html>`__). The sequence also
clears the bypass condition. The sequence only works when a printer is
connected to the terminal's printer port.

.. container:: example

   ==== ===
   ESC  ETB
   1/11 1/7
   ==== ===

.. _S13.8.4:

Set Bypass Condition
~~~~~~~~~~~~~~~~~~~~

This sequence selects the bypass condition. In the bypass condition, the
VT300 ignores any data received from the host.

.. container:: example

   ==== ===
   ESC  CAN
   1/11 1/8
   ==== ===

.. _S13.8.5:

Set Alpha Mode
~~~~~~~~~~~~~~

This sequence selects alpha mode. Selecting alpha mode erases the
screen, moves the current position to the upper-left corner, activates
margin 1, and clears the bypass condition.

.. container:: example

   ==== ====
   ESC  FF
   1/11 0/12
   ==== ====

.. _S13.8.6:

Set GIN Mode
~~~~~~~~~~~~

This sequence selects graphics input mode.

.. container:: example

   ==== ====
   ESC  SUB
   1/11 1/10
   ==== ====

.. _S13.8.7:

Set Point Plot Mode
~~~~~~~~~~~~~~~~~~~

This sequence selects point plot mode and sets the pattern register to
solid.

.. container:: example

   ==== ====
   ESC  FS
   1/11 1/12
   ==== ====

.. _S13.8.8:

Select Raster Writing Mode Features
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

These sequences let you use raster writing features in alpha and graph
modes.

NOTE: These sequences are not part of the 4010/4014 protocol.

+-----------------------+-----------------------+-----------------------+
| Feature               | Sequence              | Function              |
+=======================+=======================+=======================+
| Overlay mode          | ==== ==== === ===     | Set dots on.          |
|                       | ESC  /    0   d       |                       |
|                       | 1/11 2/15 3/0 6/4     |                       |
|                       | ==== ==== === ===     |                       |
+-----------------------+-----------------------+-----------------------+
| Erase mode            | ==== ==== === ===     | Sets dots off.        |
|                       | ESC  /    1   d       |                       |
|                       | 1/11 2/15 3/1 6/4     |                       |
|                       | ==== ==== === ===     |                       |
+-----------------------+-----------------------+-----------------------+
| Complement mode       | ==== ==== === ===     | Complements dots.     |
|                       | ESC  /    2   d       |                       |
|                       | 1/11 2/15 3/2 6/4     |                       |
|                       | ==== ==== === ===     |                       |
+-----------------------+-----------------------+-----------------------+

.. _S13.8.9:

Select Character Size
~~~~~~~~~~~~~~~~~~~~~

These sequences select character sizes, depending on whether aligned or
enlarged characters are selected in Graphics Set-Up. There are four
sizes of aligned characters and two sizes of enlarged characters.

NOTE: Digital does not recommend using ``ESC 0``, ``ESC 1``, ``ESC 2``,
and ``ESC 3``. These sequences are not standard Tektronix sequences, and
may not be supported in future terminals. Use ``ESC 8``, ``ESC 9``,
``ESC :``, or ``ESC ;`` for character size selection.

+-----------------------------------+-----------------------------------+
| Sequence                          | Function                          |
+===================================+===================================+
| Aligned Mode                      |                                   |
+-----------------------------------+-----------------------------------+
| ==== ===                          | **Selects 35 lines of 74          |
| ESC  8                            | characters each (default).**      |
| 1/11 3/8                          |                                   |
| ==== ===                          |                                   |
+-----------------------------------+-----------------------------------+
| ==== ===                          | Selects 38 lines of 81 characters |
| ESC  9                            | each.                             |
| 1/11 3/9                          |                                   |
| ==== ===                          |                                   |
+-----------------------------------+-----------------------------------+
| ==== ====                         | Selects 58 lines of 121           |
| ESC  :                            | characters each.                  |
| 1/11 3/10                         |                                   |
| ==== ====                         |                                   |
+-----------------------------------+-----------------------------------+
| ==== ====                         | Selects 64 lines of 133           |
| ESC  ;                            | characters each.                  |
| 1/11 3/11                         |                                   |
| ==== ====                         |                                   |
+-----------------------------------+-----------------------------------+
| ==== ===                          | Selects 64 lines of 133           |
| ESC  0                            | characters each.                  |
| 1/11 3/0                          |                                   |
| ==== ===                          |                                   |
+-----------------------------------+-----------------------------------+
| ==== ===                          | Selects 35 lines of 74 characters |
| ESC  1                            | each.                             |
| 1/11 3/1                          |                                   |
| ==== ===                          |                                   |
+-----------------------------------+-----------------------------------+
| ==== ===                          | Selects 35 lines of 74 characters |
| ESC  2                            | each.                             |
| 1/11 3/2                          |                                   |
| ==== ===                          |                                   |
+-----------------------------------+-----------------------------------+
| ==== ===                          | Selects 35 lines of 74 characters |
| ESC  3                            | each.                             |
| 1/11 3/3                          |                                   |
| ==== ===                          |                                   |
+-----------------------------------+-----------------------------------+
| Enlarged Mode                     |                                   |
+-----------------------------------+-----------------------------------+
| ==== ===                          | **Selects 24 lines of 69          |
| ESC  8                            | characters each (default).**      |
| 1/11 3/8                          |                                   |
| ==== ===                          |                                   |
+-----------------------------------+-----------------------------------+
| ==== ===                          | Selects 24 lines of 69 characters |
| ESC  9                            | each.                             |
| 1/11 3/9                          |                                   |
| ==== ===                          |                                   |
+-----------------------------------+-----------------------------------+
| ==== ====                         | Selects 47 lines of 125           |
| ESC  :                            | characters each.                  |
| 1/11 3/10                         |                                   |
| ==== ====                         |                                   |
+-----------------------------------+-----------------------------------+
| ==== ====                         | Selects 47 lines of 125           |
| ESC  ;                            | characters each.                  |
| 1/11 3/11                         |                                   |
| ==== ====                         |                                   |
+-----------------------------------+-----------------------------------+
| ==== ===                          | Selects 47 lines of 125           |
| ESC  0                            | characters each.                  |
| 1/11 3/0                          |                                   |
| ==== ===                          |                                   |
+-----------------------------------+-----------------------------------+
| ==== ===                          | Selects 24 lines of 69 characters |
| ESC  1                            | each.                             |
| 1/11 3/1                          |                                   |
| ==== ===                          |                                   |
+-----------------------------------+-----------------------------------+
| ==== ===                          | Selects 24 lines of 69 characters |
| ESC  2                            | each.                             |
| 1/11 3/2                          |                                   |
| ==== ===                          |                                   |
+-----------------------------------+-----------------------------------+
| ==== ===                          | Selects 24 lines of 69 characters |
| ESC  3                            | each.                             |
| 1/11 3/3                          |                                   |
| ==== ===                          |                                   |
+-----------------------------------+-----------------------------------+

.. _S13.8.10:

Select Vector Patterns
~~~~~~~~~~~~~~~~~~~~~~

These sequences select the type of pattern the terminal uses for vector
drawing.

+-----------------------+-----------------------+-----------------------+
| Sequence              | Pattern               | Intensity             |
+=======================+=======================+=======================+
| ==== ===              | Solid                 | Normal                |
| ESC  \`               |                       |                       |
| 1/11 6/0              |                       |                       |
| ==== ===              |                       |                       |
+-----------------------+-----------------------+-----------------------+
| ==== ===              | Dotted                | Normal                |
| ESC  a                |                       |                       |
| 1/11 6/1              |                       |                       |
| ==== ===              |                       |                       |
+-----------------------+-----------------------+-----------------------+
| ==== ===              | Dot-dash              | Normal                |
| ESC  b                |                       |                       |
| 1/11 6/2              |                       |                       |
| ==== ===              |                       |                       |
+-----------------------+-----------------------+-----------------------+
| ==== ===              | Short dash            | Normal                |
| ESC  c                |                       |                       |
| 1/11 6/3              |                       |                       |
| ==== ===              |                       |                       |
+-----------------------+-----------------------+-----------------------+
| ==== ===              | Long dash             | Normal                |
| ESC  d                |                       |                       |
| 1/11 6/4              |                       |                       |
| ==== ===              |                       |                       |
+-----------------------+-----------------------+-----------------------+
| ==== ===              | Solid                 | Normal                |
| ESC  e                |                       |                       |
| 1/11 6/5              |                       |                       |
| ==== ===              |                       |                       |
+-----------------------+-----------------------+-----------------------+
| ==== ===              | Solid                 | Normal                |
| ESC  f                |                       |                       |
| 1/11 6/6              |                       |                       |
| ==== ===              |                       |                       |
+-----------------------+-----------------------+-----------------------+
| ==== ===              | Solid                 | Normal                |
| ESC  g                |                       |                       |
| 1/11 6/7              |                       |                       |
| ==== ===              |                       |                       |
+-----------------------+-----------------------+-----------------------+
| ==== ===              | Solid                 | Bold                  |
| ESC  h                |                       |                       |
| 1/11 6/8              |                       |                       |
| ==== ===              |                       |                       |
+-----------------------+-----------------------+-----------------------+
| ==== ===              | Dotted                | Bold                  |
| ESC  i                |                       |                       |
| 1/11 6/9              |                       |                       |
| ==== ===              |                       |                       |
+-----------------------+-----------------------+-----------------------+
| ==== ====             | Dot-dash              | Bold                  |
| ESC  j                |                       |                       |
| 1/11 6/10             |                       |                       |
| ==== ====             |                       |                       |
+-----------------------+-----------------------+-----------------------+
| ==== ====             | Short dash            | Bold                  |
| ESC  k                |                       |                       |
| 1/11 6/11             |                       |                       |
| ==== ====             |                       |                       |
+-----------------------+-----------------------+-----------------------+
| ==== ====             | Long dash             | Bold                  |
| ESC  l                |                       |                       |
| 1/11 6/12             |                       |                       |
| ==== ====             |                       |                       |
+-----------------------+-----------------------+-----------------------+
| ==== ====             | Solid                 | Bold                  |
| ESC  m                |                       |                       |
| 1/11 6/13             |                       |                       |
| ==== ====             |                       |                       |
+-----------------------+-----------------------+-----------------------+
| ==== ====             | Solid                 | Bold                  |
| ESC  n                |                       |                       |
| 1/11 6/14             |                       |                       |
| ==== ====             |                       |                       |
+-----------------------+-----------------------+-----------------------+
| ==== ====             | Solid                 | Bold                  |
| ESC  o                |                       |                       |
| 1/11 6/15             |                       |                       |
| ==== ====             |                       |                       |
+-----------------------+-----------------------+-----------------------+

.. _S13.8.11:

Prevent Response to CRs or LFs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

These sequences prevent the terminal from responding to carriage returns
(CRs) or line feeds (LFs).

+-----------------------------------+-----------------------------------+
| ==== ====                         | Prevents the terminal from        |
| ESC  CR                           | responding to carriage returns.   |
| 1/11 0/13                         |                                   |
| ==== ====                         |                                   |
+-----------------------------------+-----------------------------------+
| ==== ====                         | Prevents the terminal from        |
| ESC  LF                           | responding to line feeds.         |
| 1/11 0/10                         |                                   |
| ==== ====                         |                                   |
+-----------------------------------+-----------------------------------+

After you send these sequences, the terminal does not process any CRs or
LFs until it receives a BEL (or some other no-operation control code).
Your application can use these escape sequences, if your operating
system environment prefers shorter lines and tends to insert CR and LF
as fillers.

.. _S13.8.12:

Set LCE Flag
~~~~~~~~~~~~

You can use any of these sequences to set the LCE flag. The LCE flag is
an escape sequence introducer condition.

+-----------------------------------+-----------------------------------+
| ==== ====                         | Sets the LCE flag.                |
| ESC  DEL                          |                                   |
| 1/11 7/15                         |                                   |
| ==== ====                         |                                   |
+-----------------------------------+-----------------------------------+
| ==== ===                          | Sets the LCE flag.                |
| ESC  NUL                          |                                   |
| 1/11 0/0                          |                                   |
| ==== ===                          |                                   |
+-----------------------------------+-----------------------------------+
| ==== ====                         | Sets the LCE flag.                |
| ESC  ESC                          |                                   |
| 1/11 1/11                         |                                   |
| ==== ====                         |                                   |
+-----------------------------------+-----------------------------------+
| ==== ====                         | Sets the LCE flag and prevents    |
| ESC  CR                           | the terminal from responding to   |
| 1/11 0/13                         | CRs.                              |
| ==== ====                         |                                   |
+-----------------------------------+-----------------------------------+
| ==== ====                         | Sets the LCE flag and prevents    |
| ESC  LF                           | the terminal from responding to   |
| 1/11 0/10                         | LFs.                              |
| ==== ====                         |                                   |
+-----------------------------------+-----------------------------------+

.. _S13.8.13:

Delete Character
~~~~~~~~~~~~~~~~

The 4010/4014 terminals have a "DEL implies low Y" strap option, that
you can turn on or off in the Graphics Set-Up screen of the VT300. (See
Installing and Using the VT330/VT340 Video Terminal.) This option lets
the terminal interpret the ASCII DEL control character as a possible low
Y value in 4010-series coordinate specifications.

Using DEL as a low Y value may cause problems if your operating system
uses DEL for synchronization. In such cases, you can use the following
sequence as a substitute for the low Y coordinate value of DEL.

.. container:: example

   ==== ====
   ESC  ?
   1/11 3/15
   ==== ====

.. _S13.8.14:

4010/4014 Functions the Terminal Ignores
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The VT300 ignores the following control functions in 4010/4014 mode.

======== ====================================================
Sequence Function
======== ====================================================
ESC SO   Selects alternate character set.
ESC SI   Selects ASCII character set.
ESC p    Sets solid vector pattern with write-through.
ESC q    Sets dotted vector pattern with write-through.
ESC r    Sets dot-dashed vector pattern with write-through.
ESC s    Sets short dashed vector pattern with write-through.
ESC t    Sets long dashed vector pattern with write-through.
ESC u    Sets solid vector pattern with write-through.
ESC v    Sets solid vector pattern with write-through.
ESC w    Sets solid vector pattern with write-through.
======== ====================================================

.. _S13.8.15:

Escape Sequences for Control Characters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following escape sequences have the same function as the control
character listed.

======== =================
Sequence Control Character
======== =================
ESC BEL  BEL
ESC BS   BS
ESC HT   HT
ESC VT   VT
ESC GS   GS
ESC RS   RS
ESC US   US
======== =================

.. _S13.9:

Entering and Exiting 4010/4014 Mode
-----------------------------------

The VT300 enters 4010/4014 in alpha mode. The terminal exits 4010/4014
mode to VT300 mode with 7-bit controls. There are two ways to enter and
exit 4010/4014 mode.

-  | **Use the Graphics Set-Up screen.**
   | See Installing and Using the VT330/VT340 Video Terminal for
     details.

-  **Use the following escape sequences.**

   +-----------------------------------+-----------------------------------+
   | ==== ==== ==== === === ===        | Enter 4010/4014 mode.             |
   | ESC  [    ?    3   8   h          |                                   |
   | 1/11 5/11 3/15 3/3 3/8 6/8        |                                   |
   | ==== ==== ==== === === ===        |                                   |
   +-----------------------------------+-----------------------------------+
   | ==== ==== ==== === === ====       | Exit 4010/4014 mode.              |
   | ESC  [    ?    3   8   l          |                                   |
   | 1/11 5/11 3/15 3/3 3/8 6/12       |                                   |
   | ==== ==== ==== === === ====       |                                   |
   +-----------------------------------+-----------------------------------+

You can mix the two methods of entering and exiting 4010/4014 mode. That
is, you can enter 4010/4014 mode via set-up and exit via escape
sequences, or enter via escape sequences and exit via set-up.

When you enter 4010/4014 mode, the VT300 erases the screen to black and
sets the output map according to the Global Set-Up screen.

-  The gray selection sets the output map to a gray scale.

-  The color selection sets the output map to a gray scale for the VT330
   and green scale for the VT340.

The terminal then displays images in normal intensity (for normal beam
focus) or in bold (for defocused beam).

When you leave 4010/4014 mode, the terminal erases the screen and sets
the output map to the factory-default state, or the state specified in
set-up. The factory-default state is VT300 mode, 7-bit controls.

.. _S13.10:

Changing Operating Modes
------------------------

In 4010/4014 mode, you can use five different operating modes. You use
control characters or escape sequences to change between these operating
modes.

`Figure 13-2 <#F13-2>`__ shows the five operating modes available in
4010/4014 mode. The arrows represent possible changes between modes.
Next to each arrow is the ASCII control character or escape sequence you
use to make the mode change.

.. table:: Figure 13-2 4010/4014 Mode Transition Diagram

   +-------------------------------------------------------------------------+
   | |image1|                                                                |
   +-------------------------------------------------------------------------+
   | +-------+-------------------------------------------------------------+ |
   | | NOTES |                                                             | |
   | +-------+-------------------------------------------------------------+ |
   | | 1.    | US, CR, ESC US, ESC FF, or Next Screen key.                 | |
   | +-------+-------------------------------------------------------------+ |
   | | 2.    | Next Screen key (or any other active non-arrow key entered  | |
   | |       | from the keyboard).                                         | |
   | +-------+-------------------------------------------------------------+ |
   +-------------------------------------------------------------------------+

Except for GIN mode, these control characters and escape sequences can
come from the host or the keyboard. In GIN mode, the terminal buffers
all host input until you leave GIN mode. You can only leave GIN mode
from the keyboard.

.. _S13.11:

Clearing the Screen
-------------------

The 4010/4014 series terminals have a clear screen key on their
keyboard. In 4010/4014 mode, you use the **Next Page** key instead. You
can also clear the screen with the **Clear Display** feature in the
Set-Up Directory screen.

.. _S13.12:

Bypass Condition
----------------

When you select the bypass condition, the terminal ignores any
characters received from the host. This condition lets the terminal
ignore its own transmissions if they are incorrectly echoed by the host.

You can turn the bypass condition on from the keyboard or the host,
using any of the following escape sequences.

+-----------------+-----------------------------------------------------+
| ESC CAN         | Selects the bypass condition only.                  |
+-----------------+-----------------------------------------------------+
| ESC ENQ         | Selects the bypass condition and requests status    |
|                 | information.                                        |
+-----------------+-----------------------------------------------------+
| ESC SUB         | Selects the bypass condition and places the VT300   |
|                 | in GIN mode.                                        |
+-----------------+-----------------------------------------------------+

You can turn off the bypass condition with a control character, escape
sequence, or the **Next Page** key.

+-----------------+-----------------------------------------------------+
| Control         |                                                     |
| Characters      |                                                     |
+-----------------+-----------------------------------------------------+
| BEL             | Rings the bell tone, if the bell is enabled.        |
+-----------------+-----------------------------------------------------+
| LF              | Causes a new line operation.                        |
+-----------------+-----------------------------------------------------+
| CR              | Moves the cursor to the left margin and resets the  |
|                 | terminal to alpha mode.                             |
+-----------------+-----------------------------------------------------+
| US              | Resets the terminal from graph mode to alpha mode.  |
+-----------------+-----------------------------------------------------+
| Escape          |                                                     |
| Sequences       |                                                     |
+-----------------+-----------------------------------------------------+
| ESC ETB         | Prints a hard copy of the bitmap.                   |
+-----------------+-----------------------------------------------------+
| ESC FF          | Selects alpha mode and clears the screen.           |
+-----------------+-----------------------------------------------------+
| Key             |                                                     |
+-----------------+-----------------------------------------------------+
| Next Page       | Selects alpha mode and clears the screen.           |
+-----------------+-----------------------------------------------------+

.. _S13.13:

Alpha Mode
----------

When you enter 4010/4014 mode, you automatically select alpha mode as
the default operating mode. In alpha mode, the terminal displays
received characters in the currently selected character size.

The terminal does not display ASCII control characters and escape
sequence characters. The terminal only processes the control characters
and escape sequences listed in the previous sections.

.. _S13.13.1:

Character Sizes
~~~~~~~~~~~~~~~

In alpha mode, you can select aligned or enlarged characters. You can
select four different sizes of aligned characters and two different
sizes of enlarged characters. You select the character size with escape
sequences.

+-------------------------------+--------------------------------------+
| Character Size                | Sequence                             |
+===============================+======================================+
| Aligned Mode                  |                                      |
+-------------------------------+--------------------------------------+
| 35 lines of 74 characters     | **ESC 8** (default), ESC 1, ESC 2,   |
|                               | or ESC 3                             |
+-------------------------------+--------------------------------------+
| 38 lines of 81 characters     | ESC 9                                |
+-------------------------------+--------------------------------------+
| 58 lines of 121 characters    | ESC :                                |
+-------------------------------+--------------------------------------+
| 64 lines of 133 characters    | ESC ; or ESC 0                       |
+-------------------------------+--------------------------------------+
| Enlarged Mode                 |                                      |
+-------------------------------+--------------------------------------+
| 24 lines of 69 characters     | **ESC 8** (default), ESC 9, ESC 1,   |
|                               | ESC 2, or ESC 3                      |
+-------------------------------+--------------------------------------+
| 48 lines of 124 characters    | ESC :, ESC ;, or ESC 0               |
+-------------------------------+--------------------------------------+

.. _S13.13.2:

Margins for Two-Column Writing
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In alpha mode, you can use two-column writing. This form of writing uses
two margins. Margin 1 is at the left edge of the display area. Margin 2
is at the center of each row in the display area.

Margin 1 is active when the terminal writes rows of characters from the
left edge. Margin 2 is active when the terminal writes from the center
of the display area.

The active margin automatically switches after one of the following
events.

-  The terminal fills the last row for the currently active margin.

-  The terminal receives a line feed on the last row of the display.

The terminal then wraps characters around to the top row of the display,
at the new margin.

Since 4010/4014 terminals are storage tube terminals, they cannot
scroll. In 4010/4014 mode, you cannot scroll. In alpha mode, the VT300
writes characters as follows. (This description assumes that the
terminal does not receive any control characters while writing.)

#. Character processing starts on the top row, from the upper-left
   corner to the upper-right corner.

#. When the terminal reaches the right edge of a row, the terminal wraps
   the next character to the left edge of next row down.

#. The terminal continues writing until it fills the bottom row.

#. When the bottom row is full, the next character wraps around to the
   top row at the middle of the screen.

#. The terminal now writes characters from the middle of the screen to
   the right edge, overstriking any characters already displayed.

#. As each row fills, the next character wraps to the middle of the next
   row.

#. The terminal continues writing until it fills the last row.

#. When the last row is full, the next character wraps around to the top
   row at the left margin. Then the process starts again.

You can use one-column or two-column writing. One-column writing uses
the full width of the screen. If you want one-column writing, then you
must clear the screen before characters wrap around to margin 2.

If you want two-column writing, then you should insert CR and LF in each
row before writing reaches margin 2. (You can insert CR alone if you set
**401X CR Processing** to "CR" in the Graphics Set-Up screen.) This step
prevents overstriking of characters.

.. _S13.13.3:

Alpha Mode Control Characters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In alpha mode, the VT300 recognizes any valid 4010/4014 mode escape
sequence or control character. Some control characters, however, have
functions specific to alpha mode.

+-----------+---------------------------------------------------------+
| Character | Function                                                |
+===========+=========================================================+
| HT        | Moves the cursor one space to the right.                |
+-----------+---------------------------------------------------------+
| VT        | Moves the cursor up one line.                           |
+-----------+---------------------------------------------------------+
| LF        | Causes a line feed. When used on the bottom display     |
|           | row, LF wraps the cursor to the top row and switches    |
|           | margins.                                                |
+-----------+---------------------------------------------------------+
| CR        | Moves the cursor to the left margin. Can also cause a   |
|           | line feed, if you set the **New Line** feature on the   |
|           | Display Set-Up screen to "new line". When used on the   |
|           | bottom row (with the "new line" setting), CR wraps the  |
|           | cursor the same way LF does.                            |
+-----------+---------------------------------------------------------+
| BS        | Moves the cursor to the left one position. Nothing      |
|           | happens if the cursor is already at the active margin.  |
+-----------+---------------------------------------------------------+

.. _S13.13.4:

Erasing Characters with Spaces and Backspaces
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In alpha mode, the VT300 erases a character when the terminal receives a
space (SP) character immediately after a backspace (BS) character. The
space character erases any character in the current character cell.

NOTE: This operation is not consistent with Tektronix 4010 or 4014
terminals.

This action is similar to using the <x] key for correcting typing
errors. Most operating systems send a backspace, space, and backspace
when they receive the delete (DEL) character.

If the space character follows any character other than a backspace, the
VT300 does not erase a character. Therefore, you can use the space
character for positioning.

.. _S13.14:

Graph Mode
----------

In graph mode, the terminal draws vectors between the absolute
coordinate values you select. The absolute coordinates are Tekpoint
values, mapped to the nearest corresponding pixel on the VT300 screen.
The terminal draws the vectors in the currently selected line pattern.
The next section describes the line patterns available.

The 4014 with the enhanced graphics module (EGM) has a 4096 × 4096
square matrix. The top 25 percent of the Y addresses are above the top
of the display area. If you specify coordinates in this top area, they
are tracked accurately. However, the terminal only draws the part of the
requested vector that appears in the display area. The rest of the
vector is clipped.

In graph mode, the VT300 recognizes any valid 4010/4014 mode escape
sequences or control characters.

.. _S13.14.1:

Line Patterns
~~~~~~~~~~~~~

There are five basic line patterns you can use. Each pattern is
available in normal or bold intensity. You select the pattern by using
an escape sequence.

=================== ==============================
Pattern             Sequence
=================== ==============================
Solid (normal)      ESC \`, ESC e, ESC f, or ESC g
Solid (bold)        ESC h, ESC m, ESC n, or ESC o
Dotted (normal)     ESC a
Dotted (bold)       ESC i
Dot-dash (normal)   ESC b
Dot-dash (bold)     ESC j
Short dash (normal) ESC c
Short dash (bold)   ESC k
Long dash (normal)  ESC d
Long dash (bold)    ESC l (lowercase L)
=================== ==============================

.. _S13.14.2:

Drawing Command
~~~~~~~~~~~~~~~

You use the GS control character to enter graph mode from alpha mode. In
graph mode, GS defines the start of a vector.

GS does not draw vectors from the cursor position. GS draws the vector
from the first coordinate value specified to the next value specified.
If you specify more than two coordinates after a GS control character,
the terminal draws a vector between every two coordinates. In the
following example, the lowercase letters represent coordinate
specifiers.

GS a b c d

The terminal draws vectors from point **a** to point **b**, from point
**b** to point **c**, and from point **c** to point **d**. However, if
you use the following command

GS a b GS c d

the terminal draws two separate vectors, one from **a** to **b**, and
another from **c** to **d**.

.. _S13.14.3:

Encoding Coordinates
~~~~~~~~~~~~~~~~~~~~

In 4010/4014 mode, you can use 10-bit or 12-bit addressing. You use
10-bit addressing when the Tekpoint matrix of the screen is defined as
1024 × 768. You use the 12-bit mode when the Tekpoint matrix of the
screen is defined as 4096 × 3072.

In either case, the VT300 screen remains defined as a 623 × 480 pixel
array. The Tekpoints are always mapped to the nearest corresponding
pixel. In graph mode, the screen is a 614 × 480 pixel array. The extra
space is for character drawing.

For 10-bit addressing, coordinates are encoded into 4 bytes. For 12-bit
addressing, coordinates are encoded into 5 bytes. `Table
13-4 <#T13-4>`__ shows the order used to send these bytes and identifies
their formats. The terminal does not send the extra byte for 10-bit
addressing, but the order of the remaining bytes is the same.

You can use shortened addresses when only parts of an address change.
`Table 13-5 <#T13-5>`__ shows which bytes must be sent.

.. table:: Table 13-4 Bytes Values for Encoding Coordinates

   +-----------+------------+---+------------+----+----+----+----+
   | Byte Name | 7-Bit      |   |            |    |    |    |    |
   |           | ASCII      |   |            |    |    |    |    |
   |           | Character  |   |            |    |    |    |    |
   +===========+============+===+============+====+====+====+====+
   |           | Tag Bits   |   | Address    |    |    |    |    |
   |           |            |   | Bits       |    |    |    |    |
   +-----------+------------+---+------------+----+----+----+----+
   |           | 7          | 6 | 5          | 4  | 3  | 2  | 1  |
   +-----------+------------+---+------------+----+----+----+----+
   | High Y    | 0          | 1 | 5 most     |    |    |    |    |
   |           |            |   | s          |    |    |    |    |
   |           |            |   | ignificant |    |    |    |    |
   |           |            |   | bits of Y  |    |    |    |    |
   |           |            |   | address    |    |    |    |    |
   +-----------+------------+---+------------+----+----+----+----+
   | Extra     | 1          | 1 |            | Y2 | Y1 | X2 | X1 |
   +-----------+------------+---+------------+----+----+----+----+
   | Low Y     | 1          | 1 | 5          |    |    |    |    |
   |           |            |   | in         |    |    |    |    |
   |           |            |   | termediate |    |    |    |    |
   |           |            |   | bits of Y  |    |    |    |    |
   |           |            |   | address    |    |    |    |    |
   +-----------+------------+---+------------+----+----+----+----+
   | High X    | 0          | 1 | 5 most     |    |    |    |    |
   |           |            |   | s          |    |    |    |    |
   |           |            |   | ignificant |    |    |    |    |
   |           |            |   | bits of X  |    |    |    |    |
   |           |            |   | address    |    |    |    |    |
   +-----------+------------+---+------------+----+----+----+----+
   | Low X     | 1          | 0 | 5          |    |    |    |    |
   |           |            |   | in         |    |    |    |    |
   |           |            |   | termediate |    |    |    |    |
   |           |            |   | bits of X  |    |    |    |    |
   |           |            |   | address    |    |    |    |    |
   +-----------+------------+---+------------+----+----+----+----+

.. table:: Table 13-5 Rules for Sending Short Address

   ============= ========== ===== ===== ====== =====
   Bytes Changed Bytes Sent                    
   ============= ========== ===== ===== ====== =====
   \             High Y     Extra Low Y High X Low X
   High Y        Yes        No    No    No     Yes
   Low Y         No         No    Yes   No     Yes
   High X        No         No    Yes   Yes    Yes
   Low X         No         No    No    No     Yes
   Extra         No         Yes   Yes   No     Yes
   ============= ========== ===== ===== ====== =====

.. _S13.15:

Point Plot Mode
---------------

In point plot mode, the terminal draws single pixels instead of vectors.
Remember, 4010/4014 mode uses Tekpoints for screen addressing. Tekpoints
are expressed as absolute coordinate values. The terminal turns on a
pixel that most closely corresponds to the Tekpoint coordinate values.

Point plot mode uses the same 10-bit and 12-bit addressing methods as
graph mode. See the previous "`Encoding Coordinates <#S13.14.3>`__"
section for details. As with graph mode, you can specify a coordinate
that is not in the actual display area. The terminal tracks these
points, but they do not appear on the screen.

You can enter point plot mode from alpha or graph mode, using the FS
control character. Point plot mode functions do not use any other
control characters or escape sequences. However, the terminal recognizes
most valid 4010/4014 mode control characters and escape sequences in
point plot mode.

.. _S13.16:

Incremental Plot Mode
---------------------

In this mode, the terminal plots points relative to the current cursor
position. The screen addressing area is 4096 × 3072 Tekpoints. Since
each pixel equals several Tekpoints, you may have to send several
characters to move the drawing point to a new pixel.

You can enter incremental mode from all modes (except GIN mode) by using
the RS control character or ESC RS sequence. When you select RS, the
terminal uses the current cursor position for relative movement.

Incremental plot mode always draws with a solid line at normal
intensity. You can enter commands to alter the pattern register or
intensity within incremental plot mode, but they do not affect the
drawing until you leave incremental plot mode.

In incremental plot mode, you can change the cursor position without
drawing. A space turns the electron beam off. Then you can use other
characters to move the cursor in different directions. The P character
turns the beam back on. You can use the following characters to plot
points.

========= =======================
Character Function
========= =======================
Space     Turns beam off/pen up.
P         Turns beam on/pen down.
D         Up (north)
E         Up, right (northeast)
A         Right (east)
I         Down, right (southeast)
H         Down (south)
J         Down, left (southwest)
B         Left (west)
F         Up, left (northwest)
========= =======================

NOTE: Except for the space character, you must use uppercase characters
in incremental plot mode.

The terminal recognizes most valid 4010/4014 mode control characters and
escape sequences in incremental plot mode.

.. _S13.17:

Graphics Input (GIN) Mode
-------------------------

You can select GIN mode by using the ESC SUB sequence. When the terminal
enters GIN mode, the following events occur.

-  The VT300 crosshair cursor appears, with the hairs intersecting at
   the active position.

   -  If you are using the arrow keys or a mouse to move the cursor, the
      initial cursor position is at the center of the screen.

   -  If you are using a graphics tablet, the initial cursor position is
      at the position specified by the tablet. You cannot use the arrow
      keys to move the cursor when you use a graphics tablet.

-  The bypass condition is on.

-  The terminal buffers characters received from the host. The terminal
   does not process the characters until you leave GIN mode.

   When the terminal's input buffer is nearly full, the terminal sends
   an XOFF character to the host. XOFF tells the host to stop sending
   characters. If the host ignores the XOFF, the terminal loses any
   characters received when the input buffer is full.

.. _S13.17.1:

Using Arrow Keys to Move the Cursor
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In GIN mode, you can move the crosshair cursor by using the four arrow
keys. The arrow keys move the cursor in the direction of their arrow, as
follows.

================= ===============
Key               Direction
================= ===============
|[right]|         1 pixel right
Shift - |[right]| 10 pixels right
|[left]|          1 pixel left
Shift - |[left]|  10 pixels left
|[up]|            1 pixel up
Shift - |[up]|    10 pixels up
|[down]|          1 pixel down
Shift - |[down]|  10 pixels down
================= ===============

NOTE: The arrow keys can auto repeat. You can turn the autorepeat
feature on or off in the Keyboard Set-Up screen.

.. _S13.17.2:

Using a Locator Device (Mouse or Tablet)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In addition to the arrow keys, you can use a mouse or graphics tablet to
move the cursor in GIN mode. `Chapter 15 <chapter15.html>`__ describes
how to use a locator device with the VT300.

If you try to move the crosshair cursor past a screen boundary, the
cursor stops at the boundary.

NOTE: Applications cannot cause the terminal to exit GIN mode.

You must leave GIN mode from the keyboard, as follows.

#. Move the cursor to the desired position.

#. Press any active key (except the arrow keys) on the keyboard. The key
   you press must be active in VT100 mode. When you press the key, the
   following events occur.

   -  The terminal sends the character code or control function of the
      key to the host.

   -  The terminal sends the current coordinates of the crosshair cursor
      to the host. These coordinates are in 10-bit addressing format.
      (The terminal never sends the extra bytes to the host.)

   -  The crosshair cursor disappears from the screen.

   -  The VT300 leaves GIN mode and enters alpha mode.

#. At this point, the VT300 is still in the bypass condition. You can
   turn this condition off by using one of the control characters and
   escape sequences listed in the "`Bypass Condition <#S13.12>`__"
   section in this chapter.

.. container:: navbar

   --------------

   +----------------------+
   | `Chapter             |
   | 12                   |
   |  <chapter12.html>`__ |
   +----------------------+

   .. container:: navbot

      http://vt100.net/docs/vt3xx-gp/chapter13.html

.. |VT100.net| image:: ../../vt100.net-logo
   :class: button
   :width: 102px
   :height: 16px
   :target: ../../
.. |image1| image:: ma-1177-83
.. |[right]| image:: arrowright
.. |[left]| image:: arrowleft
.. |[up]| image:: arrowup
.. |[down]| image:: arrowdown
