*************************************************************************
*               DMD Computer.com (c) 1997 MJJ, PETAR, DPP               *
*************************************************************************

********************************* START *********************************

#INCLUDE 'inkey.hd'

*
*       ŒŽ„“‹ Œ…ž’€ ˆ ‘‹“†…ˆ ”“Š–ˆˆ
*

*       DO COOP2
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

IF !FILE('I_KNAME.JTX') .OR. !FILE('I_KNOM.JTX') .OR. !FILE('I_PNOM.JTX') ;
        .OR. !FILE('I_LNOM.JTX') .OR. !FILE('I_ZNOM.JTX') .OR. !FILE('I_KEGN.JTX')
        DO I_NDEX
ENDIF

USE K_PARI INDEX I_PNOM ALIAS MANE  NEW
USE L_POLZ INDEX I_LNOM ALIAS POLZA NEW
USE K_ZEMQ INDEX I_ZNOM ALIAS ZEM   NEW
USE KART INDEX i_KNAME ,i_KNOM,I_KEGN ALIAS I_KART NEW

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
DEFINE PAD Slu_m  OF main_m PROMPT '      ‘«³¦¥¡­¨      '
DEFINE PAD exit_m OF main_m PROMPT '       ˆ§µ®¤        '

DEFINE POPUP Waw_p  FROM 1, 0 SHADOW
DEFINE POPUP Kor_p  FROM 1,11 SHADOW
DEFINE POPUP Slu_p  FROM 1,40 SHADOW
DEFINE POPUP exit_p FROM 1,50 SHADOW

DEFINE BAR 1 OF Slu_p PROMPT ' ®¬¥­ª« ²³°¨     '
DEFINE BAR 2 OF Slu_p PROMPT ' €°µ¨¢¨° ­¥       '
DEFINE BAR 3 OF Slu_p PROMPT ' °¥¨­¤¥ª±¨° ­¥   '
DEFINE BAR 4 OF Slu_p PROMPT ' °¥¨§·¨±«¿¢ ­¥   '
DEFINE BAR 5 OF Slu_p PROMPT ' ˆ§£®²¢¿ ±¯¨±º¶¨  '
DEFINE BAR 6 OF Slu_p PROMPT ' °¨ª«¾·¢  £®¤¨­  '
DEFINE BAR 7 OF Slu_p PROMPT ' • °²¨¿-¯ ° ¬¥²°¨ '

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
                DEFINE POPUP nomen_p FROM 3,30 SHADOW
                DEFINE BAR 1 OF nomen_p PROMPT ' Š³«²³°¨        '
                DEFINE BAR 2 OF nomen_p PROMPT ' ‹¨·­® ¯®«§¢ ­¥ '
                DEFINE BAR 3 OF nomen_p PROMPT ' Š®«¨·¥±²¢      '
                DEFINE BAR 4 OF nomen_p PROMPT ' „®ª³¬¥­²¨      '
                DEFINE BAR 5 OF nomen_p PROMPT ' Š®®¯¥° ²®°¨    '
                DEFINE BAR 6 OF nomen_p PROMPT ' „¿«®¢ ª ¯¨² «  '
                ON SELECTION POPUP nomen_p DO p_nomenp
                ACTIVATE POPUP nomen_p
                RELEASE POPUP nomen_p

        CASE PBAR() = 2
                DEFINE POPUP nomen_p FROM 4,30 SHADOW
                DEFINE BAR 1 OF nomen_p PROMPT ' €°µ¨¢¨° ­¥            '
                DEFINE BAR 2 OF nomen_p PROMPT '  § °µ¨¢¨° ­¥         '
                DEFINE BAR 3 OF nomen_p PROMPT ' ‚º§±² ­®¢¿¢  ¯°¥¤¨¸­® '
                ON SELECTION POPUP nomen_p DO p_arhp
                ACTIVATE POPUP nomen_p
                RELEASE POPUP nomen_p

        CASE PBAR() = 3
                DO i_ndex

        CASE PBAR() = 4
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

        CASE PBAR() = 5
                DEFINE POPUP nomen_p FROM 7,30 SHADOW
                DEFINE BAR 1 OF nomen_p PROMPT ' Š °²®²¥ª      - …„ˆ ŠŽŽ…€’Ž '
                DEFINE BAR 2 OF nomen_p PROMPT ' Š °²®²¥ª      - š‹… ‘ˆ‘šŠ    '
                DEFINE BAR 3 OF nomen_p PROMPT '  §¯°¥¤¥«¥­¨¥ - …„ˆ ŠŽŽ…€’Ž '
                DEFINE BAR 4 OF nomen_p PROMPT '  §¯°¥¤¥«¥­¨¥ - …„€ …ˆ‘Š€   '
                DEFINE BAR 5 OF nomen_p PROMPT '  §¯°¥¤¥«¥­¨¥ - …„€ Š“‹’“€    '
                DEFINE BAR 6 OF nomen_p PROMPT '  §¯°¥¤¥«¥­¨¥ - š‹… ‘ˆ‘šŠ    '
                ON SELECTION POPUP nomen_p DO p_printp
                ACTIVATE POPUP nomen_p
                RELEASE POPUP nomen_p

        CASE PBAR() = 6
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

        CASE PBAR() = 7
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

