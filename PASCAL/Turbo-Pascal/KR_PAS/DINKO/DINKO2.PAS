         PROGRAM Dinko;

         USES Crt;

         TYPE Bibl = RECORD
                 Nom, Ime : STRING;
                 Br       : INTEGER;
         END;

         TYPE Files = FILE OF Bibl;

         VAR F1, F2 : Files;
                Bib : Bibl;
                 Ch : CHAR;
                VBr : INTEGER;

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
                                 Read(F1,Bib);
                         END; {endwhile}
                         Write(' �����:');
                         ReadLn(Bib.Nom);
                         Write('   ���:');
                         ReadLn(Bib.Ime);
                         Write('������:');
                         ReadLn(Bib.Br);
                         Write(F1,Bib);
                         WriteLn(' ');
                         Write('�� ��������� �� ���(�/�):');
                         Ch2 := ' ';
                         ReadLn(Ch2);
                         WriteLn(' ');
                         Cont1 := 0;
                         IF ((Ch2='�') Or (Ch2='�')) THEN BEGIN
                                 Cont1 := 1;
                         END; {endif}
                 END; {endwhile}
                 Close(F1);
         END; { InputInf }

         PROCEDURE OutputInf(VAR F3:Files);
         VAR Pause : Char;
               Bib : Bibl;
         BEGIN { InputInf }
                 ClrScr;
                 Reset(F3);
                 WHILE (NOT(EOF(F3))) DO BEGIN
                         Read(F3,Bib);
                         Write(' �����:', Bib.Nom, '  ');
                         Write('   ���:', Bib.Ime, '  ');
                         WriteLn('������:', Bib.Br,  '  ');
                         Pause := ReadKey;
                 END; {endwhile}
                 Close(F3);
         END; { InputInf }

         BEGIN { Dinko }
         Ch := ' ';
         Assign(F1,'Bibl.dat');
         Assign(F2,'Spr.dat');
         WHILE (Ch<>'6') DO BEGIN
                 ClrScr;
                 GotoXY(25,5);  Write('������� ������');
                 GotoXY(25,9);  Write('1. ��� ����');
                 GotoXY(25,10); Write('2. ��������� �� ����������');
                 GotoXY(25,11); Write('3. ��������� �� �������');
                 GotoXY(25,12); Write('4. ��������� �� ������');
                 GotoXY(25,13); Write('5. ��������� �� �������');
                 GotoXY(25,14); Write('6. �����');
                 GotoXY(25,16); Write('��������: ');
                 ReadLn(Ch);
                 CASE Ch OF
                         '1': MakeFile;
                         '2': InputInf;
                         '3': BEGIN
                                 ClrScr;
                                 Reset(F1);
                                 Rewrite(F2);
                                 WriteLn('�� ����� ������:');
                                 ReadLn(VBr);
                                 WHILE (NOT(EOF(F1))) DO BEGIN
                                         Read(F1,Bib);
                                         IF (VBr=Bib.Br) THEN BEGIN
                                                 Write(F2,Bib);
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
         END. { Dinko }
