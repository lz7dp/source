*
*       DMD Computer.com (tm)&(c)1997 ,  DPP-to
*       phone: (+359 457) 0457 - 23263
*                              - 26937
*
*       This is PRG for DBJET 2.0 /Clipper compatible language/
*       If you use Clipper language - make change to INTRODMD.PRG list.
*

#INCLUDE 'inkey.hd'
*SET COLOR TO N/W       // opredelq cweta na fona - white
CLEAR
CLOSE ALL
SET CURSOR OFF
USE SCR
*ZAP
GO TOP
*APPEND FROM scr.txt TYPE SDF
GO BOTTOM
BL = RECNO()
KL = INKEY()

FOR X = 0 TO 1 {
        **************************************************** 1
        IF INKEY()=KL
                GO TOP
                FOR I = 0 TO BL {
                        GO I
                        FOR J = 0 TO 79 {
                                Chr = SUBSTR(St, J+1, 1)
                                @ I, J SAY Chr
                        }
                        IF INKEY()<>KL
                                SET COLOR TO
                                CLEAR
                                RETURN
                        ENDIF
                }
                FOR I = 1 to 1 {
                }
        ENDIF

        IF INKEY()<>KL
                SET COLOR TO
                CLEAR
                RETURN
        ENDIF

        ***************************************************** 2
        IF INKEY()=KL
                CLEAR
                GO TOP
                FOR B = 1 TO BL {
                        FOR I = 0 TO B {
                                GO I
                                FOR J = 0 TO 79 {
                                        Chr = SUBSTR(St, J+1, 1)
                                        @ BL-B, J SAY Chr
                                }
                        }
                        IF INKEY()<>KL
                                SET COLOR TO
                                CLEAR
                                RETURN
                        ENDIF
                }
                FOR I = 1 to 1 {
                }
        ENDIF

        IF INKEY()<>KL
                SET COLOR TO
                CLEAR
                RETURN
        ENDIF

        ****************************************************** 3
        IF INKEY()=KL
                CLEAR
                GO TOP
                FOR B = 1 TO BL {
                        FOR I = 0 TO B {
                                GO I
                                @ ROW()+1, 0 SAY ''
                                FOR J = 0 TO 79 {
                                        Chr = SUBSTR(St, J+1, 1)
                                        @ I+(BL-B-1), J SAY Chr
                                }
                        }
                        IF INKEY()<>KL
                                SET COLOR TO
                                CLEAR
                                RETURN
                        ENDIF
                }
                FOR I = 1 to 1 {
                }
        ENDIF

        IF INKEY()<>KL
                SET COLOR TO
                CLEAR
                RETURN
        ENDIF

        ******************************************************* 4
        IF INKEY()=KL
                GO TOP
                FOR B = BL TO 1 STEP -1 {
                        FOR I = 0 TO B {
                                GO I
                                FOR J = 0 TO 79 {
                                        Chr = SUBSTR(St, J+1, 1)
                                        @ I+(BL-B-1), J SAY Chr
                                }
                        @ ROW()+1, 0 SAY '                                                                                '
                        }
                        IF INKEY()<>KL
                                SET COLOR TO
                                CLEAR
                                RETURN
                        ENDIF
                }
                CLEAR
                FOR I = 1 to 1 {
                }
        ENDIF

        IF INKEY()<>KL
                SET COLOR TO
                CLEAR
                RETURN
        ENDIF

        ******************************************************** 5
        IF INKEY()=KL
                GO TOP
                FOR I = 0 TO BL {
                        GO I
                        FOR J = 0 TO 79 {
                                Chr = SUBSTR(St, J+1, 1)
                                @ I, J SAY Chr
                        }
                        IF INKEY()<>KL
                                SET COLOR TO
                                CLEAR
                                RETURN
                        ENDIF
                }

                FOR I = 1 to 1 {
                }
        ENDIF

        X = 0
        IF INKEY()<>KL
                X = 2
                SET COLOR TO
                CLEAR
                RETURN
        ENDIF

}

*************************************************** END
