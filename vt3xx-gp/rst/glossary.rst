.. container:: navbar

   |VT100.net| VT330/VT340 Programmer Reference Manual Volume 2:
   Graphics Programming

   +----------------------+
   | `Appendix            |
   | B <../../>`__        |
   +----------------------+

   --------------

.. _SG:

Glossary
========

2-plane bitmap
   Graphics page memory for the VT330. In a 2-plane bitmap, each
   `pixel <#PIXEL>`__ is represented by a 2-bit code. A 2-bit code has
   four possible values, so the VT330 can display up to four different
   shades of gray at a time.

4-plane bitmap
   Graphics page memory for the VT340. In a 4-plane bitmap, each
   `pixel <#PIXEL>`__ is represented by a 4-bit code. A 4-bit code has
   16 possible values, so the VT340 can display up to 16 different
   colors or shades at a time.

Absolute location
   An unsigned coordinate pair that specifies a location based on the
   screen origin. For example, [X,Y].

Active position
   The current cursor location. Usually, the point that was last moved
   to or drawn to.

Background intensity
   The color or shade of the background on the screen.

Bounded position stack
   An option to the ReGIS vector or position command that lets you save
   the last active position by pushing it onto a stack. You can return
   the active position to the last saved position by popping the saved
   position off the stack.

Closed curve sequence
   A series of locations the terminal uses to interpolate a curve whose
   endpoints meet.

Color map
   In the VT330, the four output map locations used to store a
   monochrome intensity value.

   In the VT340, the 16 output map locations used to store intensity
   values. Each location has a monochrome and a color intensity value.

Command key letter
   A single letter that identifies the beginning of a ReGIS command. For
   example, P identifies a position command.

Complement writing
   A ReGIS writing style that lets you draw over an image, using the
   "opposite" shade or color. Complement writing ignores the current
   `foreground intensity <#FOREGROUND>`__, and affects only those areas
   defined by 1 bits (foreground) in the bit pattern memory.

Coordinate pair
   Two values [X,Y] that define a specific location on the screen. The X
   value defines a location parallel to the horizontal axis. The Y value
   defines a location parallel to the vertical axis.

Curve interpolation
   The action the terminal takes to complete a curve, based on a series
   of coordinates you specify.

Default
   A standard value used by the terminal when the user or program does
   not specify a value.

Display addressing
   The limits of the screen area used for drawing graphics. The terminal
   uses screen coordinates to address (draw or move to) a point on the
   screen. The default limits for the VT300 are the coordinates [0,0]
   and [799,479].

Display cell
   The size of the screen area used to display each character. The same
   display cell is used for all characters.

Erase writing
   A ReGIS writing style that lets you write over an existing image by
   using the background color.

Foreground intensity
   The color or shade of the foreground on the screen. The terminal uses
   this color/shade to draw images when you use the overlay or replace
   writing style in ReGIS.

Graphics cursor
   An indicator that represents the active position on the screen when
   you use ReGIS. There are two types of graphics cursor, an `input
   cursor <#INPUT>`__ and an `output cursor <#OUTPUT>`__. You can use
   the default cursor characters or select your own.

Gray scale
   In the VT330, the four levels of intensity used for drawing, ranging
   from white to black.

   In the VT340, the 16 levels of intensity used for drawing, ranging
   from white to black.

HLS color system
   A color coordinate system for specifying colors, based on their hue,
   lightness, and saturation. See `RGB color system <#RGB>`__.

Input cursor
   A `graphics cursor <#GRAPHICS>`__ that appears when the terminal is
   in ReGIS graphics input mode. The default input cursor is a
   crosshair.

Line pattern
   An 8-bit pattern that ReGIS uses to draw lines. You can use a
   standard pattern or select your own.

Macrograph
   A stored string of ReGIS commands or command segments. You use a
   single letter to name each macrograph. You use macrographs to store
   text and commands that you use repeatedly.

Mask specifier
   One or more characters you can use to define a new graphics cursor
   style. The mask specifier can be a loaded, or built-in character.

Mnemonic
   An abbreviation or acronym for a command or a control character.

Monochrome map
   The four output map locations that the VT330 uses to select the
   intensity of the display. Each location stores a different intensity,
   from white to black.

Offset
   A distance from a given location.

Open curve sequence
   A series of points that the terminal uses to interpolate a curve
   whose endpoints do not necessarily meet.

Output cursor
   A `graphics cursor <#GRAPHICS>`__ that appears when the terminal is
   waiting for ReGIS input from the host system. The output cursor
   indicates the current drawing position. The default output cursor is
   a diamond.

Overlay writing
   A ReGIS writing style that lets you draw only in the foreground, not
   the background.

Pixel
   A picture element. The smallest displayable unit on the screen.

Pixel vector (PV) system
   In ReGIS, a method for selecting the direction to draw or move
   incrementally on the screen. You can select from eight different
   directions, at 45 degree increments.

Position stack
   A set of coordinate positions that ReGIS uses in sequence. You use
   position stacks to move the cursor to several positions in a single
   vector or position command. There are two types of position stacks,
   `bounded <#BOUNDED>`__ and `unbounded <#UNBOUNDED>`__.

PV multiplication factor
   An integer used to select the number of pixels to move for each PV
   value specified. ReGIS uses the PV multiplication factor for all PV
   values you enter. You can change the PV multiplication factor.

Relative location
   A point on the screen measured from a specified location, rather than
   from the `screen origin <#SCREEN>`__.

ReGIS
   Digital's graphics instruction set that lets you build images from
   standard geometric forms, such as lines, curves, and circles.

Replace writing
   A ReGIS writing style that lets you draw in both the foreground and
   the background.

RGB color system
   A coordinate system for specifying colors, based on the three primary
   colors red, green, and blue. See `HLS color system <#HLS>`__.

Screen origin
   The first ReGIS coordinate at the upper-left corner of the screen.
   This coordinate is [0,0].

Shading reference line
   A horizontal or vertical line that ReGIS uses when shading images.
   Shading occurs between the shading reference line and the point being
   drawn or moved to.

Unbounded position stack
   An option to the ReGIS vector or position command that lets you save
   a nonexistent position by pushing it onto a stack. The active
   position does not move when the saved dummy position is popped off
   the stack. See `bounded position stack <#BOUNDED>`__.

Unit cell
   The maximum size of each display character within the `display
   cell <#DISPLAY>`__.

Vector
   A directed line. You use the ReGIS vector command to draw lines.

Vertex
   One of the points defining a polygon.

.. container:: navbar

   --------------

   +----------------------+
   | `Appendix            |
   | B <../../>`__        |
   +----------------------+

   .. container:: navbot

      http://vt100.net/docs/vt3xx-gp/glossary.html

.. |VT100.net| image:: ../../vt100.net-logo
   :class: button
   :width: 102px
   :height: 16px
   :target: ../../
