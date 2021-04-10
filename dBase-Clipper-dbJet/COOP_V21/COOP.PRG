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
@ 24, 0 SAY ' „‚ˆ†…ˆ… € Š“‘Ž€:'
@ 24, 23 SAY '[]ƒŽ…'
@ 24, 32 SAY '[]„Ž‹“'
@ 24, 41 SAY '[-]‹Ÿ‚Ž'
@ 24, 51 SAY '[-]„Ÿ‘Ž'
@ 24, 62 SAY '[ENTER]Ž’‚š†„€‚€'
SET COLOR TO
@  1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@ 23, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@  2, 0 SAY ' DMD Computer.com (c)96, BULGARIA, 8900 Nova Zagora, phones:359-457-23263,26937 '
@ 17, 0 SAY '     Žƒ€Œ€ ‡€ Ž‘‹“†‚€… € —‹…-ŠŽŽ…€’Žˆ’… ‚ ‡…Œ…„…‹‘Šˆ’… ŠŽŽ…€–ˆˆ     '
@ 21, 0 SAY '   -COOP Standart- ’Ž‚€ … …„ˆ Ž’ ŒŽ„“‹ˆ’… € ‘—…’Ž‚Ž„Ž Žˆ…’ˆ€ˆŸ Ž„“Š’   '
@ 22, 0 SAY '  -DMD Standart- (c)&(tm) € ŠŽŒž’šŽ Ž…„ˆ…ˆ… -DMD Computer.com- (tm)1995  '

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
DEFINE PAD Waw_m  OF main_m PROMPT '     Š °²®²¥ª       '
DEFINE PAD Kor_m  OF main_m PROMPT '                    '
DEFINE PAD Slu_m  OF main_m PROMPT '     ‘«³¦¥¡­¨       '
DEFINE PAD exit_m OF main_m PROMPT '       ˆ§µ®¤        '

DEFINE POPUP Waw_p  FROM 1, 0 SHADOW
DEFINE POPUP Kor_p  FROM 1,11 SHADOW
DEFINE POPUP Slu_p  FROM 1,40 SHADOW
DEFINE POPUP exit_p FROM 1,50 SHADOW

