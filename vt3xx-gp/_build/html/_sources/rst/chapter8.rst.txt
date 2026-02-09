.. container:: navbar

   |VT100.net| VT330/VT340 Programmer Reference Manual Volume 2:
   Graphics Programming

   +----------------------+
   | `Chapter             |
   | 7 <chapter7.html>`__ |
   +----------------------+

   --------------

.. _S8:

8 Load Command
==============

.. _S8.1:

Using Your Own Character Sets
-----------------------------

The VT300 lets you designate up to four character sets to use in ReGIS.
The alphabet 0 set (A0) can have up to 192 characters, all others can
have up to 96 characters. You assign and select these character sets by
number.

+--------+------------------------------------------------------------+
| Number | Character Set                                              |
+========+============================================================+
| 0      | Any one of the terminal's built-in sets (such as ASCII or  |
|        | ISO Latin-1 supplemental graphic)                          |
+--------+------------------------------------------------------------+
| 1 to 3 | Up to three sets that you load into the terminal from the  |
|        | host system                                                |
+--------+------------------------------------------------------------+

You use the load command to select, load, or reload sets 1, 2, and 3.
You cannot use the load command to load character set 0. Set 0 is
reserved for one of the terminal's built-in sets. See `Chapter
7 <chapter7.html>`__ for information on loading built-in character sets.

There are three options to the load command.

+----------------------+----------------------------------------------+
| Select character set | Assigns a number to the set you want to      |
|                      | load.                                        |
+----------------------+----------------------------------------------+
| Specify name         | Assigns a name to the set selected with the  |
|                      | select character set option.                 |
+----------------------+----------------------------------------------+
| Load character cell  | Loads a character into the set selected with |
|                      | the select character set option.             |
+----------------------+----------------------------------------------+

.. _S8.2:

Select Character Set
--------------------

You use this option to assign a number to a character set you want to
load into the terminal. You can select 1, 2, or 3. You use the following
format for the select character set option.

L(A<1 to 3>)

where

.. container:: example

   **L** identifies a load command.

   **A** identifies a select character set option.

   **<1 to 3>** is a number to assign to a character set loaded from the
   host system.

After you select a character set number, you can use the other load
command options to name the character set and load the characters. All
load commands apply to the character set with this number, until you
select another number. However, you can use other types of ReGIS
commands without affecting the character set selected for loading.

You load characters into the character set by using the load character
cell option. You can load characters into the character set as needed.
You do not have to load the complete set at one time.

NOTE: You can select character set 0, but you cannot load it.

.. _S8.3:

Specify Name
------------

This option lets you specify a name for the character set selected with
the select character set option. You can use up to 10 characters in the
name. You use this name for report commands (`Chapter
10 <chapter10.html>`__), to report the name of the currently selected
loadable set. You use the following format for the specify name option.

L(A'<name>')

where

.. container:: example

   **A** identifies a specify name option.

   **' '** are single or double quotation marks that enclose the
   character set name.

   **<name>** is a name to assign to the currently selected character
   set. You can use up to 10 characters in the name.

You can use the specify name and select character set options together.
That is, you can assign the name and number of the character set at the
same time. Make sure you use the select character set option first in
the command. Otherwise, ReGIS assigns the name to the character set
already selected, not the character set you are selecting.

.. _S8.4:

Load Character Cell
-------------------

These arguments let you design and load a character into the terminal.
ReGIS loads the character into the set selected with the select
character set option. You use the following format for the load cell
option.

L"<character>"<hex pairs>

where

.. container:: example

   **" "** are single or double quotation marks that enclose the call
   letter to use for the character cell you are loading.

   **<character>** is one ASCII character to use as a call letter for
   the character cell you are loading.

   **<hex pairs>** is a hexadecimal code that defines the appearance of
   the character cell. You use a pair of hex values for each row of the
   cell (up to 10 rows).

First, you assign a call letter (<character>) to the cell. You use the
*call letter* to select the loaded character set in text commands. You
can use any single ASCII character for the call letter, including a
number or space. However, there is no relationship between the shape of
the call letter and the character you are loading.

Next, you define how the loaded character will look. Each character cell
has 80 pixels in a 8 × 10 array. This size matches the unit cell size
for a standard S1 character cell (`Table 7-1 <chapter7.html#T7-1>`__).
You cannot define a character larger than the 8 × 10 array.

You use hexadecimal codes to define which pixels are on and off when you
display the character. `Table 8-1 <#T8-1>`__ lists the bit pattern for
each possible hex code. A 1 bit turns a pixel on, and a 0 bit turns a
pixel off. Each hex code defines a 4-bit pattern. You use two hex code
values to define a row of 8 pixels. You can define all 10 rows in the
character cell.

