.. container:: navbar

   |VT100.net| VT330/VT340 Programmer Reference Manual Volume 2:
   Graphics Programming

   +----------------------+
   | `Chapter             |
   | 14                   |
   |  <chapter14.html>`__ |
   +----------------------+

   --------------

.. _S15:

15 Using a Mouse or Tablet
==========================

.. _S15.1:

Locator Devices
---------------

This chapter describes how to program your VT300 terminal for use with a
locator device. You use a locator device to move the cursor and select
position coordinates on the screen. With a locator device, you can
easily move the graphics input cursor to a specific point or enter data
to application programs.

There are two locator devices you can use with your terminal, a mouse or
graphics tablet. You connect the device to the rear of the terminal.
These devices use a serial line input/output format with the micro-DIN
connector.

.. _S15.2:

VSXXX-AA Mouse
--------------

Digital's VSXXX-AA mouse is a small handheld device, with three buttons
on top and a roller ball on the bottom. You can write applications that
use the mouse as an input device. You can use the three buttons on the
mouse to send data to an application.

The roller ball controls cursor movement. When you move the mouse on a
flat surface, the roller ball turns. The cursor moves in the direction
you move the mouse. You can move the cursor in any direction, and place
it anywhere on the screen.

If you pick the mouse up, the cursor stops moving on the screen. The
cursor stays at this point until you put the mouse down and move the
roller ball along the surface again.

.. _S15.3:

VSXXX-AB Graphics Tablet
------------------------

Digital's VSXXX-AB tablet has three parts.

-  Tablet
-  Puck
-  Stylus

The tablet has a flat, square surface similar to a tabletop. To move the
cursor, you move the puck or stylus over this surface. The tablet has a
position-sensitive grid that senses the position of the puck or stylus.

The puck is a handheld device with crosshair markings that help you
select precise coordinates on the tablet. The puck has four buttons that
serve the same purpose as the buttons on the mouse. You can program the
buttons to send position reports when pressed or released.

The stylus is a handheld device that resembles a pen. The stylus has two
buttons, a barrel and a tip. The barrel is a button on the side of the
pen you can press to send data to an application. You activate the tip
by pressing the pen down onto the tablet surface.

To move the cursor, you move the puck or stylus over the tablet surface.
You do not have to touch the surface, but the tablet or stylus must be
within 0.65 cm (0.25 in) of the surface to move the cursor. When the
puck or stylus is close enough to the tablet surface to move the cursor,
the puck or stylus is in proximity with the tablet.

If you remove the puck or stylus from the tablet surface while the
tablet is plugged in, then the VT300 uses the last known tablet
position.

Unlike the mouse, the tablet is an absolute positioning device. The
layout of the tablet corresponds roughly to the layout of the screen.
The next section explains tablet-to-screen mapping.

.. _S15.3.1:

Tablet-to-Screen Mapping
~~~~~~~~~~~~~~~~~~~~~~~~

The VT300 screen maps to the bottom two-thirds of the tablet surface.
Applications cannot use the top third of the tablet. The points at the
top third of the tablet map to the top visible scan line of the screen.

The complete horizontal extent of the tablet's coordinate system maps to
the complete horizontal extent of the screen. However, the tablet has
borders to compensate for the difference between the screen's coordinate
system and the tablet's system.

The vertical extent at the bottom of the tablet's coordinate system maps
to the complete vertical extent of the screen. The tablet must also have
borders in the vertical direction.

The origin of the tablet's coordinate system is at the lower-left corner
of the tablet surface, so the lower Y coordinates on the tablet map to
the horizontal extent of the screen. The upper Y coordinates map to the
top scan line of the screen.

.. _S15.4:

Locator Cursor
--------------

The VT300 can use any one of the following cursor styles with a locator
device.

================ ================ =======================
Crosshair        ReGIS, 4010/4014 (default input cursor)
Diamond          ReGIS            (default output cursor)
Rubber band line ReGIS            
Rubber band box  ReGIS            
User-defined     ReGIS            
================ ================ =======================

In ReGIS mode, software can select the cursor style by using the cursor
control option to the screen command: S(C(I)). See `Chapter
2 <chapter2.html>`__ for details on the ReGIS screen command.

In 4010/4014 mode, the terminal only uses the crosshair cursor style.

.. _S15.5:

Locator Buttons
---------------

In graphics input mode, pressing a locator button sends a cursor
position report to the host. The mouse has three buttons. The graphics
tablet includes a puck with four buttons, and a stylus with a barrel
button and a tip switch. All the buttons serve the same purpose – they
send locator data to the host.