******************* ®¬¥­ª« ²³°¨ ****************************
PROCEDURE  p_nomenp
flag = .F.
r_mod = 0
DO CASE
********************************Š“‹’“ˆ *********************
        CASE PBAR() = 1
                ali = ALIAS()
                sel = SELECT()
                SELECT 10
                USE kulturi
                SELECT 11
                USE normi
                IF FILE("kult.jtx")
                        SET INDEX TO kult
                ELSE
                        INDEX ON kultura TO kult
                ENDIF
                SELECT 10
                DEFI WIND db_wk FROM 5 ,35 TO 23 ,75 TITLE " ®¬¥­ª« ²³°  Š“‹’“ˆ ";
                'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 2
                ACTIVATE WINDOW db_wk
                @ 15,0 SAY '[] [] „‚ˆ†ˆ €Š’ˆ‚ˆŸ’ …„, [ESC]Ž’Š€‡'
                @ 16,0 SAY '[INS]„Ž€‚Ÿ, [DEL]’ˆ…, [ENTER]ŠŽ…Š–ˆŸ'
                DBEDIT(0,0,14,38,,"_dbfun_k",,,,,)
                RELEASE WINDOW db_wk
                CLOSE
                SELECT 11
                CLOSE
                SELECT &ali
                IF ali = ""
                        SELECT (sel)
                ENDIF

**************************** ‹ˆ—Ž Ž‹‡‚€… *********************
        CASE PBAR() = 2
                ali = ALIAS()
                sel = SELECT()
                SELECT 10
                USE n_l_polz
                DEFI WIND db_wp FROM 6 ,35 TO 23 ,75 TITLE " ®¬¥­ª« ²³°  ‹ˆ—Ž Ž‹‡‚€… ";
                'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 2
                ACTIVATE WINDOW db_wp
                @ 14,0 SAY '[] [] „‚ˆ†ˆ €Š’ˆ‚ˆŸ’ …„, [ESC]Ž’Š€‡'
                @ 15,0 SAY '[INS]„Ž€‚Ÿ, [DEL]’ˆ…, [ENTER]ŠŽ…Š–ˆŸ'
                DBEDIT(0,0,13,38,,"_dbfun_l",,,,,)
                RELEASE WINDOW db_wp
                CLOSE
                SELECT &ali
                IF ali = ""
                        SELECT (sel)
                ENDIF

