*************************************************************************
*               DMD Computer.com (c) 1997 MJJ, PETAR, DPP, DSG          *
*               dmd-computer.com@bulmail.gocis.bg                       *
*************************************************************************

*************************************************************************
*                                                                       *
*                      �������� �� ����� �� �����                       *
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

@  7, 0 SAY '    ���������������            ���������    ���������������        ��������     '
@  8, 0 SAY '    ����        ����         ����   ����    ����        ����         ����       '
@  9, 0 SAY '    ����        ����        ����    ����    ����        ����         ����       '
@ 10, 0 SAY '    ����        ����       ����     ����    ����        ����         ����       '
@ 11, 0 SAY '    ���������������       ����      ����    ���������������          ����       '
@ 12, 0 SAY '    ����                 ���������������    ����     ����            ����       '
@ 13, 0 SAY '    ����                ����        ����    ����      ����           ����       '
@ 14, 0 SAY '    ����               ����         ����    ���� S T A N D A R T(c)1997 �       '
@ 15, 0 SAY '    ����              ����          ����    ����        ����       ��������     '
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
@  2, 0 SAY ' DMD Computer.com (c)97, BULGARIA, 8900 Nova Zagora, phones:359-457-23263,26937 '
@ 17, 0 SAY '                  �������� �� ���������� ����� �� ������ ����                   '
@ 20, 0 SAY '   -PARI Standart- ���� � ���� �� �������� �� ���������� ������������ �������   '
@ 21, 0 SAY '  -DMD Standart- (c)&(tm) �� ���������� ���������� -DMD Computer.com- (tm)1995  '
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
DEFINE PAD Waw_m  OF main_m PROMPT '     ���������      '
DEFINE PAD Kor_m  OF main_m PROMPT '                    '
DEFINE PAD Slu_m  OF main_m PROMPT '      ��������      '
DEFINE PAD exit_m OF main_m PROMPT '       �����        '

DEFINE POPUP Waw_p  FROM 1, 0 SHADOW
DEFINE POPUP Kor_p  FROM 1,11 SHADOW
DEFINE POPUP Slu_p  FROM 1,40 SHADOW
DEFINE POPUP exit_p FROM 1,50 SHADOW

DEFINE BAR 1 OF Slu_p PROMPT ' ��������������   '
DEFINE BAR 2 OF Slu_p PROMPT ' ������� �������  '
DEFINE BAR 3 OF Slu_p PROMPT ' ������-��������� '

ON SELECTION PAD Slu_m   OF main_m ACTIVATE POPUP Slu_p
ON SELECTION PAD Waw_m   OF main_m DO vxkop
ON SELECTION PAD exit_m  OF main_m DO p_endp
ON SELECTION POPUP Slu_p DO p_slop

@ 0,0,24,80 BOX '         '

@  7, 0 SAY '    ���������������            ���������    ���������������        ��������     '
@  8, 0 SAY '    ����        ����         ����   ����    ����        ����         ����       '
@  9, 0 SAY '    ����        ����        ����    ����    ����        ����         ����       '
@ 10, 0 SAY '    ����        ����       ����     ����    ����        ����         ����       '
@ 11, 0 SAY '    ���������������       ����      ����    ���������������          ����       '
@ 12, 0 SAY '    ����                 ���������������    ����     ����            ����       '
@ 13, 0 SAY '    ����                ����        ����    ����      ����           ����       '
@ 14, 0 SAY '    ����               ����         ����    ���� S T A N D A R T(c)1997 �       '
@ 15, 0 SAY '    ����              ����          ����    ����        ����       ��������     '

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
@  2, 0 SAY ' DMD Computer.com (c)97, BULGARIA, 8900 Nova Zagora, phones:359-457-23263,26937 '
@ 17, 0 SAY '                  �������� �� ���������� ����� �� ������ ����                   '

