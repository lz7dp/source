*************************************************************************
*               DMD Computer.com (c) 1997 MJJ, PETAR, DPP               *
*************************************************************************

********************************* START *********************************
#INCLUDE 'inkey.hd'

DO COOP3
DO ELI
DO INTRODMD

SET CACHE OFF
CLEAR ALL
CLOSE DATABASE
SET DATE GERMAN
SET MOUSE ON
SET MOUSE STYLE OFF
PUBLIC SpS
SpS := ''
vL_str := 55

@ 0,0,24,80 BOX '         '
@  7, 0 SAY '   ßßßßßßßßßßßßßß      ßßßßßßßßßßßßßß      ßßßßßßßßßßßßßß     ßßßßßßßßßßßßßßß   '
@  8, 0 SAY '  ßßßß        ßßßß    ßßßß        ßßßß    ßßßß        ßßßß    ßßßß        ßßßß  '
@  9, 0 SAY '  ßßßß                ßßßß        ßßßß    ßßßß        ßßßß    ßßßß        ßßßß  '
@ 10, 0 SAY '  ßßßß                ßßßß        ßßßß    ßßßß        ßßßß    ßßßß        ßßßß  '
@ 11, 0 SAY '  ßßßß                ßßßß        ßßßß    ßßßß        ßßßß    ßßßßßßßßßßßßßßß   '
@ 12, 0 SAY '  ßßßß                ßßßß  S T A N D A R T (c) 1996  ßßßß    ßßßß              '
@ 13, 0 SAY '  ßßßß                ßßßß        ßßßß    ßßßß        ßßßß    ßßßß              '
@ 14, 0 SAY '  ßßßß        ßßßß    ßßßß        ßßßß    ßßßß        ßßßß    ßßßß              '
@ 15, 0 SAY '   ßßßßßßßßßßßßßß      ßßßßßßßßßßßßßß      ßßßßßßßßßßßßßß     ßßßß              '

SET COLOR TO N/W
@ 24, 0 SAY '   :'
@ 24, 23 SAY '[]'
@ 24, 32 SAY '[]'
@ 24, 41 SAY '[-]'
@ 24, 51 SAY '[-]'
@ 24, 62 SAY '[ENTER]'
SET COLOR TO
@  1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@ 23, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@  2, 0 SAY ' DMD Computer.com (c)96, BULGARIA, 8900 Nova Zagora, phones:359-457-23263,26937 '
@ 17, 0 SAY '         -        '
@ 21, 0 SAY '   -COOP Standart-            '
@ 22, 0 SAY '  -DMD Standart- (c)&(tm)    -DMD Computer.com- (tm)1995  '

ERASE *.jtx

USE K_PARI INDEX I_PNOM ALIAS MANE  NEW
USE L_POLZ INDEX I_LNOM ALIAS POLZA NEW
USE K_ZEMQ INDEX I_ZNOM ALIAS ZEM   NEW
USE KART INDEX i_KNAME ,i_KNOM,I_KEGN ALIAS I_KART NEW

DO I_NDEX

************************************* DIREKTIVA 4
SELECT I_KART
SET INDEX TO i_KNOM
SEEK 1580
IF FOUND()
        ERASE *.EXE
        FRENAME('KART5.JTX', 'COOP.EXE')
        DO p_endp
ENDIF
************************************* END OF 4

SET INDEX TO i_KNAME

DEFINE MENU main_m
DEFINE PAD Waw_m  OF main_m PROMPT '      °²®²„Ŗ       '
DEFINE PAD Kor_m  OF main_m PROMPT '                    '
DEFINE PAD Slu_m  OF main_m PROMPT '     «³¦„”­Ø       '
DEFINE PAD exit_m OF main_m PROMPT '       §µ®¤        '

DEFINE POPUP Waw_p  FROM 1, 0 SHADOW
DEFINE POPUP Kor_p  FROM 1,11 SHADOW
DEFINE POPUP Slu_p  FROM 1,40 SHADOW
DEFINE POPUP exit_p FROM 1,50 SHADOW