DEFINE BAR 1 OF Slu_p PROMPT ' °¥¨­¤¥ª±¨° ­¥   '
DEFINE BAR 2 OF Slu_p PROMPT ' °¥¨§·¨±«¿¢ ­¥   '
DEFINE BAR 3 OF Slu_p PROMPT ' ˆ§£®²¢¿ ±¯¨±º¶¨  '
DEFINE BAR 4 OF Slu_p PROMPT ' °¨ª«¾·¢  £®¤¨­  '
DEFINE BAR 5 OF Slu_p PROMPT ' • °²¨¿-¯ ° ¬¥²°¨ '
DEFINE BAR 6 OF Slu_p PROMPT ' „¿«®¢ ª ¯¨² «    '


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
@ 24, 0 SAY ' „‚ˆ†…ˆ… € Š“‘Ž€:'
@ 24, 23 SAY '[]ƒŽ…'
@ 24, 32 SAY '[]„Ž‹“'
@ 24, 41 SAY '[-]‹Ÿ‚Ž'
@ 24, 51 SAY '[-]„Ÿ‘Ž'
@ 24, 62 SAY '[ENTER]Ž’‚š†„€‚€'
SET COLOR TO
@  1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@ 23, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@  2, 0 SAY ' DMD Computer.com (c)96, BULGARIA, 8900 Nova Zagora, phones:359-457-23263,26937 '
@ 17, 0 SAY '     Žƒ€Œ€ ‡€ Ž‘‹“†‚€… € —‹…-ŠŽŽ…€’Žˆ’… ‚ ‡…Œ…„…‹‘Šˆ’… ŠŽŽ…€–ˆˆ     '
@ 21, 0 SAY '   -COOP Standart- ’Ž‚€ … …„ˆ Ž’ ŒŽ„“‹ˆ’… € ‘—…’Ž‚Ž„Ž Žˆ…’ˆ€ˆŸ Ž„“Š’   '
@ 22, 0 SAY '  -DMD Standart- (c)&(tm) € ŠŽŒž’šŽ Ž…„ˆ…ˆ… -DMD Computer.com- (tm)1995  '

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
                DEFI WIND db_wss FROM 6 ,23 TO 12,58 TITLE " ‘ˆ‘’…ŒŽ ‘šŽ™…ˆ… ! ";
                               'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 8
                ACTIVATE WINDOW db_wss
                SET CURSOR OFF
                @ 1, 5 SAY '   ˆ‡—€Š€‰’… Ž–…‘€ !  '
                @ 2, 5 SAY '… …Šš‘‚€‰’… ”ˆ‡ˆ—…‘Šˆ'
                @ 3, 5 SAY '      €Ž’€’€ Œˆ !     '
                DO preiz
                SET CURSOR ON
                RELEASE WIND db_wss

        CASE PBAR() = 3
                DEFINE POPUP nomen_p FROM 7,30 SHADOW
                DEFINE BAR 1 OF nomen_p PROMPT ' Š °²®²¥ª      - …„ˆ ŠŽŽ…€’Ž '
                DEFINE BAR 2 OF nomen_p PROMPT ' Š °²®²¥ª      - š‹… ‘ˆ‘šŠ    '
                ON SELECTION POPUP nomen_p DO p_printp
                ACTIVATE POPUP nomen_p
                RELEASE POPUP nomen_p

        CASE PBAR() = 4
                DEFI WIND db_wws FROM 6 ,23 TO 15,57 TITLE " ‚  ˆ Œ €  ˆ … !!! ";
                               'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 8
                ACTIVATE WINDOW db_wws
                SET CURSOR OFF
                @ 1, 0 SAY '  ’“Š €“‘€‹ˆ’… ŠŽŽ…€’Žˆ,   '
                @ 2, 0 SAY ' ˆ‡’…ƒ‹…ˆ ‡…ŒŸ, Š€ˆ’€‹, ‹ˆ—Ž  '
                @ 3, 0 SAY '   Ž‹‡‚€… ™… š„€’ ˆ‡’ˆ’ˆ !   '
                @ 4, 0 SAY ' ™… Ž„ƒŽ’‚Ÿ ‘ˆ‘šŠ ‡€ ‘‹…„‚€™€  '
                @ 5, 0 SAY '            ƒŽ„ˆ€ !             '
                @ 6, 0 SAY 'Ž’‚š„…’… Ž…€–ˆŸ’€ „(¤)a/(­)e'
                @ 7, 0 SAY '             (  )               '
                Otg = ''
                SET CURSOR ON
                @ 7, 0 SAY '             (' GET Otg
                READ
                IF (Otg='„') .Or. (Otg='¤')
                        SET CURSOR OFF
                        @ 1, 0 SAY '                                 '
                        @ 2, 0 SAY '       ˆ‡—€Š€‰’… Ž–…‘€ !       '
                        @ 3, 0 SAY '    … …Šš‘‚€‰’… ”ˆ‡ˆ—…‘Šˆ     '
                        @ 4, 0 SAY '          €Ž’€’€ Œˆ !          '
                        @ 5, 0 SAY '                                 '
                        @ 6, 0 SAY '                                 '
                        @ 7, 0 SAY '                                 '
                        DO anuliran
                        SET CURSOR ON
                ENDIF
                RELEASE WIND db_wws

        CASE PBAR() = 5
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

        CASE PBAR() = 6
                ali = ALIAS()
                sel = SELECT()
                ZDK  = 0000000.00
                SELECT 10
                USE norma
                GO 1
                ZDK = Norma
                DEFI WIND db_wnr FROM 10 ,35 TO 15 ,75 TITLE " ‡€„š‹†ˆ’…‹… „Ÿ‹Ž‚ Š€ˆ’€‹ € 1 „Š€ ";
                'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 2
                ACTIVATE WINDOW db_wnr
                @ 3, 0 SAY '        [ESC] ˆ‡•Ž„ …‡ ŽŒŸ€ '
                @ 1, 1 SAY STR(ZDK) + ' ‹‚ ­  1 „Š€ ‚…‘…€ ‡…ŒŸ '
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

