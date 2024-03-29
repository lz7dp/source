*************************************************************************
*                       DMD Computer.com (c) 1997                       *
*************************************************************************

********************************* START *********************************

*********************** START CONFIG ************************************
*
#INCLUDE 'inkey.hd'
#INCLUDE 'box.hd'

*       DO COOP2       &&&      EXTERNAL PROC
*       DO INTRODMD    &&&      EXTERNAL PROC

CLEAR ALL
CLOSE DATABASE
SET DATE GERMAN
SET MOUSE ON
SET MOUSE STYLE OFF
*
************************ END START CONFIG ********************************


************************ START SCREEN ************************************
*
@ 0,0,24,80 BOX '         '

@  6, 0 SAY '       ßßßßßßßßß    ßßßßßßßßßß    ßßßßßßßßß     ßßßßßßßßßß    ßßßßßßßßßß        '
@  7, 0 SAY '      ßßß     ßßß   ßßß     ßßß   ßßß     ßßß   ßßß           ßßß     ßßß       '
@  8, 0 SAY '      ßßß     ßßß   ßßß     ßßß   ßßß     ßßß   ßßß           ßßß     ßßß       '
@  9, 0 SAY '      ßßß     ßßß   ßßß     ßßß   ßßß     ßßß   ßßß           ßßß     ßßß       '
@ 10, 0 SAY '      ßßß     ßßß   ßßßßßßßßßß    ßßß     ßßß   ßßßßßßß       ßßßßßßßßßß        '
@ 11, 0 SAY '      ßßß     ßßß   ßßß  ßßß      ßßß     ßßß   ßßß           ßßß  ßßß          '
@ 12, 0 SAY '      ßßß     ßßß   ßßß   ßßß     ßßß   STANDART (c)1997      ßßß   ßßß         '
@ 13, 0 SAY '      ßßß     ßßß   ßßß    ßßß    ßßß     ßßß   ßßß           ßßß    ßßß        '
@ 14, 0 SAY '       ßßßßßßßßß    ßßß     ßßß   ßßßßßßßßß     ßßßßßßßßßßß   ßßß     ßßß       '


SET COLOR TO N/W
@ 24, 0 SAY '   :'
@ 24, 23 SAY '[]'
@ 24, 32 SAY '[]'
@ 24, 41 SAY '[<-]'
@ 24, 51 SAY '[->]'
@ 24, 62 SAY '[ENTER]'
SET COLOR TO
@  1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@ 23, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@  2, 0 SAY ' DMD Computer.com (c)97, BULGARIA, 8900 Nova Zagora, phones:359-457-23263,26937 '
@ 18, 0 SAY '                 AJUR_S          '
@ 21, 0 SAY '  -ORDER Standart-            '
@ 22, 0 SAY '  -DMD Standart- (c)&(tm)    -DMD Computer.com- (tm)1995  '
*
************************ END START SCREEN **********************************


*********************** PUBLIC VARIBLE ************************************
*
V_wid_op = ' '                  && vid na operaciqta
V_izbor1 = 0                    && var za izbor na pbar() w menu
V_t_izbor1 = ' '
V_izbor2 = 0                    && var za izbor na pbar() w menu
V_t_izbor2 = ' '
vL = 0

vNom_op     = 0000000000                               && Numeric       10
vEndRecno   = 0000000000                               && Numeric       10
vWid_op     = '               '                        && Character     15
vName_doc   = '               '                        && Character     15
vNom_doc    = 0000000000                               && Numeric       10
vData_doc   = DATE()                                   && Date           8
vFirma      = '                       '                && Character     30
vAdres_f    = '                       '                && Character     25
vNom_dan    = 0000000000                               && Numeric       10
vBulstat    = '           '                            && Character     11
vMol        = '                       '                && Character     35
vN_mqsto    = '               '                        && Character     15
vData_sys   = DATE()                                   && Date           8
vPoluchil   = '                                   '    && Character     35
vLp_ser_pol = ' '                                      && Character      1
vLp_nom_pol = 0000000000                               && Numeric       10
vRpu        = '                         '              && Character     25
vData_izd   = DATE()                                   && Date           8
vBank_kod   = '          '                             && Character     10
vBank_sm    = '          '                             && Character     10
vStoka      = '                    '                   && Character     35
vMqrka      = '     '                                  && Character      5
vKolichest  = 000000000000000.000                      && Numeric       15        3
vCena       = 000000000000000                          && Numeric       15
vSuma       = 000000000000000                          && Numeric       15
vSuma_end   = 000000000000000                          && Numeric       15
vSdelka     = '                         '              && Character     25
vAdres_Gr   = '                         '              && Character     25
vAdres_Ul   = '                         '              && Character     25
vAdres_Nom  = '                    '                   && Character     25
*
************************ END OF PUBLIC VARIBLE ****************************