.. table:: Table 8-1 Hex Code Table

   ======== =======
   Hex Code Bit 1/5
   ======== =======
   0        0
   1        0
   2        0
   3        0
   4        0
   5        0
   6        0
   7        0
   8        1
   9        1
   A        1
   B        1
   C        1
   D        1
   E        1
   F        1
   ======== =======

You build the cell from the top down. The first hex code value for a row
controls the pattern for the four left pixels. The second value controls
the pattern for the four right pixels.

**Example**

.. container::

   |image1|

If you use more than two hex values, ReGIS proceeds as if you used a
comma after each pair of values. If you use only one hex value or end up
with one, ReGIS assumes the first hex value is 0 and sets the first 4
bits in the row to 0 (off).

You do not have to define every row in a cell. However, you must define
the following rows.

-  Rows that have any pixels on
-  Blank rows that are above rows with pixels on

ReGIS assumes that any undefined rows at the bottom of the cell are
blank. `Figure 8-1 <#F8-1>`__ shows some examples of loaded characters
and their hex codes.

.. table:: Figure 8-1 Example of Load Character Cell Argument

   +--------------------------------------------+
   | |image2|                                   |
   +--------------------------------------------+
   | ======== ================================= |
   | COMMANDS                                   |
   |          L(A3"alpha")                      |
   | (A)      "S" 00,14,3E,54,3E,15,3E,14       |
   | (B)      'c' 4,E,15,15,15,E,4              |
   | (C)      'C' FF,89,EB,81,E3,81,EB,89,FF    |
   | (D)      "b" 7F,41,41,41,41,49,55,55,55,63 |
   | (E)      '1' 0,1C,1C,1C,7F,3E,1C,8         |
   | (F)      "." 0,1F,8F,47,29,10,28,44,82;    |
   | ======== ================================= |
   +--------------------------------------------+

.. _S8.5:

Load Command Summary
--------------------

`Table 8-2 <#T8-2>`__ is a summary of the **L** command options,
including any default values.

.. table:: Table 8-2 Load Command Summary

   +------------------------+-------------+-------------------------------+
   | Option                 | Default     | Description                   |
   +========================+=============+===============================+
   | (A<1 to 3>)            | 1           | | **Select character set**    |
   |                        |             | | Selects one of three        |
   |                        |             |   loadable character sets to  |
   |                        |             |   use for any following load  |
   |                        |             |   commands.                   |
   +------------------------+-------------+-------------------------------+
   | (A"<name>")            | " "         | | **Specify name**            |
   |                        |             | | Selects a name of up to 10  |
   |                        |             |   characters for the          |
   |                        |             |   currently selected loadable |
   |                        |             |   character set. You can use  |
   |                        |             |   this option with the select |
   |                        |             |   character set option:       |
   |                        |             | | (A<1 to 3>"<name>").        |
   +------------------------+-------------+-------------------------------+
   | "<ASCII>"<hex pairs>   | –           | | **Load character cell**     |
   |                        |             | | Loads a character into the  |
   |                        |             |   currently selected loadable |
   |                        |             |   set.                        |
   |                        |             |                               |
   |                        |             | +------------+------------+   |
   |                        |             | | <ASCII>    | is an      |   |
   |                        |             | |            | ASCII      |   |
   |                        |             | |            | character  |   |
   |                        |             | |            | you use to |   |
   |                        |             | |            | select the |   |
   |                        |             | |            | loadable   |   |
   |                        |             | |            | character  |   |
   |                        |             | |            | in other   |   |
   |                        |             | |            | commands.  |   |
   |                        |             | +------------+------------+   |
   |                        |             | | <          | define the |   |
   |                        |             | | hex pairs> | bit        |   |
   |                        |             | |            | pattern    |   |
   |                        |             | |            | for each   |   |
   |                        |             | |            | line of    |   |
   |                        |             | |            | the        |   |
   |                        |             | |            | character. |   |
   |                        |             | +------------+------------+   |
   +------------------------+-------------+-------------------------------+

.. container:: navbar

   --------------

   +----------------------+
   | `Chapter             |
   | 7 <chapter7.html>`__ |
   +----------------------+

   .. container:: navbot

      http://vt100.net/docs/vt3xx-gp/chapter8.html

.. |VT100.net| image:: ../../vt100.net-logo
   :class: button
   :width: 102px
   :height: 16px
   :target: ../../
.. |image1| image:: inline8-1
.. |image2| image:: ma-0409-86
