/***
*
*  Box.ch   +   for cyrilic drv.
*
*  Computer Associates International, Inc.
*  &
*  DMD Computer.com noStandard definitions for Clipper box drawing commands
*
*  Copyright (c) 1990-1993, Computer Associates International, Inc.
*  All rights reserved.
*
*  Copyright (c) 1995-1998, DMD Computer.com, Bulgaria, MJJ-to
*  dmd-computer.com@bulmail.gocis.bg
*  & dpavlov@iname.com
*  For Free Use!
*
*/

// Single-line box
#define B_SINGLE                ( CHR(218) + CHR(196) + CHR(207) + CHR(211) + ;
                          CHR(217) + CHR(196) + CHR(192) + CHR(211)   )


#define CYR_SINGLE_BOX          ( CHR(218) + CHR(196) + CHR(207) + CHR(211) + ;
                          CHR(217) + CHR(196) + CHR(192) + CHR(211)   )

// Double-line box
#define B_DOUBLE                ( CHR(201) + CHR(205) + CHR(187) + CHR(186) + ;
                       CHR(188) + CHR(205) + CHR(200) + CHR(186)   )

// Single-line top, double-line sides
#define B_SINGLE_DOUBLE ( CHR(214) + CHR(196) + CHR(183) + CHR(186) + ;
                          CHR(189) + CHR(196) + CHR(211) + CHR(186)   )

// Double-line top, single-line sides
#define B_DOUBLE_SINGLE ( CHR(213) + CHR(205) + CHR(184) + CHR(211) + ;
                             CHR(190) + CHR(205) + CHR(212) + CHR(211)   )


#define _BOX_CH

