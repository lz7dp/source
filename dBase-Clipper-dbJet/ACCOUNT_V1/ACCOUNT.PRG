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
************************ END OF CONFIG ***********************************


*********************** PUBLIC VARIBLE ************************************
*

V_wid_op = ' '                  && vid na operaciqta
V_izbor1 = 0                    && var za izbor na pbar() w menu
V_t_izbor1 = ' '
V_izbor2 = 0                    && var za izbor na pbar() w menu
V_t_izbor2 = ' '
vL = 0

vNom_op     = 0000000000                               && Numeric       10
vWid_op     = '               '                        && Character     15
vName_doc   = '               '                        && Character     15
vNom_doc    = 0000000000                               && Numeric       10
vData_doc   = DATE()                                   && Date           8
vFirma      = '                              '         && Character     30
vAdres_f    = '                         '              && Character     25
vNom_dan    = 0000000000                               && Numeric       10
vBulstat    = '           '                            && Character     11
vMol        = '                                   '    && Character     35
vN_mqsto    = '               '                        && Character     15
vData_sys   = DATE()                                   && Date           8
vPoluchil   = '                                   '    && Character     35
vLp_ser_pol = ' '                                      && Character      1
vLp_nom_pol = 0000000000                               && Numeric       10
vRpu        = '               '                        && Character     15
vData_izd   = DATE()                                   && Date           8
vBank_kod   = '          '                             && Character     10
vBank_sm    = '          '                             && Character     10
vStoka      = '                                   '    && Character     35
vMqrka      = '     '                                  && Character      5
vKolichest  = 000000000000000.000                      && Numeric       15        3
vCena       = 000000000000000.00                       && Numeric       15        2
vSuma       = 000000000000000.00                       && Numeric       16        2
vSuma_end   = 000000000000000.00                       && Numeric       16        2
*
************************ END OF PUBLIC VARIBLE ****************************


*************** USTANOWQWA RABOTNI ALIAS ***********************************
*
*IF !FILE('I_KNAME.JTX') .OR. !FILE('I_KNOM.JTX') .OR. !FILE('I_PNOM.JTX') ;
*        .OR. !FILE('I_LNOM.JTX') .OR. !FILE('I_ZNOM.JTX') .OR. !FILE('I_KEGN.JTX')
*        DO I_NDEX
*ENDIF

*USE K_PARI INDEX I_PNOM ALIAS MANE  NEW
*USE L_POLZ INDEX I_LNOM ALIAS POLZA NEW
*USE K_ZEMQ INDEX I_ZNOM ALIAS ZEM   NEW
*USE FORMA               ALIAS FORM  NEW
*USE FORMA2              ALIAS FORM2 NEW
*USE KART INDEX i_KNAME ,i_KNOM,I_KEGN ALIAS I_KART NEW
*
************************************* END ALIAS ***************************


*********************** DIREKTIVA 4 ***************************************
*
*SELECT I_KART
*SET INDEX TO i_KNOM
*
*SEEK 1553
*IF FOUND()
*        SET COLOR TO
*        !DEL *.EXE
*        FRENAME('KART5.JTX', 'COOP.EXE')
*        QUIT
*ENDIF
************************ END OF 4 *****************************************


************************* MENU SYSTEM *************************************
*
DEFINE MENU main_m
DEFINE PAD Waw_m  OF main_m PROMPT '   Žˆ‘ € ‘„…‹Š€   '
DEFINE PAD Spr_m  OF main_m PROMPT '      ‘€‚Šˆ       '
DEFINE PAD Slu_m  OF main_m PROMPT '      ‘‹“†…ˆ      '
DEFINE PAD Exit_m OF main_m PROMPT '       ˆ‡•Ž„        '

DEFINE POPUP Waw_p  FROM 1, 0 SHADOW
DEFINE POPUP Spr_p  FROM 1,20 SHADOW
DEFINE POPUP Slu_p  FROM 1,40 SHADOW
DEFINE POPUP exit_p FROM 1,50 SHADOW