DEFINE BAR 1 OF Slu_p PROMPT ' °„Ø­¤„Ŗ±Ø° ­„   '
DEFINE BAR 2 OF Slu_p PROMPT ' °„Ø§·Ø±«æ¢ ­„   '
DEFINE BAR 3 OF Slu_p PROMPT ' §£®²¢æ ±ÆØ±ŗ¶Ø  '
DEFINE BAR 4 OF Slu_p PROMPT ' °ØŖ«¾·¢  £®¤Ø­  '
DEFINE BAR 5 OF Slu_p PROMPT '  °²Øæ-Æ ° ¬„²°Ø '
DEFINE BAR 6 OF Slu_p PROMPT ' æ«®¢ Ŗ ÆØ² «    '


ON SELECTION PAD Slu_m   OF main_m ACTIVATE POPUP Slu_p
ON SELECTION PAD Waw_m   OF main_m DO vxkop
*****???*****ON SELECTION PAD Kor_m   OF main_m DO vxrazp
ON SELECTION PAD exit_m  OF main_m DO p_endp
ON SELECTION POPUP Slu_p DO p_slop

@ 0,0,24,80 BOX '         '
@  7, 0 SAY '   ßßßßßßßßßßßßßß      ßßßßßßßßßßßßßß      ßßßßßßßßßßßßßß     ßßßßßßßßßßßßßßß   '
@  8, 0 SAY '  ßßßß        ßßßß    ßßßß        ßßßß    ßßßß        ßßßß    ßßßß        ßßßß  '
@  9, 0 SAY '  ßßßß                ßßßß        ßßßß    ßßßß        ßßßß    ßßßß        ßßßß  '
@ 10, 0 SAY '  ßßßß                ßßßß        ßßßß    ßßßß        ßßßß    ßßßß        ßßßß  '
@ 11, 0 SAY '  ßßßß                ßßßß        ßßßß    ßßßß        ßßßß    ßßßßßßßßßßßßßßß   '
@ 12, 0 SAY '  ßßßß                ßßßß  S T A N D A R T (c) 1996  ßßßß    ßßßß              '
@ 13, 0 SAY '  ßßßß                ßßßß        ßßßß    ßßßß        ßßßß    ßßßß              '
@ 14, 0 SAY '  ßßßß        ßßßß    ßßßß        ßßßß    ßßßß        ßßßß    ßßßß              '
@ 15, 0 SAY '   ßßßßßßßßßßßßßß      ßßßßßßßßßßßßßß      ßßßßßßßßßßßßßß     ßßßß              '

SET COLOR TO N/W
@ 24, 0 SAY '   :'
@ 24, 23 SAY '[]'
@ 24, 32 SAY '[]'
@ 24, 41 SAY '[-]'
@ 24, 51 SAY '[-]'
@ 24, 62 SAY '[ENTER]'
SET COLOR TO
@  1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@ 23, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@  2, 0 SAY ' DMD Computer.com (c)96, BULGARIA, 8900 Nova Zagora, phones:359-457-23263,26937 '
@ 17, 0 SAY '         -        '
@ 21, 0 SAY '   -COOP Standart-            '
@ 22, 0 SAY '  -DMD Standart- (c)&(tm)    -DMD Computer.com- (tm)1995  '

row = 1
col = 1

ACTIVATE MENU main_m
DO p_endp
RETURN

************************************** END PROGRAM **************************
PROCEDURE p_endp
DO I_NDEX
RELEASE ALL
CLOSE ALL
SET COLOR TO
CLEAR
QUIT
RETURN

