/*****
 *
 * MANAGINF.PRG
 *
 *
 * RMAKE manager
 *
 */

#include "box.ch"

FUNCTION Info( nTop, nRight )
   LOCAL cClr, cScr

   // Save
   cClr := SETCOLOR("W+/RB")
   cScr := SAVESCREEN( 4, 5, 18, 66 )

   // Screen
   Shadow( 5, 7, 18, 66 )
   SCROLL( 4, 5, 17, 64 )
   @  4, 5, 17, 64 BOX CYR_SINGLE_BOX

   // This is the useless part of the program!
   //
   // Blah, blah, blah, blah, blah
   //



   @  5, 8 SAY "     The DMD Computer.com File Manager V1.0 rel.     "
   @  7, 8 SAY " ���� �������� � ������������ � ���������� ������ �� "
   @  8, 8 SAY "    MENAGER.PRG �� ������������ ���������� �� US     "
   @  9, 8 SAY "   ������� Computer Associates International, Inc.   "
   @ 10, 8 SAY "   �� ����� �� ������������ CA-Clipper Version 5.2   "
   @ 12, 8 SAY "   �� ��������:  dmd-computer.com@bulmail.gocis.bg   "
   @ 13, 8 SAY "                 (+359)0-457-26937                   "
   @ 16, 8 SAY "          ������� ������ �� ����������� ...          "

   // Keep the clock running
   WhatKey( , {|| SETPOS( 0, 71 ),;
                  DEVOUT( TIME(), "N/BG" ) } )

   // Put it Back
   SETCOLOR(cClr)
   RESTSCREEN( 4, 5, 18, 66, cScr )
   RETURN (NIL)

// EOF - MANGINF.PRG //