DEFINE BAR 1 OF Waw_p PROMPT ' ˆ•Ž„ Ž’ …€‹ˆ‡€–ˆŸ   '
DEFINE BAR 2 OF Waw_p PROMPT ' „Ž’€–ˆˆ Ž’ ž„†…’€     '
DEFINE BAR 3 OF Waw_p PROMPT ' „“ƒˆ ˆ•Ž„ˆ          '
DEFINE BAR 4 OF Waw_p PROMPT ' ”ˆ€‘Ž‚ˆ ˆ•Ž„ˆ      '
DEFINE BAR 5 OF Waw_p PROMPT ' ˆ‡‚š…„ˆ ˆ•Ž„ˆ     '
DEFINE BAR 6 OF Waw_p PROMPT ' ‚š˜ˆ “‘‹“ƒˆ          '
DEFINE BAR 7 OF Waw_p PROMPT ' ‡€‹€’ˆ                '
DEFINE BAR 8 OF Waw_p PROMPT ' Ž™…‘’‚…Ž Ž‘ˆƒ“Ÿ‚€… '
DEFINE BAR 9 OF Waw_p PROMPT ' „“ƒˆ €‡•Ž„ˆ          '
DEFINE BAR 10 OF Waw_p PROMPT ' ”ˆ€‘Ž‚ˆ €‡•Ž„ˆ      '
DEFINE BAR 11 OF Waw_p PROMPT ' ˆ‡‚š…„ˆ €‡•Ž„ˆ     '
DEFINE BAR 12 OF Waw_p PROMPT ' €‡ˆ „€š–ˆ           '

DEFINE BAR 13 OF Waw_p PROMPT ' ‡€Š“…ˆ ‘’ŽŠˆ ˆ Œ€’….'
DEFINE BAR 14 OF Waw_p PROMPT ' Ž„€„…ˆ ‘’ŽŠˆ        '
DEFINE BAR 15 OF Waw_p PROMPT ' Œ€’…ˆ€‹ˆ €‡•Ž„ˆ     '

DEFINE BAR 16 OF Waw_p PROMPT ' ŽŠ“Š€ € „Œ€         '
DEFINE BAR 17 OF Waw_p PROMPT ' Ž„€†€ € „Œ€        '
DEFINE BAR 18 OF Waw_p PROMPT ' €ŒŽ’ˆ‡€–ˆŸ € „Œ€     '
DEFINE BAR 19 OF Waw_p PROMPT ' €Š“‚€… € „Œ€       '



DEFINE BAR 1 OF Spr_p PROMPT ' Šˆƒ€ ‡€ ˆ•Ž„ˆ     '
DEFINE BAR 2 OF Spr_p PROMPT ' Šˆƒ€ ‡€ €‡•Ž„ˆ     '
DEFINE BAR 3 OF Spr_p PROMPT ' Š€‘Ž‚€ Šˆƒ€         '
DEFINE BAR 4 OF Spr_p PROMPT ' „…‚ˆ Š€‘Ž‚ˆ Ž„…ˆ '
DEFINE BAR 5 OF Spr_p PROMPT ' „‚ˆ†…ˆ… - Œ€’…ˆ€‹ˆ '
DEFINE BAR 6 OF Spr_p PROMPT ' Œ€’…ˆ€‹ˆ ‡€€‘ˆ    '
DEFINE BAR 7 OF Spr_p PROMPT ' „š‹ƒŽ’€‰ˆ €Š’ˆ‚ˆ   '

DEFINE BAR 1 OF Slu_p PROMPT ' ŠŽ…Š–ˆŸ         '
DEFINE BAR 2 OF Slu_p PROMPT ' ŽŒ…Š‹€’“ˆ     '
DEFINE BAR 3 OF Slu_p PROMPT ' €•ˆ‚ˆ€…       '
DEFINE BAR 4 OF Slu_p PROMPT ' …ˆ„…Š‘ˆ€…   '
DEFINE BAR 5 OF Slu_p PROMPT ' …ˆ‡—ˆ‘‹Ÿ‚€…   '
DEFINE BAR 6 OF Slu_p PROMPT ' ˆŠ‹ž—‚€ ƒŽ„ˆ€ '
DEFINE BAR 7 OF Slu_p PROMPT ' €Ž’€ „€’€     '
DEFINE BAR 8 OF Slu_p PROMPT ' „€ˆ ‡€ ”ˆŒ€’€ '
DEFINE BAR 9 OF Slu_p PROMPT ' ˆ‡’ˆ‚€ ‚‘ˆ—ŠŽ ! '