************************ FUNCTION ”€‰‹Ž‚… ************************
FUNCTION nkey(sas,tele,tpos)
DO CASE           && ’¥±²¢  ±º±²®¿­¨¥²® ­  ACHOICE()
        CASE sas=4
                RETURN 0

        CASE sas=0
                RETURN 2

        CASE sas=3
                DO CASE
                        CASE LASTKEY()=13    && Š« ¢¨¸ Return
                                RETURN 1
                        CASE LASTKEY()=27    && Š« ¢¨¸ Esc
                                RETURN 0
                        CASE LASTKEY()>32    && ‘¨¬¢®«
                                RETURN 3
                        ENDCASE

        CASE sas=1
                @ 1,2 SAY ">„®±²¨£­ «¨ ±²¥ ­ · «®²® ­  ¬ ±¨¢ <"
                INKEY(0)
                @ 1,2 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
                RETURN 2

        CASE sas=2
                @ 14,2 SAY ">„®±²¨£­ «¨ ±²¥ ª° ¿ ­  ¬ ±¨¢ <"
                INKEY(0)
                @ 14,2 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
                RETURN 2
ENDCASE
@ 14,2 SAY "> ²¨±­ «¨ ±²¥ ­¥¤®¯³±²¨¬ ª« ¢¨¸<"
INKEY(0)
@ 14,2 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
RETURN 2

******************* …—€’€… € ‘€‚Šˆ *******************
PROCEDURE  p_printp
sel = SELECT()
ali = ALIAS()
DO CASE
******************************** ‡€ 1 ŠŽŽ…€’Ž *************
        CASE PBAR() = 1
                SELECT  I_KART
                SET INDEX TO i_KNAME
                DEFI WIND db_ww FROM 6 ,25 TO 11,75 TITLE " ‚º¢¥¤¥²¥ ¥¤­  ®² ¤ ­­¨²¥: ";
                'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW
                ACTIVATE WINDOW db_ww
                LP = 0
                DO WHILE LP=0 .AND. LASTKEY()<>_ESC
                        g_Nom  = 000000
                        g_Name = SPACE(35)
                        g_EGN  = 00000000000
                        @ 1,0  SAY 'ŽŒ…      : ' GET g_Nom
                        @ 2,0  SAY '’ˆ’… ˆŒ…€: ' GET g_Name
                        @ 3,0  SAY '…ƒ        : ' GET g_EGN
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

******************* ‡€ š‹… ‘ˆ‘šŠ ***************************
        CASE PBAR() = 2
                DEFI WIND db_p2 FROM 6 ,25 TO 12,60 TITLE " …—€’€… € š‹… ‘ˆ‘šŠ ";
                        'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 8
                ACTIVATE WINDOW db_p2
                @  1,0 SAY '      ˆ‡—€Š€‰’… Ž–…‘€ !!!       '
                @  3,0 SAY '  …—€’€ ‘… Š€’Ž’…—… ‘ˆ‘šŠ €  '
                @  4,0 SAY ' ‡Š—‘ „šƒ€ ‘’‚ , ±. ‘²®¨« ¢®©¢®¤  '
                DO f_prt2
                DO prt_pr
                RELEASE WINDOW db_p2

END CASE
SELECT &ali
IF ali = ""
     SELECT (sel)
ENDIF
RETURN

