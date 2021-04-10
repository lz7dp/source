#INCLUDE "inkey.hd"

*       DMD Computer.com (tm)&(c) 1995 , BULGARIA, Nova Zagora, +359 457 23263
*       PETER & DPP-to
*
*****************************************************
*********  edit & print music information  **********
*****************************************************

*************************************************************************

SET COLOR TO N/BG+
@ 0,0,24,80 BOX 'ееееееееее'


@  1, 0 SAY 'ееъъъъъъъ еъъъ еееъъъ ъъъ ееееееееееееъъъъ ъъъ ееееееъъъ еееееееъъъъ ееъъъъъъ ее'
@  2, 0 SAY 'еъъъ ееъъъ ъъъ ееъъъ еъъъ ее(tm)`98ееъъъъъ ъъъъ ееееъъъъ ееееееъъъъъ ъъъ еееъъъ '
@  3, 0 SAY 'еъъъ ееееееъъъ еъъъ ееъъъ ееееееееееъъъъъъ ъъъъъ ееъъъъъ еееееъъъъъъ ъъъ еееъъъ '
@  4, 0 SAY 'ееъъъ еееееъъъ ъъъ еееъъъ еееееееееъъъ ъъъ ъъъъъъъъъъъъъ ееееъъъ ъъъ ъъъ еееееее'
@  5, 0 SAY 'ееееъъъ еееъъъъъъ ееееъъъ ееееееееъъъ еъъъ ъъъ еъъъ еъъъ еееъъъ еъъъ ъъъ еееееее'
@  6, 0 SAY 'ееееееъъъ еъъъ ъъъ еееъъъ еееееееъъъъъъъъъ ъъъ ееъ ееъъъ ееъъъъъъъъъ ъъъ еееееее'
@  7, 0 SAY 'еееееееъъъ ъъъ еъъъ ееъъъ ееееееъъъ еееъъъ ъъъ ееееееъъъ еъъъ еееъъъ ъъъ ешъъъъ '
@  8, 0 SAY 'еъъъ ееъъъ ъъъ ееъъъ еъъъ еееееъъъ ееееъъъ ъъъ ееееееъъъ ъъъ ееееъъъ ъъъ еееъъъ '
@  9, 0 SAY 'ееъъъъъъъ еъъъ еееъъъ ъъъъъъъъъъъ еееееъъъ ъъъ ееееееъъъъъъ еееееъъъ ееъъъъъъ ее'


@ 11, 11 SAY 'еъъъъъъъъъъъъъъ еееееъъъъ еееееееъъъъ еееъъъъъъъъъъъъъъ ее'
@ 12, 11 SAY 'еъъъъ еееееееъъъъ еееъъъъъ еееееъъъъъ еееъъъъ еееееееъъъъ '
@ 13, 11 SAY 'еъъъъ еееееееъъъъ еееъъъъъъ еееъъъъъъ еееъъъъ еееееееъъъъ '
@ 14, 11 SAY 'еъъъъ еееееееъъъъ еееъъъъъъъъъъъъъъъъ еееъъъъ еееееееъъъъ '
@ 15, 11 SAY 'еъъъъ еееееееъъъъ еееъъъъ еъъъъ еъъъъ еееъъъъ еееееееъъъъ '
@ 16, 11 SAY 'еъъъъ еееееееъъъъ еееъъъъ ееъъ ееъъъъ еееъъъъ еееееееъъъъ '
@ 17, 11 SAY 'еъъъъ еееееееъъъъ еееъъъъ еееееCOMPUTER.COM (tm)`95ееъъъъ '
@ 18, 11 SAY 'еъъъъ еееееееъъъъ еееъъъъ еееееееъъъъ еееъъъъ еееееееъъъъ '
@ 19, 11 SAY 'еъъъъъъъъъъъъъъ еееееъъъъ еееееееъъъъ еееъъъъъъъъъъъъъъ ее'


@ 21,1 SAY ' DMD Computer.com еее (c)98 еее SKLAMAG V 0.1 '
@ 22,1 SAY ' BULGARIA ее 8900 Nova Zagora ее p.k. 39 ее phones: ее +359 457 29347, 26937 '
@ 23,1 SAY ' e-mail: еее dmd-computer.com@bulmail.gocis.bg '

