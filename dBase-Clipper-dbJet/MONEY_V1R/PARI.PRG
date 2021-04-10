*************************************************************************
*               DMD Computer.com (c) 1997 MJJ, PETAR, DPP, DSG          *
*               dmd-computer.com@bulmail.gocis.bg                       *
*************************************************************************

*************************************************************************
*                                                                       *
*                      Žƒ€Œ€ ‡€ Ž’—…’ € ‡€…Œˆ                       *
*                                                                       *
*************************************************************************

*************************** START OF PROGRAMM ***************************

*************************** EXTERNAL PROC & FUNC ************************
#INCLUDE 'inkey.hd'
DO PARI2
DO ELI
DO INTRODMD
*************************** END EXTERNAL ********************************

*************************** START UP ************************************
SET CACHE OFF
CLEAR ALL
CLOSE DATABASE
SET DATE GERMAN
SET MOUSE ON
SET MOUSE STYLE OFF
Logp := 0

@ 0,0,24,80 BOX '         '

@  7, 0 SAY '    ßßßßßßßßßßßßßßß            ßßßßßßßßß    ßßßßßßßßßßßßßßß        ßßßßßßßß     '
@  8, 0 SAY '    ßßßß        ßßßß         ßßßß   ßßßß    ßßßß        ßßßß         ßßßß       '
@  9, 0 SAY '    ßßßß        ßßßß        ßßßß    ßßßß    ßßßß        ßßßß         ßßßß       '
@ 10, 0 SAY '    ßßßß        ßßßß       ßßßß     ßßßß    ßßßß        ßßßß         ßßßß       '
@ 11, 0 SAY '    ßßßßßßßßßßßßßßß       ßßßß      ßßßß    ßßßßßßßßßßßßßßß          ßßßß       '
@ 12, 0 SAY '    ßßßß                 ßßßßßßßßßßßßßßß    ßßßß     ßßßß            ßßßß       '
@ 13, 0 SAY '    ßßßß                ßßßß        ßßßß    ßßßß      ßßßß           ßßßß       '
@ 14, 0 SAY '    ßßßß               ßßßß         ßßßß    ßßßß S T A N D A R T(c)1997 ß       '
@ 15, 0 SAY '    ßßßß              ßßßß          ßßßß    ßßßß        ßßßß       ßßßßßßßß     '
SET COLOR TO N/W
@ 24, 0 SAY ' „‚ˆ†…ˆ… € Š“‘Ž€:'
@ 24, 23 SAY '[]ƒŽ…'
@ 24, 32 SAY '[]„Ž‹“'
@ 24, 41 SAY '[-]‹Ÿ‚Ž'
@ 24, 51 SAY '[-]„Ÿ‘Ž'
@ 24, 62 SAY '[ENTER]Ž’‚š†„€‚€'
SET COLOR TO
@  1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@ 23, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@  2, 0 SAY ' DMD Computer.com (c)97, BULGARIA, 8900 Nova Zagora, phones:359-457-23263,26937 '
@ 17, 0 SAY '                  Žƒ€Œ€ ‡€ Ž‘‹“†‚€… ‡€…Œˆ € —€‘’ˆ ‹ˆ–€                   '
@ 20, 0 SAY '   -PARI Standart- ’Ž‚€ … …„ˆ Ž’ ŒŽ„“‹ˆ’… € ‘—…’Ž‚Ž„Ž Žˆ…’ˆ€ˆŸ Ž„“Š’   '
@ 21, 0 SAY '  -DMD Standart- (c)&(tm) € ŠŽŒž’šŽ Ž…„ˆ…ˆ… -DMD Computer.com- (tm)1995  '
@ 22, 0 SAY '                   e-mail: dmd-computer.com@bulmail.gocis.bg                    '

PUBLIC SpS
SpS := ''
vL_str := 55

DO I_NDEX

********************************** END START UP **************************


********************************** DIREKTIVA 4 ***************************
SELECT I_KART
SET INDEX TO I_KNOM
SEEK 1600
IF FOUND()
        SET COLOR TO
        FERASE('paridmd.zip')
        !PKZIP paridmd -sdmdpari
        ERASE COOP.EXE
        FRENAME('KART5.JTX', 'COOP.EXE')
        QUIT
