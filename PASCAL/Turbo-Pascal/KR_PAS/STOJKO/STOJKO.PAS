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
                         Write('   �����:');
                         ReadLn(Kar.Nom);
                         Write('     ���:');
                         ReadLn(Kar.Ime);
                         Write('     ���:');
                         ReadLn(Kar.Pol);
                         Write('  ������:');
                         ReadLn(Kar.God);
                         Write('��������:');
                         ReadLn(Kar.Diag);
                         Write(F1,Kar);
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
               Kar : Kart;
         BEGIN { InputInf }
                 ClrScr;
                 Reset(F3);
                 WHILE (NOT(EOF(F3))) DO BEGIN
                         Read(F3,Kar);
                         WriteLn('   �����: ', Kar.Nom);
                         WriteLn('     ���: ', Kar.Ime);
                         WriteLn('     ���: ', Kar.Pol);
                         WriteLn('  ������: ', Kar.God);
                         WriteLn('��������: ', Kar.Diag);
                         WriteLn(' ');
                         WriteLn('��������� ������ !');
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
                 GotoXY(5,5);  Write('         ������� ������');
                 GotoXY(5,9);  Write('[1] .............. ��� ����');
                 GotoXY(5,10); Write('[2] .............. ��������� �� ��������');
                 GotoXY(5,11); Write('[3] .............. ������� �������');
                 GotoXY(5,12); Write('[4] .............. ������� ������ �����');
                 GotoXY(5,13); Write('[5] .............. ������� ���������');
                 GotoXY(5,14); Write('[6] .............. ����');
                 GotoXY(5,16); Write('    ��������: ');
                 ReadLn(Ch);
                 CASE Ch OF
                         '1': MakeFile;
                         '2': InputInf;
                         '3': BEGIN
                                 ClrScr;
                                 Reset(F1);
                                 Rewrite(F2);
                                 WriteLn('�� ������� ������� !');
                                 Write('�� ����� ��������:');
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