SET COLOR TO
SET MOUSE OFF
SET DELETED ON
CLOSE ALL

USE music.dbf
INDEX ON Name TO Music
COPY TO music1.dbf
CLOSE ALL
USE text
COPY TO text_w
RUN del music.dbf
RUN ren music1.dbf music.dbf

SELECT 1
USE music

SELECT 2
USE nomer

SELECT 3
USE text_w

SELECT 1
        /* └╔╙╚═╟╗╟═ ╗ ╖═╟╔╕╓═ ╛═╠╗╒╗, ╙╝╗╡╝ ╠╔ ╗╖╞╝╚╖╒═╡
           ╞╟╗ ╗╖║╝╟ ╝╡ ╞╟╝╖╝╟╔╤ ╖═ ╙╚╗╔╜╡╗ */
        mus1 := { ' ┬▄┘ █─ ┬┤▐ ▀█┬▓┘▀ ', ' ┬▄┘ █─ ─▀│⌠▄ ', ' │░▌┴ ' }
        mus := { 'NAME', 'NAME_ALBUM', 'BR' }

Help_R()

DEFINE WINDOW MainWIN FROM 2,5 TO 20,75 TITLE ;
    ' cd_disk ┼─░▓▌▓┘┼─ ' SHADOW NOCURSOR COLOR SCHEME 1
ACTIVATE WINDOW MainWIN NOSHOW
ACTIVATE WINDOW MainWIN
DO WHILE LASTKEY() != _ESC
    DBEDIT(,,,, mus,'udbedit',NIL, mus1)
ENDDO
RELEASE WINDOW MainWIN
SET CURSOR OFF
INKEY(0)

SET COLOR TO
CLEAR
RETURN
*******************************OK_END*****************


FUNCTION udbedit(mode,tp)
red     := ROW()
@ 16,20 SAY 'ддддддддддддддддддддддддддддддддддддддддд'
ins     := .F.
R       := 0
gr      := 0
gc      := 0
dr      := maxrow()
dc      := maxcol()
l_key   := LASTKEY()
nreturn := 1

DO CASE
  CASE mode=0   && ▒╨╠╡╝©╜╗╔ "╜╔╖═╔╡"
    nreturn:=1
  CASE mode=1
    @ 16,20 SAY '> └╝╠╡╗ё╜═╡╝ ╔ ╜═╥═╚╝╡╝ ╜═ ╢═╘╚═ ! <'
    nreturn:=1
  CASE mode=2
    @ 16,20 SAY '> └╝╠╡╗ё╜═╡ ╔ ╙╟═© ╜═ ╢═╘╚═ ! <'
    nreturn:=1
  CASE mode=3
    @ 16,20 SAY '> ■═╘╚╨╡ ╔ ╞╟═╖╔╜ ! <'
    WAIT
    nreturn:=0
  CASE mode=4  && █═╡╗╠╜═╡ ╔ ╜╔╟╔ё╚═╛╔╜╡╗╟═╜ ╙╚═╒╗╦
    DO CASE
      CASE l_key=22     && ┼╚═╒╗╦ Ins ╖═ ╓╝║═╒©╜╔
        ins:=.T.
        CLEAR GETS
        GO BOTTOM
        SET CURSOR ON
        NAME1        = SPACE(27)
        NAME_ALBUM1  = SPACE(27)
        BR1          = 000
        @ red,1  GET NAME1
        @ row(),31 GET NAME_ALBUM1
        @ row(),62 GET BR1 PICTURE '@K 999'
        READ
        SET CURSOR OFF
        IF LASTKEY() != _ESC
           APPEN BLANK
           REPLACE NAME       WITH NAME1
           REPLACE NAME_ALBUM WITH NAME_ALBUM1
           REPLACE BR         WITH BR1