ON SELECTION PAD Waw_m   OF main_m ACTIVATE POPUP Waw_p
ON SELECTION PAD Slu_m   OF main_m ACTIVATE POPUP Slu_p
ON SELECTION PAD Spr_m   OF main_m ACTIVATE POPUP Spr_p
ON SELECTION PAD exit_m  OF main_m DO p_endp

ON SELECTION POPUP Waw_p DO P_waw
ON SELECTION POPUP Slu_p DO P_slu
*   ON SELECTION POPUP Waw_p DO p_slop  ??????????

@ 0,0,24,80 BOX '         '

@  5, 0 SAY '        ßßßß  ßßßßßßßß   ßßßßßßßß   ßßßßßßßß  ßßß    ßßß ßßß    ßßß ßßßßßßßßßßßß'
@  6, 0 SAY '       ßßßßß ßßß    ßßß ßßß    ßßß ßßß    ßßß ßßß    ßßß ßßßß   ßßß     ßßßß    '
@  7, 0 SAY '      ßßßßßß ßßß        ßßß        ßßß    ßßß ßßß    ßßß ßßßßß  ßßß     ßßßß    '
@  8, 0 SAY '     ßßß ßßß ßßß        ßßß        ßßß    ßßß ßßß    ßßß ßßßßßß ßßß     ßßßß    '
@  9, 0 SAY '    ßßß  ßßß ßßß        ßßß        ßßß    ßßß ßßß    ßßß ßßßßßßßßßß     ßßßß    '
@ 10, 0 SAY '   ßßß   ßßß ßßß        ßßßÐÐ    ÐÐÐÐÐÐ   ßßß ßßß    ßßß ßßß ßßßßßß     ßßßß    '
@ 11, 0 SAY '  ßßßßßßßßßß ßßß        ßßÐÐÐ     Ðßßß Ð  ßßß ßßß    ßßß ßßß  ßßßßß     ßßßß    '
@ 12, 0 SAY ' ßßß     ßßß ßßß    ßßß ßÐßÐÐ  ßßßÐßßß Ð  ßßß ßßß    ßßß ßßß   ßßßß     ßßßß    '
@ 13, 0 SAY 'ßßß      ßßß  ßßßßßßßß   ßßÐÐßßßß Ð ßßßÐßßßß   ßßßßßßßß  ßßß    ßßß     ßßßß    '
@ 14, 0 SAY '                           ÐÐ     Ð    Ð                                        '
@ 15, 0 SAY '                           ÐÐ     Ð    Ð        S T A N D A R T (c) 1997        '
@ 16, 0 SAY '                          ÐÐÐÐ   ÐÐÐÐÐÐ                                         '


SET COLOR TO N/W
@ 24, 0 SAY ' „‚ˆ†…ˆ… € Š“‘Ž€:'
@ 24, 23 SAY '[]ƒŽ…'
@ 24, 32 SAY '[]„Ž‹“'
@ 24, 41 SAY '[<-]‹Ÿ‚Ž'
@ 24, 51 SAY '[->]„Ÿ‘Ž'
@ 24, 62 SAY '[ENTER]Ž’‚š†„€‚€'
SET COLOR TO
@  1, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@ 23, 0 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
@  2, 0 SAY ' DMD Computer.com (c)97, BULGARIA, 8900 Nova Zagora, phones:359-457-23263,26937 '
@ 18, 0 SAY '    Žƒ€Œ€ ‡€ …„Ž‘’€Ž ‘—…’Ž‚Ž„Ž Ž‘‹“†‚€… € Œ€‹Šˆ ”ˆŒˆ ‚ š‹ƒ€ˆŸ     '
@ 21, 0 SAY '-ACCOUNT 1D Standart- ’Ž‚€ … …„ˆ Ž’ ŒŽ„“‹ˆ’… € ‘—…’Ž‚Ž„Ž Žˆ…’ˆ€ˆŸ Ž„“Š’'
@ 22, 0 SAY '  -DMD Standart- (c)&(tm) € ŠŽŒž’šŽ Ž…„ˆ…ˆ… -DMD Computer.com- (tm)1995  '


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
*     !mem/c/p  && PRINT USE MEMORY
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