@ 20, 0 SAY '   -PARI Standart- ���� � ���� �� �������� �� ���������� ������������ �������   '
@ 21, 0 SAY '  -DMD Standart- (c)&(tm) �� ���������� ���������� -DMD Computer.com- (tm)1995  '
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
                DEFINE BAR 1 OF nomen_p PROMPT ' ���� ������� - ���� ��������������  '
                DEFINE BAR 2 OF nomen_p PROMPT ' ��� ������ - ������ ��������������� '
                DEFINE BAR 3 OF nomen_p PROMPT ' ��� ������ - ���������� �����       '
                ON SELECTION POPUP nomen_p DO p_printp
                ACTIVATE POPUP nomen_p
                RELEASE POPUP nomen_p

        CASE PBAR() = 3
                DEFI WIND db_prh FROM 6 ,23 TO 15,57 TITLE " � � � � � � � � !!! ";
                               '��������' FLOAT SHADOW COLOR SCHEME 2
                ACTIVATE WINDOW db_prh
                SET CURSOR OFF
                @ 1, 0 SAY '  ��� �� ������� ����������� ��  '
                @ 2, 0 SAY ' ��������, �� ����� �� ��������  '
                @ 3, 0 SAY '                                 '
                @ 4, 0 SAY ' ���� ������ �� �����:' GET vL_str
                @ 5, 0 SAY ' ���������� �� � ? �(�)a/�(�)e   '
                @ 6, 0 SAY '             ( � )               '
                Otg = '�'
                SET CURSOR ON
                @ 6, 0 SAY '             (' GET Otg
                READ

                SpS = ' '
                IF Otg='�' .AND. Otg='�'
                        SpS = ''
                ENDIF

                IF Otg='�' .AND. Otg='�'
                        SpS = ' '
                ENDIF

                RELEASE WIND db_prh

ENDCASE

RETURN
************************** END OF PROC ********************************

************************** �������� �� ������� ************************
PROCEDURE  p_printp

sel = SELECT()
ali = ALIAS()

DO CASE
        ******************************** �� 1 ****************************
        CASE PBAR() = 1
                SELECT I_KART
                SET INDEX TO I_KNAME

                DEFI WIND db_ww FROM 6 ,25 TO 11,75 TITLE " �������� ���� �� �������: ";
                        '��������' FLOAT SHADOW
                ACTIVATE WINDOW db_ww
                        LP = 0
                        DO WHILE LP=0 .AND. LASTKEY()<>_ESC
                                ERASE temp.txt
                                g_Nom  = 000000
                                g_Name = SPACE(35)
                                g_EGN  = 00000000000
                                @ 1,0  SAY '�����      : ' GET g_Nom
                                @ 2,0  SAY '����� �����: ' GET g_Name
                                @ 3,0  SAY '���        : ' GET g_EGN
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

        ***************************** �� ����� ������ *********************
        CASE PBAR() = 2
                DEFI WIND db_wse FROM 7 ,23 TO 11,58 TITLE " �������� ���������: ";
                        '��������' FLOAT SHADOW COLOR SCHEME 8
                ACTIVATE WINDOW db_wse
                        @ 1, 9 SAY '��������� ! ...  '
                        SET CURSOR OFF
                        ERASE temp.txt
                        DO f_prt2
                        DO visual
                        SET CURSOR ON
                RELEASE WIND db_wse

        CASE PBAR() = 3
                DEFI WIND db_wse1 FROM 7 ,23 TO 11,58 TITLE " �������� ���������: ";
                        '��������' FLOAT SHADOW COLOR SCHEME 8
                ACTIVATE WINDOW db_wse1
                        @ 1, 9 SAY '��������� ! ...  '
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


********************************* �������� �� ����� 1 *********************
PROCEDURE  f_prt1

DO preiz
SET PRINTER TO TEMP.TXT
SET DEVICE TO PRINT

@ pROW()+1, 0 SAY 'DMD Computer.com, ph:(+359)0-457-23263'
@ pROW()+1, 0 SAY 'e-mail:dmd-computer.com@bulmail.gocis.bg'
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY '                    ������� �� ��������������:'
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY '__________________________________________________________________'
@ pROW()+1, 0 SAY ' '
SELECT I_KART
GO Nom_p
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

SELECT MANE
SET INDEX TO I_PNOM
GO TOP
SEEK Nom_p
IF FOUND()
        @ pROW()+1, 0 SAY ' '
        @ pROW()+1, 0 SAY ' '
        @ pROW()+1, 0 SAY '������� �� �������� �����: '
        @ pROW()+1, 0 SAY ' ________________________________________________________________ '
        @ pROW()+1, 0 SAY '|     ����    |���� �� |���� �� |��� ��    | �������� |������� ��|'
        @ pROW()+1, 0 SAY '|             |������� |������� |��������� |    �     |   ����   |'
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


********************************* �������� �� ����� 2 *********************
PROCEDURE f_prt2

