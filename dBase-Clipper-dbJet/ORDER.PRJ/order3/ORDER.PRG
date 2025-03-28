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

@  6, 0 SAY '       ���������    ����������    ���������     ����������    ����������        '
@  7, 0 SAY '      ���     ���   ���     ���   ���     ���   ���           ���     ���       '
@  8, 0 SAY '      ���     ���   ���     ���   ���     ���   ���           ���     ���       '
@  9, 0 SAY '      ���     ���   ���     ���   ���     ���   ���           ���     ���       '
@ 10, 0 SAY '      ���     ���   ����������    ���     ���   �������       ����������        '
@ 11, 0 SAY '      ���     ���   ���  ���      ���     ���   ���           ���  ���          '
@ 12, 0 SAY '      ���     ���   ���   ���     ���   STANDART (c)1997      ���   ���         '
@ 13, 0 SAY '      ���     ���   ���    ���    ���     ���   ���           ���    ���        '
@ 14, 0 SAY '       ���������    ���     ���   ���������     �����������   ���     ���       '


SET COLOR TO N/W
@ 24, 0 SAY ' �������� �� �������:'
@ 24, 23 SAY '[]����'
@ 24, 32 SAY '[]����'
@ 24, 41 SAY '[-]����'
@ 24, 51 SAY '[-]�����'
@ 24, 62 SAY '[ENTER]�����������'
SET COLOR TO
@  1, 0 SAY '��������������������������������������������������������������������������������'
@ 23, 0 SAY '��������������������������������������������������������������������������������'
@  2, 0 SAY 'DMD Computer.com(c)97, BULGARIA, 8900 Nova Zagora, phones(+359)0-457-23263/26937'
@ 18, 0 SAY '         �������� �� ���������� �� ������ ��������� �� �������� AJUR_S          '
@ 21, 0 SAY '  -ORDER Standart- ���� � ���� �� �������� �� ���������� ������������ �������   '
@ 22, 0 SAY '  -DMD Standart- (c)&(tm) �� ���������� ���������� -DMD Computer.com- (tm)1995  '
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
PUBLIC SpS
SpS := ''
vL_str := 55
vIme_F := '�� �������-������� ������'
*
************************ END OF PUBLIC VARIBLE ****************************


************************* MENU SYSTEM *************************************
*
DEFINE MENU main_m
DEFINE PAD Waw_m  OF main_m PROMPT ' ���������-�������� '
DEFINE PAD Spr_m  OF main_m PROMPT '   ���� �� AJUR_S   '
DEFINE PAD Slu_m  OF main_m PROMPT '     ���������      '
DEFINE PAD Exit_m OF main_m PROMPT '       �����        '

DEFINE POPUP Waw_p  FROM 1, 0 SHADOW
DEFINE POPUP Spr_p  FROM 1,20 SHADOW
DEFINE POPUP Slu_p  FROM 1,40 SHADOW
DEFINE POPUP exit_p FROM 1,50 SHADOW

DEFINE BAR 1 OF Waw_p PROMPT '  �������� �����  '
DEFINE BAR 2 OF Waw_p PROMPT '  �������� �����  '

DEFINE BAR 1 OF Slu_p PROMPT ' ������ �����    '
DEFINE BAR 2 OF Slu_p PROMPT ' �������� ������ '
DEFINE BAR 3 OF Slu_p PROMPT ' �������� ������ '

ON SELECTION PAD Waw_m  OF main_m ACTIVATE POPUP Waw_p
ON SELECTION PAD Slu_m  OF main_m ACTIVATE POPUP Slu_p
ON SELECTION PAD Spr_m  OF main_m ACTIVATE POPUP Spr_p
ON SELECTION PAD exit_m OF main_m DO p_endp

ON SELECTION POPUP Waw_p DO I_NDEX
ON SELECTION POPUP Slu_p DO Spr_prt
*ON SELECTION POPUP Spr_p DO

@ 0,0,24,80 BOX '         '

