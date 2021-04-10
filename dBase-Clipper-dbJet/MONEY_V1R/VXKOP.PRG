*************************************************************************
*               DMD Computer.com (c) 1997 MJJ, PETAR, DPP, DSG          *
*               dmd-computer.com@bulmail.gocis.bg                       *
*************************************************************************

***************************************************************************
*                                                                         *
*                    ŒŽ„“‹ Š€’Ž’…Š€ € ŠŽ’€ƒ…’ˆ’…                     *
*                                                                         *
***************************************************************************

*********************** START OF PROC *************************************

SELECT I_KART
SET INDEX TO I_KNAME

DEFI WIND WinVXKoop FROM 3, 1 TO 22, 76 ;
        'ÄÏÓÙÄÀÓ' FLOAT SHADOW COLOR SCHEME 2
ACTIVATE WINDOW WinVXKoop
        @ 15, 1 say  '                       [F3] Š€’Ž’…Š€ ‡€…Œˆ                             '
        @ 16, 1 say  '[F5] ’š‘…… Ž ŽŒ…  [F6] ’š‘…… Ž ˆŒ…      [F7] ’š‘…… Ž …ƒ     '
        @ 17, 1 say  '[ESC] ˆ‡•Ž„            [INS] Ž‚ ŠŽ’€ƒ…’     [ENTER] ŠŽ…Š–ˆŸ        '

pol     := {'NOM_KART',  'IME','EGN',  'LP_SER', 'LP_NOM','DATE_IZD','MQSTO_IZD','NAS_MQSTO','ADRES','PHONE','NOTE'}
polName := {' ŽŒ… ','                 ˆŒ…                   ','    …ƒ    ','‹.. ‘…ˆŸ','   ‹.. ŽŒ…   ',' „€’€ € ˆ‡„€‚€… ','  ŒŸ‘’Ž € ˆ‡„€‚€…   ','     Œ…‘’Ž†ˆ‚………     ','              €„…‘               ','   ’…‹…”Ž   ','  ‡€…‹…†Š€  '}

        DBEDIT( 0, 0,14,73,pol,'_dbFunc_auto',NIL,polname,"Ä"," ","Ä")
RELEASE WINDOWS WinVXKoop

RETURN
**************************** END OF PROC ************************************

****************************** FUNC MENAGE OF SCHEET ************************
FUNCTION _dbFunc_auto(mode,dPeek1)

l_key   := LASTKEY()   && —¥²¥¬ ¯®±«¥¤­¨¿² ­ ²¨±­ ² ª« ¢¨¸
nROW    := ROW()       &&  ¬¨° ¬¥ ªº¤¥ ¥ ¡¨« ¬ °ª¥° 
nCOL    := COL()       &&
nReturn := 1