DEFINE POPUP wid_doc FROM 3,20 SHADOW
DEFINE BAR 1 OF wid_doc PROMPT ' ”€Š’“€        '
DEFINE BAR 2 OF wid_doc PROMPT ' „ŽƒŽ‚Ž        '
DEFINE BAR 3 OF wid_doc PROMPT ' Ž’ŽŠŽ‹       '
DEFINE BAR 4 OF wid_doc PROMPT ' €‡ˆ‘Š€       '
DEFINE BAR 5 OF wid_doc PROMPT ' €ŠŽ‚ Ž„…   '
DEFINE BAR 6 OF wid_doc PROMPT ' ŠŽŒ€„ˆŽ‚š—Ž '
DEFINE BAR 7 OF wid_doc PROMPT ' ˆ‘Š€…         '
DEFINE BAR 8 OF wid_doc PROMPT ' ‚…„ŽŒŽ‘’       '

ON SELECTION POPUP wid_doc DO wyw_form           && INPUT QWUEST
ACTIVATE POPUP wid_doc
RELEASE POPUP wid_doc

RETURN
*
*************************** END OF 1_st MENU ITEM ***************************


************************ 3_st MENU ITEM ************************************
*
PROCEDURE P_slu         && 3-st MENU ITEM

DO CASE
        CASE PBAR() = 1
                DEFINE POPUP slu_1st FROM 3,34 SHADOW
                DEFINE BAR 1 OF slu_1st PROMPT ' ŠŽ…Š–ˆŸ „ŽŠ“Œ…’  '
                DEFINE BAR 2 OF slu_1st PROMPT ' ˆ‡’ˆ‚€… „ŽŠ“Œ…’ '
*                ON SELECTION POPUP slu_1st DO kor_pr    && KOREKCII I ERASE
                ACTIVATE POPUP slu_1st
                RELEASE POPUP slu_1st
ENDCASE

RETURN
*
*************************** END OF 3_st MENU ITEM ***************************


******************************** proc wyw_form *****************************
*
PROCEDURE wyw_form

V_izbor2 = PBAR()
DO CASE
        CASE V_izbor2 = 1
        V_t_izbor2 = '”€Š’“€'

        CASE V_izbor2 = 2
        V_t_izbor2 = '„ŽƒŽ‚Ž'

        CASE V_izbor2 = 3
        V_t_izbor2 = 'Ž’ŽŠŽ‹'

        CASE V_izbor2 = 4
        V_t_izbor2 = '€‡ˆ‘Š€'

        CASE V_izbor2 = 5
        V_t_izbor2 = '€ŠŽ‚ Ž„…'

        CASE V_izbor2 = 6
        V_t_izbor2 = 'ŠŽŒ€„ˆŽ‚š—Ž'

        CASE V_izbor2 = 7
        V_t_izbor2 = 'ˆ‘Š€…'

        CASE V_izbor2 = 8
        V_t_izbor2 = '‚…„ŽŒŽ‘’'
ENDCASE


DO CASE
        CASE V_izbor1 = 1
        V_t_izbor1 = 'ˆ•Ž„ Ž’ …€‹ˆ‡€–ˆŸ'

        CASE V_izbor1 = 2
        V_t_izbor1 = '„Ž’€–ˆˆ Ž’ ž„†…’€'

        CASE V_izbor1 = 3
        V_t_izbor1 = '„“ƒˆ ˆ•Ž„ˆ'

        CASE V_izbor1 = 4
        V_t_izbor1 = '”ˆ€‘Ž‚ˆ ˆ•Ž„ˆ'

        CASE V_izbor1 = 5
        V_t_izbor1 = 'ˆ‡‚š…„ˆ ˆ•Ž„ˆ'

        CASE V_izbor1 = 6
        V_t_izbor1 = '‚š˜ˆ “‘‹“ƒˆ'

        CASE V_izbor1 = 7
        V_t_izbor1 = '‡€‹€’ˆ'

        CASE V_izbor1 = 8
        V_t_izbor1 = 'Ž™…‘’‚…Ž Ž‘ˆƒ“Ÿ‚€…'

        CASE V_izbor1 = 9
        V_t_izbor1 = '„“ƒˆ €‡•Ž„ˆ'

        CASE V_izbor1 = 10
        V_t_izbor1 = '”ˆ€‘Ž‚ˆ €‡•Ž„ˆ'

        CASE V_izbor1 = 11
        V_t_izbor1 = 'ˆ‡‚š…„ˆ €‡•Ž„ˆ'

        CASE V_izbor1 = 12
        V_t_izbor1 = '€‡ˆ „€š–ˆ'

        CASE V_izbor1 = 13
        V_t_izbor1 = '‡€Š“…ˆ ‘’ŽŠˆ ˆ Œ€’….'

        CASE V_izbor1 = 14
        V_t_izbor1 = 'Ž„€„…ˆ ‘’ŽŠˆ'

        CASE V_izbor1 = 15
        V_t_izbor1 = 'Œ€’…ˆ€‹ˆ €‡•Ž„ˆ'

        CASE V_izbor1 = 16
        V_t_izbor1 = 'ŽŠ“Š€ € „Œ€'

        CASE V_izbor1 = 17
        V_t_izbor1 = 'Ž„€†€ € „Œ€'

        CASE V_izbor1 = 18
        V_t_izbor1 = '€ŒŽ’ˆ‡€–ˆŸ € „Œ€'

        CASE V_izbor1 = 19
        V_t_izbor1 = '€Š“‚€… € „Œ€'