DO preiz
B := ARRAY(6)
SET PRINTER TO TEMP.TXT
SET DEVICE TO PRINT
@ pROW()+1, 0 SAY '  DMD Computer.com, ph:(+359)0-457-23263'
@ pROW()+1, 0 SAY '  e-mail:dmd-computer.com@bulmail.gocis.bg'
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY '                   ������ �� ������ ��� �����                           '
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY '   _______________________________________________________________ '
@ pROW()+1, 0 SAY '  | � |     ���, �������, �������      |     ����    |  �������   |'
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
                @ pROW()+1, 0 SAY '  | � |     ���, �������, �������      |    ����     |  �������   |'
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



********************************* �������� �� ����� 3 *********************
PROCEDURE f_prt3

DO preiz
B := ARRAY(6)
SET PRINTER TO TEMP.TXT
SET DEVICE TO PRINT
@ pROW()+1, 0 SAY '  DMD Computer.com, ph:(+359)0-457-23263'
@ pROW()+1, 0 SAY '  e-mail:dmd-computer.com@bulmail.gocis.bg'
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY '                ������ �� ������ � ���������� �����                '
@ pROW()+1, 0 SAY ' '
@ pROW()+1, 0 SAY '   _______________________________________________________________ '
@ pROW()+1, 0 SAY '  | � |     ���, �������, �������      |     ����    |  �������   |'
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
                        @ pROW()+1, 0 SAY '  | � |     ���, �������, �������      |    ����     |  �������   |'
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


************************ ���� ����� ����� *****************************
PROCEDURE  no_zap

DEFI WIND db_wse3 FROM 6 ,23 TO 10,58 TITLE " �������� ������ !!! ";
        '��������' FLOAT SHADOW COLOR SCHEME 8
ACTIVATE WINDOW db_wse3
        @ 1, 8 SAY '���� ����� ����� !'
        SET CURSOR OFF
        INKEY(0)
        SET CURSOR ON
RELEASE WIND db_wse3

RETURN
************************** END OF PROC *********************************


**************** ����������� - ���� �������� ����� �� ������� �� ��������� ****
PROCEDURE I_NDEX

sel = SELECT()
ali = ALIAS()
CLOSE DATABASE
ERASE *.jtx

PrtIND_on()

SET CURSOR OFF
@ 1 ,0 SAY  "����10%���������������������"
@ 2 ,0 SAY  "����������������������������"
USE KART ALIAS I_KART NEW
INDEX ON IME TO I_KNAME
@ 1 ,0 SAY  "��������30%�����������������"
@ 2 ,0 SAY  "����������������������������"
INDEX ON NOM_KART TO I_KNOM
@ 1 ,0 SAY  "������������50%�������������"
@ 2 ,0 SAY  "����������������������������"
INDEX ON EGN TO i_KEGN
@ 1 ,0 SAY  "����������������70%���������"
@ 2 ,0 SAY  "����������������������������"
USE K_PARI ALIAS MANE NEW
@ 1 ,0 SAY  "��������������������90%�����"
@ 2 ,0 SAY  "����������������������������"
INDEX ON NOM_KART TO I_PNOM
@ 1 ,0 SAY  "�����������������������100%�"
@ 2 ,0 SAY  "����������������������������"

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

DEFI WIND Winind FROM 10, 26 TO 15, 55 TITLE " �������������� ";
        '��������' FLOAT SHADOW COLOR SCHEME 2
ACTIVATE WINDOW WinInd

RETURN .T.
************************ END OF FUNC ************************************


*********************** >>>>>>>> function PrtIND_off() ******************
FUNCTION PrtIND_off()
        RELEASE WINDOWS Winind
RETURN .T.
*********************** END OF FUNC *************************************


************************ ������������ ����� ***************************
PROCEDURE preiz

DEFI WIND db_wss1 FROM  8, 20 TO 14, 55 TITLE " �������� ���������: ";
        '��������' FLOAT SHADOW COLOR SCHEME 8
ACTIVATE WINDOW db_wss1
        SET CURSOR OFF
        @ 1, 5 SAY '   ��������� ������� !  '
        @ 2, 5 SAY '�� ����������� ���������'
        @ 3, 5 SAY '      �������� �� !     '

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
DEFI WIND db_wse4 FROM 3, 5 TO 22, 74 TITLE " ������� ������� (����-����� temp.txt): ";
        '��������' FLOAT SHADOW COLOR SCHEME 2
ACTIVATE WINDOW db_wse4
        SET CURSOR OFF
        MEMOEDIT(MEMOREAD("TEMP.TXT"),0,0,17,67,,"0",80) // " ������� ������� (����-����� temp.txt): "
        SET CURSOR ON
RELEASE WIND db_wse4
ENDIF

RETURN
************************** END OF PROC *********************************