@  6, 0 SAY '       ���������    ����������    ���������     ����������    ����������        '
@  7, 0 SAY '      ���     ���   ���     ���   ���     ���   ���           ���     ���       '
@  8, 0 SAY '      ���     ���   ���     ���   ���     ���   ���           ���     ���       '
@  9, 0 SAY '      ���     ���   ���     ���   ���     ���   ���           ���     ���       '
@ 10, 0 SAY '      ���     ���   ����������    ���     ���   �������       ����������        '
@ 11, 0 SAY '      ���     ���   ���  ���      ���     ���   ���           ���  ���          '
@ 12, 0 SAY '      ���     ���   ���   ���     ���   STANDART (c)1997      ���   ���         '
@ 13, 0 SAY '      ���     ���   ���    ���    ���     ���   ���           ���    ���        '
@ 14, 0 SAY '       ���������    ���     ���   ���������     �����������   ���     ���       '

SET COLOR TO N/W
@ 24, 0 SAY ' �������� �� �������:'
@ 24, 23 SAY '[]����'
@ 24, 32 SAY '[]����'
@ 24, 41 SAY '[-]����'
@ 24, 51 SAY '[-]�����'
@ 24, 62 SAY '[ENTER]�����������'
SET COLOR TO
@  1, 0 SAY '��������������������������������������������������������������������������������'
@ 23, 0 SAY '��������������������������������������������������������������������������������'
@  2, 0 SAY 'DMD Computer.com(c)97, BULGARIA, 8900 Nova Zagora, phones(+359)0-457-23263/26937'
@ 18, 0 SAY '         �������� �� ���������� �� ������ ��������� �� �������� AJUR_S          '
@ 21, 0 SAY '  -ORDER Standart- ���� � ���� �� �������� �� ���������� ������������ �������   '
@ 22, 0 SAY '  -DMD Standart- (c)&(tm) �� ���������� ���������� -DMD Computer.com- (tm)1995  '


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
        V_t_izbor1 = '�������� ����� �����'

        CASE V_izbor1 = 2
        V_t_izbor1 = '�������� ����� �����'
ENDCASE

DO wyw_oper

CLOSE DATABASE
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

@ 2, 1 SAY   '                               ����� �� ������                              '
@ 3, 0 SAY  '������������������������������������������������������������������������������'

@ 12, 0 SAY '       ��������� �� ����� �� �����������, ���� ������������� �� ������,       '
@ 13, 0 SAY '                         ����� �� �������� ���������.                         '
@ 14, 0 SAY '           �������� �� ���� ������� ����� �� �����������, ���� ����           '
@ 15, 0 SAY '               ��������� ������ �� �������, ����� �� ����������.              '
@ 16, 1 SAY '       ��������� �� ������� �� �����������, ���� ������� ��� ����������       '
@ 17, 1 SAY '                 ��� � ��������� �������������� �� ���������                  '
@ 18, 1 SAY '  [F5], [ENTER] - ������ ���������� � ���������� � ���� �� �� ������� ����,   '
@ 19, 1 SAY '                              ���� �������� !!!                               '
@ 20, 1 SAY '        ����� ��� ��������� �� ������� - ��������� 2 ���� ������ [ESC]        '

GO BOTTOM
vNom_op = NOM + 1

vWid_op = V_t_izbor1
@ 0, 35 SAY '��������: ' + vWid_op

@ 0, 1 SAY '�������������� � ' GET vNom_op
READ

DO CASE
        CASE V_izbor1 = 1
        SEEK vNom_op
        IF FOUND()
                vData_sys = DATA
                vSuma     = SUMA
                vPoluchil = IME
                vSdelka   = SDELKA
                @  4, 3 SAY '���� �� ���������:                           ' GET vData_sys
                @  5, 3 SAY '���� �� ������   :                    '        GET vSuma
                @  6, 3 SAY '��� �� ����������:'                            GET vPoluchil
                @  7, 3 SAY '���� �� ������   :          '                  GET vSdelka
                READ
        ENDIF
        IF !FOUND()
                vSuma     = 000000000000000
                vPoluchil = '          �� �������               '
                vSdelka   = '�������� �����           '
                @  4, 3 SAY '���� �� ���������:                           ' GET vData_sys
                @  5, 3 SAY '���� �� ������   :                         '   GET vSuma
                @  6, 3 SAY '��� �� ����������:'                            GET vPoluchil
                @  7, 3 SAY '���� �� ������   :          '                  GET vSdelka
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
                @  4, 3 SAY '���� �� ���������:                           ' GET vData_sys
                @  5, 3 SAY '���� �� ������   :                    '        GET vSuma
                @  6, 3 SAY '��� �� ����������:'                            GET vPoluchil
                @  7, 3 SAY '���� (����)      :          '                  GET vAdres_Gr
                @  8, 3 SAY '�����            :          '                  GET vAdres_Ul
                @  9, 3 SAY '�����            :               '             GET vAdres_Nom
                @ 10, 3 SAY '���� �� �������� :          '                  GET vSdelka
                READ
        ENDIF
        IF !FOUND()
                vSuma     = 000000000000000
                vPoluchil = '          �� �������               '
                vSdelka   = '�������� �����           '
                @  4, 3 SAY '���� �� ���������:                           ' GET vData_sys
                @  5, 3 SAY '���� �� ������   :                         '   GET vSuma
                @  6, 3 SAY '��� �� ����������:'                            GET vPoluchil
                @  7, 3 SAY '���� (����)      :          '                  GET vAdres_Gr
                @  8, 3 SAY '�����            :          '                  GET vAdres_Ul
                @  9, 3 SAY '�����            :               '             GET vAdres_Nom
                @ 10, 3 SAY '���� �� �������� :          '                  GET vSdelka
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