ENDIF
*********************************** END OF 4 *****************************

*********************************** MENU *********************************
SET INDEX TO I_KNAME
DEFINE MENU main_m
DEFINE PAD Waw_m  OF main_m PROMPT '     Š °²®²¥ª       '
DEFINE PAD Kor_m  OF main_m PROMPT '                    '
DEFINE PAD Slu_m  OF main_m PROMPT '      ‘«³¦¥¡­¨      '
DEFINE PAD exit_m OF main_m PROMPT '       ˆ§µ®¤        '

DEFINE POPUP Waw_p  FROM 1, 0 SHADOW
DEFINE POPUP Kor_p  FROM 1,11 SHADOW
DEFINE POPUP Slu_p  FROM 1,40 SHADOW
DEFINE POPUP exit_p FROM 1,50 SHADOW

DEFINE BAR 1 OF Slu_p PROMPT ' °¥¨§·¨±«¿¢ ­¥   '
DEFINE BAR 2 OF Slu_p PROMPT ' ˆ§£®²¢¿ ±¯° ¢ª¨  '
DEFINE BAR 3 OF Slu_p PROMPT ' • °²¨¿-¯ ° ¬¥²°¨ '

ON SELECTION PAD Slu_m   OF main_m ACTIVATE POPUP Slu_p
ON SELECTION PAD Waw_m   OF main_m DO vxkop
ON SELECTION PAD exit_m  OF main_m DO p_endp
ON SELECTION POPUP Slu_p DO p_slop

@ 0,0,24,80 BOX '         '

@  7, 0 SAY '    ßßßßßßßßßßßßßßß            ßßßßßßßßß    ßßßßßßßßßßßßßßß        ßßßßßßßß     '
@  8, 0 SAY '    ßßßß        ßßßß         ßßßß   ßßßß    ßßßß        ßßßß         ßßßß       '
@  9, 0 SAY '    ßßßß        ßßßß        ßßßß    ßßßß    ßßßß        ßßßß         ßßßß       '
@ 10, 0 SAY '    ßßßß        ßßßß       ßßßß     ßßßß    ßßßß        ßßßß         ßßßß       '
@ 11, 0 SAY '    ßßßßßßßßßßßßßßß       ßßßß      ßßßß    ßßßßßßßßßßßßßßß          ßßßß       '
@ 12, 0 SAY '    ßßßß                 ßßßßßßßßßßßßßßß    ßßßß     ßßßß            ßßßß       '
@ 13, 0 SAY '    ßßßß                ßßßß        ßßßß    ßßßß      ßßßß           ßßßß       '
@ 14, 0 SAY '    ßßßß               ßßßß         ßßßß    ßßßß S T A N D A R T(c)1997 ß       '
@ 15, 0 SAY '    ßßßß              ßßßß          ßßßß    ßßßß        ßßßß       ßßßßßßßß     '

SET COLOR TO N/W
@ 24, 0 SAY ' „‚ˆ†…ˆ… € Š“‘Ž€:'
@ 24, 23 SAY '[]ƒŽ…'
@ 24, 32 SAY '[]„Ž‹“'
@ 24, 41 SAY '[-]‹Ÿ‚Ž'
@ 24, 51 SAY '[-]„Ÿ‘Ž'
@ 24, 62 SAY '[ENTER]Ž’‚š†„€‚€'
SET COLOR TO
@  1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@ 23, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@  2, 0 SAY ' DMD Computer.com (c)97, BULGARIA, 8900 Nova Zagora, phones:359-457-23263,26937 '
@ 17, 0 SAY '                  Žƒ€Œ€ ‡€ Ž‘‹“†‚€… ‡€…Œˆ € —€‘’ˆ ‹ˆ–€                   '

@ 20, 0 SAY '   -PARI Standart- ’Ž‚€ … …„ˆ Ž’ ŒŽ„“‹ˆ’… € ‘—…’Ž‚Ž„Ž Žˆ…’ˆ€ˆŸ Ž„“Š’   '
@ 21, 0 SAY '  -DMD Standart- (c)&(tm) € ŠŽŒž’šŽ Ž…„ˆ…ˆ… -DMD Computer.com- (tm)1995  '
@ 22, 0 SAY '                   e-mail: dmd-computer.com@bulmail.gocis.bg                    '