*          KEYBOARD CHR(13)    && <CR>
           INDEX ON Name TO Music
           nreturn:=0
        ELSE
           nreturn:=1
           RETURN nreturn
        ENDIF
        test:=.T.
        SET CURSOR OFF
      CASE l_key=27     && ┼╚═╒╗╦ Esc
        test:=.t.
        nreturn:=0
      CASE l_key=-1     && ┼╚═╒╗╦ F2
        Help_R()
        test:=.t.
        nreturn:=0
      CASE l_key=-4     && ┼╚═╒╗╦ F5
        SELECT 1
        R = RECNO()
        SELECT 2
        REPLACE Rek_1 WITH R
        test:=.t.
        nreturn:=0
        SELECT 1
      CASE l_key=-5     && ┼╚═╒╗╦ F6
        SELECT 1
        R = RECNO()
        SELECT 2
        REPLACE Rek_2 WITH R
        test:=.t.
        nreturn:=0
        SELECT 1
      CASE l_key=-6     && ┼╚═╒╗╦ F7
        SELECT 2
        Print_R()
        test:=.t.
        nreturn:=0
        SELECT 1
      CASE l_key=-7     && ┼╚═╒╗╦ F8
        SELECT 2
        Print_F()
        test:=.t.
        nreturn:=0
        SELECT 1
      CASE l_key=7      && ┼╚═╒╗╦ Delete
        CLEAR GETS
        test:=.T.
        xime:=NAME
        DELETE
        PACK
        INDEX ON Name TO Music
        nreturn:=0
      CASE l_key=13     && ┼╚═╒╗╦ Return
        CLEAR GETS
        test:=.T.
        xime:=NAME
        SET CURSOR ON
        @   red, 1 GET NAME
        @ ROW(),31 GET NAME_ALBUM
        @ ROW(),62 GET BR
        READ
        SET CURSOR OFF
        INDEX ON Name TO Music
        nreturn:=0
      OTHERWISE
        nreturn:=1
      ENDCASE
OTHERWISE
  nreturn:=1
ENDCASE
RETURN nReturn

*************************************************************************

PROCEDURE Help_R
        DEFINE WINDOW HelpWIN FROM 1,2 TO 18,72 TITLE ;
               ' ▐▌▄▌≥┘█ ┘┼░─█ ' SHADOW NOCURSOR COLOR SCHEME 1
        ACTIVATE WINDOW HelpWIN NOSHOW
        @ 0,0 SAY  '>>>>>>------------------>  HE-E-ELP ME !!! <------------------<<<<<<'
        @ 1,0 SAY  '                                                                    '
        @ 2,0 SAY  '     ▓▌┌─ ▌▐┬▒─█┬┘ ┘ █─ ┼▀─┌┬≤┬▓┘, ▒ ┼▌┬▓▌ ░─│▌▓┬ ▐░▌┐░─▄─▓─ !      '
        @ 3,0 SAY  '                                                                    '
        @ 4,0 SAY  '┼▌┐─▓▌ ▒┬ ┤─▒▓─█─▀ ┌ ░∙⌠ ░┘└ ▄▌├┘≤ └─ ┬┤▐▌▀┤┌─≤ ▒▀┘└█┬▓┘ ┼▀─┌┬≤┬ ┤─:'
        @ 5,0 SAY  '         [ENTER]  - ┼▌░┘┼√┬÷ █─ ┌ ┌┘└┘█─▓─ ┬█■▌░▄─√┬÷               '
        @ 6,0 SAY  '         [INSERT] - ┌ ┌┘├└─█┘ █─ █▌┌─ ┬█■▌░▄─√┬÷                    '
        @ 7,0 SAY  '         [DELETE] - ┬┤▓░┬┌─█┘ █─ ┘└┬█ ░┘└ ┬█■▌░▄─√┬÷                '
        @ 8,0 SAY  '         [F2]     - ┬┤┌┘├└─ ▓▌┤┬ ▐▌▄▌≥┘█ ┘┼░─█                      '
        @ 9,0 SAY  '         [F5]     - ▄─░┼┬░─ █─≈─▀┘█ ░┘└ ┤─ ▐┘≈─▓                    '
        @ 10,0 SAY '         [F6]     - ▄─░┼┬░─ ┼░─┘█ ░┘└ ┤─ ▐┘≈─▓                      '
        @ 11,0 SAY '         [F7]     - ▌▓▐┘≈─▓┌─ ▌│▀─▒▓▓─ ▄─░┼┬░─█─ ▒ ┐▌░█┬▓┘ ┼▀─┌┬≤┬  '
        @ 12,0 SAY '         [F8]     - ▐░─┌┬ ■─┴▀ SPISAK.PRN ▌▓ ▄─░┼┬░─█─▓─ ▌│▀─▒▓     '
        @ 13,0 SAY '         [ESC]    - ┬┤∙▌└ ┬▀┬ ▌▓┼─┤ ▌▓ └┘┴▒▓┌┬┘ ┬ ▌▐┘░─√┬÷          '
        @ 14,0 SAY '                                                                    '
        @ 15,0 SAY '                          █═╡╗╠╜╗ ╙╚═╒╗╦═ [ENTER], ╖═ ╓═ ╞╟╝╓╨╚╕╗╦ !'
        ACTIVATE WINDOW HelpWIN

        INKEY(0)