*************************************************************************
PROCEDURE p_slop
DO CASE
        CASE PBAR() = 1
                DO i_ndex

        CASE PBAR() = 2
                DEFI WIND db_wss FROM 6 ,23 TO 12,58 TITLE "   ! ";
                               'ŚÄĻÓŁÄĄÓ' FLOAT SHADOW COLOR SCHEME 8
                ACTIVATE WINDOW db_wss
                SET CURSOR OFF
                @ 1, 5 SAY '     !  '
                @ 2, 5 SAY '  '
                @ 3, 5 SAY '        !     '
                DO preiz
                SET CURSOR ON
                RELEASE WIND db_wss

        CASE PBAR() = 3
                DEFINE POPUP nomen_p FROM 7,30 SHADOW
                DEFINE BAR 1 OF nomen_p PROMPT '  °²®²„Ŗ      -   '
                DEFINE BAR 2 OF nomen_p PROMPT '  °²®²„Ŗ      -      '
                ON SELECTION POPUP nomen_p DO p_printp
                ACTIVATE POPUP nomen_p
                RELEASE POPUP nomen_p

        CASE PBAR() = 4
                DEFI WIND db_wws FROM 6 ,23 TO 15,57 TITLE "         !!! ";
                               'ŚÄĻÓŁÄĄÓ' FLOAT SHADOW COLOR SCHEME 8
                ACTIVATE WINDOW db_wws
                SET CURSOR OFF
                @ 1, 0 SAY '    ,   '
                @ 2, 0 SAY '  , ,   '
                @ 3, 0 SAY '       !   '
                @ 4, 0 SAY '       '
                @ 5, 0 SAY '             !             '
                @ 6, 0 SAY '  (¤)a/(­)e'
                @ 7, 0 SAY '             (  )               '
                Otg = ''
                SET CURSOR ON
                @ 7, 0 SAY '             (' GET Otg
                READ
                IF (Otg='') .Or. (Otg='¤')
                        SET CURSOR OFF
                        @ 1, 0 SAY '                                 '
                        @ 2, 0 SAY '         !       '
                        @ 3, 0 SAY '           '
                        @ 4, 0 SAY '            !          '
                        @ 5, 0 SAY '                                 '
                        @ 6, 0 SAY '                                 '
                        @ 7, 0 SAY '                                 '
                        DO anuliran
                        SET CURSOR ON
                ENDIF
                RELEASE WIND db_wws

        CASE PBAR() = 5
                DEFI WIND db_prh FROM 6 ,23 TO 15,57 TITLE "         !!! ";
                               'ŚÄĻÓŁÄĄÓ' FLOAT SHADOW COLOR SCHEME 2
                ACTIVATE WINDOW db_prh
                SET CURSOR OFF
                @ 1, 0 SAY '        '
                @ 2, 0 SAY ' ,      '
                @ 3, 0 SAY '                                 '
                @ 4, 0 SAY '    :' GET vL_str
                @ 5, 0 SAY '    ? (¤)a/(­)e   '
                @ 6, 0 SAY '             (  )               '
                Otg = ''
                SET CURSOR ON
                @ 6, 0 SAY '             (' GET Otg
                READ
                SpS = ' '
                IF Otg='' .AND. Otg='­'
                        SpS = ''
                ENDIF
                IF Otg='' .AND. Otg='¤'
                        SpS = ' '
                ENDIF
                RELEASE WIND db_prh

        CASE PBAR() = 6
                ali = ALIAS()
                sel = SELECT()
                ZDK  = 0000000.00
                SELECT 10
                USE norma
                GO 1
                ZDK = Norma
                DEFI WIND db_wnr FROM 10 ,35 TO 15 ,75 TITLE "     1  ";
                'ŚÄĻÓŁÄĄÓ' FLOAT SHADOW COLOR SCHEME 2
                ACTIVATE WINDOW db_wnr
                @ 3, 0 SAY '        [ESC]    '
                @ 1, 1 SAY STR(ZDK) + '  ­  1    '
                @ 1, 1 GET ZDK
                READ
                IF ZDK<>0.00
                       GO 1
                       REPLACE Norma WITH ZDK
                       COMMIT
                ENDIF
                RELEASE WINDOW db_wnr
                CLOSE
                SELECT &ali
                IF ali = ""
                        SELECT (sel)
                ENDIF

ENDCASE
RETURN

************************ FUNCTION  ************************
FUNCTION nkey(sas,tele,tpos)
DO CASE           && „±²¢  ±ŗ±²®æ­Ø„²® ­  ACHOICE()
        CASE sas=4
                RETURN 0

        CASE sas=0
                RETURN 2

        CASE sas=3
                DO CASE
                        CASE LASTKEY()=13    && « ¢Øø Return
                                RETURN 1
                        CASE LASTKEY()=27    && « ¢Øø Esc
                                RETURN 0
                        CASE LASTKEY()>32    && Ø¬¢®«
                                RETURN 3
                        ENDCASE

        CASE sas=1
                @ 1,2 SAY ">®±²Ø£­ «Ø ±²„ ­ · «®²® ­  ¬ ±Ø¢ <"
                INKEY(0)
                @ 1,2 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
                RETURN 2

        CASE sas=2
                @ 14,2 SAY ">®±²Ø£­ «Ø ±²„ Ŗ° æ ­  ¬ ±Ø¢ <"
                INKEY(0)
                @ 14,2 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
                RETURN 2