DO CASE
        CASE mode = 0  //±º±²®¿­¨¥ ±¢®¡®¤¥­
                Nreturn:=1

        CASE mode=1
                @ 1,2 SAY '> „®±²¨£­ ²® ¥ ­ · «®²® ­  ´ ©«  ! <'
                INKEY(0)
                @ 1,2 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
                nreturn:=1

        CASE mode=2
                IF LASTKEY() != _PGDN
                        @ 1,2 SAY '> „®±²¨£­ ² ¥ ª° ¿ ­  ´ ©«  ! <'
                        INKEY(0)
                        @ 1,2 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
                        nreturn:=1
                ELSE
                        TONE(310,2)
                ENDIF

        CASE mode=3 &&  ª® ¿¬  § ¯¨±¨ ¢º¢ ”€ˆ‹€
                @ 1,2 SAY '¥¦¨¬ ¢º¢¥¦¤ ­¥ ­  ­®¢ § ¯¨±. '
                DO VX_KART
                nreturn:=2

        CASE L_KEY = _INS  && INPUT
                DO VX_KART
                nreturn:=2

        CASE L_KEY = -4    && ’š‘…… Ž ŽŒ…
                ADRR = RECNO()
                TRN = 000000
                SET CURSOR ON
                @ 17, 1 SAY SPACE(70)
                @ 17, 1 SAY 'M®«¿ ¢º¢¥¤¥²¥ ŽŒ…€, ª®©²® ’š‘ˆ’…: ' GET TRN
                READ
                SET CURSOR OFF
                SET INDEX TO I_KNOM
                SEEK TRN
                IF !FOUND()
                        @ 17, 1 SAY SPACE(70)
                        @ 17, 1 SAY '‚ „€ˆ’… … ”ˆƒ“ˆ€ Ž‘Ž—…ˆŸ ŽŒ… !!!'
                        TONE(200,2)
                        INKEY(0)
                ELSE
                        ADRR = RECNO()
                ENDIF
                SET INDEX TO I_KNAME
                GO ADRR
                @ 17, 1 SAY SPACE(70)
                @ 17, 1 say  '[ESC] ˆ‡•Ž„            [INS] Ž‚ ŠŽ’€ƒ…’     [ENTER] ŠŽ…Š–ˆŸ        '
                nreturn:=2

        CASE L_KEY = -5 && ’š‘…… Ž ˆŒ…
                ADRR = RECNO()
                TRI = SPACE(30)
                SET CURSOR ON
                @ 17, 1 SAY SPACE(70)
                @ 17, 1 SAY 'M®«¿ ¢º¢¥¤¥²¥ ˆŒ…’Ž, ª®¥²® ’š‘ˆ’…: ' GET TRI
                READ
                TRI = ALLTRIM(TRI)
                SET CURSOR OFF
                SET INDEX TO I_KNAME
                SEEK TRI
                IF !FOUND()
                        @ 17,1 SAY SPACE(70)
                        @ 17,1 SAY '‚ „€ˆ’… … ”ˆƒ“ˆ€ Ž‘Ž—…Ž’Ž ˆŒ… !!!'
                        TONE(200,2)
                        INKEY(0)
                ELSE
                        ADRR = RECNO()
                ENDIF
                GO ADRR
                @ 17, 1 SAY SPACE(70)
                @ 17, 1 say  '[ESC] ˆ‡•Ž„            [INS] Ž‚ ŠŽ’€ƒ…’     [ENTER] ŠŽ…Š–ˆŸ        '
                nreturn:=2

        CASE L_KEY = -6    && ’š‘…… Ž …ƒ
                ADRR = RECNO()
                TRE = 00000000000
                SET CURSOR ON
                @ 17, 1 SAY SPACE(70)
                @ 17, 1 SAY 'M®«¿ ¢º¢¥¤¥²¥ …ƒ, ª®¥²® ’š‘ˆ’…:' GET TRE PICTURE '@K 99999999999'
                READ
                SET CURSOR OFF
                SET INDEX TO I_KEGN
                SEEK TRE
                IF !FOUND()
                        @ 17, 1 SAY SPACE(70)
                        @ 17, 1 SAY '‚ „€ˆ’… … ”ˆƒ“ˆ€ Ž‘Ž—…Ž’Ž …ƒ !!!'
                        TONE(200,2)
                        INKEY(0)
                ELSE
                        ADRR = RECNO()
                ENDIF
                SET INDEX TO I_KNAME
                GO ADRR
                @ 17, 1 SAY SPACE(70)
                @ 17, 1 say  '[ESC] ˆ‡•Ž„            [INS] Ž‚ ŠŽ’€ƒ…’     [ENTER] ŠŽ…Š–ˆŸ        '
                nreturn:=2

        CASE l_key = _ESC && EXIT <<--------------------------------
                nReturn := 0

        CASE l_key = _ENTER  && ª®°¥ª¶¨¿ € Ž‹…
                poleSave = recno()
                SET KEY  -1 TO
                SET CURSOR ON
                SET ESCAPE ON
                PolpTemp = POL[dPeek1]    &&  ‡ °¥¦¤ ¬¥ ¨¬¥­ ²  ­  ¯®«¥² ²  ®² ¬ ±¨¢ 
                IF PolpTemp != 'NOM_KART' {
                        @ nROW, nCOL GET &PolpTemp  && ‘ ¬ ²  Š®°¥ª¶¨¿
                        READ
                        TONE(300,2)
                }
                SET CURSOR OFF
                nReturn :=  1

        CASE L_KEY = -2
                NOM = NOM_KART
                NAME = IME
                DO parip WITH NOM, NAME
                nReturn :=  1
ENDCASE

RETURN nReturn
*************************** END OF FUNKTION *****************************

*************************** PROC KART PARI ******************************
PROCEDURE parip(TNOM,NAMEKOOP)

DEFI WIND WinPARI FROM 7 ,4 TO 20 ,73 TITLE " Š€’Ž’…Š€ - ‡€…Œˆ ";
        'ÄÏÓÙÄÀÓ' FLOAT SHADOW