**************** ����������� - ���� �������� ����� �� ������� �� �������� ****
*
PROCEDURE I_NDEX

CLOSE DATABASE

DEFI WIND Winind FROM 10, 13 TO 15, 67 '��������' FLOAT SHADOW COLOR SCHEME 2
ACTIVATE WINDOW WinInd

SET CURSOR OFF
@ 0 ,0 SAY  "������������������ �������������� �������������������"
@ 1 ,0 SAY  "�0    10   20   30   40   50   60   70   80   90 100�"
@ 2 ,0 SAY  "�����������������������������������������������������"
@ 3 ,0 SAY  "�����������������������������������������������������"
ERASE prih.jtx
ERASE razh.jtx
@ 0 ,0 SAY  "������������������ �������������� �������������������"
@ 1 ,0 SAY  "�0    10   20   30   40   50   60   70   80   90 100�"
@ 2 ,0 SAY  "�����������������������������������������������������"
@ 3 ,0 SAY  "�����������������������������������������������������"
USE kasa_pr
@ 0 ,0 SAY  "������������������ �������������� �������������������"
@ 1 ,0 SAY  "�0    10   20   30   40   50   60   70   80   90 100�"
@ 2 ,0 SAY  "�����������������������������������������������������"
@ 3 ,0 SAY  "�����������������������������������������������������"
INDEX ON NOM TO prih
@ 0 ,0 SAY  "������������������ �������������� �������������������"
@ 1 ,0 SAY  "�0    10   20   30   40   50   60   70   80   90 100�"
@ 2 ,0 SAY  "�����������������������������������������������������"
@ 3 ,0 SAY  "�����������������������������������������������������"
USE kasa_raz
@ 0 ,0 SAY  "������������������ �������������� �������������������"
@ 1 ,0 SAY  "�0    10   20   30   40   50   60   70   80   90 100�"
@ 2 ,0 SAY  "�����������������������������������������������������"
@ 3 ,0 SAY  "�����������������������������������������������������"
INDEX ON NOM TO razh
@ 0 ,0 SAY  "������������������ �������������� �������������������"
@ 1 ,0 SAY  "�0    10   20   30   40   50   60   70   80   90 100�"
@ 2 ,0 SAY  "�����������������������������������������������������"
@ 3 ,0 SAY  "�����������������������������������������������������"
USE kasa_kn
INDEX ON DATA TO kasa
@ 0 ,0 SAY  "������������������ �������������� �������������������"
@ 1 ,0 SAY  "�0    10   20   30   40   50   60   70   80   90 100�"
@ 2 ,0 SAY  "�����������������������������������������������������"
@ 3 ,0 SAY  "�����������������������������������������������������"

@ 0 ,0 SAY  "������������������ �������������� �������������������"
@ 1 ,0 SAY  "�0    10   20   30   40   50   60   70   80   90 100�"
@ 2 ,0 SAY  "�����������������������������������������������������"
@ 3 ,0 SAY  "�����������������������������������������������������"

SET CURSOR ON
RELEASE WINDOWS Winind

DO P_waw

RETURN
*
*********************************************************