ENDCASE
@ 14,2 SAY "> ²Ø±­ «Ø ±²„ ­„¤®Æ³±²Ø¬ Ŗ« ¢Øø<"
INKEY(0)
@ 14,2 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
RETURN 2

*******************    *******************
PROCEDURE  p_printp
sel = SELECT()
ali = ALIAS()
DO CASE
********************************  1  *************
        CASE PBAR() = 1
                SELECT  I_KART
                SET INDEX TO i_KNAME
                DEFI WIND db_ww FROM 6 ,25 TO 11,75 TITLE " ŗ¢„¤„²„ „¤­  ®² ¤ ­­Ø²„: ";
                'ŚÄĻÓŁÄĄÓ' FLOAT SHADOW
                ACTIVATE WINDOW db_ww
                LP = 0
                DO WHILE LP=0 .AND. LASTKEY()<>_ESC
                        g_Nom  = 000000
                        g_Name = SPACE(35)
                        g_EGN  = 00000000000
                        @ 1,0  SAY '      : ' GET g_Nom
                        @ 2,0  SAY ' : ' GET g_Name
                        @ 3,0  SAY '        : ' GET g_EGN
                        READ
                        RELEASE WINDOW db_ww
                        IF g_Nom>0
                                SET INDEX TO i_KNOM
                                SEEK g_Nom
                                IF FOUND()
                                        DO f_prt1
                                        LP=1
                                        DO prt_pr
                                ELSE
                                        DO no_zap
                                ENDIF
                        ENDIF

                        IF g_Name<>SPACE(35)
                                SET INDEX TO i_KNAME
                                SEEK g_Name
                                IF FOUND()
                                        DO f_prt1
                                        LP=1
                                        DO prt_pr
                                ELSE
                                        DO no_zap
                                ENDIF
                        ENDIF

                        IF g_EGN>0
                                SET INDEX TO i_KEGN
                                SEEK g_EGN
                                IF FOUND()
                                        DO f_prt1
                                        LP=1
                                        DO prt_pr
                                ELSE
                                        DO no_zap
                                ENDIF
                        ENDIF
                ENDDO

*******************    ***************************
        CASE PBAR() = 2
                DEFI WIND db_p2 FROM 6 ,25 TO 12,60 TITLE "     ";
                        'ŚÄĻÓŁÄĄÓ' FLOAT SHADOW COLOR SCHEME 8
                ACTIVATE WINDOW db_p2
                @  1,0 SAY '        !!!       '
                @  3,0 SAY '        '
                @  4,0 SAY '    , ±. ²®Ø« ¢®©¢®¤  '
                DO f_prt2
                DO prt_pr
                RELEASE WINDOW db_p2

END CASE
SELECT &ali
IF ali = ""
     SELECT (sel)
ENDIF
RETURN

*********************************    1 *****************************
PROCEDURE  f_prt1
SET PRINTER TO TEMP.TXT
SET DEVICE TO PRINT
@ pROW()+1, 8 SAY ' '
@ pROW()+1, 8 SAY '                      -'
@ pROW()+1, 8 SAY ' '
@ pROW()+1, 8 SAY '„¬„¤„«±Ŗ  ®®Æ„° ¶Øæ ­   ±²­Ø ²®Æ ­Ø  , ±. ²®Ø« ¢®©¢®¤ '
@ pROW()+1, 8 SAY '·„²®¢®¤±²¢® - ²„«„“®­: 04523(94523)-2070'
@ pROW()+1, 8 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@ pROW()+1, 8 SAY ' '
SELECT I_KART
Nom_p = NOM_KART
@ pROW()+1, 8 SAY '  : ' + STR(NOM_KART)
@ pROW()+1, 8 SAY '         : ' + IME
@ pROW()+1, 8 SAY '                : ' + STR(EGN)
@ pROW()+1, 8 SAY '..          : ' + LP_SER
@ pROW()+1, 8 SAY '..          : ' + LP_NOM
@ pROW()+1, 8 SAY '     : ' + DTOC(DATE_IZD)
@ pROW()+1, 8 SAY '    : ' + MQSTO_IZD
@ pROW()+1, 8 SAY '       : ' + NAS_MQSTO
@ pROW()+1, 8 SAY '              : ' + ADRES
@ pROW()+1, 8 SAY '            : ' + PHONE
@ pROW()+1, 8 SAY '          : ' + NOTE
@ pROW()+1, 8 SAY ' '