row = 1
col = 1

ACTIVATE MENU main_m
RELEASE ALL
CLOSE ALL
SET COLOR TO
CLEAR
RETURN
*********************************** END OF MENU **************************

*********************************** PROC END PROGRAM *********************
PROCEDURE p_endp

RELEASE ALL
CLOSE ALL
SET COLOR TO
CLEAR
QUIT

RETURN
******************************** END OR PROGRAM **************************

******************************** PROC P_SLOP *****************************
PROCEDURE p_slop

DO CASE
        CASE PBAR() = 1
                DO preiz

        CASE PBAR() = 2
                DEFINE POPUP nomen_p FROM 4,30 SHADOW
                DEFINE BAR 1 OF nomen_p PROMPT ' Ž¡¹  ±¯° ¢ª  - …„ˆ ‡€…ŒŽŽ‹“—€’…‹  '
                DEFINE BAR 2 OF nomen_p PROMPT ' Ž¡¹ ±¯¨±ºª - ‚‘ˆ—Šˆ ‡€…ŒŽŽ‹“—€’…‹ˆ '
                DEFINE BAR 3 OF nomen_p PROMPT ' Ž¡¹ ±¯¨±ºª - Ž‘Ž—…ˆ ‡€…Œˆ       '
                ON SELECTION POPUP nomen_p DO p_printp
                ACTIVATE POPUP nomen_p
                RELEASE POPUP nomen_p

        CASE PBAR() = 3
                DEFI WIND db_prh FROM 6 ,23 TO 15,57 TITLE " ‚  ˆ Œ €  ˆ … !!! ";
                               'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 2
                ACTIVATE WINDOW db_prh
                SET CURSOR OFF
                @ 1, 0 SAY '  ’“Š ‘… ˆ‡ˆ€’ €€Œ…’ˆ’… €  '
                @ 2, 0 SAY ' •€’ˆŸ’€, € ŠŽŸ’Ž ™… …—€’€’…  '
                @ 3, 0 SAY '                                 '
                @ 4, 0 SAY ' Ž‰ …„Ž‚… € ‹ˆ‘’€:' GET vL_str
                @ 5, 0 SAY ' …‡ŠŽ…—€ ‹ˆ … ? „(¤)a/(­)e   '
                @ 6, 0 SAY '             (  )               '
                Otg = ''
                SET CURSOR ON
                @ 6, 0 SAY '             (' GET Otg
                READ

                SpS = ' '
                IF Otg='' .AND. Otg='­'
                        SpS = ''
                ENDIF

                IF Otg='„' .AND. Otg='¤'
                        SpS = ' '
                ENDIF

                RELEASE WIND db_prh

ENDCASE

RETURN
************************** END OF PROC ********************************

************************** …—€’€… € ‘€‚Šˆ ************************
PROCEDURE  p_printp

sel = SELECT()
ali = ALIAS()