A locator button can be in one of two states, up (released) or down
(pressed). A change from one state to another is called a transition.
You can program the buttons to send reports in three different ways.

-  When pressed
-  When released
-  When pressed or released

You can also program the locator buttons to send specific codes or
control functions to the host. Programming locator buttons is described
later in this chapter. `Table 15-1 <#T15-1>`__ shows the default codes
that each button sends when pressed or released.

.. table:: Table 15-1 Default Locator Button Codes

   ========== ============================= ============== ===============
   Button     Device\*                      Code (Pressed) Code (Released)
   ========== ============================= ============== ===============
   1 (left)   mouse, puck, or stylus barrel **CSI 241 ~**  no report
   2 (middle) mouse, puck, or stylus tip    **CSI 243 ~**  no report
   3 (right)  mouse or puck                 **CSI 245 ~**  no report
   4 (fourth) puck                          **CSI 247 ~**  no report
   ========== ============================= ============== ===============

There is also a null button code that the terminal sends in response to
a request from the host: **CSI 240 ~**.

.. _S15.6:

Entering Data with the Locator Device
-------------------------------------

Before you can enter data with a locator device, the terminal must be in
a graphics input mode. You can use three different graphics input modes
with the VT300.

-  ReGIS one-shot graphics input mode
-  ReGIS multiple graphics input mode
-  Tektronix GIN mode

.. _S15.6.1:

ReGIS One-Shot Graphics Input Mode
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

An application can select this mode with the following ReGIS command.

**R(I0)**

In one-shot mode, the terminal suspends processing of received
characters and commands. The terminal buffers all received characters,
until it leaves one-shot mode.

When the terminal enters graphics input mode, the input cursor appears
on the screen.

.. _S15.6.1.1:

Moving the Graphics Cursor
^^^^^^^^^^^^^^^^^^^^^^^^^^

You can move the input cursor around the screen by moving the locator
device.

| **Mouse**
| The input cursor moves as you move the mouse over a flat surface.

| **Tablet**
| The input cursor moves as you move the stylus or puck across the
  tablet surface.

| **Arrow Keys**
| The input cursor moves as you press the corresponding arrow key on the
  keyboard. If a mouse is connected to the locator port, you can use the
  arrow keys or the mouse interchangeably to move the cursor. If a
  tablet is connected, you can use the arrow keys to move the cursor
  only when the puck or stylus is not in proximity with the tablet
  surface.

.. _S15.6.1.2:

Requesting a Cursor Position Report
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In one-shot mode, the terminal cannot send a position report until the
application sends a request to the terminal. You use the ReGIS report
position interactive command to request a position report.

**R(P(I))**

After sending the report position interactive command, the application
does not receive a report until you press an active key or locator
button.

.. _S15.6.1.3:

Sending a Cursor Position Report
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You can send a cursor position report from the keyboard or locator
device.

======== =======================================
Mouse    Press any mouse button.
Tablet   Press any puck, or stylus button.
Keyboard Press any non-arrow key that is active.
======== =======================================

When you send a report, the following actions occur.

#. | **If you use the keyboard**
   | The terminal sends the character code or control function of the
     key pressed to the host.

   | **If you use the mouse or tablet**
   | The terminal sends the code of the button pressed to the host.
     `Table 15-1 <#T15-1>`__ lists the default codes. Digital's mouse
     has three buttons, the tablet's puck has four.

   Your application can redefine the codes that the locator buttons send
   to the host. User-defined codes override the default codes. See
   "`Programming Locator Device Buttons <#S15.8>`__" later in the
   chapter.

#. | **The terminal sends the position report.**
   | The terminal sends the current coordinates of the input cursor to
     the host. The terminal sends this report as an absolute bracketed
     extent in ReGIS coordinates (such as [X,Y]).

#. | **The terminal exits one-shot mode.**
   | The graphics input cursor disappears from the screen when the
     terminal exits graphics input mode.

.. _S15.6.2:

ReGIS Multiple Graphics Input Mode
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

An application can select this mode with the following ReGIS command.

**R(I1)**

In multiple mode, the user moves the cursor and sends reports as in
one-shot mode. Multiple mode differs from one-shot mode in the following
ways.

-  The terminal processes characters and command as it receives them
   from the host. This feature lets the terminal perform graphics input
   and output at the same time.

-  The terminal does not exit graphics input mode after the terminal
   sends a cursor position report. In multiple mode, the terminal can
   send an indefinite number of position reports.

-  When you press a button or an application requests a report, the
   terminal immediately sends a position report.

-  To exit multiple mode, the application must send the ReGIS R(I0)
   command. The input cursor remains on the screen until the application
   sends this command.

.. _S15.6.2.1:

Sending a Cursor Position Report
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In multiple mode, there are two ways for the application to receive a
report.

-  | **Send R(P(I)) to the terminal.**
   | An application can request an immediate position report by sending
     the ReGIS report position interactive command to the terminal. When
     the terminal receives R(P(I)), it immediately sends a position
     report to the application.

-  | **Press a locator button.**
   | When you press (or release) a locator button, the terminal
     immediately sends a position report to the application.

**Notes on Multiple Mode**

-  To exit multiple graphics input mode, you must exit ReGIS. To
   re-enter multiple mode, you must use the ReGIS R(I1) command again.

-  You cannot use the four arrow keys to position the input cursor as
   you can in ReGIS one-shot graphics input mode. If you press an arrow
   key in multiple mode, the terminal sends that key's escape sequence
   to the host. If the host system is set to echo all of the input that
   it receives, then the escape sequence will be sent back to the
   terminal, causing ReGIS to abort.

   To prevent this, you should either

   -  turn off the host system's echoing function (using a command such
      as **SET TERM/NOECHO** on VMS), or

   -  program your application to read terminal input in such a way as
      to prevent echoing input back to the terminal.

.. _S15.6.3:

ReGIS Locator Reports
~~~~~~~~~~~~~~~~~~~~~

Locator reports begin with the code(s) of the active non-arrow key or
locator button pressed. Following this code is the current position of
the input cursor. The terminal sends the input cursor position as an
absolute bracketed extent in user coordinates. The report ends with the
carriage return character (CR).

The following list shows some examples of locator reports and their
meaning.

-  **One-shot mode**

   ::

      A[102,200]<CR>

   The user pressed the letter 'A' with the cursor at position 102,200.

-  **One-shot or multiple mode**

   ::

      <CSI>241~[102.5,200]<CR>

   The user pressed the left mouse button with the input cursor at
   position [102.5,200]. <CSI>241~ is the default sequence sent when you
   press the left mouse button.

-  **Multiple mode**

   ::

      <CSI>240~[100,100]<CR>

   The terminal received the ReGIS report position interactive command
   R(P(I)). <CSI>240~ is the null button sequence. The null button
   sequence indicates this report is the result of an application
   request, not a locator button transition. The cursor is at position
   [100, 100].

.. _S15.6.4:

Synchonizing Locator Reports Between the Terminal and Application
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The way you synchronize input cursor position reports between the
terminal and your application depends on whether the terminal is in
one-shot graphics input mode, or multiple graphics input mode.

.. _S15.6.4.1:

In One-Shot Mode
^^^^^^^^^^^^^^^^

In one-shot mode, the terminal cannot send a report until it receives
the ReGIS R(P(I)) command. To synchronize reports, your application must
keep count of the R(P(I)) commands sent to the terminal.

.. _S15.6.4.2:

In Multiple Mode
^^^^^^^^^^^^^^^^

In multiple mode, the terminal can send a report at any time. To
synchronize reports, the application must be able to recognize the
format of each ReGIS input cursor position report. See "`ReGIS Locator
Reports <#S15.6.3>`__" earlier in this chapter for the report formats.

.. _S15.6.5:

Tektronix Graphics Input (GIN) Mode
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Tektronix GIN mode is available only when the terminal is in 4010/4014
mode. Tektronix GIN mode is similar to ReGIS one-shot mode. The cursor
moves and the terminal sends reports as in ReGIS one-shot mode.

An application can select this mode with the following escape sequence.

.. container:: example

   ==== ====
   ESC  SUB
   1/11 1/10
   ==== ====

The only input cursor available in Tektronix GIN mode is the crosshair.
See `Chapter 13 <chapter13.html>`__ for the format of the 4010/4014 mode
position report.

.. _S15.7:

Using a Locator Device with Dual Sessions
-----------------------------------------

This section describes how a locator device acts in a dual-session
environment. You may want to review the chapter on dual sessions (Volume
1, Chapter 14) before you continue.

.. _S15.7.1:

Locator Device Attributes in a Dual-Session Environment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  The locator device and the keyboard share the same input buffer, so
   they always send data to the same session. That is, the locator
   device and the keyboard are always associated with the active
   session.

-  Each session independently selects graphics input mode. Either
   session can use a locator device without affecting the other session.

-  The VT300 lets users display data from two sessions at the same time,
   using windows. In this environment, the locator cursor moves freely
   only in the active session's window. To change the active session,
   use the **Switch Session** key.

.. _S15.8:

Programming Locator Device Buttons (DECLBD)
-------------------------------------------

You can program the locator device buttons to send codes that are
different from the default codes. `Table 15-1 <#T15-1>`__ lists the
default codes.