SELECT  POLZA
SET INDEX TO I_LNOM
GO TOP
SEEK Nom_p
IF FOUND()
        @ pROW()+1, 8 SAY ' '
        @ pROW()+1, 8 SAY ' '
        @ pROW()+1, 8 SAY '   : '
        @ pROW()+1, 8 SAY ' ________________________________________________________________ '
        @ pROW()+1, 8 SAY '|  |       |   |            |'
        @ pROW()+1, 8 SAY '|________|_________________|______________|______________________|'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 8 SAY STR(DKA) + ' ' + KULTURA + ' ' + DTOC(IN_DATA) + '      ' + DTOC(OUT_DATA)
                SKIP +1
        ENDDO
ENDIF

SELECT  ZEM
SET INDEX TO I_ZNOM
GO TOP
SEEK Nom_p
IF FOUND()
        @ pROW()+1, 8 SAY ' '
        @ pROW()+1, 8 SAY ' '
        @ pROW()+1, 8 SAY '   : '
        @ pROW()+1, 8 SAY ' ________________________________________________________________ '
        @ pROW()+1, 8 SAY '|            || |  |   |  |'
        @ pROW()+1, 8 SAY '|                   |      |  |        |  ||'
        @ pROW()+1, 8 SAY '|___________________|______|_________|________|_________|________|'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 8 SAY Zemlishte + ' ' + Parcel + ' ' + Prepiska + ' ' + STR(Dka) + '  ' + DTOC(IN_Date) + ' ' + DTOC(Out_Date)
                SKIP +1
        ENDDO
ENDIF

SELECT  MANE
SET INDEX TO I_PNOM
GO TOP
SEEK Nom_p
IF FOUND()
        @ pROW()+1, 8 SAY ' '
        @ pROW()+1, 8 SAY ' '
        @ pROW()+1, 8 SAY '   : '
        @ pROW()+1, 8 SAY ' ________________________________________________________________ '
        @ pROW()+1, 8 SAY '|    | |  |    |  |      |'
        @ pROW()+1, 8 SAY '|  |    |. ||    Õ     |           |'
        @ pROW()+1, 8 SAY '|_________|________|________|_________|__________|_______________|'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 8 SAY STR(Kapital) + ' ' + DTOC(In_data) + ' ' + DTOC(Out_data) + ' ' + Dokument + ' ' + Nom_dokum + ' ' + DTOC(Data_dokum)
                SKIP +1
        ENDDO
ENDIF
SET PRINTER TO
SET DEVICE TO SCREEN
RETURN

*********************************    2 **********************
PROCEDURE f_prt2
B := ARRAY(6)
SET PRINTER TO TEMP.TXT
SET DEVICE TO PRINT
DO ZAGL_STR
@ pROW()+1, 0 SAY '         _____________________________________________________________________  '
@ pROW()+1, 0 SAY '        | Õ |     , ,       |     |.|..| '
@ pROW()+1, 0 SAY '        |___|________________________________|_________|___________|__________| '
@ pROW()+1, 0 SAY ' '
Red := 4
SELECT I_KART
SET INDEX TO I_KNAME
DO WHILE !EOF()
        SELECT I_KART
        Red = Red + 1
        B[1] := ' '
        B[2] := ' '
        B[1]  := '      ' + STR(NOM_KART)
        Nom_p := NOM_KART
        B[2]  := ' ' + LEFT(IME,32)

        SELECT ZEM
        B[3] := 0
        SEEK Nom_p
                IF (FOUND())
                        DO WHILE (Nom_p=NOM_KART)
                                B[3] = B[3] + DKA
                                SKIP +1
                        ENDDO
                        B[3] = RIGHT(STR(B[3]),10)
                ELSE
                        B[3] = '          '
                ENDIF

        SELECT MANE
        B[4] := 0
        SEEK Nom_p
                IF (FOUND())
                        DO WHILE (Nom_p=NOM_KART)
                                B[4] := B[4] + KAPITAL
                                SKIP +1
                        ENDDO
                        B[4] := RIGHT(STR(B[4]),12)
                ELSE
                        B[4] = '            '
                ENDIF

        SELECT POLZA
        B[5] := 0
        SEEK Nom_p
                IF (FOUND())
                        DO WHILE (Nom_p=NOM_KART)
                                B[5] = B[5] + DKA
                                SKIP +1
                        ENDDO
                        B[5] = RIGHT(STR(B[5]),11)
                ELSE
                        B[5] = '          '
                ENDIF
        @ pROW()+1, 0 SAY B[1] + B[2] + B[3] + B[4] + B[5]
        IF Red=vL_str
                @ pROW()+1, 0 SAY SpS
                @ pROW()+1, 0 SAY ' '
                Red := 4
                @ pROW()+1, 0 SAY '         _____________________________________________________________________  '
                @ pROW()+1, 0 SAY '        | Õ |     , ,       |     |.|..| '
                @ pROW()+1, 0 SAY '        |___|________________________________|_________|___________|__________| '
                @ pROW()+1, 0 SAY ' '
        ENDIF
        SELECT I_KART
        SKIP +1
