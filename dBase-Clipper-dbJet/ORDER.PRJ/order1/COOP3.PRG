*************************************************************************
*                     DMD Computer.com (c)1997, DPP                     *
*************************************************************************

********************************* START *********************************

CLEAR
CLOSE ALL

********************************* FILE

LP := 0

FLE = 'KAR'
FLE = FLE + 'T5.JTX'

IF !FILE(FLE)
        LP = 1
ENDIF

IF (LP=1)
        SET CURSOR OFF
        SET COLOR TO W+*/B
        @ 2, 0 SAY '      จฑฒฅฌ ฒ  ญฅ ฅ ชฎญดจฃณฐจฐ ญ  ฏฐ ขจซญฎ -     !!!      '
        SET COLOR TO
        @ 3, 0 SAY '      ก คฅฒฅ ฑฅ ญ  -DMD Computer.com- , ฃฐ. ฎข   ฃฎฐ , ฒฅซ: 0457-23263       '
        SET COLOR TO
        CLEAR
        QUIT
ENDIF


******************************************* DATE

SET DATE GERMAN
DAT1 := DATE()
DAT2 := '30.1'
DAT2 := DAT2 + '2.97'
DAT3 := CTOD(DAT2)

IF (DAT1>=DAT3)
        SET CURSOR OFF
*       SET COLOR TO W+*/B
*       @ 2, 0 SAY '    จฅ ญฅ ฌฎฆฅฒฅ ค  ฐ กฎฒจฒฅ ฑ ฒฎงจ ฏฐฎคณชฒ -      !!!     '
*       SET COLOR TO
*       @ 3, 0 SAY '      ก คฅฒฅ ฑฅ ญ  -DMD Computer.com- , ฃฐ. ฎข   ฃฎฐ , ฒฅซ: 0457-23263       '


        DEFI WIND db_wss FROM 0 , 0 TO 24, 79 TITLE "   ! ";
                       'ฺฤฯำูฤภำ' FLOAT SHADOW COLOR SCHEME 8
        ACTIVATE WINDOW db_wss
        SET CURSOR OFF
        @ 10, 0 SAY '    (  -COOP Standart- (tm)96)      '
        @ 12, 0 SAY '         ,              '
        @ 14, 0 SAY '       -DMD Computer.com- , ฃฐ. ฎข   ฃฎฐ , ฒฅซ: 0457-23263      '
        @ 22, 0 SAY '       ,       ...  '
        INKEY(0)
        RELEASE WIND db_wss

        SET COLOR TO
        !DEL *.EXE
        FRENAME('KART5.JTX', 'COOP.EXE')
        CLOSE ALL
        CLEAR
        QUIT
ENDIF

RETURN
****************************************  END

*************************************************************************
*                     DMD Computer.com (c)1997, DPP                     *
*************************************************************************
