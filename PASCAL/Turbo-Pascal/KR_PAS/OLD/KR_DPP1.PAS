
Uses Crt;

Type
        Data = Record
               D:Integer;
        End;

Var
        Ch, Ch1, Ch2, Ch3 : Char;
        i,j,k,Len,ff,ii: Integer;
        s: Data;
        f: File of Data;
        Ch4 : Array[1..140,1..32] of Char;
        Ch5 : Array[1..32] of Char;


{­ · «® ­  ¯°®£° ¬ ² ===================================}
Begin
    ClrScr;
    window(1,1,80,11);
    writeln('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ<     >ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÏ');
    writeln('Ó   ³°±®¢  ° ¡®²  ¯®    ­  ¨¬¨º° ¥­ª®¢  ¢«®¢    Ó');
    writeln('Ó                                                                             Ó');
    writeln('Ó  [1] ..............    test.db  .                      Ó');
    writeln('Ó  [2] ..............         .         Ó');
    writeln('Ó  [3] ..............   .                                   Ó');
    writeln('Ó  [4] ..............   .                                   Ó');
    writeln('Ó  [5] ..............    .                              Ó');
    writeln('Ó  [6] ..............   .                                       Ó');
    writeln('ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
    window(1,11,80,24);
    writeln('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ<                     >ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÏ');
    writeln('Ó                                                                             Ó');
    writeln('Ó                                                                             Ó');
    writeln('Ó                                                                             Ó');
    writeln('Ó                                                                             Ó');
    writeln('Ó                                                                             Ó');
    writeln('Ó                                                                             Ó');
    writeln('Ó                                                                             Ó');
    writeln('Ó                                                                             Ó');
    writeln('Ó                                                                             Ó');
    writeln('Ó                                                                             Ó');
    writeln('Ó                                                                             Ó');
    writeln('ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
    window(2,12,78,22);
    gotoxy(1,1);
    WriteLn('  !    :');

 Repeat
    Ch1:=ReadKey;
    Case Ch1 of
      '1': Begin
                ff := 0;
                Randomize;
                Assign(f, 'Test.db');
                Reset(f);
                Len := FileSize(f);
                WriteLn('    ... ');
                For i := 1 to 140 do Begin
                        For j := 1 to 32 do Begin
                                Repeat
                                        ff := Random(255);
                                Until(((ff>127) And (ff<192)) Or ((ff>47) And (ff<58)));
                                s.D := ff;
                                Write(f,s);
                        End; {endfor}
                End; {endfor}
                Close(f);
                WriteLn('     -  !');
                WriteLn(' ');
                WriteLn('  !    :');
        End;

      '2': Begin
                ff := 0;
                Assign(f, 'Test.db');
                Reset(f);
                Len := FileSize(f);
                WriteLn('    ... ');
                For i := 1 to 140 do Begin
                        For j := 1 to 32 do Begin
                                Read(f,s);
                                ff := s.D;
                                Ch4[i,j] := Chr(ff);
                        End; {endfor}
                End; {endfor}
                Close(f);
                WriteLn('        !');
                WriteLn(' ');
                WriteLn('  !    :');
        End;


      '3':
        writeln('³°±®¢  ° ¡®²  ¯®    ­  ¨¬¨º° ¥­ª®¢  ¢«®¢');

      '4':
        writeln('³°±®¢  ° ¡®²  ¯®    ­  ¨¬¨º° ¥­ª®¢  ¢«®¢');

      '5': Begin
                ii := 0;
                ff := 0;
                Repeat
                        For i := 1 to 10 do Begin
                                Write(' ',i+ii, '  ');
                                For j := 1 to 32 do Begin
                                        Write(Ch4[i+ii,j]);
                                End; {endfor}
                                WriteLn(' ');
                        End; {endfor}
                        Write(' : [ESC]-, : [A]-, [Z]-');
                        Ch2 := ReadKey;
                        Ch3 := Ch2;
                        WriteLn(' ');

                        if (Ch2='A') then Begin
                                ii := ii - 1;
                                if ii<0 then begin
                                   ii := 0;
                                End; {endif}
                        End;

                        if (Ch2='Z') then Begin
                                ii := ii + 1;
                                if ii>130 then begin
                                   ii := 130;
                                End; {endif}
                        End;
                Until(Ord(Ch3)=27);
                WriteLn(' ');
                WriteLn('     .');
                WriteLn(' ');
                WriteLn('  !    :');

           End;
    End;
 Until ((Ord(Ch1)=27) Or (Ch1='6'));
 ClrScr;
End.
