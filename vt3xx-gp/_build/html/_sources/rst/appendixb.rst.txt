.. container:: navbar

   |VT100.net| VT330/VT340 Programmer Reference Manual Volume 2:
   Graphics Programming

   +----------------------+
   | `Appendix            |
   | A                    |
   |  <appendixa.html>`__ |
   +----------------------+

   --------------

.. _SB:

Differences Between the VT300 and Other Digital Terminals
=========================================================

This appendix describes some differences between the VT300 and previous
Digital terminals.

.. _SB.1:

ReGIS Plane Select Control Command, W(F<n>)
-------------------------------------------

The VT340 terminal has more graphics planes than previous Digital
terminals. This may affect the way your present ReGIS programs appear on
the screen. You may have to adjust some ReGIS applications to produce
the same output that appears on your VT240 or VT125 terminal.

The VT240 and the VT330 have two graphics planes. The ReGIS W(F3)
command enables writing or erasing in all graphics planes.

The VT340 has four graphics planes. To enable writing or erasing in all
graphics planes, you must use W(F15). This command also works for the
VT240 and the VT330.

For more information, see `Chapter 3 <chapter3.html>`__.

.. _SB.2:

ReGIS Vector Command, V
-----------------------

On the VT240, the ReGIS vector command (V) includes the point drawn to,
but not the point drawn from.

On the VT300, the ReGIS vector command includes the point drawn from,
but not the point drawn to.

This may affect the appearance of your current ReGIS images on the
VT300.

For more information, see `Chapter 5 <chapter5.html>`__.

.. _SB.3:

VT340 Color Maps
----------------

In the VT340, there is only one set of values for both the color and
monochrome maps.

For more information, see `Chapter 2 <chapter2.html>`__.

.. _SB.4:

Displaying Sixel Images
-----------------------

The VT300 scrolls sixels. The VT240 does not scroll sixels.

The VT300 sends a sixel next line (-) character following a sixel dump.
The top line of the sixel image may scroll off the screen if (1) your
application returns the sixel dump to the terminal, or (2) you perform a
sixel dump to a video terminal connected to the VT300 printer port.

NOTE: You can prevent the sixel image from scrolling off the screen by
disabling the sixel scrolling feature in the Graphics Set-Up screen.

For more information, see `Chapter 14 <chapter14.html>`__.

.. container:: navbar

   --------------

   +----------------------+
   | `Appendix            |
   | A                    |
   |  <appendixa.html>`__ |
   +----------------------+

   .. container:: navbot

      http://vt100.net/docs/vt3xx-gp/appendixb.html

.. |VT100.net| image:: ../../vt100.net-logo
   :class: button
   :width: 102px
   :height: 16px
   :target: ../../