******************* ŠŽ‹ˆ—…‘’‚€ ****************************
        CASE PBAR() = 3
                ali = ALIAS()
                sel = SELECT()
                SELECT 10
                USE normi
                IF FILE("kult.jtx")
                        SET INDEX TO kult
                ELSE
                        INDEX ON kultura TO kult
                ENDIF
                DEFI WIND db_wc FROM  7,12 TO 22 ,75 TITLE " ®¬¥­ª« ²³°  ­  –…ˆ ¨ ŠŽ‹ˆ—…‘’‚€ ";
                'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 2
                ACTIVATE WINDOW db_wc
                @  0,1 SAY '         ‚ˆ„ Š“‹’“€            ŠŽ‹ˆ—…‘’‚Ž  –…€ € Šˆ‹Žƒ€Œ'
                @ 12,1 SAY ' [] []  …Œ…‘’‚€ €Š’ˆ‚ˆŸ’ …„,  [ESC] Ž’Š€‡ Ž’ Ž…€–ˆŸ '
                @ 13,1 SAY '           [ENTER] ŠŽ…Š–ˆŸ ‚š•“ –ˆ”Ž‚ˆ Ž‡ˆ–ˆˆ           '
                DBEDIT(0,0,11,61,,"_dbfun_c",,,,,)
                RELEASE WINDOW db_wc
                CLOSE
                SELECT &ali
                IF ali = ""
                        SELECT (sel)
                ENDIF

******************* „ŽŠ“Œ…’ˆ *****************************
        CASE PBAR() = 4
                ali = ALIAS()
                sel = SELECT()
                SELECT 10
                USE vid_doc
                DEFI WIND db_wd FROM 8 ,35 TO 23 ,75 TITLE " ®¬¥­ª« ²³°  ‚ˆ„Ž‚… „ŽŠ“Œ…’ˆ ";
                'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 2
                ACTIVATE WINDOW db_wd
                @ 12,0 SAY '[] [] „‚ˆ†ˆ €Š’ˆ‚ˆŸ’ …„, [ESC]Ž’Š€‡'
                @ 13,0 SAY '[INS]„Ž€‚Ÿ, [DEL]’ˆ…, [ENTER]ŠŽ…Š–ˆŸ'
                DBEDIT(0,0,11,38,,"_dbfun_d",,,,,)
                RELEASE WINDOW db_wd
                CLOSE
                SELECT &ali
                IF ali = ""
                        SELECT (sel)
                ENDIF

************************  ŠŽŽ…€’Žˆ *************************
        CASE PBAR() = 5
                ali = ALIAS()
                sel = SELECT()
                SELECT 10
                USE vid_koop
                DEFI WIND db_wvk FROM 9 ,35 TO 23 ,75 TITLE " ®¬¥­ª« ²³°  ‚ˆ„Ž‚… ŠŽŽ…€’Žˆ ";
                'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 2
                ACTIVATE WINDOW db_wvk
                @ 11,0 SAY '[] [] „‚ˆ†ˆ €Š’ˆ‚ˆŸ’ …„, [ESC]Ž’Š€‡'
                @ 12,0 SAY '[INS]„Ž€‚Ÿ, [DEL]’ˆ…, [ENTER]ŠŽ…Š–ˆŸ'
                DBEDIT(0,0,10,38,,"_dbfun_v",,,,,)
                RELEASE WINDOW db_wvk
                CLOSE
                SELECT &ali
                IF ali = ""
                        SELECT (sel)
                ENDIF

************************  ‡€„š‹†ˆ’…‹… „Ÿ‹Ž‚ Š€ˆ’€‹ € 1 „Š€ **************
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

***************** FUNCTION KULTURI ******************************
FUNCTION _dbfun_k ( mod,kol)
l_key := LASTKEY()  && —¥²¥¬ ¯®±«¥¤­¨¿² ­ ²¨±­ ² ª« ¢¨¸
nROW := ROW()       &&  ¬¨° ¬¥ ªº¤¥ ¥ ¡¨« ¬ °ª¥° 
nCOL := COL()       &&
nreturn:=1