*************** USTANOWQWA RABOTNI ALIAS ***********************************
*
IF !FILE('PRIH.JTX') .OR. !FILE('RAZH.JTX') .OR. !FILE('KASA.JTX')
        DO I_NDEX
ENDIF

USE kasa_pr  INDEX prih ALIAS prihod NEW
USE kasa_raz INDEX razh ALIAS razhod NEW
USE kasa_kn  INDEX kasa ALIAS kasa_k NEW
*
************************************* END ALIAS ***************************


************************* MENU SYSTEM *************************************
*
DEFINE MENU main_m
DEFINE PAD Waw_m  OF main_m PROMPT '      '
DEFINE PAD Spr_m  OF main_m PROMPT '     AJUR_S   '
DEFINE PAD Slu_m  OF main_m PROMPT '           '
DEFINE PAD Exit_m OF main_m PROMPT '               '

DEFINE POPUP Waw_p  FROM 1, 0 SHADOW
DEFINE POPUP Spr_p  FROM 1,20 SHADOW
DEFINE POPUP Slu_p  FROM 1,40 SHADOW
DEFINE POPUP exit_p FROM 1,50 SHADOW

DEFINE BAR 1 OF Waw_p PROMPT '     '
DEFINE BAR 2 OF Waw_p PROMPT '     '

DEFINE BAR 1 OF Slu_p PROMPT '      '
DEFINE BAR 2 OF Slu_p PROMPT '   '
DEFINE BAR 3 OF Slu_p PROMPT '   '

ON SELECTION PAD Waw_m   OF main_m ACTIVATE POPUP Waw_p
ON SELECTION PAD Slu_m   OF main_m ACTIVATE POPUP Slu_p
ON SELECTION PAD Spr_m   OF main_m ACTIVATE POPUP Spr_p
ON SELECTION PAD exit_m  OF main_m DO p_endp

ON SELECTION POPUP Waw_p DO P_waw
*   ON SELECTION POPUP Slu_p DO P_slu
ON SELECTION POPUP Spr_p DO Spr_prt

@ 0,0,24,80 BOX '         '

@  6, 0 SAY '       ßßßßßßßßß    ßßßßßßßßßß    ßßßßßßßßß     ßßßßßßßßßß    ßßßßßßßßßß        '
@  7, 0 SAY '      ßßß     ßßß   ßßß     ßßß   ßßß     ßßß   ßßß           ßßß     ßßß       '
@  8, 0 SAY '      ßßß     ßßß   ßßß     ßßß   ßßß     ßßß   ßßß           ßßß     ßßß       '
@  9, 0 SAY '      ßßß     ßßß   ßßß     ßßß   ßßß     ßßß   ßßß           ßßß     ßßß       '
@ 10, 0 SAY '      ßßß     ßßß   ßßßßßßßßßß    ßßß     ßßß   ßßßßßßß       ßßßßßßßßßß        '
@ 11, 0 SAY '      ßßß     ßßß   ßßß  ßßß      ßßß     ßßß   ßßß           ßßß  ßßß          '
@ 12, 0 SAY '      ßßß     ßßß   ßßß   ßßß     ßßß   STANDART (c)1997      ßßß   ßßß         '
@ 13, 0 SAY '      ßßß     ßßß   ßßß    ßßß    ßßß     ßßß   ßßß           ßßß    ßßß        '
@ 14, 0 SAY '       ßßßßßßßßß    ßßß     ßßß   ßßßßßßßßß     ßßßßßßßßßßß   ßßß     ßßß       '

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
@  2, 0 SAY ' DMD Computer.com (c)97, BULGARIA, 8900 Nova Zagora, phones:359-457-23263,26937 '
@ 18, 0 SAY '                 AJUR_S          '
@ 21, 0 SAY '  -ORDER Standart-            '
@ 22, 0 SAY '  -DMD Standart- (c)&(tm)    -DMD Computer.com- (tm)1995  '