Programming locator buttons is similar to programming function keys on
the keyboard (Volume 1, Chapter 11). You use a device control string
containing button definitions.

There are three programmable buttons on Digital's mouse, four on the
tablet's puck, and two on the tablet's stylus. The VT300 lets you
program all the buttons on the device you use. Each button can send a
different code when pressed or released.

The VT300 lets you program up to six characters for each transition (up
or down).

The terminal does not save your locator button codes in nonvolatile RAM
(NVR). When you turn off or reset the terminal, you lose any locator
button codes you defined. Unlike user-defined keys (UDKs), you cannot
program the locator buttons from set-up.

.. _S15.8.1:

DECLBD Device Control String
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You use the following device control string to define the function of
locator buttons.

**DCS Pc $ w Ky1/Std1/Stu1 ;...; Kyn/Stdn/Stun ST**

where

.. container:: example

   **DCS** (9/0) introduces device control strings. DCS is a C1 control
   character that you can also express as ESC P (1/11 5/0) when coding
   for a 7-bit environment.

   **Pc** is the clear parameter. Pc determines how the locator buttons
   are cleared.

   +---------------+-----------------------------------------------------+
   | Pc            | Meaning                                             |
   +===============+=====================================================+
   | **0** or none | Clear all button definitions before loading new     |
   |               | values (default).                                   |
   +---------------+-----------------------------------------------------+
   | 1             | Clear one button at a time, before loading a new    |
   |               | value.                                              |
   +---------------+-----------------------------------------------------+

   NOTE: You can only use 6 characters per button transition (pressed or
   released).

   **$ w (2/4, 7/7)** are the intermediate and final characters that
   identify this device control string as a DECLBD string.

   **Ky1/Std/Stu ; ...** are the button definition strings.

   .. container:: example

      **Ky1** is the number of the button you are defining.

      === ====== =============================
      Ky1 Button Device
      === ====== =============================
      1   Left   Mouse, puck, or stylus barrel
      2   Middle Mouse, puck, or stylus tip
      3   Right  Mouse or puck
      4   Fourth Puck only
      === ====== =============================

      **/** (2/15) is the slash character. This character separates the
      button selector number, up button value, and down button value in
      each button definition.

      **Std** is the *down* string value. This value represents the code
      the selected locator button sends when pressed. The value is a
      string of hex pairs, each representing one 8-bit character.

      You can use hex values in the following ranges.

      | 3/0 through 3/9 (0 through 9)
      | 4/1 through 4/6 (A through F)
      | 6/1 through 6/6 (a through f)

      When you combine these hex values, you can represent any 8-bit
      code. You can use up to 6 characters (6 hex pairs) for each Std
      value.

      **Stu** is the *up* string value. This value represents the code
      the selected locator button sends when released. You code this
      value the same as Std above.

      **;** (3/11) is a separator character. This character separates
      each button definition string.

   **ST** (9/12) is the string terminator and indicates the end of the
   DCS. ST is a C1 control character that you can also express as ESC \\
   (1/11, 5/12) when coding for a 7-bit environment.

**Notes on DECLBD**

-  When you use the DECLBD function in an application, you may want to
   clear all the button definitions. Then you can define the buttons as
   used in that application.

-  When you redefine a locator button, the old definition is lost.

-  Locator button definitions are not stored in nonvolatile RAM (NVR).
   When you turn off or reset the terminal, you lose your definitions.

**Examples of Locator Button Definitions**

-  You can use the following sequence to clear the locator buttons.

   .. container:: example

      === === === === ====
      DCS 0   $   w   ST
      9/0 3/0 2/4 7/7 9/12
      === === === === ====

-  Suppose you want to define locator button 1 on Digital's mouse. You
   want the button to send a carriage return (CR) when released, and the
   default PF1 key code, **SS3 P**, when pressed. You want to do this
   without clearing any other buttons. The first part of your DECLBD
   sequence would look like this.

   .. container:: example

      === === === === === ====
      DCS 1   $   w   1   /
      9/0 3/1 2/4 7/7 3/1 2/15
      === === === === === ====

   The 1 after the w character indicates that this sequence defines
   locator button 1 on the mouse. The hex code for the carriage return
   character is D.

   The hex code for the default PF1 key control function is as follows.

   | SS3 = 8F hex
   | P = 50 hex

   The rest of the DECLBD sequence after the first slash would look like
   this.

   .. container:: example

      +-----------------+-----------------+-----------------+-----------------+
      | D               | /               | 8F50            | ST              |
      +-----------------+-----------------+-----------------+-----------------+
      | button          | 2/15            | button          | 9/12            |
      | released        |                 | pressed         |                 |
      +-----------------+-----------------+-----------------+-----------------+

   The complete string would look like this.

   **DCS 1 $ w 1 / D / 8F50 ST**

.. _S15.9:

Summary
-------

`Table 15-2 <#T15-2>`__ is a summary of the control functions and
commands described in this chapter.

.. table:: Table 15-2 Locator Command Summary

   +-----------------------+-----------------------+-----------------------+
   | Name                  | Command               | Function              |
   +=======================+=======================+=======================+
   | ReGIS                 |                       |                       |
   +-----------------------+-----------------------+-----------------------+
   | One-shot graphics     | **R(I0)**             | #. Selects one-shot   |
   | input mode            |                       |    mode.              |
   |                       |                       | #. In multiple mode,  |
   |                       |                       |    exits multiple     |
   |                       |                       |    mode and selects   |
   |                       |                       |    one-shot mode.     |
   +-----------------------+-----------------------+-----------------------+
   | Multiple graphics     | **R(I1)**             | Selects multiple      |
   | input mode            |                       | mode.                 |
   +-----------------------+-----------------------+-----------------------+
   | Request cursor        | **R(P(I))**           | In one-shot or        |
   | position report       |                       | multiple mode,        |
   |                       |                       | requests a cursor     |
   |                       |                       | position report from  |
   |                       |                       | the terminal.         |
   |                       |                       |                       |
   |                       |                       | In one shot mode, the |
   |                       |                       | terminal sends the    |
   |                       |                       | report when you press |
   |                       |                       | a locator button.     |
   |                       |                       |                       |
   |                       |                       | In multiple mode, the |
   |                       |                       | terminal sends the    |
   |                       |                       | report immediately.   |
   |                       |                       | The terminal also     |
   |                       |                       | sends a report when   |
   |                       |                       | you press a locator   |
   |                       |                       | button.               |
   +-----------------------+-----------------------+-----------------------+
   | 4010/4014 Mode        |                       |                       |
   +-----------------------+-----------------------+-----------------------+
   | GIN mode              | **ESC SUB**           | Selects graphics      |
   |                       |                       | input mode.           |
   +-----------------------+-----------------------+-----------------------+
   | Programming Locator   |                       |                       |
   | Device Buttons        |                       |                       |
   | (DECLBD)              |                       |                       |
   +-----------------------+-----------------------+-----------------------+
   | **DCS Pc $ w          |                       |                       |
   | Ky1/Std1/Stu1 ; ... ; |                       |                       |
   | Kyn/Stdn/Stun ST**    |                       |                       |
   |                       |                       |                       |
   | where                 |                       |                       |
   |                       |                       |                       |
   | +---                  |                       |                       |
   | -----+-----+--------+ |                       |                       |
   | | Pc                  |                       |                       |
   |      |  =  | clear  | |                       |                       |
   | |                     |                       |                       |
   |      |     | para   | |                       |                       |
   | |                     |                       |                       |
   |      |     | meter. | |                       |                       |
   | +---                  |                       |                       |
   | -----+-----+--------+ |                       |                       |
   | | 0                   |                       |                       |
   | or   |  =  | clear  | |                       |                       |
   | | no                  |                       |                       |
   | ne   |     | all    | |                       |                       |
   | |                     |                       |                       |
   |      |     | button | |                       |                       |
   | |                     |                       |                       |
   |      |     | defin  | |                       |                       |
   | |                     |                       |                       |
   |      |     | itions | |                       |                       |
   | |                     |                       |                       |
   |      |     | before | |                       |                       |
   | |                     |                       |                       |
   |      |     | l      | |                       |                       |
   | |                     |                       |                       |
   |      |     | oading | |                       |                       |
   | |                     |                       |                       |
   |      |     | new    | |                       |                       |
   | |                     |                       |                       |
   |      |     | values | |                       |                       |
   | |                     |                       |                       |
   |      |     | (def   | |                       |                       |
   | |                     |                       |                       |
   |      |     | ault). | |                       |                       |
   | +---                  |                       |                       |
   | -----+-----+--------+ |                       |                       |
   | | 1                   |                       |                       |
   |      |  =  | clear  | |                       |                       |
   | |                     |                       |                       |
   |      |     | one    | |                       |                       |
   | |                     |                       |                       |
   |      |     | button | |                       |                       |
   | |                     |                       |                       |
   |      |     | at a   | |                       |                       |
   | |                     |                       |                       |
   |      |     | time,  | |                       |                       |
   | |                     |                       |                       |
   |      |     | before | |                       |                       |
   | |                     |                       |                       |
   |      |     | l      | |                       |                       |
   | |                     |                       |                       |
   |      |     | oading | |                       |                       |
   | |                     |                       |                       |
   |      |     | a new  | |                       |                       |
   | |                     |                       |                       |
   |      |     | value. | |                       |                       |
   | +---                  |                       |                       |
   | -----+-----+--------+ |                       |                       |
   |                       |                       |                       |
   | NOTE: You can only    |                       |                       |
   | use 6 characters per  |                       |                       |
   | button transition     |                       |                       |
   | (pressed or           |                       |                       |
   | released).            |                       |                       |
   |                       |                       |                       |
   | .. container::        |                       |                       |
   | example               |                       |                       |
   |                       |                       |                       |
   |    **Ky1/Std/Stu ;    |                       |                       |
   |    ...** are the      |                       |                       |
   |    button definition  |                       |                       |
   |    strings.           |                       |                       |
   |                       |                       |                       |
   |                       |                       |                       |
   |   +-----+-----+-----+ |                       |                       |
   |                       |                       |                       |
   |   | Ky1 | =   | num | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ber | |                       |                       |
   |                       |                       |                       |
   |   |     |     | of  | |                       |                       |
   |                       |                       |                       |
   |   |     |     | the | |                       |                       |
   |                       |                       |                       |
   |   |     |     | but | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ton | |                       |                       |
   |                       |                       |                       |
   |   |     |     | you | |                       |                       |
   |                       |                       |                       |
   |   |     |     | are | |                       |                       |
   |                       |                       |                       |
   |   |     |     | def | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ini | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ng. | |                       |                       |
   |                       |                       |                       |
   |   +-----+-----+-----+ |                       |                       |
   |                       |                       |                       |
   |   | +   |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   | |   |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  Ky |     |     | |                       |                       |
   |                       |                       |                       |
   |   | 1 | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  Bu |     |     | |                       |                       |
   |                       |                       |                       |
   |   | tto |     |     | |                       |                       |
   |                       |                       |                       |
   |   | n | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  De |     |     | |                       |                       |
   |                       |                       |                       |
   |   | vic |     |     | |                       |                       |
   |                       |                       |                       |
   |   | e | |     |     | |                       |                       |
   |                       |                       |                       |
   |   | +   |     |     | |                       |                       |
   |                       |                       |                       |
   |   | === |     |     | |                       |                       |
   |                       |                       |                       |
   |   | ==+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   | === |     |     | |                       |                       |
   |                       |                       |                       |
   |   | === |     |     | |                       |                       |
   |                       |                       |                       |
   |   | ==+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   | === |     |     | |                       |                       |
   |                       |                       |                       |
   |   | === |     |     | |                       |                       |
   |                       |                       |                       |
   |   | ==+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   | |   |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  1  |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  Le |     |     | |                       |                       |
   |                       |                       |                       |
   |   | ft  |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  Mo |     |     | |                       |                       |
   |                       |                       |                       |
   |   | use |     |     | |                       |                       |
   |                       |                       |                       |
   |   | , | |     |     | |                       |                       |
   |                       |                       |                       |
   |   | |   |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  pu |     |     | |                       |                       |
   |                       |                       |                       |
   |   | ck, |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   | |   |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  or |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   | |   |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  st |     |     | |                       |                       |
   |                       |                       |                       |
   |   | ylu |     |     | |                       |                       |
   |                       |                       |                       |
   |   | s | |     |     | |                       |                       |
   |                       |                       |                       |
   |   | |   |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  ba |     |     | |                       |                       |
   |                       |                       |                       |
   |   | rre |     |     | |                       |                       |
   |                       |                       |                       |
   |   | l | |     |     | |                       |                       |
   |                       |                       |                       |
   |   | +   |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   | |   |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  2  |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  Mi |     |     | |                       |                       |
   |                       |                       |                       |
   |   | ddl |     |     | |                       |                       |
   |                       |                       |                       |
   |   | e | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  Mo |     |     | |                       |                       |
   |                       |                       |                       |
   |   | use |     |     | |                       |                       |
   |                       |                       |                       |
   |   | , | |     |     | |                       |                       |
   |                       |                       |                       |
   |   | |   |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  pu |     |     | |                       |                       |
   |                       |                       |                       |
   |   | ck, |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   | |   |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  or |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   | |   |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  st |     |     | |                       |                       |
   |                       |                       |                       |
   |   | ylu |     |     | |                       |                       |
   |                       |                       |                       |
   |   | s | |     |     | |                       |                       |
   |                       |                       |                       |
   |   | |   |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  ti |     |     | |                       |                       |
   |                       |                       |                       |
   |   | p   |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   | +   |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   | |   |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  3  |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  Ri |     |     | |                       |                       |
   |                       |                       |                       |
   |   | ght |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  Mo |     |     | |                       |                       |
   |                       |                       |                       |
   |   | use |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   | |   |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  or |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   | |   |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  pu |     |     | |                       |                       |
   |                       |                       |                       |
   |   | ck  |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   | +   |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   | |   |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  4  |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  Fo |     |     | |                       |                       |
   |                       |                       |                       |
   |   | urt |     |     | |                       |                       |
   |                       |                       |                       |
   |   | h | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  Pu |     |     | |                       |                       |
   |                       |                       |                       |
   |   | ck  |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   | |   |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   |  on |     |     | |                       |                       |
   |                       |                       |                       |
   |   | ly  |     |     | |                       |                       |
   |                       |                       |                       |
   |   |   | |     |     | |                       |                       |
   |                       |                       |                       |
   |   | +   |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --- |     |     | |                       |                       |
   |                       |                       |                       |
   |   | --+ |     |     | |                       |                       |
   |                       |                       |                       |
   |   +-----+-----+-----+ |                       |                       |
   |                       |                       |                       |
   |   | Std | =   | the | |                       |                       |
   |                       |                       |                       |
   |   |     |     | c   | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ode | |                       |                       |
   |                       |                       |                       |
   |   |     |     | the | |                       |                       |
   |                       |                       |                       |
   |   |     |     | se  | |                       |                       |
   |                       |                       |                       |
   |   |     |     | lec | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ted | |                       |                       |
   |                       |                       |                       |
   |   |     |     | l   | |                       |                       |
   |                       |                       |                       |
   |   |     |     | oca | |                       |                       |
   |                       |                       |                       |
   |   |     |     | tor | |                       |                       |
   |                       |                       |                       |
   |   |     |     | but | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ton | |                       |                       |
   |                       |                       |                       |
   |   |     |     | se  | |                       |                       |
   |                       |                       |                       |
   |   |     |     | nds | |                       |                       |
   |                       |                       |                       |
   |   |     |     | w   | |                       |                       |
   |                       |                       |                       |
   |   |     |     | hen | |                       |                       |
   |                       |                       |                       |
   |   |     |     | pr  | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ess | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ed. | |                       |                       |
   |                       |                       |                       |
   |   |     |     | The | |                       |                       |
   |                       |                       |                       |
   |   |     |     | va  | |                       |                       |
   |                       |                       |                       |
   |   |     |     | lue | |                       |                       |
   |                       |                       |                       |
   |   |     |     | is  | |                       |                       |
   |                       |                       |                       |
   |   |     |     | a   | |                       |                       |
   |                       |                       |                       |
   |   |     |     | str | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ing | |                       |                       |
   |                       |                       |                       |
   |   |     |     | of  | |                       |                       |
   |                       |                       |                       |
   |   |     |     | hex | |                       |                       |
   |                       |                       |                       |
   |   |     |     | pai | |                       |                       |
   |                       |                       |                       |
   |   |     |     | rs, | |                       |                       |
   |                       |                       |                       |
   |   |     |     | e   | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ach | |                       |                       |
   |                       |                       |                       |
   |   |     |     | rep | |                       |                       |
   |                       |                       |                       |
   |   |     |     | res | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ent | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ing | |                       |                       |
   |                       |                       |                       |
   |   |     |     | one | |                       |                       |
   |                       |                       |                       |
   |   |     |     | 8-  | |                       |                       |
   |                       |                       |                       |
   |   |     |     | bit | |                       |                       |
   |                       |                       |                       |
   |   |     |     | c   | |                       |                       |
   |                       |                       |                       |
   |   |     |     | har | |                       |                       |
   |                       |                       |                       |
   |   |     |     | act | |                       |                       |
   |                       |                       |                       |
   |   |     |     | er. | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     | You | |                       |                       |
   |                       |                       |                       |
   |   |     |     | can | |                       |                       |
   |                       |                       |                       |
   |   |     |     | use | |                       |                       |
   |                       |                       |                       |
   |   |     |     | hex | |                       |                       |
   |                       |                       |                       |
   |   |     |     | val | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ues | |                       |                       |
   |                       |                       |                       |
   |   |     |     | in  | |                       |                       |
   |                       |                       |                       |
   |   |     |     | the | |                       |                       |
   |                       |                       |                       |
   |   |     |     | fol | |                       |                       |
   |                       |                       |                       |
   |   |     |     | low | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ing | |                       |                       |
   |                       |                       |                       |
   |   |     |     | r   | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ang | |                       |                       |
   |                       |                       |                       |
   |   |     |     | es. | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     | |   | |                       |                       |
   |                       |                       |                       |
   |   |     |     | 3/0 | |                       |                       |
   |                       |                       |                       |
   |   |     |     |   t | |                       |                       |
   |                       |                       |                       |
   |   |     |     | hro | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ugh | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     | 3/9 | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |  (0 | |                       |                       |
   |                       |                       |                       |
   |   |     |     |   t | |                       |                       |
   |                       |                       |                       |
   |   |     |     | hro | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ugh | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |  9) | |                       |                       |
   |                       |                       |                       |
   |   |     |     | |   | |                       |                       |
   |                       |                       |                       |
   |   |     |     | 4/1 | |                       |                       |
   |                       |                       |                       |
   |   |     |     |   t | |                       |                       |
   |                       |                       |                       |
   |   |     |     | hro | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ugh | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     | 4/6 | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |  (A | |                       |                       |
   |                       |                       |                       |
   |   |     |     |   t | |                       |                       |
   |                       |                       |                       |
   |   |     |     | hro | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ugh | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |  F) | |                       |                       |
   |                       |                       |                       |
   |   |     |     | |   | |                       |                       |
   |                       |                       |                       |
   |   |     |     | 6/1 | |                       |                       |
   |                       |                       |                       |
   |   |     |     |   t | |                       |                       |
   |                       |                       |                       |
   |   |     |     | hro | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ugh | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     | 6/6 | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |  (a | |                       |                       |
   |                       |                       |                       |
   |   |     |     |   t | |                       |                       |
   |                       |                       |                       |
   |   |     |     | hro | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ugh | |                       |                       |
   |                       |                       |                       |
   |   |     |     |     | |                       |                       |
   |                       |                       |                       |
   |   |     |     |  f) | |                       |                       |
   |                       |                       |                       |
   |   +-----+-----+-----+ |                       |                       |
   |                       |                       |                       |
   |   | Stu | =   | the | |                       |                       |
   |                       |                       |                       |
   |   |     |     | c   | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ode | |                       |                       |
   |                       |                       |                       |
   |   |     |     | the | |                       |                       |
   |                       |                       |                       |
   |   |     |     | se  | |                       |                       |
   |                       |                       |                       |
   |   |     |     | lec | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ted | |                       |                       |
   |                       |                       |                       |
   |   |     |     | l   | |                       |                       |
   |                       |                       |                       |
   |   |     |     | oca | |                       |                       |
   |                       |                       |                       |
   |   |     |     | tor | |                       |                       |
   |                       |                       |                       |
   |   |     |     | but | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ton | |                       |                       |
   |                       |                       |                       |
   |   |     |     | se  | |                       |                       |
   |                       |                       |                       |
   |   |     |     | nds | |                       |                       |
   |                       |                       |                       |
   |   |     |     | w   | |                       |                       |
   |                       |                       |                       |
   |   |     |     | hen | |                       |                       |
   |                       |                       |                       |
   |   |     |     | rel | |                       |                       |
   |                       |                       |                       |
   |   |     |     | eas | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ed. | |                       |                       |
   |                       |                       |                       |
   |   |     |     | You | |                       |                       |
   |                       |                       |                       |
   |   |     |     | c   | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ode | |                       |                       |
   |                       |                       |                       |
   |   |     |     | t   | |                       |                       |
   |                       |                       |                       |
   |   |     |     | his | |                       |                       |
   |                       |                       |                       |
   |   |     |     | va  | |                       |                       |
   |                       |                       |                       |
   |   |     |     | lue | |                       |                       |
   |                       |                       |                       |
   |   |     |     | the | |                       |                       |
   |                       |                       |                       |
   |   |     |     | s   | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ame | |                       |                       |
   |                       |                       |                       |
   |   |     |     | as  | |                       |                       |
   |                       |                       |                       |
   |   |     |     | Std | |                       |                       |
   |                       |                       |                       |
   |   |     |     | abo | |                       |                       |
   |                       |                       |                       |
   |   |     |     | ve. | |                       |                       |
   |                       |                       |                       |
   |   +-----+-----+-----+ |                       |                       |
   +-----------------------+-----------------------+-----------------------+

.. container:: navbar

   --------------

   +----------------------+
   | `Chapter             |
   | 14                   |
   |  <chapter14.html>`__ |
   +----------------------+

   .. container:: navbot

      http://vt100.net/docs/vt3xx-gp/chapter15.html

.. |VT100.net| image:: ../../vt100.net-logo
   :class: button
   :width: 102px
   :height: 16px
   :target: ../../