********pko***************** �������� �� ����� 2 *****************************
PROCEDURE  f_prt2
SET PRINTER TO PKO.TXT
SET DEVICE TO PRINT


@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY '                    ������� �� ����-����������'
@ pROW()+1, 0 SAY '���������� ���������� �� ������ ������� ���� ���, �. ����� �������'
@ pROW()+1, 0 SAY '������������ - �������: 20-70'
@ pROW()+1, 0 SAY '������������������������������������������������������������������'
@ pROW()+1, 0 SAY ' '
SELECT I_KART
Nom_p = NOM_KART
@ pROW()+1, 0 SAY '����� � �����������: ' + STR(NOM_KART)
@ pROW()+1, 0 SAY '����� �����        : ' + IME
@ pROW()+1, 0 SAY '���                : ' + STR(EGN)
@ pROW()+1, 0 SAY '�.�. �����         : ' + LP_SER
@ pROW()+1, 0 SAY '�.�. �����         : ' + LP_NOM
@ pROW()+1, 0 SAY '���� �� ��������   : ' + DTOC(DATE_IZD)
@ pROW()+1, 0 SAY '����� �� ��������  : ' + MQSTO_IZD
@ pROW()+1, 0 SAY '������������       : ' + NAS_MQSTO
@ pROW()+1, 0 SAY '�����              : ' + ADRES
@ pROW()+1, 0 SAY '�������            : ' + PHONE
@ pROW()+1, 0 SAY '���������          : ' + NOTE
@ pROW()+1, 0 SAY ' '

SELECT  POLZA
SET INDEX TO I_LNOM
GO TOP
SEEK Nom_p
IF FOUND()
        @ pROW()+1, 0 SAY ' '
        @ pROW()+1, 0 SAY ' ������� �� ����� ��������: '
        @ pROW()+1, 0 SAY '������������������������������������������������������������������'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 0 SAY ' '
                @ pROW()+1, 0 SAY '������      : ' + STR(DKA)
                @ pROW()+1, 0 SAY '��� ������� : ' + KULTURA
                @ pROW()+1, 0 SAY '������� ����: ' + DTOC(IN_DATA)
                @ pROW()+1, 0 SAY '������ ���� : ' + DTOC(OUT_DATA)
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
        @ pROW()+1, 0 SAY ' ������� �� ���������� ����: '
        @ pROW()+1, 0 SAY '������������������������������������������������������������������'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 0 SAY ' '
                @ pROW()+1, 0 SAY '�������                 ' + Zemlishte
                @ pROW()+1, 0 SAY '������                  ' + Parcel
                @ pROW()+1, 0 SAY '�������� �� �����       ' + Prepiska
                @ pROW()+1, 0 SAY '������                  ' + STR(Dka)
                @ pROW()+1, 0 SAY '����������� �� ������   ' + Sobstwenos
                @ pROW()+1, 0 SAY '���������� ���      �   ' + NOT_AKT
                @ pROW()+1, 0 SAY '������� ��              ' + DTOC(Date_n_akt)
                @ pROW()+1, 0 SAY '����������          �   ' + Nom_Pylnom
                @ pROW()+1, 0 SAY '�������� ��             ' + DTOC(DATE_Pylno)
                @ pROW()+1, 0 SAY '���� �� �������         ' + DTOC(IN_Date)
                @ pROW()+1, 0 SAY '���� �� ��������        ' + DTOC(Out_Date)
                @ pROW()+1, 0 SAY '����� �� ���������      ' + Forma_Obr
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
        @ pROW()+1, 0 SAY ' ������� �� ����� �������: '
        @ pROW()+1, 0 SAY '������������������������������������������������������������������'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 0 SAY ' '
                @ pROW()+1, 0 SAY '����� �������           ' + STR(Kapital)
                @ pROW()+1, 0 SAY '������� ����            ' + DTOC(In_data)
                @ pROW()+1, 0 SAY '���� �� ���������       ' + DTOC(Out_data)
                @ pROW()+1, 0 SAY '��� �� ���������        ' + Dokument
                @ pROW()+1, 0 SAY '��������            �   ' + Nom_dokum
                @ pROW()+1, 0 SAY '������� ��              ' + DTOC(Data_dokum)
                @ pROW()+1, 0 SAY ' '
                SKIP +1
        ENDDO