row = 1
col = 1

ACTIVATE MENU main_m
RELEASE ALL
CLOSE ALL
SET COLOR TO
CLEAR
RETURN
*
**********************************END MENU **********************************


********************************* START OF END PROGRAM **********************
*
PROCEDURE p_endp

RELEASE ALL
CLOSE ALL
SET COLOR TO
CLEAR
QUIT
RETURN
*
********************************* END OF PROGRAM ***************************


************************ WORK PROCEDURE OF PRG *****************************
*
*
************************ 1_st MENU ITEM ************************************
*
PROCEDURE P_waw         && 1-st MENU ITEM

V_izbor1 = PBAR()

DO CASE
        CASE V_izbor1 = 1
        V_t_izbor1 = '  '
        SELECT prihod

        CASE V_izbor1 = 2
        V_t_izbor1 = '  '
        SELECT razhod
ENDCASE

DO wyw_oper

RETURN
*
*************************** END OF 1_st MENU ITEM ***************************


******************************** proc wyw_oper *****************************
*
PROCEDURE wyw_oper

DEFINE WINDOW wyw_win FROM 1 ,0 TO 23 ,79
ACTIVATE WINDOW wyw_win

SET KEY -4 TO Flag_L

@ 1, 0,  11, 77 BOX B_DOUBLE

@ 2, 1 SAY   '                                                               '
@ 3, 0 SAY  'ĢĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĶĘ'

@ 12, 0 SAY '           ,    ,       '
@ 13, 0 SAY '                            .                         '
@ 14, 0 SAY '                 ,             '
@ 15, 0 SAY '                  ,   .              '
@ 16, 1 SAY '           ,           '
@ 17, 1 SAY '                                        '
@ 18, 1 SAY '  [F5], [ENTER] -          ,   '
@ 19, 1 SAY '                                !!!                               '
@ 20, 1 SAY '             -  2   [ESC]        '

GO BOTTOM
vNom_op = Nom + 1

vWid_op = V_t_izbor1
@ 0, 35 SAY '®Ŗ³¬„­²: ' + vWid_op

@ 0, 1 SAY '„£Ø±²° ¶Ø®­„­ Õ ' GET vNom_op
READ