DO CASE
        CASE  mod = 0  //±º±²®¿­¨¥ ±¢®¡®¤¥­
                Nreturn:=1

        CASE mod=3 &&  ª® ¿¬  § ¯¨±¨ ¢º¢ ”€ˆ‹€ KIENT.DBF
                @ 1,2 SAY '¥¦¨¬ ¢º¢¥¦¤ ­¥ ­  ­®¢ § ¯¨±. '
                APPEND BLANK
                SET CURSOR ON
                SET ESCAPE ON
                t_kult = kulturi
                @ ROW(),COL() GET t_kult
                READ
                REPLACE kulturi WITH t_kult
                SELECT 11
                APPEND BLANK
                REPLACE kultura WITH t_kult
                COMMIT
                REINDEX
                SELECT 10
                SET CURSOR OFF
                nreturn:=2

        CASE L_KEY = _INS  && INPUT
                ret_x = 2
                IF flag = .F.
                        APPEND BLANK
                        KEYBOARD CHR(22)
                        flag = .T.
                ELSE
                        SET CURSOR ON
                        SET ESCAPE ON
                        t_kult = kulturi
                        @ ROW(),COL() GET t_kult
                        READ
                        IF LASTKEY() = 27
                                DELETE
                                PACK
                        ELSE
                                REPLACE kulturi WITH t_kult
                                SELECT 11
                                APPEND BLANK
                                REPLACE kultura WITH t_kult
                                SELECT 10
                                COMMIT
                        ENDIF
                        SET CURSOR OFF
                        flag = .F.
                ENDIF
                nreturn:=2

        CASE l_key = _DEL
                t_kult:= kulturi
                DELETE
                PACK
                SELECT 11
                SEEK t_kult
                DELETE
                PACK
                SELECT 10
                nreturn:=2

        CASE  l_key = _ESC && EXIT <<--------------------------------
                nReturn := 0

        CASE  l_key = _ENTER  && ª®°¥ª¶¨¿ € Ž‹…
                poleSave = recno()
                SET CURSOR ON
                SET ESCAPE ON
                t_kult = kulturi
                t_kul2 = kulturi
                @ ROW(),COL() GET t_kult
                READ
                REPLACE kulturi WITH t_kult
                SELECT 11
                SEEK t_kul2
                REPLACE kultura WITH t_kult
                SELECT 10
                COMMIT
                SET CURSOR OFF
                nReturn :=  1
END CASE
RETURN nReturn

*************************** FUNCTION POLZWANE ***********************
FUNCTION _dbfun_l ( mod,kol)
l_key := LASTKEY()  && —¥²¥¬ ¯®±«¥¤­¨¿² ­ ²¨±­ ² ª« ¢¨¸
nROW := ROW()       &&  ¬¨° ¬¥ ªº¤¥ ¥ ¡¨« ¬ °ª¥° 
nCOL := COL()       &&
nreturn:=1
DO CASE
        CASE  mod = 0  //±º±²®¿­¨¥ ±¢®¡®¤¥­
                Nreturn:=1

        CASE mod=3 &&  ª® ¿¬  § ¯¨±¨ ¢º¢ ”€ˆ‹€ KIENT.DBF
                @ 1,2 SAY '¥¦¨¬ ¢º¢¥¦¤ ­¥ ­  ­®¢ § ¯¨±. '
                APPEND BLANK
                SET CURSOR ON
                SET ESCAPE ON
                t_polz = L_polz
                @ ROW(),COL() GET t_polz
                READ
                REPLACE L_polz  WITH t_polz
                COMMIT
                SET CURSOR OFF
                nreturn:=2

        CASE  L_KEY = _INS  && INPUT
                IF flag = .f.
                        APPEND BLANK
                        KEYBOARD CHR(22)
                        flag:= .t.
                ELSE
                        SET CURSOR ON
                        SET ESCAPE ON
                        t_polz = L_polz
                        @ ROW(),COL() GET t_polz
                        READ
                        IF LASTKEY() = 27
                                DELETE
                                PACK
                        ELSE
                                REPLACE L_polz  WITH t_polz
                                COMMIT
                        ENDIF
                        flag:= .f.
                ENDIF
                SET CURSOR OFF
                nreturn:=2

        CASE l_key = _DEL
                DELETE
                PACK
                nreturn:=2

        CASE  l_key = _ESC && EXIT <<--------------------------------
                nReturn := 0

        CASE  l_key = _ENTER  && ª®°¥ª¶¨¿ € Ž‹…
                poleSave = recno()
                SET CURSOR ON
                SET ESCAPE ON
                t_polz = L_polz
                @ ROW(),COL() GET t_polz
                READ
                REPLACE L_polz WITH t_polz
                COMMIT
                SET CURSOR OFF
                nReturn :=  1
