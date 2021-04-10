
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

        Br1:Integer;   { I }
        X1:String[2];  { X }
        X2:String[2];  {   }
        K:Integer;     { K }
        Br2:Integer;   { J }
        N:Integer;     { N }


{­ · «® ­  ¯°®£° ¬ ² ===================================}
Begin
    ClrScr;
    window(1,1,80,11);
    writeln('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ< Œ …   >ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÏ');
    writeln('Ó   Š³°±®¢  ° ¡®²  ¯® ’…•‹ƒˆŸ € ƒ€Œˆ€…’ ­  „¨¬¨º° ¥­ª®¢  ¢«®¢    Ó');
    writeln('Ó                                                                             Ó');
    writeln('Ó  [1] .............. ‡€…†„€… € ”€‰‹ test.db ‘ „€ˆ.                      Ó');
    writeln('Ó  [2] .............. ‡€…†„€… € Œ€‘ˆ‚ ’ €Œ…’’€ ‘ „€ˆ ’ ”€‰‹€.         Ó');
    writeln('Ó  [3] .............. š‚€ ’…‘’‚€ ‡€„€—€.                                   Ó');
    writeln('Ó  [4] .............. ‚’€ ’…‘’‚€ ‡€„€—€.                                   Ó');
    writeln('Ó  [5] .............. ˆ‡‚…†„€… Œ€‘ˆ‚€ € …Š€.                              Ó');
    writeln('Ó  [6] .............. Š€‰ € €’€’€.                                       Ó');
    writeln('ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
    window(1,11,80,24);
    writeln('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ<   ’  …  ˆ ’ … ‹ ‘ Š ˆ   … Š  €  >ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÏ');
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
    WriteLn(' ƒ’‚ ! ˆ‡……’… –ˆŸ ’ Œ…’:');

 Repeat
    Ch1:=ReadKey;
    Case Ch1 of
      '1': Begin
                ff := 0;
                Randomize;
                Assign(f, 'Test.db');
                Reset(f);
                Len := FileSize(f);
                WriteLn(' €—€‹ € –…‘€ ... ');
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
                WriteLn(' ”€‰‹š’ … ‡€…„… ‘ “Š‚…-–ˆ”‚€ ˆ”Œ€–ˆŸ !');
                WriteLn(' ');
                WriteLn(' ƒ’‚ ! ˆ‡……’… –ˆŸ ’ Œ…’:');
        End;

      '2': Begin
                ff := 0;
                Assign(f, 'Test.db');
                Reset(f);
                Len := FileSize(f);
                WriteLn(' €—€‹ € –…‘€ ... ');
                For i := 1 to 140 do Begin
                        For j := 1 to 32 do Begin
                                Read(f,s);
                                ff := s.D;
                                Ch4[i,j] := Chr(ff);
                        End; {endfor}
                End; {endfor}
                Close(f);
                WriteLn(' Œ€‘ˆ‚š’ … ‡€…„… ‘ “Š‚… –ˆ”‚€ ˆ”Œ€–ˆŸ !');
                WriteLn(' ');
                WriteLn(' ƒ’‚ ! ˆ‡……’… –ˆŸ ’ Œ…’:');
        End;


      '3': N := 100;
           Br1 := 1;
           Repeat
                   X1 := A[Br1];
                   K := Br1;
                   Br2 := Br1 + 1;
                   Repeat
                           X2 := A[Br2];
                           If (X1>X2) Then Begin
                                   X1 := X2;
                                   K := Br2;
                           End;
                           Br2 := Br2 + 1;
                   Until (Br2>N);

                   A[K] := A[Br1];
                   A[Br1] := X1;
                   Br1 := Br1 + 1;
           Until (Br1>(N-1));

      '4': writeln('Š³°±®¢  ° ¡®²  ¯® ’…•‹ƒˆŸ € ƒ€Œˆ€…’ ­  „¨¬¨º° ¥­ª®¢  ¢«®¢');

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
                        Write(' Š‹€‚ˆ˜ˆ: [ESC]-ˆ‡•„, ‘Š‹: [A]-ƒ…, [Z]-„‹“');
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
                WriteLn(' ‚ˆ… ˆŠ‹—ˆ•’… €‡ƒ‹…†„€…’ € Œ€‘ˆ‚€.');
                WriteLn(' ');
                WriteLn(' ƒ’‚ ! ˆ‡……’… –ˆŸ ’ Œ…’:');

           End;
    End;
 Until ((Ord(Ch1)=27) Or (Ch1='6'));
 ClrScr;
End.