DO CASE
        CASE V_izbor1 = 1
        SEEK vNom_op
        IF FOUND()
                vData_sys = DATA
                vSuma     = SUMA
                vPoluchil = IME
                vSdelka   = SDELKA
                @  4, 3 SAY ' ²  ­  ±ŗ±² ¢æ­„:                           ' GET vData_sys
                @  5, 3 SAY '³¬  Æ® ®°¤„°    :                    '        GET vSuma
                @  6, 3 SAY '¬„ ­  Æ®«³· ²„«æ:'                            GET vPoluchil
                @  7, 3 SAY 'ÆØ± ­  ±¤„«Ŗ    :          '                  GET vSdelka
                READ
        ENDIF
        IF !FOUND()
                vSuma     = 000000000000000
                vPoluchil = '                          '
                vSdelka   = '            '
                @  4, 3 SAY ' ²  ­  ±ŗ±² ¢æ­„:                           ' GET vData_sys
                @  5, 3 SAY '³¬  Æ® ®°¤„°    :                         '   GET vSuma
                @  6, 3 SAY '¬„ ­  Æ®«³· ²„«æ:'                            GET vPoluchil
                @  7, 3 SAY 'ÆØ± ­  ±¤„«Ŗ    :          '                  GET vSdelka
                READ
        ENDIF

        CASE V_izbor1 = 2
        SEEK vNom_op
        IF FOUND()
                vData_sys = DATA
                vSuma     = SUMA
                vPoluchil = IME
                vAdres_Gr = ADRES_GR
                vAdres_Ul = ADRES_UL
                vAdres_Nom= ADRES_NOM
                vSdelka   = SDELKA
                @  4, 3 SAY ' ²  ­  ±ŗ±² ¢æ­„:                           ' GET vData_sys
                @  5, 3 SAY '³¬  Æ® ®°¤„°    :                    '        GET vSuma
                @  6, 3 SAY '¬„ ­  Æ®«³· ²„«æ:'                            GET vPoluchil
                @  7, 3 SAY '° ¤ (±„«®)      :          '                  GET vAdres_Gr
                @  8, 3 SAY '«Ø¶             :          '                  GET vAdres_Ul
                @  9, 3 SAY '®¬„°            :               '             GET vAdres_Nom
                @ 10, 3 SAY 'ÆØ± ­  ±¤„«Ŗ ²  :          '                  GET vSdelka
                READ
        ENDIF
        IF !FOUND()
                vSuma     = 000000000000000
                vPoluchil = '                          '
                vSdelka   = '            '
                @  4, 3 SAY ' ²  ­  ±ŗ±² ¢æ­„:                           ' GET vData_sys
                @  5, 3 SAY '³¬  Æ® ®°¤„°    :                         '   GET vSuma
                @  6, 3 SAY '¬„ ­  Æ®«³· ²„«æ:'                            GET vPoluchil
                @  7, 3 SAY '° ¤ (±„«®)      :          '                  GET vAdres_Gr
                @  8, 3 SAY '«Ø¶             :          '                  GET vAdres_Ul
                @  9, 3 SAY '®¬„°            :               '             GET vAdres_Nom
                @ 10, 3 SAY 'ÆØ± ­  ±¤„«Ŗ ²  :          '                  GET vSdelka
                READ
        ENDIF
ENDCASE


SET KEY -4
RELEASE WINDOWS wyw_win
RETURN
*
*************************** END OF wyw_oper ********************************


******************************** proc wyw_oper *****************************
*
PROCEDURE Flag_L

SEEK vNom_op

IF !FOUND()
        APPEND BLANK
ENDIF

DO CASE
        CASE V_izbor1 = 1
        REPLACE NOM      WITH vNom_op
        REPLACE DATA     WITH vData_sys
        REPLACE SUMA     WITH vSuma
        REPLACE IME      WITH vPoluchil
        REPLACE SDELKA   WITH vSdelka

        CASE V_izbor1 = 2
        REPLACE NOM       WITH vNom_op
        REPLACE DATA      WITH vData_sys
        REPLACE SUMA      WITH vSuma
        REPLACE IME       WITH vPoluchil
        REPLACE SDELKA    WITH vSdelka
        REPLACE ADRES_GR  WITH vAdres_Gr
        REPLACE ADRES_UL  WITH vAdres_Ul
        REPLACE ADRES_NOM WITH vAdres_Nom
ENDCASE

RETURN
*
*************************** END OF wyw_oper ********************************


****************  -  Æ°®¢„°Ŗ  Ø¬ ¬„ «Ø Ø­¤„Ŗ±Ø ­  ®°¤„°Ø²„ ****
*
PROCEDURE I_NDEX

sel = SELECT()
ali = ALIAS()
CLOSE DATABASE

PrtIND_on()