ACTIVATE WINDOW WinPARI
        SET CURSOR OFF
        SDBF = ALIAS()
        SELECT MANE
        D_key = 13
        SEEK TNOM
        IF !FOUND()
                FG = .T.
                DO VXPARI WITH FG
        ELSE
                X = 0
                ADR = RECNO()
                DO WHILE NOM_KART = TNOM
                        X++
                        SKIP
                ENDDO
                GO ADR
                DO WHILE LASTKEY() != _ESC
                        @  1, 1  SAY 'ŽŒ… € ŠŽ’€ƒ…’     ' + STR(TNOM)
                        @  2, 1  SAY 'ˆŒ… € ŠŽ’€ƒ…’       ' + NAMEKOOP
                        @  3, 1  SAY '‘“Œ€                    ' + STR(Kapital)
                        @  4, 1  SAY '„€’€ € „€‚€… ‡€…Œ€    ' + DTOC(In_data)
                        @  5, 1  SAY 'Š€‰€ „€’€ ‡€ ‚š™€…  ' + DTOC(Out_data)
                        @  6, 1  SAY '‚ˆ„ € „ŽŠ“Œ…’€        ' + Dokument
                        @  7, 1  SAY '„ŽŠ“Œ…’            Õ   ' + Nom_dokum
                        @  8, 1  SAY 'ˆ‡„€„… €              ' + DTOC(Data_dokum)
                        @  9, 1 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
                        @ 10, 1 SAY '  ‡€‚…„…ˆ ……ˆ‘Šˆ: ' + STR(X)
                        @ 11, 1 SAY '  [PAGE DOWN]   [PAGE UP]    [INS]Ž‚ ‡€ˆ‘    [ENTER]ŠŽ…Š–ˆŸ  '

                        INKEY(0)
                        DO CASE
                                CASE LASTKEY() = _PGUP
                                        IF !BOF()
                                                SKIP -1
                                                IF TNOM != NOM_KART
                                                        SKIP
                                                        TONE(200,2)
                                                ENDIF
                                        ELSE
                                                TONE(300,3)
                                        ENDIF

                                CASE LASTKEY() = _PGDN
                                        IF !EOF()
                                                SKIP
                                                IF TNOM != NOM_KART
                                                        SKIP -1
                                                        TONE(200,2)
                                                ENDIF
                                        ELSE
                                                TONE(300,3)
                                        ENDIF

                                CASE LASTKEY() = _ENTER
                                        FG = .F.
                                        DO VXPARI WITH FG

                                CASE LASTKEY() = _INS
                                        FG = .T.
                                        DO VXPARI WITH FG
                        ENDCASE
                ENDDO
        ENDIF

RELEASE WINDOW WINPARI
SELECT &SDBF

RETURN
******************* END OF FUNKTION **********************

******************* VHOD PARI PROC ***********************
PROCEDURE VXPARI(FLG)

IF FLG = .T.
        APPEND BLANK
        REPLACE Nom_Kart WITH TNOM
        COMMIT
ENDIF

DEFI WIND WinPARIV FROM 7, 4 TO 20, 73 TITLE " ‚š‚…†„€…/ŠŽ…Š–ˆŸ/ € „€ˆ ‡€ ‡€…Œ ";
        'ÄÏÓÙÄÀÓ' FLOAT SHADOW
ACTIVATE WINDOW WinPARIV
        SET CURSOR ON
        @  1, 1  SAY 'ŽŒ… € ŠŽ’€ƒ…’     ' + STR(TNOM)
        @  2, 1  SAY 'ˆŒ… € ŠŽ’€ƒ…’       ' + NAMEKOOP
        @  3, 1  SAY '‘“Œ€                    ' GET Kapital
        @  4, 1  SAY '„€’€ € „€‚€… ‡€…Œ€    ' GET In_data
        @  5, 1  SAY 'Š€‰€ „€’€ ‡€ ‚š™€…  ' GET Out_data
        @  6, 1  SAY '‚ˆ„ € „ŽŠ“Œ…’€        ' GET Dokument
        @  7, 1  SAY '„ŽŠ“Œ…’            Õ   ' GET Nom_dokum
        @  8, 1  SAY 'ˆ‡„€„… €              ' GET Data_dokum
        @  9, 1 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
        @ 10, 1 SAY '               [ESC] ˆ‡•Ž„   [ENTER] Ž’‚š†„€‚€…                '
        @ 11, 1 SAY '           [] ƒŽ…   [] „Ž‹“   [-] ‹Ÿ‚Ž   [-] „Ÿ‘Ž           '
        READ
        SET CURSOR OFF
RELEASE WINDOW WINPARIV

IF FLG = .T.
        IF LASTKEY() = _ESC
                DELETE
                PACK
                COMMIT
         ELSE
                COMMIT
                Index on NOM_KART to i_ZNOM
                x++
         ENDIF
ENDIF

RETURN
********************************** END PROC **********************

********************************** VHOD KART PROC ****************
PROCEDURE VX_KART

DEFI WIND WinVXK FROM 4 ,4 TO 20 ,73 TITLE " ‚š‚…†„€… € ŠŽ’€ƒ…’ ";
        'ÄÏÓÙÄÀÓ' FLOAT SHADOW