********************************* ”ŽŒ“‹Ÿ ‡€ …—€’ 1 *****************************
PROCEDURE  f_prt1
SET PRINTER TO TEMP.TXT
SET DEVICE TO PRINT
@ pROW()+1, 8 SAY ' '
@ pROW()+1, 8 SAY '                    ‘€‚Š€ € —‹…-ŠŽŽ…€’Ž'
@ pROW()+1, 8 SAY ' '
@ pROW()+1, 8 SAY '‡¥¬¥¤¥«±ª  Š®®¯¥° ¶¨¿ ­  — ±²­¨ ‘²®¯ ­¨ „šƒ€ ‘’‚, ±. ‘²®¨« ¢®©¢®¤ '
@ pROW()+1, 8 SAY '‘·¥²®¢®¤±²¢® - ²¥«¥´®­: 04523(94523)-2070'
@ pROW()+1, 8 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@ pROW()+1, 8 SAY ' '
SELECT I_KART
Nom_p = NOM_KART
@ pROW()+1, 8 SAY 'ŽŒ… ‚ Š€’Ž’…Š€’€: ' + STR(NOM_KART)
@ pROW()+1, 8 SAY '’ˆ’… ˆŒ…€        : ' + IME
@ pROW()+1, 8 SAY '…ƒ                : ' + STR(EGN)
@ pROW()+1, 8 SAY '‹.. ‘…ˆŸ         : ' + LP_SER
@ pROW()+1, 8 SAY '‹.. ŽŒ…         : ' + LP_NOM
@ pROW()+1, 8 SAY '„€’€ € ˆ‡„€‚€…   : ' + DTOC(DATE_IZD)
@ pROW()+1, 8 SAY 'ŒŸ‘’Ž € ˆ‡„€‚€…  : ' + MQSTO_IZD
@ pROW()+1, 8 SAY 'Œ…‘’Ž†ˆ‚………       : ' + NAS_MQSTO
@ pROW()+1, 8 SAY '€„…‘              : ' + ADRES
@ pROW()+1, 8 SAY '’…‹…”Ž            : ' + PHONE
@ pROW()+1, 8 SAY '‡€…‹…†Š€          : ' + NOTE
@ pROW()+1, 8 SAY ' '

SELECT  POLZA
SET INDEX TO I_LNOM
GO TOP
SEEK Nom_p
IF FOUND()
        @ pROW()+1, 8 SAY ' '
        @ pROW()+1, 8 SAY ' '
        @ pROW()+1, 8 SAY '‘€‚Š€ ‡€ ‹ˆ—Ž Ž‹‡‚€…: '
        @ pROW()+1, 8 SAY ' ________________________________________________________________ '
        @ pROW()+1, 8 SAY '| „…Š€ˆ |‚ˆ„ Š“‹’“€      | €—€‹€ „€’€ | Š€‰€ „€’€          |'
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
        @ pROW()+1, 8 SAY '‘€‚Š€ ‡€ ‡…Œ…„…‹‘Š€ ‡…ŒŸ: '
        @ pROW()+1, 8 SAY ' ________________________________________________________________ '
        @ pROW()+1, 8 SAY '|  ‡…Œ‹ˆ™…          |€–…‹| …ˆ‘Š€|  „…Š€ˆ| „€’€ € |„€’€ € |'
        @ pROW()+1, 8 SAY '|                   |      | Ž ”…Œ€|        | ‚€‘Ÿ… |ˆ‡‹ˆ‡€…|'
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
        @ pROW()+1, 8 SAY '‘€‚Š€ ‡€ „Ÿ‹Ž‚ Š€ˆ’€‹: '
        @ pROW()+1, 8 SAY ' ________________________________________________________________ '
        @ pROW()+1, 8 SAY '| „Ÿ‹Ž‚   |‚•Ž„Ÿ™€ |„€’€ € |‚ˆ„ €   | „ŽŠ“Œ…’ |ˆ‡„€„… €     |'
        @ pROW()+1, 8 SAY '|Š€ˆ’€‹  | „€’€   |ˆ‡’…ƒ‹. |„ŽŠ“Œ…’€|    Õ     |   „€’€        |'
        @ pROW()+1, 8 SAY '|_________|________|________|_________|__________|_______________|'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 8 SAY STR(Kapital) + ' ' + DTOC(In_data) + ' ' + DTOC(Out_data) + ' ' + Dokument + ' ' + Nom_dokum + ' ' + DTOC(Data_dokum)
                SKIP +1
        ENDDO
ENDIF
SET PRINTER TO
SET DEVICE TO SCREEN
RETURN