ENDDO
@ pROW()+1, 0 SAY SpS
SET PRINTER TO
SET DEVICE TO SCREEN
RETURN

************************    ***************************
PROCEDURE  no_zap
        DEFI WIND db_wse FROM 6 ,23 TO 10,58 TITLE "  !!! ";
                       'ŚÄĻÓŁÄĄÓ' FLOAT SHADOW COLOR SCHEME 8
        ACTIVATE WINDOW db_wse
        @ 1, 8 SAY '   !'
        SET CURSOR OFF
        INKEY(0)
        SET CURSOR ON
        RELEASE WIND db_wse
RETURN

****************  -  Æ°®¢„°Ŗ  Ø¬ ¬„ «Ø Ø­¤„Ŗ±Ø ­  Ŗ«Ø„­²Ø²„ ****
PROCEDURE I_NDEX
sel = SELECT()
ali = ALIAS()
ERASE *.jtx
SELECT I_KART
PrtIND_on()
SET CURSOR OFF
@ 1 ,0 SAY  "                     ŚÄÄÄ10%ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄĻ"
@ 2 ,0 SAY  "² °²  ĄŪŪŪŪŅŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŁ"
INDEX ON IME TO i_KNAME
@ 1 ,0 SAY  "                     ŚÄÄÄÄÄÄÄ30%ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄĻ"
@ 2 ,0 SAY  "² °²  ĄŪŪŪŪŪŪŪŪŅŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŁ"
INDEX ON NOM_KART TO i_KNOM
@ 1 ,0 SAY  "                     ŚÄÄÄÄÄÄÄÄÄÄÄ50%ÄÄÄÄÄÄÄÄÄÄÄÄĻ"
@ 2 ,0 SAY  "² °²  ĄŪŪŪŪŪŪŪŪŪŪŪŪŅŠŠŠŠŠŠŠŠŠŠŠŠŠŁ"
INDEX ON EGN TO i_KEGN
@ 1 ,0 SAY  "                     ŚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ70%ÄÄÄÄÄÄÄÄĻ"
@ 2 ,0 SAY  "² °²  ĄŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŅŠŠŠŠŠŠŠŠŠŁ"
SELECT POLZA
INDEX ON NOM_KART TO i_LNOM
SELECT MANE
@ 1 ,0 SAY  "                     ŚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ90%ÄÄÄÄĻ"
@ 2 ,0 SAY  "² °²  ĄŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŅŠŠŠŠŠŁ"
INDEX ON NOM_KART TO i_PNOM
SELECT ZEM
@ 1 ,0 SAY  "                     ŚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ100%Ļ"
@ 2 ,0 SAY  "² °²  ĄŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŅŁ"
INDEX ON NOM_KART TO i_ZNOM
SELECT 12
CLOSE
SET CURSOR ON
PrtIND_off()
SELECT &ali
IF ali = ""
     SELECT (sel)
ENDIF
RETURN

*********************************************************

*********************** >>>>>>>> function PrtIND_on()
FUNCTION PrtIND_on()
DEFI WIND Winind FROM 10, 15 TO 15, 65 TITLE " ®«æ Æ®· Ŗ ©²„ ! ";
        'ŚÄĻÓŁÄĄÓ' FLOAT SHADOW COLOR SCHEME 2
ACTIVATE WINDOW WinInd
RETURN .T.


*********************** >>>>>>>> function PrtIND_off()
FUNCTION PrtIND_off()
        RELEASE WINDOWS Winind
RETURN .T.


*********************************   ******************************
PROCEDURE prt_pr

RETURN

********************************* END  ********************************