DO CASE
        ******************************** ‡€ 1 ****************************
        CASE PBAR() = 1
                SELECT I_KART
                SET INDEX TO I_KNAME

                DEFI WIND db_ww FROM 6 ,25 TO 11,75 TITLE " ‚º¢¥¤¥²¥ ¥¤­  ®² ¤ ­­¨²¥: ";
                        'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW
                ACTIVATE WINDOW db_ww
                        LP = 0
                        DO WHILE LP=0 .AND. LASTKEY()<>_ESC
                                ERASE temp.txt
                                g_Nom  = 000000
                                g_Name = SPACE(35)
                                g_EGN  = 00000000000
                                @ 1,0  SAY 'ŽŒ…      : ' GET g_Nom
                                @ 2,0  SAY '’ˆ’… ˆŒ…€: ' GET g_Name
                                @ 3,0  SAY '…ƒ        : ' GET g_EGN
                                READ

                                IF g_Nom>0
                                        SET INDEX TO I_KNOM
                                        SEEK g_Nom
                                        Nom_p = NOM_KART
                                        IF FOUND()
                                                DO f_prt1
                                                LP=1
                                        ELSE
                                                DO no_zap
                                        ENDIF
                                ENDIF

                                IF g_Name<>SPACE(35)
                                        SET INDEX TO I_KNAME
                                        SEEK g_Name
                                        Nom_p = NOM_KART
                                        IF FOUND()
                                                DO f_prt1
                                                LP=1
                                        ELSE
                                                DO no_zap
                                        ENDIF
                                ENDIF

                                IF g_EGN>0
                                        SET INDEX TO i_KEGN
                                        SEEK g_EGN
                                        Nom_p = NOM_KART
                                        IF FOUND()
                                                DO f_prt1
                                                LP=1
                                        ELSE
                                                DO no_zap
                                        ENDIF
                                ENDIF
                        ENDDO
                        DO visual

                RELEASE WINDOW db_ww    && REGLAMENT EXIT 1

        ***************************** ‡€ š‹… ‘ˆ‘šŠ *********************
        CASE PBAR() = 2
                DEFI WIND db_wse FROM 7 ,23 TO 11,58 TITLE " ‘ˆ‘’…ŒŽ ‘šŽ™…ˆ…: ";
                        'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 8
                ACTIVATE WINDOW db_wse
                        @ 1, 9 SAY 'ˆ‡—€Š€‰’… ! ...  '
                        SET CURSOR OFF
                        ERASE temp.txt
                        DO f_prt2
                        DO visual
                        SET CURSOR ON
                RELEASE WIND db_wse

        CASE PBAR() = 3
                DEFI WIND db_wse1 FROM 7 ,23 TO 11,58 TITLE " ‘ˆ‘’…ŒŽ ‘šŽ™…ˆ…: ";
                        'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 8
                ACTIVATE WINDOW db_wse1
                        @ 1, 9 SAY 'ˆ‡—€Š€‰’… ! ...  '
                        SET CURSOR OFF
                        ERASE temp.txt
                        DO f_prt3
                        DO visual
                        SET CURSOR ON
                RELEASE WIND db_wse1


END CASE

SELECT &ali
IF ali = ""
        SELECT (sel)
ENDIF

RETURN
********************************* END OF PROC *****************************


********************************* ”ŽŒ“‹Ÿ ‡€ …—€’ 1 *********************
PROCEDURE  f_prt1

DO preiz
SET PRINTER TO TEMP.TXT
SET DEVICE TO PRINT

@ pROW()+1, 0 SAY 'DMD Computer.com, ph:(+359)0-457-23263'
@ pROW()+1, 0 SAY 'e-mail:dmd-computer.com@bulmail.gocis.bg'
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY '                    ‘€‚Š€ ‡€ ‡€…ŒŽŽ‹“—€’…‹:'
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY '__________________________________________________________________'
@ pROW()+1, 0 SAY ' '
SELECT I_KART
GO Nom_p
@ pROW()+1, 0 SAY 'ŽŒ… ‚ Š€’Ž’…Š€’€: ' + STR(NOM_KART)
@ pROW()+1, 0 SAY '’ˆ’… ˆŒ…€        : ' + IME
@ pROW()+1, 0 SAY '…ƒ                : ' + STR(EGN)
@ pROW()+1, 0 SAY '‹.. ‘…ˆŸ         : ' + LP_SER
@ pROW()+1, 0 SAY '‹.. ŽŒ…         : ' + LP_NOM
@ pROW()+1, 0 SAY '„€’€ € ˆ‡„€‚€…   : ' + DTOC(DATE_IZD)
@ pROW()+1, 0 SAY 'ŒŸ‘’Ž € ˆ‡„€‚€…  : ' + MQSTO_IZD
@ pROW()+1, 0 SAY 'Œ…‘’Ž†ˆ‚………       : ' + NAS_MQSTO
@ pROW()+1, 0 SAY '€„…‘              : ' + ADRES
@ pROW()+1, 0 SAY '’…‹…”Ž            : ' + PHONE
@ pROW()+1, 0 SAY '‡€…‹…†Š€          : ' + NOTE
@ pROW()+1, 0 SAY ' '