ENDCASE
RETURN nReturn

************************ FUNCTION DOKUMENTI ************************
FUNCTION _dbfun_d ( mod,kol)
l_key := LASTKEY()  && —¥²¥¬ ¯®±«¥¤­¨¿² ­ ²¨±­ ² ª« ¢¨¸
nROW := ROW()       &&  ¬¨° ¬¥ ªº¤¥ ¥ ¡¨« ¬ °ª¥° 
nCOL := COL()       &&
nreturn:=1
DO CASE
        CASE mod = 0  //±º±²®¿­¨¥ ±¢®¡®¤¥­
                Nreturn:=1

        CASE mod=3 &&  ª® ¿¬  § ¯¨±¨ ¢º¢ ”€ˆ‹€ KIENT.DBF
                @ 1,2 SAY '¥¦¨¬ ¢º¢¥¦¤ ­¥ ­  ­®¢ § ¯¨±. '
                APPEND BLANK
                SET CURSOR ON
                SET ESCAPE ON
                t_doc  = Vid_doc
                @ ROW(),COL() GET t_doc
                READ
                REPLACE Vid_doc WITH t_doc
                COMMIT
                SET CURSOR OFF
                nreturn:=2

        CASE  L_KEY = _INS  && INPUT
                IF flag = .f.
                        APPEND BLANK
                        KEYBOARD CHR(22)
                        flag:= .t.
                ELSE
                        SET CURSOR ON
                        SET ESCAPE ON
                        t_doc  = Vid_doc
                        @ ROW(),COL() GET t_doc
                        READ
                        IF LASTKEY() = 27
                                DELETE
                                PACK
                        ELSE
                                REPLACE Vid_doc WITH t_doc
                                COMMIT
                                ENDIF
                                flag = .f.
                        ENDIF
                SET CURSOR OFF
                nreturn:=2

        CASE l_key = _DEL
                DELETE
                PACK
                nreturn:=2

        CASE l_key = _ESC && EXIT <<--------------------------------
                nReturn := 0

        CASE l_key = _ENTER  && ª®°¥ª¶¨¿ € Ž‹…
                poleSave = RECNO()
                SET CURSOR ON
                SET ESCAPE ON
                t_doc = Vid_doc
                @ ROW(),COL() GET t_doc
                READ
                REPLACE Vid_doc WITH t_doc
                COMMIT
                SET CURSOR OFF
                nReturn :=  1
ENDCASE
RETURN nReturn