********************************* ”ŽŒ“‹Ÿ ‡€ …—€’ 2 **********************
PROCEDURE f_prt2
B := ARRAY(6)
SET PRINTER TO TEMP.TXT
SET DEVICE TO PRINT
DO ZAGL_STR
@ pROW()+1, 0 SAY '         _____________________________________________________________________  '
@ pROW()+1, 0 SAY '        | Õ |     ˆŒ…, …‡ˆŒ…, ”€Œˆ‹ˆŸ      |  ‡…ŒŸ   |„Ÿ‹.Š€ˆ’€‹|‹ˆ—.Ž‹‡‚.| '
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
                @ pROW()+1, 0 SAY '        | Õ |     ˆŒ…, …‡ˆŒ…, ”€Œˆ‹ˆŸ      |  ‡…ŒŸ   |„Ÿ‹.Š€ˆ’€‹|‹ˆ—.Ž‹‡‚.| '
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

************************ ŸŒ€ ’€Šš‚ ‡€ˆ‘ ***************************
PROCEDURE  no_zap
        DEFI WIND db_wse FROM 6 ,23 TO 10,58 TITLE " ‘ˆ‘’…Œ€ ƒ…˜Š€!!! ";
                       'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 8
        ACTIVATE WINDOW db_wse
        @ 1, 8 SAY 'ŸŒ€ ’€Šš‚ ‡€ˆ‘ !'
        SET CURSOR OFF
        INKEY(0)
        SET CURSOR ON
        RELEASE WIND db_wse
RETURN

**************** ˆ„…Š‘ˆ€… - ‘‹…„ ¯°®¢¥°ª  ¨¬ ¬¥ «¨ ¨­¤¥ª±¨ ­  ª«¨¥­²¨²¥ ****
PROCEDURE I_NDEX
sel = SELECT()
ali = ALIAS()
ERASE *.jtx
SELECT I_KART
PrtIND_on()
SET CURSOR OFF
@ 1 ,0 SAY  "                     ÚÄÄÄ10%ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÏ"
@ 2 ,0 SAY  "‘² °² …ˆ„…Š‘ˆ€… ÀÛÛÛÛÒÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÙ"
INDEX ON IME TO i_KNAME
@ 1 ,0 SAY  "                     ÚÄÄÄÄÄÄÄ30%ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÏ"
@ 2 ,0 SAY  "‘² °² …ˆ„…Š‘ˆ€… ÀÛÛÛÛÛÛÛÛÒÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÙ"
INDEX ON NOM_KART TO i_KNOM
@ 1 ,0 SAY  "                     ÚÄÄÄÄÄÄÄÄÄÄÄ50%ÄÄÄÄÄÄÄÄÄÄÄÄÏ"
@ 2 ,0 SAY  "‘² °² …ˆ„…Š‘ˆ€… ÀÛÛÛÛÛÛÛÛÛÛÛÛÒÐÐÐÐÐÐÐÐÐÐÐÐÐÙ"
INDEX ON EGN TO i_KEGN
@ 1 ,0 SAY  "                     ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ70%ÄÄÄÄÄÄÄÄÏ"
@ 2 ,0 SAY  "‘² °² …ˆ„…Š‘ˆ€… ÀÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÒÐÐÐÐÐÐÐÐÐÙ"
SELECT POLZA
INDEX ON NOM_KART TO i_LNOM
SELECT MANE
@ 1 ,0 SAY  "                     ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ90%ÄÄÄÄÏ"
@ 2 ,0 SAY  "‘² °² …ˆ„…Š‘ˆ€… ÀÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÒÐÐÐÐÐÙ"
INDEX ON NOM_KART TO i_PNOM
SELECT ZEM
@ 1 ,0 SAY  "                     ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ100%Ï"
@ 2 ,0 SAY  "‘² °² …ˆ„…Š‘ˆ€… ÀÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÒÙ"
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
DEFI WIND Winind FROM 10, 15 TO 15, 65 TITLE " Œ®«¿ ¯®· ª ©²¥ ! ";
        'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 2
ACTIVATE WINDOW WinInd
RETURN .T.


*********************** >>>>>>>> function PrtIND_off()
FUNCTION PrtIND_off()
        RELEASE WINDOWS Winind
RETURN .T.


********************************* …—€’  ******************************
PROCEDURE prt_pr

RETURN

********************************* END  ********************************