SELECT MANE
SET INDEX TO I_PNOM
GO TOP
SEEK Nom_p
IF FOUND()
        @ pROW()+1, 0 SAY ' '
        @ pROW()+1, 0 SAY ' '
        @ pROW()+1, 0 SAY '‘€‚Š€ ‡€ Ž‹“—…ˆ ‡€…Œˆ: '
        @ pROW()+1, 0 SAY ' ________________________________________________________________ '
        @ pROW()+1, 0 SAY '|     ‘“Œ€    |„€’€ € |„€’€ ‡€ |‚ˆ„ €    | „ŽŠ“Œ…’ |ˆ‡„€„… €|'
        @ pROW()+1, 0 SAY '|             |‚‡…Œ€… |‚š™€… |„ŽŠ“Œ…’€ |    Õ     |   „€’€   |'
        @ pROW()+1, 0 SAY '|_____________|________|________|__________|__________|__________|'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 1 SAY STR(Kapital) + ' ' + DTOC(In_data) + ' ' + DTOC(Out_data) + ' ' + Dokument + ' ' + Nom_dokum + '  ' + DTOC(Data_dokum)
                SKIP +1
        ENDDO
ENDIF
SET PRINTER TO
SET DEVICE TO SCREEN

RETURN
************************ END OF PROC **********************************


********************************* ”ŽŒ“‹Ÿ ‡€ …—€’ 2 *********************
PROCEDURE f_prt2

DO preiz
B := ARRAY(6)
SET PRINTER TO TEMP.TXT
SET DEVICE TO PRINT
@ pROW()+1, 0 SAY '  DMD Computer.com, ph:(+359)0-457-23263'
@ pROW()+1, 0 SAY '  e-mail:dmd-computer.com@bulmail.gocis.bg'
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY '                   ‘ˆ‘šŠ € ‹ˆ–€’€ ‘š‘ ‡€…Œˆ                           '
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY '   _______________________________________________________________ '
@ pROW()+1, 0 SAY '  | Õ |     ˆŒ…, …‡ˆŒ…, ”€Œˆ‹ˆŸ      |     ‘“Œ€    |  ’…‹…”Ž   |'
@ pROW()+1, 0 SAY '  |___|________________________________|_____________|____________|'
@ pROW()+1, 0 SAY ' '
Red := 9
SELECT I_KART
SET INDEX TO I_KNAME
DO WHILE !EOF()
        SELECT I_KART
        Red = Red + 1
        B[1] := ' '
        B[2] := ' '
        B[3] := ' '
        B[1] := STR(NOM_KART)
        B[2] := ' ' + LEFT(IME,32)
        B[3] := ' ' + PHONE
        Nom_p := NOM_KART

        SELECT MANE
        B[4] := 0
        SEEK Nom_p
                IF (FOUND())
                        DO WHILE (Nom_p=NOM_KART)
                                B[4] := B[4] + KAPITAL
                                SKIP +1
                        ENDDO
                        B[4] := '    ' + STR(B[4])
                ELSE
                        B[4] = '             '
                ENDIF

        @ pROW()+1, 0 SAY B[1] + B[2] + B[4] + B[3]
        IF Red=vL_str
                @ pROW()+1, 0 SAY SpS
                @ pROW()+1, 0 SAY ' '
                Red := 5
                @ pROW()+1, 0 SAY '   _______________________________________________________________ '
                @ pROW()+1, 0 SAY '  | Õ |     ˆŒ…, …‡ˆŒ…, ”€Œˆ‹ˆŸ      |    ‘“Œ€     |  ’…‹…”Ž   |'
                @ pROW()+1, 0 SAY '  |___|________________________________|_____________|____________|'
                @ pROW()+1, 0 SAY ' '
        ENDIF
        SELECT I_KART
        SKIP +1
ENDDO
@ pROW()+1, 0 SAY SpS
SET PRINTER TO
SET DEVICE TO SCREEN

RETURN
************************ END OF PROC **********************************



********************************* ”ŽŒ“‹Ÿ ‡€ …—€’ 3 *********************
PROCEDURE f_prt3