**************************FUNCTION KOOPERATORI **********************
FUNCTION _dbfun_v ( mod,kol)
l_key := LASTKEY()  && —¥²¥¬ ¯®±«¥¤­¨¿² ­ ²¨±­ ² ª« ¢¨¸
nROW := ROW()       &&  ¬¨° ¬¥ ªº¤¥ ¥ ¡¨« ¬ °ª¥° 
nCOL := COL()       &&
nReturn:=1
DO CASE
        CASE  mod = 0  //±º±²®¿­¨¥ ±¢®¡®¤¥­
                nReturn:=1

        CASE mod=3 && €ŠŽ ŸŒ€ ‡€ˆ‘ˆ ‚ Š€’Ž’…Š€’€
                @ 1,2 SAY '¥¦¨¬ ¢º¢¥¦¤ ­¥ ­  ­®¢ § ¯¨±. '
                APPEND BLANK
                SET CURSOR ON
                SET ESCAPE ON
                t_kop = Vid_koop
                @ ROW(),COL() GET t_kop
                READ
                REPLACE Vid_koop WITH t_kop
                COMMIT
                SET CURSOR OFF
                nReturn:=2

        CASE  L_KEY = _INS  && INPUT
                IF flag = .f.
                        APPEND BLANK
                        KEYBOARD CHR(22)
                        flag:= .t.
                ELSE
                        SET CURSOR ON
                        SET ESCAPE ON
                        t_kop  = Vid_koop
                        @ ROW(),COL() GET t_kop
                        READ
                        IF LASTKEY() = 27
                                DELETE
                                PACK
                        ELSE
                                REPLACE Vid_koop WITH t_kop
                                COMMIT
                        ENDIF
                        flag = .f.
                        SET CURSOR OFF
                ENDIF
                nReturn:=2

        CASE l_key = _DEL
                DELETE
                PACK
                nReturn:=2

        CASE l_key = _ESC && EXIT <<--------------------------------
                nReturn := 0

        CASE l_key = _ENTER  && ª®°¥ª¶¨¿ € Ž‹…
                poleSave = recno()
                SET CURSOR ON
                SET ESCAPE ON
                t_kop = Vid_koop
                @ ROW(),COL() GET t_kop
                READ
                REPLACE Vid_koop WITH t_kop
                COMMIT
                SET CURSOR OFF
                nReturn := 1
ENDCASE
RETURN nReturn

************************* FUNCTION CENI I KOLICHESTWA ******************
FUNCTION _dbfun_c ( mod,kol)
l_key := LASTKEY()  && —¥²¥¬ ¯®±«¥¤­¨¿² ­ ²¨±­ ² ª« ¢¨¸
nROW := ROW()       &&  ¬¨° ¬¥ ªº¤¥ ¥ ¡¨« ¬ °ª¥° 
nCOL := COL()       &&
nReturn:=1
DO CASE
        CASE mod = 0  //±º±²®¿­¨¥ ±¢®¡®¤¥­
                nReturn := 1

        CASE l_key = _ESC && EXIT <<--------------------------------
                nReturn := 0

        CASE l_key = _ENTER  && ª®°¥ª¶¨¿ € Ž‹…
                IF kol > 1
                        SET CURSOR ON
                        SET ESCAPE ON
                        f_n = FIELDNAME(kol)
                        t_kop  = &f_n
                        @ ROW(),COL() GET t_kop
                        READ
                        REPLACE &f_n     WITH t_kop
                        COMMIT
                        SET CURSOR OFF
                ENDIF
                nReturn :=  1
ENDCASE
RETURN nReturn

******************* €°µ¨¢¨° ­¥ ****************************
PROCEDURE  p_arhp
DO CASE
******************************** €°µ¨¢¨° ­¥ ******************
        CASE PBAR() = 1
                SET CURSOR OFF
                N_ARH = SPACE(8)
                DEFI WIND db_wa FROM 6 ,35 TO 9 ,70 TITLE " ‚º¢¥¤¥²¥ ¨¬¥ ­   °µ¨¢ : ";
                        'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW
                ACTIVATE WINDOW db_wa
                @ 1,10 SAY '.ZIP'
                @ 1,1  GET N_ARH
                READ
                IF N_ARH<>SPACE(8)
                        SET CURSOR OFF
                        !PKZIP TTT2.ZIP ????????.DBF > NUL
                        IF FILE("TTT2.ZIP")
                                FRENAME("TTT2.ZIP", N_ARH + ".ZIP")
                        ENDIF
                ENDIF
                RELEASE WINDOW db_wa