SET CURSOR OFF
@ 1 ,0 SAY  "                     ŚÄÄÄ10%ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄĻ"
@ 2 ,0 SAY  "² °²  ĄŪŪŪŪŅŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŁ"
USE kasa_pr
@ 1 ,0 SAY  "                     ŚÄÄÄÄÄÄÄ30%ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄĻ"
@ 2 ,0 SAY  "² °²  ĄŪŪŪŪŪŪŪŪŅŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŁ"
INDEX ON NOM TO prih
@ 1 ,0 SAY  "                     ŚÄÄÄÄÄÄÄÄÄÄÄ50%ÄÄÄÄÄÄÄÄÄÄÄÄĻ"
@ 2 ,0 SAY  "² °²  ĄŪŪŪŪŪŪŪŪŪŪŪŪŅŠŠŠŠŠŠŠŠŠŠŠŠŠŁ"
USE kasa_raz
@ 1 ,0 SAY  "                     ŚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ70%ÄÄÄÄÄÄÄÄĻ"
@ 2 ,0 SAY  "² °²  ĄŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŅŠŠŠŠŠŠŠŠŠŁ"
INDEX ON NOM TO razh
@ 1 ,0 SAY  "                     ŚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ90%ÄÄÄÄĻ"
@ 2 ,0 SAY  "² °²  ĄŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŅŠŠŠŠŠŁ"
USE kasa_kn
INDEX ON DATA TO kasa
@ 1 ,0 SAY  "                     ŚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ100%Ļ"
@ 2 ,0 SAY  "² °²  ĄŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŅŁ"
CLOSE DATABASE

SET CURSOR ON

PrtIND_off()

IF ali <> ""
     SELECT &ali
     SELECT (sel)
ENDIF

RETURN
*
*********************************************************


*********************** >>>>>>>> function PrtIND_on() ****************
*
FUNCTION PrtIND_on()
DEFI WIND Winind FROM 10, 15 TO 15, 65 TITLE " ®«æ Æ®· Ŗ ©²„ ! ";
        'ŚÄĻÓŁÄĄÓ' FLOAT SHADOW COLOR SCHEME 2
ACTIVATE WINDOW WinInd
RETURN .T.
*
*********************** >>>>>>>> function PrtIND_on() ****************


*********************** >>>>>>>> function PrtIND_off() ***************
*
FUNCTION PrtIND_off()
        RELEASE WINDOWS Winind
RETURN .T.
*
*********************** >>>>>>>> function PrtIND_off() ***************

****************************    2 *****************************
PROCEDURE  f_prt2
SET PRINTER TO TEMP.TXT
SET DEVICE TO PRINT
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY '                      -'
@ pROW()+1, 0 SAY '„¬„¤„«±Ŗ  ®®Æ„° ¶Øæ ­   ±²­Ø ²®Æ ­Ø  , ±. ²®Ø« ¢®©¢®¤ '
@ pROW()+1, 0 SAY '·„²®¢®¤±²¢® - ²„«„“®­: 20-70'
@ pROW()+1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@ pROW()+1, 0 SAY ' '
SELECT I_KART
Nom_p = NOM_KART
@ pROW()+1, 0 SAY '  : ' + STR(NOM_KART)
@ pROW()+1, 0 SAY '         : ' + IME
@ pROW()+1, 0 SAY '                : ' + STR(EGN)
@ pROW()+1, 0 SAY '..          : ' + LP_SER
@ pROW()+1, 0 SAY '..          : ' + LP_NOM
@ pROW()+1, 0 SAY '     : ' + DTOC(DATE_IZD)
@ pROW()+1, 0 SAY '    : ' + MQSTO_IZD
@ pROW()+1, 0 SAY '       : ' + NAS_MQSTO
@ pROW()+1, 0 SAY '              : ' + ADRES
@ pROW()+1, 0 SAY '            : ' + PHONE
@ pROW()+1, 0 SAY '          : ' + NOTE
@ pROW()+1, 0 SAY ' '