ENDIF
SET PRINTER TO
SET DEVICE TO SCREEN
RETURN

********************************* �������� �� ����� 3 *****************************
PROCEDURE  f_prt3
SET PRINTER TO TEMP.TXT
SET DEVICE TO PRINT
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY '                    ������� �� ����-����������'
@ pROW()+1, 0 SAY '���������� ���������� �� ������ ������� ���� ���, �. ����� �������'
@ pROW()+1, 0 SAY '������������ - �������: 20-70'
@ pROW()+1, 0 SAY '������������������������������������������������������������������'
@ pROW()+1, 0 SAY ' '
SELECT I_KART
Nom_p = NOM_KART
@ pROW()+1, 0 SAY '����� � �����������: ' + STR(NOM_KART)
@ pROW()+1, 0 SAY '����� �����        : ' + IME
@ pROW()+1, 0 SAY '���                : ' + STR(EGN)
@ pROW()+1, 0 SAY '�.�. �����         : ' + LP_SER
@ pROW()+1, 0 SAY '�.�. �����         : ' + LP_NOM
@ pROW()+1, 0 SAY '���� �� ��������   : ' + DTOC(DATE_IZD)
@ pROW()+1, 0 SAY '����� �� ��������  : ' + MQSTO_IZD
@ pROW()+1, 0 SAY '������������       : ' + NAS_MQSTO
@ pROW()+1, 0 SAY '�����              : ' + ADRES
@ pROW()+1, 0 SAY '�������            : ' + PHONE
@ pROW()+1, 0 SAY '���������          : ' + NOTE
@ pROW()+1, 0 SAY ' '

SELECT  POLZA
SET INDEX TO I_LNOM
GO TOP
SEEK Nom_p
IF FOUND()
        @ pROW()+1, 0 SAY ' '
        @ pROW()+1, 0 SAY ' ������� �� ����� ��������: '
        @ pROW()+1, 0 SAY '������������������������������������������������������������������'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 0 SAY ' '
                @ pROW()+1, 0 SAY '������      : ' + STR(DKA)
                @ pROW()+1, 0 SAY '��� ������� : ' + KULTURA
                @ pROW()+1, 0 SAY '������� ����: ' + DTOC(IN_DATA)
                @ pROW()+1, 0 SAY '������ ���� : ' + DTOC(OUT_DATA)
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
        @ pROW()+1, 0 SAY ' ������� �� ���������� ����: '
        @ pROW()+1, 0 SAY '������������������������������������������������������������������'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 0 SAY ' '
                @ pROW()+1, 0 SAY '�������                 ' + Zemlishte
                @ pROW()+1, 0 SAY '������                  ' + Parcel
                @ pROW()+1, 0 SAY '�������� �� �����       ' + Prepiska
                @ pROW()+1, 0 SAY '������                  ' + STR(Dka)
                @ pROW()+1, 0 SAY '����������� �� ������   ' + Sobstwenos
                @ pROW()+1, 0 SAY '���������� ���      �   ' + NOT_AKT
                @ pROW()+1, 0 SAY '������� ��              ' + DTOC(Date_n_akt)
                @ pROW()+1, 0 SAY '����������          �   ' + Nom_Pylnom
                @ pROW()+1, 0 SAY '�������� ��             ' + DTOC(DATE_Pylno)
                @ pROW()+1, 0 SAY '���� �� �������         ' + DTOC(IN_Date)
                @ pROW()+1, 0 SAY '���� �� ��������        ' + DTOC(Out_Date)
                @ pROW()+1, 0 SAY '����� �� ���������      ' + Forma_Obr
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
        @ pROW()+1, 0 SAY ' ������� �� ����� �������: '
        @ pROW()+1, 0 SAY '������������������������������������������������������������������'
        DO WHILE Nom_p=NOM_KART
                @ pROW()+1, 0 SAY ' '
                @ pROW()+1, 0 SAY '����� �������           ' + STR(Kapital)
                @ pROW()+1, 0 SAY '������� ����            ' + DTOC(In_data)
                @ pROW()+1, 0 SAY '���� �� ���������       ' + DTOC(Out_data)
                @ pROW()+1, 0 SAY '��� �� ���������        ' + Dokument
                @ pROW()+1, 0 SAY '��������            �   ' + Nom_dokum
                @ pROW()+1, 0 SAY '������� ��              ' + DTOC(Data_dokum)
                @ pROW()+1, 0 SAY ' '
                SKIP +1
        ENDDO