ACTIVATE WINDOW WinVXK
        @ 12, 1 SAY 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
        @ 13, 1 SAY '               [ESC] ˆ‡•Ž„   [ENTER] Ž’‚š†„€‚€…                '
        @ 14, 1 SAY '           [] ƒŽ…   [] „Ž‹“   [-] ‹Ÿ‚Ž   [-] „Ÿ‘Ž           '
        SET CURSOR ON
        SET INDEX TO
        ADR = RECNO()
        GO BOTTOM

        PNOM_KART  = NOM_KART +1
        PIME       = SPACE(35)
        PEGN       = 00000000000
        PLP_SER    = SPACE(2)
        PLP_NOM    = SPACE(15)
        PDATE_IZD  = DATE()
        PMQSTO_IZD = SPACE(20)
        PNAS_MQSTO = SPACE(20)
        PADRES     = SPACE(30)
        PPHONE     = SPACE(12)
        PNOTE      = SPACE(20)

        @ 1,2 SAY  'ŽŒ…             ' GET PNOM_KART VALID(PR_NOM(PNOM_KART))
        @ 2,2 SAY  'ˆŒ…               ' GET PIME
        @ 3,2 SAY  '…ƒ               ' GET PEGN
        @ 4,2 SAY  '‹.. ‘…ˆŸ        ' GET PLP_SER
        @ 5,2 SAY  '‹.. ŽŒ…        ' GET PLP_NOM
        @ 6,2 SAY  '„€’€ € ˆ‡„€‚€…  ' GET PDATE_IZD
        @ 7,2 SAY  'ŒŸ‘’Ž € ˆ‡„€‚€… ' GET PMQSTO_IZD
        @ 8,2 SAY  'Œ…‘’Ž†ˆ‚………      ' GET PNAS_MQSTO
        @ 9,2 SAY  '€„…‘             ' GET PADRES
        @ 10,2 SAY '’…‹…”Ž           ' GET PPHONE
        @ 11,2 SAY '‡€…‹…†Š€         ' GET PNOTE
        READ

        SET CURSOR OFF
        IF LASTKEY() != _ESC
                APPEND BLANK
                REPLACE NOM_KART    WITH  PNOM_KART
                REPLACE IME         WITH  ALLTRIM(PIME)
                REPLACE EGN         WITH  PEGN
                REPLACE LP_SER      WITH  PLP_SER
                REPLACE LP_NOM      WITH  PLP_NOM
                REPLACE DATE_IZD    WITH  PDATE_IZD
                REPLACE MQSTO_IZD   WITH  PMQSTO_IZD
                REPLACE NAS_MQSTO   WITH  PNAS_MQSTO
                REPLACE ADRES       WITH  PADRES
                REPLACE PHONE       WITH  PPHONE
                REPLACE NOTE        WITH  PNOTE
                COMMIT

                ADR1 = RECNO()
                PrtIND_on()

                ERASE I_KNAME.JTX
                ERASE I_KNOM.JTX
                ERASE I_KEGN.JTX

                SET CURSOR OFF
                @ 1 ,1 SAY  "ÚÄÄÄÄ25%ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÏ"
                @ 2 ,1 say  "ÀÛÛÛÛÛÒÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÙ"
                index on IME to i_KNAME
                @ 1 ,1 SAY  "ÚÄÄÄÄÄÄÄÄÄÄ50%ÄÄÄÄÄÄÄÄÄÄÄÏ"
                @ 2 ,1 say  "ÀÛÛÛÛÛÛÛÛÛÛÛÒÐÐÐÐÐÐÐÐÐÐÐÐÙ"
                Index on NOM_KART to i_KNOM
                @ 1 ,1 SAY  "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ75%ÄÄÄÄÄÏ"
                @ 2 ,1 say  "ÀÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÒÐÐÐÐÐÐÙ"
                Index on EGN to i_KEGN
                @ 1 ,1 SAY  "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ100%Ï"
                @ 2 ,1 say  "ÀÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÒÙ"
                PrtIND_off()
        ELSE
                ADR1 = ADR
        ENDIF

        SET INDEX TO I_KNAME
        GO ADR1

RELEASE WINDOW WINVXK
RETURN
******************************** END OF PROC ************************

******************************** Ž‚…Š€ ‡€ „“‹ˆ€… € ŽŒ…€ ****
FUNCTION PR_NOM(S_NOM)

SET INDEX TO i_KNOM
SEEK S_NOM

IF !FOUND()
        S_RETURN:=.T.
ELSE
        S_RETURN:=.F.
        TONE(270,4)
ENDIF

SET INDEX TO

RETURN S_RETURN
********************************* END OF FUNC ************************