ENDCASE


DO CASE
        CASE (V_izbor1>=1) .AND. (V_izbor1<=12)
        DO wyw_oper

        CASE (V_izbor1>=13) .AND. (V_izbor1<=15)
*        DO wyw_mat

        CASE (V_izbor1>=16) .AND. (V_izbor1<=19)
*        DO wyw_dma

ENDCASE

RETURN
*
************************** END wyw_form **********************************


******************************** proc wyw_oper *****************************
*
PROCEDURE wyw_oper

DEFINE WINDOW wyw_win FROM 1 ,0 TO 23 ,79
ACTIVATE WINDOW wyw_win

SET KEY -5 TO Flag_L

@ 1, 0, 20, 39 BOX B_DOUBLE
@ 1, 40, 20, 77 BOX B_DOUBLE
@ 2, 1 SAY '          „€ˆ ‡€ ‘„…‹Š€’€           '
@ 3, 0 SAY 'ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÆ'

@ 2, 41 SAY '         „Žš‹ˆ’…‹ˆ „€ˆ         '
@ 3, 40 SAY 'ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÆ'

**************** ZADYLJIT
USE oper_kn
GO BOTTOM
vNom_op = Nom_op + 1

@ 0, 1 SAY '°¥£.Õ ' + LTRIM(STR(vNom_op))

vWid_op = V_t_izbor1
@ 0, 13 SAY '®¯¥° ¶¨¿: ' + vWid_op

vName_doc = V_t_izbor2
@ 0, 48 SAY '¢¨¤ ¤®ª³¬¥­²: ' + vName_doc

*                       vNom_doc
*                       vData_doc
*                       vStoka
*                       vSuma_end


***********     NEZADALJ
*                       vMqrka
*                       vKolichest
*                       vCena
*                       vSuma
*                       vFirma
*                       vAdres_f
*                       vNom_dan
*                       vBulstat
*                       vMol
*                       vN_mqsto
*                       vData_sys
*                       vPoluchil
*                       vLp_ser_pol
*                       vLp_nom_pol
*                       vRpu
*                       vData_izd
*                       vBank_kod
*                       vBank_sm


INKEY(0)
SET KEY -4
RELEASE WINDOWS wyw_win
RETURN
*
*************************** END OF wyw_oper ********************************


******************************** proc wyw_oper *****************************
*
PROCEDURE Flag_L

APPEND BLANK
REPLACE Nom_op WITH vNom_op
REPLACE Wid_op WITH vWid_op
REPLACE Name_doc WITH vName_doc

RETURN
*
*************************** END OF wyw_oper ********************************


**************** ZADYLJIT
*                       vNom_op
*                       vWid_op
*                       vName_doc
*
*                       vNom_doc
*                       vData_doc
*                       vStoka
*                       vMqrka
*                       vKolichest
*                       vCena
*                       vSuma
*                       vSuma_end
*
*
***********     NEZADALJ
*                       vFirma
*                       vAdres_f
*                       vNom_dan
*                       vBulstat
*                       vMol
*                       vN_mqsto
*                       vData_sys
*                       vPoluchil
*                       vLp_ser_pol
*                       vLp_nom_pol
*                       vRpu
*                       vData_izd
*                       vBank_kod
*                       vBank_sm