ENDIF
SET PRINTER TO
SET DEVICE TO SCREEN
RETURN

********************************* �������� �� ����� 1 **********************
PROCEDURE f_prt1

DO pr_fkasa

sel = SELECT()
ali = ALIAS()
CLOSE DATABASE

B := ARRAY(6)
SET PRINTER TO KASA.TXT
SET DEVICE TO PRINT
DO ZAGL_STR
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY ' ___________________________________________________________________________________________________________________________________ '
@ pROW()+1, 0 SAY '|         � � � � �          |     ����      |                              ����� �� ������ �� ������                               |'
@ pROW()+1, 0 SAY '|____________________________|               |______________________________________________________________________________________|'
@ pROW()+1, 0 SAY '|   �����  |   ���  |  ����  |               |               � � �               | �.�. ���.|  �.�.�   |  ������� ��   |���� �� ���.|'
@ pROW()+1, 0 SAY '|__________|________|________|_______________|___________________________________|__________|__________|_______________|____________|'
@ pROW()+1, 0 SAY ' '
Red := 7
USE kasa_kn
INDEX ON DATA TO kasa
DO WHILE !EOF()
        Red = Red + 1
        B[1] := ' '
        B[2] := ' '
        B[3] := ' '
        B[4] := ' '
        B[5] := ' '

        B[1] := ' ' + STR(NOM)
        B[2] := '     ' + WID
        B[3] := ' ' + DTOC(DATA)
        B[4] := STR(SUMA)
        B[5] := '   ' + LTRIM(IME)

        @ pROW()+1, 0 SAY B[1] + B[2] + B[3] + B[4] + B[5]
        IF Red=vL_str
                @ pROW()+1, 0 SAY SpS
                Red := 7
                @ pROW()+1, 0 SAY ' '
                @ pROW()+1, 0 SAY ' ___________________________________________________________________________________________________________________________________ '
                @ pROW()+1, 0 SAY '|         � � � � �          |     ����      |                              ����� �� ������ �� ������                               |'
                @ pROW()+1, 0 SAY '|____________________________|               |______________________________________________________________________________________|'
                @ pROW()+1, 0 SAY '|   �����  |   ���  |  ����  |               |               � � �               | �.�. ���.|  �.�.�   |  ������� ��   |���� �� ���.|'
                @ pROW()+1, 0 SAY '|__________|________|________|_______________|___________________________________|__________|__________|_______________|____________|'
                @ pROW()+1, 0 SAY ' '
        ENDIF
        SKIP +1
ENDDO
@ pROW()+1, 0 SAY SpS
SET PRINTER TO
SET DEVICE TO SCREEN

CLOSE DATABASE
IF ali <> ""
     SELECT &ali
     SELECT (sel)
ENDIF

RETURN

******************************************************************************
PROCEDURE Spr_prt

DEFI WIND db_p2 FROM 6 ,25 TO 14,60 TITLE " ��������� �� ��������� ";
        '��������' FLOAT SHADOW COLOR SCHEME 8
ACTIVATE WINDOW db_p2
@  1,0 SAY '      ��������� ������� !!!       '
@  2,0 SAY '   ������� �� ������� �������     '
@  3,0 SAY '   ���� �� �� �������� OT DOS.    '
@  4,0 SAY '   ��������� �� : <kasa.txt>      '
@  5,0 SAY '      <pko.txt> � <rko.txt>       '

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

sel = SELECT()
ali = ALIAS()
CLOSE DATABASE
USE kasa_kn

IF FILE('kasa_kn.dbf')
        ZAP
        APPEND FROM kasa_pr
        REPLACE ALL WID WITH '��������'
        GO BOTTOM
        APPEND FROM kasa_raz
        REPLACE ALL WID WITH '��������' FOR WID<>'��������'
ENDIF

IF !FILE('kasa_kn.dbf')
        DO ERR_PRC
ENDIF

CLOSE DATABASE
IF ali <> ""
     SELECT &ali
     SELECT (sel)
ENDIF

RETURN


******************************* ERR_PRC  *******************************
PROCEDURE err_prc

RETURN


*************************************************************************
*                                   END
*************************************************************************