RELEASE WINDOW HelpWIN
RETURN

*************************************************************************

PROCEDURE Print_R

    B = 0
    SET PRINTER ON
    SET DEVICE TO PRINT

    SELECT 2
    IF Rek_1<Rek_2
        Na = Rek_1
        Kr = Rek_2
    ENDIF

    IF Rek_2<Rek_1
        Na = Rek_2
        Kr = Rek_1
    ENDIF

    IF Rek_1=Rek_2
        Na = Rek_1
        Kr = Rek_2
    ENDIF

    SELECT 1
    GO Na

    DO WHILE RECNO()<(Kr+1) .AND. LASTKEY() != 27
    @ prow()+1, 3 say 'здддддддддддддддддддддддддддддддбдддддддддддддддддддддддддддддддбддддддо'
    @ prow()+1, 3 say 'с         ┬▄┘ █─ ┐░⌠▐─          с         ┬▄┘ █─ ─▀│⌠▄─         с │╟╝╘ с'
    @ prow()+1, 3 say 'цдддддддддддддддддддддддддддддддедддддддддддддддддддддддддддддддеддддддт'
    @ prow()+1, 3 say ' '

        DO WHILE (!EOF() .AND. B<>55 .AND. lastkey()!=27 .AND. RECNO()<>Kr+1)
                @ prow(),  4 say NAME
                @ prow(), 36 say NAME_ALBUM
                @ prow(), 69 say BR
                @ prow() + 1, 1 say '  '
                B = B + 1
                skip 1
        ENDDO

    @ prow()+1, 3 say 'цдддддддддддддддддддддддддддддддедддддддддддддддддддддддддддддддеддддддт'
    B = 0
    EJECT
    ENDDO

    SET PRINTER OFF
    SET DEVICE TO SCREEN
    RETURN


*************************************************************************

PROCEDURE Print_F

    RUN del spisak.prn

    SELECT 3
    GO BOTTOM
    APPEND BLANK
    REPLACE tex with  '     здддддддддддддддддддддддддддддддбдддддддддддддддддддддддддддддддбддддддо'
    APPEND BLANK
    REPLACE tex with  '     с         ┬▄┘ █─ ┐░⌠▐─          с         ┬▄┘ █─ ─▀│⌠▄─         с │╟╝╘ с'
    APPEND BLANK
    REPLACE tex with  '     цдддддддддддддддддддддддддддддддедддддддддддддддддддддддддддддддеддддддт'
    APPEND BLANK
    REPLACE tex with  ' '

    SELECT 2
    IF Rek_1<Rek_2
        Na = Rek_1
        Kr = Rek_2
    ENDIF

    IF Rek_2<Rek_1
        Na = Rek_2
        Kr = Rek_1
    ENDIF

    IF Rek_1=Rek_2
        Na = Rek_1
        Kr = Rek_2
    ENDIF

    SELECT 1
    GO Na

    DO WHILE RECNO()<(Kr+1) .AND. LASTKEY() != 27 .AND. !EOF()
        SELECT 1
        v_name       = NAME
        v_name_album = NAME_ALBUM
        v_br         = STR(BR)
        v_spc        = '  '
        skip +1

        SELECT 3
        GO BOTTOM
        APPEND BLANK
        REPLACE tex WITH '      ' + v_name + '     ' + v_name_album + '      ' + v_br

        SELECT 1
    ENDDO

    SELECT 3
    GO TOP
    COPY TO spisak.prn FIELDS tex SDF

RETURN

*************************************************************************
