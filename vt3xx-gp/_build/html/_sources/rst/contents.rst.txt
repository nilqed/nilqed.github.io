.. container:: navbar

   |VT100.net| VT330/VT340 Programmer Reference Manual Volume 2:
   Graphics Programming

   +----------------------+
   | `Cover <./>`__       |
   +----------------------+

   --------------

Contents
========

**Chapter 1 –** `Introduction to ReGIS <chapter1.html>`__

-  `What is ReGIS? <chapter1.html#S1.1>`__
-  `Conventions <chapter1.html#S1.2>`__
-  `ReGIS Command Syntax <chapter1.html#S1.3>`__
-  `Control Characters <chapter1.html#S1.4>`__
-  `VT300 Screen <chapter1.html#S1.5>`__
-  `X-Y Coordinate System <chapter1.html#S1.6>`__
-  `Graphics Cursors <chapter1.html#S1.7>`__
-  `Entering and Exiting ReGIS <chapter1.html#S1.8>`__
-  `ReGIS Default Values <chapter1.html#S1.9>`__
-  `Preventing Transmission Errors <chapter1.html#S1.10>`__
-  `Pixel Vector (PV) System <chapter1.html#S1.11>`__
-  `ReGIS Examples in this Manual <chapter1.html#S1.12>`__

**Chapter 2 –** `Screen Control Command <chapter2.html>`__

-  `Display Addressing <chapter2.html#S2.1>`__
-  `Scroll Argument <chapter2.html#S2.2>`__
-  `Hard Copy Control – H <chapter2.html#S2.3>`__
-  `Output Mapping Control – M <chapter2.html#S2.4>`__
-  `Background Intensity Control – I <chapter2.html#S2.5>`__
-  `Time Delay – T <chapter2.html#S2.6>`__
-  `Screen Erase – E <chapter2.html#S2.7>`__
-  `Temporary Write Control – W <chapter2.html#S2.8>`__
-  `Graphics Cursor Control – C <chapter2.html#S2.9>`__
-  `Display Graphics Page – P <chapter2.html#S2.10>`__
-  `Screen Control Command Summary <chapter2.html#S2.11>`__

**Chapter 3 –** `Write Control Command <chapter3.html>`__

-  `PV Multiplication – M <chapter3.html#S3.1>`__
-  `Pattern Multiplication – P <chapter3.html#S3.2>`__
-  `Foreground Intensity – I <chapter3.html#S3.3>`__
-  `Plane Select Control – F <chapter3.html#S3.4>`__
-  `Writing Styles <chapter3.html#S3.5>`__
-  `Negative Pattern Control – N <chapter3.html#S3.6>`__
-  `Shading Control – S <chapter3.html#S3.7>`__
-  `Write Control Command Summary <chapter3.html#S3.8>`__

**Chapter 4 –** `Position Command <chapter4.html>`__

-  `Set Position Arguments <chapter4.html#S4.1>`__
-  `Position Stack Options <chapter4.html#S4.2>`__
-  `Select Graphics Page – P <chapter4.html#S4.3>`__
-  `Position Command Summary <chapter4.html#S4.4>`__

**Chapter 5 –** `Vector Command <chapter5.html>`__

-  `About the Examples <chapter5.html#S5.1>`__
-  `Draw Dot <chapter5.html#S5.2>`__
-  `Draw Line <chapter5.html#S5.3>`__
-  `Position Stack Options <chapter5.html#S5.4>`__
-  `Temporary Write Control <chapter5.html#S5.5>`__
-  `Vector Command Summary <chapter5.html#S5.6>`__

**Chapter 6 –** `Curve Command <chapter6.html>`__

-  `About the Examples <chapter6.html#S6.1>`__
-  `Circles <chapter6.html#S6.2>`__
-  `Arcs <chapter6.html#S6.3>`__
-  `Curve Interpolation <chapter6.html#S6.4>`__
-  `Temporary Write Control <chapter6.html#S6.5>`__
-  `Curve Command Summary <chapter6.html#S6.6>`__

**Chapter 7 –** `Text Command <chapter7.html>`__

-  `How the Terminal Draws Characters <chapter7.html#S7.1>`__
-  `Text Strings <chapter7.html#S7.2>`__
-  `Character Set Option – A <chapter7.html#S7.3>`__
-  `Character Spacing <chapter7.html#S7.4>`__
-  `Size Options – S <chapter7.html#S7.5>`__
-  `Height Multiplier – H <chapter7.html#S7.6>`__
-  `Size Multiplier – M <chapter7.html#S7.7>`__
-  `String and Character Tilt Options <chapter7.html#S7.8>`__
-  `Italics Option – I <chapter7.html#S7.9>`__
-  `Temporary Text Control <chapter7.html#S7.10>`__
-  `PV Spacing – Subscripts, Superscripts, and
   Overstrikes <chapter7.html#S7.11>`__
-  `Temporary Write Control <chapter7.html#S7.12>`__
-  `Text Command Summary <chapter7.html#S7.13>`__

**Chapter 8 –** `Load Command <chapter8.html>`__

