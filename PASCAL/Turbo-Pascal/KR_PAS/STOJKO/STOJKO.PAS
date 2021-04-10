         PROGRAM Stojko;

         USES Crt;

         TYPE Kart = RECORD
              Nom, Ime, Pol, God, Diag : STRING;
         END;

         TYPE Files = FILE OF Kart;

         VAR F1, F2 : Files;
                Kar : Kart;
                 Ch : CHAR;
              VDiag : STRING;

         PROCEDURE MakeFile;
         BEGIN { MakeFile }
                 Rewrite(F1);
                 Close(F1);
         END; { MakeFile }

         PROCEDURE InputInf;
         VAR Cont1 : INTEGER;
               Ch2 : CHAR;
         BEGIN { InputInf }
                 ClrScr;
                 Reset(F1);
                 Cont1 := 1;
                 WHILE (Cont1=1) DO BEGIN
                         WHILE (NOT(EOF(F1))) DO BEGIN
                                 Read(F1,Kar);
                         END; {endwhile}
                         Write('   çéåÖê:');
                         ReadLn(Kar.Nom);
                         Write('     àåÖ:');
                         ReadLn(Kar.Ime);
                         Write('     èéã:');
                         ReadLn(Kar.Pol);
                         Write('  ÉéÑàçà:');
                         ReadLn(Kar.God);
                         Write('ÑàÄÉçéáÄ:');
                         ReadLn(Kar.Diag);
                         Write(F1,Kar);
                         WriteLn(' ');
                         Write('ôÖ ÇöÇÖÜÑÄíÖ ãà éôÖ(Ñ/ç):');
                         Ch2 := ' ';
                         ReadLn(Ch2);
                         WriteLn(' ');
                         Cont1 := 0;
                         IF ((Ch2='Ñ') Or (Ch2='§')) THEN BEGIN
                                 Cont1 := 1;
                         END; {endif}
                 END; {endwhile}
                 Close(F1);
         END; { InputInf }

         PROCEDURE OutputInf(VAR F3:Files);
         VAR Pause : Char;
               Kar : Kart;
         BEGIN { InputInf }
                 ClrScr;
                 Reset(F3);
                 WHILE (NOT(EOF(F3))) DO BEGIN
                         Read(F3,Kar);
                         WriteLn('   çéåÖê: ', Kar.Nom);
                         WriteLn('     àåÖ: ', Kar.Ime);
                         WriteLn('     èéã: ', Kar.Pol);
                         WriteLn('  ÉéÑàçà: ', Kar.God);
                         WriteLn('ÑàÄÉçéáÄ: ', Kar.Diag);
                         WriteLn(' ');
                         WriteLn('çÄíàëçÖíÖ äãÄÇàò !');
                         Pause := ReadKey;
                 END; {endwhile}
                 Close(F3);
         END; { InputInf }

         BEGIN { Stojko }
         Ch := ' ';
         Assign(F1,'Kart.dat');
         Assign(F2,'Spr.dat');
         WHILE (Ch<>'6') DO BEGIN
                 ClrScr;
                 GotoXY(5,5);  Write('         äìêëéÇÄ áÄÑÄóÄ');
                 GotoXY(5,9);  Write('[1] .............. çéÇ îÄâã');
                 GotoXY(5,10); Write('[2] .............. ÇöÇÖÜÑÄçÖ çÄ èÄñàÖçíà');
                 GotoXY(5,11); Write('[3] .............. ëöáÑÄÇÄ ëèêÄÇäÄ');
                 GotoXY(5,12); Write('[4] .............. èéäÄáÇÄ Çëàóäà ÑÄççà');
                 GotoXY(5,13); Write('[5] .............. èéäÄáÇÄ ëèêÄÇäÄíÄ');
                 GotoXY(5,14); Write('[6] .............. äêÄâ');
                 GotoXY(5,16); Write('    àáÅÖêÖíÖ: ');
                 ReadLn(Ch);
                 CASE Ch OF
                         '1': MakeFile;
                         '2': InputInf;
                         '3': BEGIN
                                 ClrScr;
                                 Reset(F1);
                                 Rewrite(F2);
                                 WriteLn('ôÖ çÄèêÄÇü ëèêÄÇäÄ !');
                                 Write('áÄ äÄäÇÄ ÑàÄÉçéáÄ:');
                                 ReadLn(VDiag);
                                 WHILE (NOT(EOF(F1))) DO BEGIN
                                         Read(F1,Kar);
                                         IF (VDiag=Kar.Diag) THEN BEGIN
                                                 Write(F2,Kar);
                                         END; {endif}
                                 END; {endwhile}
                                 Close(F1);
                                 Close(F2);
                              END;
                         '4': OutputInf(F1);
                         '5': OutputInf(F2);
                 END; {endcase}
         END; {endwhile}
         Close(F1);
         Close(F2);
         END. { Stojko }