SELECT  POLZA
SET INDEX TO I_LNOM
GO TOP
SEEK Nom_p
IF FOUND()
        @ pROW()+1, 0 SAY ' '
        @ pROW()+1, 0 SAY '    : '
        @ pROW()+1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 0 SAY ' '
                @ pROW()+1, 0 SAY '      : ' + STR(DKA)
                @ pROW()+1, 0 SAY '  : ' + KULTURA
                @ pROW()+1, 0 SAY ' : ' + DTOC(IN_DATA)
                @ pROW()+1, 0 SAY '  : ' + DTOC(OUT_DATA)
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
        @ pROW()+1, 0 SAY '    : '
        @ pROW()+1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 0 SAY ' '
                @ pROW()+1, 0 SAY '                 ' + Zemlishte
                @ pROW()+1, 0 SAY '                  ' + Parcel
                @ pROW()+1, 0 SAY '         ' + Prepiska
                @ pROW()+1, 0 SAY '                  ' + STR(Dka)
                @ pROW()+1, 0 SAY '     ' + Sobstwenos
                @ pROW()+1, 0 SAY '       Õ   ' + NOT_AKT
                @ pROW()+1, 0 SAY '               ' + DTOC(Date_n_akt)
                @ pROW()+1, 0 SAY '          Õ   ' + Nom_Pylnom
                @ pROW()+1, 0 SAY '              ' + DTOC(DATE_Pylno)
                @ pROW()+1, 0 SAY '           ' + DTOC(IN_Date)
                @ pROW()+1, 0 SAY '          ' + DTOC(Out_Date)
                @ pROW()+1, 0 SAY '        ' + Forma_Obr
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
        @ pROW()+1, 0 SAY '    : '
        @ pROW()+1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 0 SAY ' '
                @ pROW()+1, 0 SAY '            ' + STR(Kapital)
                @ pROW()+1, 0 SAY '             ' + DTOC(In_data)
                @ pROW()+1, 0 SAY '         ' + DTOC(Out_data)
                @ pROW()+1, 0 SAY '          ' + Dokument
                @ pROW()+1, 0 SAY '            Õ   ' + Nom_dokum
                @ pROW()+1, 0 SAY '               ' + DTOC(Data_dokum)
                @ pROW()+1, 0 SAY ' '
                SKIP +1
        ENDDO
ENDIF
SET PRINTER TO
SET DEVICE TO SCREEN
RETURN

*********************************    3 *****************************
PROCEDURE  f_prt3
SET PRINTER TO TEMP.TXT
SET DEVICE TO PRINT
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY '                      -'
@ pROW()+1, 0 SAY '„¬„¤„«±Ŗ  ®®Æ„° ¶Øæ ­   ±²­Ø ²®Æ ­Ø  , ±. ²®Ø« ¢®©¢®¤ '
@ pROW()+1, 0 SAY '·„²®¢®¤±²¢® - ²„«„“®­: 20-70'
@ pROW()+1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@ pROW()+1, 0 SAY ' '
SELECT I_KART
Nom_p = NOM_KART
@ pROW()+1, 0 SAY '  : ' + STR(NOM_KART)
@ pROW()+1, 0 SAY '         : ' + IME
@ pROW()+1, 0 SAY '                : ' + STR(EGN)
@ pROW()+1, 0 SAY '..          : ' + LP_SER
@ pROW()+1, 0 SAY '..          : ' + LP_NOM
@ pROW()+1, 0 SAY '     : ' + DTOC(DATE_IZD)
@ pROW()+1, 0 SAY '    : ' + MQSTO_IZD
@ pROW()+1, 0 SAY '       : ' + NAS_MQSTO
@ pROW()+1, 0 SAY '              : ' + ADRES
@ pROW()+1, 0 SAY '            : ' + PHONE
@ pROW()+1, 0 SAY '          : ' + NOTE
@ pROW()+1, 0 SAY ' '