-  `Using Your Own Character Sets <chapter8.html#S8.1>`__
-  `Select Character Set <chapter8.html#S8.2>`__
-  `Specify Name <chapter8.html#S8.3>`__
-  `Load Character Cell <chapter8.html#S8.4>`__
-  `Load Command Summary <chapter8.html#S8.5>`__

**Chapter 9 –** `Macrographs <chapter9.html>`__

-  `Macrographs: Storing Your Graphics <chapter9.html#S9.1>`__
-  `Define Macrograph <chapter9.html#S9.2>`__
-  `Invoke Macrograph <chapter9.html#S9.3>`__
-  `Clear Macrograph <chapter9.html#S9.4>`__
-  `Macrograph Summary <chapter9.html#S9.5>`__

**Chapter 10 –** `Report Command <chapter10.html>`__

-  `Report Options <chapter10.html#S10.1>`__
-  `Graphics Input Modes – I <chapter10.html#S10.2>`__
-  `Report Command Summary <chapter10.html#S10.3>`__

**Chapter 11 –** `Polygon Fill Command <chapter11.html>`__

-  `Vector Option <chapter11.html#S11.1>`__
-  `Curve and Arc Option <chapter11.html#S11.2>`__
-  `Position Option <chapter11.html#S11.3>`__
-  `Temporary Write Controls Option <chapter11.html#S11.4>`__
-  `Filling Complex Polygons <chapter11.html#S11.5>`__
-  `Some Points on Using the Polygon Fill
   Command <chapter11.html#S11.6>`__
-  `Polygon Fill Command Summary <chapter11.html#S11.7>`__

**Chapter 12 –** `Combining ReGIS Commands <chapter12.html>`__

-  `Drawing Complex Images <chapter12.html#S12.1>`__

**Chapter 13 –** `4010/4014 Mode <chapter13.html>`__

-  `Supported Features <chapter13.html#S13.1>`__
-  `Restrictions <chapter13.html#S13.2>`__
-  `Screen Addressing <chapter13.html#S13.3>`__
-  `Set-Up Support <chapter13.html#S13.4>`__
-  `Communication <chapter13.html#S13.5>`__
-  `Locator Device (Mouse or Graphics Tablet) <chapter13.html#S13.6>`__
-  `Control Characters <chapter13.html#S13.7>`__
-  `Escape Sequences <chapter13.html#S13.8>`__
-  `Entering and Exiting 4010/4014 Mode <chapter13.html#S13.9>`__
-  `Changing Operating Modes <chapter13.html#S13.10>`__
-  `Clearing the Screen <chapter13.html#S13.11>`__
-  `Bypass Condition <chapter13.html#S13.12>`__
-  `Alpha Mode <chapter13.html#S13.13>`__
-  `Graph Mode <chapter13.html#S13.14>`__
-  `Point Plot Mode <chapter13.html#S13.15>`__
-  `Incremental Plot Mode <chapter13.html#S13.16>`__
-  `Graphics Input (GIN) Mode <chapter13.html#S13.17>`__

**Chapter 14 –** `Sixel Graphics <chapter14.html>`__

-  `What are Sixels? <chapter14.html#S14.1>`__
-  `Sixel Data Format <chapter14.html#S14.2>`__
-  `Sixel Control Functions <chapter14.html#S14.3>`__
-  `Sixel Scrolling Mode <chapter14.html#S14.4>`__

**Chapter 15 –** `Using a Mouse or Tablet <chapter15.html>`__

-  `Locator Devices <chapter15.html#S15.1>`__
-  `VSXXX-AA Mouse <chapter15.html#S15.2>`__
-  `VSXXX-AB Graphics Tablet <chapter15.html#S15.3>`__
-  `Locator Cursor <chapter15.html#S15.4>`__
-  `Locator Buttons <chapter15.html#S15.5>`__
-  `Entering Data with the Locator Device <chapter15.html#S15.6>`__
-  `Using a Locator Device with Dual Sessions <chapter15.html#S15.7>`__
-  `Programming Locator Device Buttons
   (DECLBD) <chapter15.html#S15.8>`__
-  `Summary <chapter15.html#S15.9>`__

**Chapter 16 –** `Printing Graphics <chapter16.html>`__

-  `Selecting a Format for Printing <chapter16.html#S16.1>`__
-  `Sending Graphics to the Host or Printer <chapter16.html#S16.2>`__
-  `Sixel Graphics Levels – Matching Your
   Printer <chapter16.html#S16.3>`__
-  `Summary <chapter16.html#S16.4>`__

**Appendix A –** `VT240 Style HLS Color Programming <appendixa.html>`__

**Appendix B –** `Differences Between the VT300 and Other Digital
Terminals <appendixb.html>`__

.. container:: navbar

   --------------

   +----------------------+
   | `Cover <./>`__       |
   +----------------------+

   .. container:: navbot

      http://vt100.net/docs/vt3xx-gp/contents.html

.. |VT100.net| image:: ../../vt100.net-logo
   :class: button
   :width: 102px
   :height: 16px
   :target: ../../
