
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

@ 0,0,24,80 BOX 'ÐÐÐÐÐÐÐÐÐ'

@ 10, 2 SAY ' ˆŠ‹ž—‚€…’Ž ‡€‚š˜ˆ “‘…˜Ž ! ‚ ’€‡ˆ „ˆ…Š’ŽˆŸ ™… Ž’Šˆ…’… ”€‰‹Ž‚… ‘    '
@ 11, 2 SAY ' €‡˜ˆ…ˆŸ *.old, ‚ ŠŽˆ’Ž … €•ˆ‚ˆ€Ž ‘š„š†€ˆ…’Ž € ”€‰‹Ž‚…’… „Ž ‘…ƒ€.  '
@ 12, 2 SAY ' Ž’ŠŽˆ€‰’… ’Ž‡ˆ ”€‰‹ ‚ ŸŠŽŸ Ž’ ‚€˜ˆ’… €•ˆ‚ˆ „ˆ…Š’Žˆˆ, ‡€ „€ ‘… ‡€€‡ˆ'
@ 13, 2 SAY ' €ŠŽ ‚ˆ ‘… €‹Ž†ˆ „€ ‚š‡‘’€Ž‚ˆ’… …„ˆ˜Ž’Ž ‘š‘’ŽŸˆ… (…„ˆ ˆŠ‹ž—‚€…’Ž)'
@ 14, 2 SAY ' ’Ž …ˆŒ…“‚€‰’… ”€‰‹Ž‚…’… ‚ „ˆ…Š’ŽˆŸ ‘ Ž‘’€€‹ˆ’… ”€‰‹Ž‚… Ž’ Žƒ€Œ€’€ '
@ 15, 2 SAY '     ‡€ –…‹’€ ‘š‡„€‰’… „“ƒ€ „ˆ…Š’ŽˆŸ ˆ Ž’ŠŽˆ€‰’… –…‹ˆŸ €Š…’ ‚ …Ÿ     '
@ 16, 2 SAY ' €ŠŽ … ŒŽ†…’… „€ ‘… ‘€‚ˆ’… ‘ ’Ž‚€ ‘… Ž€„…’… € ‘…‚ˆ‡ˆ’… ˆ ’…‹…”Žˆ ! '

@ 28, 2 SAY ' €ŠŽ Ž„š‹†€‚€’… €Ž’€ ‘ Žƒ€Œ€’€ Ÿ ‘’€’ˆ€‰’… Ž’Ž‚Ž !!! '

INKEY(0)

QUIT

RETURN