SELECT  POLZA
SET INDEX TO I_LNOM
GO TOP
SEEK Nom_p
IF FOUND()
        @ pROW()+1, 0 SAY ' '
        @ pROW()+1, 0 SAY '    : '
        @ pROW()+1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 0 SAY ' '
                @ pROW()+1, 0 SAY '      : ' + STR(DKA)
                @ pROW()+1, 0 SAY '  : ' + KULTURA
                @ pROW()+1, 0 SAY ' : ' + DTOC(IN_DATA)
                @ pROW()+1, 0 SAY '  : ' + DTOC(OUT_DATA)
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
        @ pROW()+1, 0 SAY '    : '
        @ pROW()+1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 0 SAY ' '
                @ pROW()+1, 0 SAY '                 ' + Zemlishte
                @ pROW()+1, 0 SAY '                  ' + Parcel
                @ pROW()+1, 0 SAY '         ' + Prepiska
                @ pROW()+1, 0 SAY '                  ' + STR(Dka)
                @ pROW()+1, 0 SAY '     ' + Sobstwenos
                @ pROW()+1, 0 SAY '       Õ   ' + NOT_AKT
                @ pROW()+1, 0 SAY '               ' + DTOC(Date_n_akt)
                @ pROW()+1, 0 SAY '          Õ   ' + Nom_Pylnom
                @ pROW()+1, 0 SAY '              ' + DTOC(DATE_Pylno)
                @ pROW()+1, 0 SAY '           ' + DTOC(IN_Date)
                @ pROW()+1, 0 SAY '          ' + DTOC(Out_Date)
                @ pROW()+1, 0 SAY '        ' + Forma_Obr
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
        @ pROW()+1, 0 SAY '    : '
        @ pROW()+1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 0 SAY ' '
                @ pROW()+1, 0 SAY '            ' + STR(Kapital)
                @ pROW()+1, 0 SAY '             ' + DTOC(In_data)
                @ pROW()+1, 0 SAY '         ' + DTOC(Out_data)
                @ pROW()+1, 0 SAY '          ' + Dokument
                @ pROW()+1, 0 SAY '            Õ   ' + Nom_dokum
                @ pROW()+1, 0 SAY '               ' + DTOC(Data_dokum)
                @ pROW()+1, 0 SAY ' '
                SKIP +1
        ENDDO
ENDIF
SET PRINTER TO
SET DEVICE TO SCREEN
RETURN

*********************************    1 **********************
PROCEDURE f_prt1

DO pr_fkasa

B := ARRAY(6)
SET PRINTER TO TEMP.TXT
SET DEVICE TO PRINT
DO ZAGL_STR
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY ' ___________________________________________________________________________________________________________________________________ '
@ pROW()+1, 0 SAY '|                       |           |                                                                 |'
@ pROW()+1, 0 SAY '|____________________________|               |______________________________________________________________________________________|'
@ pROW()+1, 0 SAY '|     |     |    |               |                                | .. .|  ..Õ   |      |  .|'
@ pROW()+1, 0 SAY '|__________|________|________|_______________|___________________________________|__________|__________|_______________|____________|'
@ pROW()+1, 0 SAY ' '
Red := 7
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
                Red := 7
                @ pROW()+1, 0 SAY ' ___________________________________________________________________________________________________________________________________ '
                @ pROW()+1, 0 SAY '|                       |           |                                                                 |'
                @ pROW()+1, 0 SAY '|____________________________|               |______________________________________________________________________________________|'
                @ pROW()+1, 0 SAY '|     |     |    |               |                                | .. .|  ..Õ   |      |  .|'
                @ pROW()+1, 0 SAY '|__________|________|________|_______________|___________________________________|__________|__________|_______________|____________|'
                @ pROW()+1, 0 SAY ' '
        ENDIF
        SELECT I_KART
        SKIP +1
ENDDO
@ pROW()+1, 0 SAY SpS
SET PRINTER TO
SET DEVICE TO SCREEN
RETURN

******************************************************************************
PROCEDURE Spr_prt

DEFI WIND db_p2 FROM 6 ,25 TO 12,60 TITLE "     ";
        'ŚÄĻÓŁÄĄÓ' FLOAT SHADOW COLOR SCHEME 8
ACTIVATE WINDOW db_p2
@  1,0 SAY '        !!!       '
@  3,0 SAY '      .    '

DO CASE
        CASE PBAR() = 1
        DO f_prt1

        CASE PBAR() = 2
        DO f_prt2

        CASE PBAR() = 3
        DO f_prt3
ENDCASE

RELEASE WINDOW db_p2
RETURN

******************************* FILE KASA *******************************
PROCEDURE pr_fkasa

SELECT kasa_k
IF FILE('kasa.dbf')
        ZAP
ENDIF



RETURN


*************************************************************************
*                                   END
*************************************************************************