DO preiz
B := ARRAY(6)
SET PRINTER TO TEMP.TXT
SET DEVICE TO PRINT
@ pROW()+1, 0 SAY '  DMD Computer.com, ph:(+359)0-457-23263'
@ pROW()+1, 0 SAY '  e-mail:dmd-computer.com@bulmail.gocis.bg'
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY '                ‘ˆ‘šŠ € ‹ˆ–€’€ ‘ Ž‘Ž—…ˆ ‡€…Œˆ                '
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY '   _______________________________________________________________ '
@ pROW()+1, 0 SAY '  | Õ |     ˆŒ…, …‡ˆŒ…, ”€Œˆ‹ˆŸ      |     ‘“Œ€    |  ’…‹…”Ž   |'
@ pROW()+1, 0 SAY '  |___|________________________________|_____________|____________|'
@ pROW()+1, 0 SAY ' '
Red := 9
SELECT I_KART
SET INDEX TO I_KNOM
SELECT MANE
GO TOP
DO WHILE !EOF()
        SELECT MANE
        IF DATE()>OUT_DATA
                Nom_p := NOM_KART
                B[4] := 0
                B[4] := KAPITAL
                B[4] := ' ' + STR(B[4])

                SELECT I_KART
                Red = Red + 1
                B[1] := ' '
                B[2] := ' '
                B[3] := ' '
                B[1] := STR(NOM_KART)
                B[2] := ' ' + LEFT(IME,32)
                B[3] := ' ' + PHONE

                @ pROW()+1, 0 SAY B[1] + B[2] + B[4] + B[3]
                IF Red=vL_str
                        @ pROW()+1, 0 SAY SpS
                        @ pROW()+1, 0 SAY ' '
                        Red := 5
                        @ pROW()+1, 0 SAY '   _______________________________________________________________ '
                        @ pROW()+1, 0 SAY '  | Õ |     ˆŒ…, …‡ˆŒ…, ”€Œˆ‹ˆŸ      |    ‘“Œ€     |  ’…‹…”Ž   |'
                        @ pROW()+1, 0 SAY '  |___|________________________________|_____________|____________|'
                        @ pROW()+1, 0 SAY '  '
                ENDIF
        ENDIF
        SELECT MANE
        SKIP +1
ENDDO
@ pROW()+1, 0 SAY SpS
SET PRINTER TO
SET DEVICE TO SCREEN

RETURN
************************ END OF PROC **********************************


************************ ŸŒ€ ’€Šš‚ ‡€ˆ‘ *****************************
PROCEDURE  no_zap

DEFI WIND db_wse3 FROM 6 ,23 TO 10,58 TITLE " ‘ˆ‘’…Œ€ ƒ…˜Š€ !!! ";
        'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 8
ACTIVATE WINDOW db_wse3
        @ 1, 8 SAY 'ŸŒ€ ’€Šš‚ ‡€ˆ‘ !'
        SET CURSOR OFF
        INKEY(0)
        SET CURSOR ON
RELEASE WIND db_wse3

RETURN
************************** END OF PROC *********************************


**************** ˆ„…Š‘ˆ€… - ‘‹…„ ¯°®¢¥°ª  ¨¬ ¬¥ «¨ ¨­¤¥ª±¨ ­  ª«¨¥­²¨²¥ ****
PROCEDURE I_NDEX

sel = SELECT()
ali = ALIAS()
CLOSE DATABASE
ERASE *.jtx

PrtIND_on()