**************************** €‡€•ˆ‚ˆ€… *********************
        CASE PBAR() = 2
                SET CURSOR OFF
                Fil_nom := 0
                Fil_nam := SPACE(12)
                IF FILE("COOP.ARH")
                        !DEL COOP.ARH > NUL
                ENDIF
                !PKZIP COOP.ZIP ????????.DBF > NUL
                FRENAME("COOP.ZIP", "COOP.ARH")
                IF FILE("COOP.ZIP")
                        !DEL COOP.ZIP > NUL
                ENDIF
                x1 := DIRECTORY("*.ZIP")
                tru := ARRAY(LEN(x1))
                nam := ARRAY(LEN(x1))
                FOR i:= 1 to LEN(x1)
                        nam[i]:=x1[i][1]
                NEXT
                AFILL(tru,.t.)
                DEFI WIND db_wr FROM 5 ,35 TO 23 ,75 TITLE " ˆ§¡¥°¥²¥  °µ¨¢¥­ ´ ©«: ";
                        'ÚÄÏÓÙÄÀÓ' FLOAT SHADOW
                ACTIVATE WINDOW db_wr
                @  1,0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
                @ 14,0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
                @ 15,0 SAY '      [] [] „‚ˆ†ˆ €Š’ˆ‚ˆŸ’ …„,     '
                @ 16,0 SAY '  [ESC] Ž’Š€‡ ,  [ENTER] Ž’‚š†„€‚€   '
                Fil_nom := ACHOICE(2,2,14,30,nam,tru,"nkey",)
                IF Fil_nom<>0
                        Fil_nam := x1[Fil_nom]
                        FRENAME(Fil_nam, "TTT2.ZIP")
                        !PKUNZJR TTT2.ZIP > NUL
                        FRENAME("TTT2.ZIP", Fil_nam)
                ENDIF
                DO I_NDEX
                RELEASE WINDOW db_wr

******************* ‚š‡‘’€Ž‚Ÿ‚€… ****************************
        CASE PBAR() = 3
                SET CURSOR OFF
                FRENAME("COOP.ARH", "COOP.ZIP")
                !PKUNZJR COOP.ZIP > NUL
                FRENAME("COOP.ZIP", "COOP.ARH")
                DO I_NDEX
END CASE
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

******************* ‡€ ............ ***************************
        *   .................
        *   ’“Š Ž„š‹†€‚€’ Ž‘’€€‹ˆ’… …—€’ˆ ‘€‚Šˆ !!!
        *   .................

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
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY '                    ‘€‚Š€ € —‹…-ŠŽŽ…€’Ž'
@ pROW()+1, 0 SAY '‡¥¬¥¤¥«±ª  Š®®¯¥° ¶¨¿ ­  — ±²­¨ ‘²®¯ ­¨ „šƒ€ ‘’‚, ±. ‘²®¨« ¢®©¢®¤ '
@ pROW()+1, 0 SAY '‘·¥²®¢®¤±²¢® - ²¥«¥´®­: 20-70'
@ pROW()+1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@ pROW()+1, 0 SAY ' '
SELECT I_KART
Nom_p = NOM_KART
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

SELECT  POLZA
SET INDEX TO I_LNOM
GO TOP
SEEK Nom_p
IF FOUND()
        @ pROW()+1, 0 SAY ' '
        @ pROW()+1, 0 SAY ' ‘€‚Š€ ‡€ ‹ˆ—Ž Ž‹‡‚€…: '
        @ pROW()+1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 0 SAY ' '
                @ pROW()+1, 0 SAY '„…Š€ˆ      : ' + STR(DKA)
                @ pROW()+1, 0 SAY '‚ˆ„ Š“‹’“€ : ' + KULTURA
                @ pROW()+1, 0 SAY '€—€‹€ „€’€: ' + DTOC(IN_DATA)
                @ pROW()+1, 0 SAY 'Š€‰€ „€’€ : ' + DTOC(OUT_DATA)
                @ pROW()+1, 0 SAY ' '
                SKIP +1
        ENDDO
ENDIF

