
B := ARRAY(6)

SELECT 17
USE norma
ZDK = Norma
CLOSE

SELECT I_KART
SET INDEX TO I_KNAME


DO WHILE !EOF()
        SELECT I_KART
        B[1]  := NOM_KART
        B[2]  := IME


        SELECT MANE
        B[4] := 0
        SEEK B[1]
                IF (FOUND())
                        DO WHILE (B[1]=NOM_KART)
                                B[4] := B[4] + KAPITAL
                                SKIP +1
                        ENDDO
                ELSE
                        B[4] = 0
                ENDIF


        SELECT ZEM
        B[3] := 0
        SEEK B[1]
                IF (FOUND())
                        DO WHILE (B[1]=NOM_KART)
                                B[3] = B[3] + DKA
                                SKIP +1
                        ENDDO
                ELSE
                        B[3] = 0
                ENDIF

        GO TOP
        SEEK B[1]
                IF (FOUND())
                        VDK = 0
                        VDK = B[4]
                        IDK = 0
                        IDK = ZDK * B[3]

                        DO WHILE (B[1]=NOM_KART)
                                REPLACE Forma_Obr WITH '…Ž…„…‹…'

                                IF (VDK=IDK)
                                       REPLACE Forma_Obr WITH 'ŠŽŽ…€’Ž'
                                ENDIF
                                IF (VDK>IDK)
                                       REPLACE Forma_Obr WITH 'ŠŽŽ…€’Ž'
                                ENDIF
                                IF VDK<IDK .AND. VDK>0
                                       REPLACE Forma_Obr WITH '‘Œ…‘…€'
                                ENDIF
                                IF VDK=0 .AND. IDK>0
                                       REPLACE Forma_Obr WITH '€…„€’Ž'
                                ENDIF
                                IF IDK=0 .AND. VDK>0
                                       REPLACE Forma_Obr WITH '„Ÿ‹Ž‚Ž “—€‘’ˆ…'
                                ENDIF

                                SKIP +1
                        ENDDO
                ENDIF


        SELECT I_KART
        SKIP +1

ENDDO

RETURN