SET CURSOR OFF
@ 1 ,0 SAY  "ÚÄÄÄ10%ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÏ"
@ 2 ,0 SAY  "ÀÛÛÛÛÒÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÙ"
USE KART ALIAS I_KART NEW
INDEX ON IME TO I_KNAME
@ 1 ,0 SAY  "ÚÄÄÄÄÄÄÄ30%ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÏ"
@ 2 ,0 SAY  "ÀÛÛÛÛÛÛÛÛÒÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÙ"
INDEX ON NOM_KART TO I_KNOM
@ 1 ,0 SAY  "ÚÄÄÄÄÄÄÄÄÄÄÄ50%ÄÄÄÄÄÄÄÄÄÄÄÄÏ"
@ 2 ,0 SAY  "ÀÛÛÛÛÛÛÛÛÛÛÛÛÒÐÐÐÐÐÐÐÐÐÐÐÐÐÙ"
INDEX ON EGN TO i_KEGN
@ 1 ,0 SAY  "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ70%ÄÄÄÄÄÄÄÄÏ"
@ 2 ,0 SAY  "ÀÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÒÐÐÐÐÐÐÐÐÐÙ"
USE K_PARI ALIAS MANE NEW
@ 1 ,0 SAY  "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ90%ÄÄÄÄÏ"
@ 2 ,0 SAY  "ÀÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÒÐÐÐÐÐÙ"
INDEX ON NOM_KART TO I_PNOM
@ 1 ,0 SAY  "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ100%Ï"
@ 2 ,0 SAY  "ÀÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÒÙ"

CLOSE DATABASE
USE K_PARI INDEX I_PNOM ALIAS MANE NEW
USE KART INDEX I_KNAME ,I_KNOM,I_KEGN ALIAS I_KART NEW

SET CURSOR OFF
PrtIND_off()
IF ali <> ""
        SELECT(&ali)
        SELECT(sel)
ENDIF

RETURN
*********************** END OF PROC **************************************


*********************** >>>>>>>> function PrtIND_on() ********************
FUNCTION PrtIND_on()

DEFI WIND Winind FROM 10, 26 TO 15, 55 TITLE " …ˆ„…Š‘ˆ€… ";
        'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 2
ACTIVATE WINDOW WinInd

RETURN .T.
************************ END OF FUNC ************************************


*********************** >>>>>>>> function PrtIND_off() ******************
FUNCTION PrtIND_off()
        RELEASE WINDOWS Winind
RETURN .T.
*********************** END OF FUNC *************************************


************************ …ˆ‡—ˆ‘‹Ÿ‚€ ‡€…Œˆ ***************************
PROCEDURE preiz

DEFI WIND db_wss1 FROM  8, 20 TO 14, 55 TITLE " ‘ˆ‘’…ŒŽ ‘šŽ™…ˆ…: ";
        'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 8
ACTIVATE WINDOW db_wss1
        SET CURSOR OFF
        @ 1, 5 SAY '   ˆ‡—€Š€‰’… Ž–…‘€ !  '
        @ 2, 5 SAY '… …Šš‘‚€‰’… ”ˆ‡ˆ—…‘Šˆ'
        @ 3, 5 SAY '      €Ž’€’€ Œˆ !     '

        SELECT I_KART
        SET INDEX TO I_KNOM
        SELECT MANE
        GO TOP
        DO WHILE !EOF()
                SELECT MANE
                IF KAPITAL=0
                        Nom_p := NOM_KART
                        SKIP +1
                        IF !EOF()
                                Logp := 0
                                IF Nom_p=NOM_KART
                                        Logp := 1
                                ELSE
                                        Logp := 0
                                ENDIF
                        ENDIF
                        SKIP -1
                        DELETE
                        IF Logp=0
                                SELECT I_KART
                                SEEK Nom_p
                                DELETE
                        ENDIF
                ENDIF

                SELECT MANE
                SKIP +1
        ENDDO

        SELECT MANE
        PACK
        SELECT I_KART
        PACK
        DO I_NDEX
        SET CURSOR ON
RELEASE WIND db_wss1

RETURN
************************** END OF PROC *********************************


************************** visual PROC *********************************
PROCEDURE visual

IF FILE('temp.txt')
DEFI WIND db_wse4 FROM 3, 5 TO 22, 74 TITLE " …Š€€ ‘€‚Š€ (”€‰‹-…—€’ temp.txt): ";
        'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 2
ACTIVATE WINDOW db_wse4
        SET CURSOR OFF
        MEMOEDIT(MEMOREAD("TEMP.TXT"),0,0,17,67,,"0",80) // " …Š€€ ‘€‚Š€ (”€‰‹-…—€’ temp.txt): "
        SET CURSOR ON
RELEASE WIND db_wse4
ENDIF

RETURN
************************** END OF PROC *********************************