SELECT  ZEM
SET INDEX TO I_ZNOM
GO TOP
SEEK Nom_p
IF FOUND()
        @ pROW()+1, 0 SAY ' '
        @ pROW()+1, 0 SAY ' ‘€‚Š€ ‡€ ‡…Œ…„…‹‘Š€ ‡…ŒŸ: '
        @ pROW()+1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 0 SAY ' '
                @ pROW()+1, 0 SAY '‡…Œ‹ˆ™…                 ' + Zemlishte
                @ pROW()+1, 0 SAY '€–…‹                  ' + Parcel
                @ pROW()+1, 0 SAY '…ˆ‘Š€ Ž ”…Œ€       ' + Prepiska
                @ pROW()+1, 0 SAY '„…Š€ˆ                  ' + STR(Dka)
                @ pROW()+1, 0 SAY '‘Ž‘’‚…Ž‘’ € ‡…ŒŸ’€   ' + Sobstwenos
                @ pROW()+1, 0 SAY 'Ž’€ˆ€‹ˆ €Š’      Õ   ' + NOT_AKT
                @ pROW()+1, 0 SAY 'ˆ‡„€„… €              ' + DTOC(Date_n_akt)
                @ pROW()+1, 0 SAY 'š‹ŽŒŽ™Ž          Õ   ' + Nom_Pylnom
                @ pROW()+1, 0 SAY 'ˆ‡„€„…Ž €             ' + DTOC(DATE_Pylno)
                @ pROW()+1, 0 SAY '„€’€ € ‚‹ˆ‡€…         ' + DTOC(IN_Date)
                @ pROW()+1, 0 SAY '„€’€ € ˆ‡‹ˆ‡€…        ' + DTOC(Out_Date)
                @ pROW()+1, 0 SAY '”ŽŒ€ € Ž€Ž’Š€      ' + Forma_Obr
                @ pROW()+1, 0 SAY ' '
                SKIP +1
        ENDDO
ENDIF

SELECT  MANE
SET INDEX TO I_PNOM
GO TOP
SEEK Nom_p
IF FOUND()
        @ pROW()+1, 0 SAY ' '
        @ pROW()+1, 0 SAY ' ‘€‚Š€ ‡€ „Ÿ‹Ž‚ Š€ˆ’€‹: '
        @ pROW()+1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 0 SAY ' '
                @ pROW()+1, 0 SAY '„Ÿ‹Ž‚ Š€ˆ’€‹           ' + STR(Kapital)
                @ pROW()+1, 0 SAY '‚•Ž„Ÿ™€ „€’€            ' + DTOC(In_data)
                @ pROW()+1, 0 SAY '„€’€ € ˆ‡’…ƒ‹Ÿ…       ' + DTOC(Out_data)
                @ pROW()+1, 0 SAY '‚ˆ„ € „ŽŠ“Œ…’€        ' + Dokument
                @ pROW()+1, 0 SAY '„ŽŠ“Œ…’            Õ   ' + Nom_dokum
                @ pROW()+1, 0 SAY 'ˆ‡„€„… €              ' + DTOC(Data_dokum)
                @ pROW()+1, 0 SAY ' '
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
@ pROW()+1, 0 SAY '        ÚÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÏ '
@ pROW()+1, 0 SAY '        Ó Õ Ó     ˆŒ…, …‡ˆŒ…, ”€Œˆ‹ˆŸ      Ó  ‡…ŒŸ   Ó„Ÿ‹.Š€ˆ’€‹Ó‹ˆ—.Ž‹‡‚.Ó '
@ pROW()+1, 0 SAY '        ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÔ '
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
                @ pROW()+1, 0 SAY '        ÚÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÏ '
                @ pROW()+1, 0 SAY '        Ó Õ Ó     ˆŒ…, …‡ˆŒ…, ”€Œˆ‹ˆŸ      Ó  ‡…ŒŸ   Ó„Ÿ‹.Š€ˆ’€‹Ó‹ˆ—.Ž‹‡‚.Ó '
                @ pROW()+1, 0 SAY '        ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÔ '
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
USE normi
INDEX ON kultura TO kult
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