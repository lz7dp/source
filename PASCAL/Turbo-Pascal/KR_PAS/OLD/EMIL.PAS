
Program Emil;

Uses Crt;

Var   Ch : String;
     sLog : Char;
    sLog1 : Char;
    sLog2 : Char;
    sLog3 : Char;
     dLog : Char;
      Usp : String;
       Br : Integer;
        I : Integer;
    Kart1 : Array[1..3,1..50] of String;
    Kart2 : Array[1..50] of Real;


Procedure MENU;
Begin
        ClrScr;
        WriteLn('                    „…Œ‘’€–ˆ€ Œ… ƒ€Œ€  ‡€„€ˆ…');
        WriteLn('');
        WriteLn('[1] ......... Œ… 1.');
        WriteLn('[2] ......... Œ… 2.');
End;


Procedure MENU3;
Begin { MENU3 }
       WriteLn('[6] ......... ˆ‡•„.');
       WriteLn(' ');
       WriteLn(' ');
       Write('€€‚…’… ‚€˜ˆŸ’ ˆ‡ => ');
End; { MENU3 }


Procedure MENU1;
Begin
        ClrScr;
        WriteLn('                                Œ… 1.');
        WriteLn('');
        WriteLn('[1] ......... Œ… 1.1.');
        WriteLn('[2] ......... Œ… 1.2.');
        WriteLn('[3] ......... Œ… 1.3.');
End;


Procedure MENU2;
Begin
        ClrScr;
        WriteLn('                                Œ… 2.');
        WriteLn('');
        WriteLn('[1] ......... €Š’“€‹ˆ‡€–ˆŸ.');
        WriteLn('[2] ......... ‘€‚Š€.');
        WriteLn('[3] ......... Œ… 2.3.');
End;


Procedure MENU11;
Begin
        ClrScr;
        WriteLn('                                Œ… 1.1.');
        WriteLn('');
        WriteLn('[1] ......... Œ… 1.1.1');
        WriteLn('[2] ......... Œ… 1.1.2');
End;


Procedure MENU12;
Begin
        ClrScr;
        WriteLn('                                Œ… 1.2.');
        WriteLn('');
        WriteLn('[1] ......... Œ… 1.2.1.');
        WriteLn('[2] ......... Œ… 1.2.2.');
        WriteLn('[3] ......... Œ… 1.2.3.');
End;


Procedure MENU13;
Begin
        ClrScr;
        WriteLn('                                Œ… 1.3.');
        WriteLn('');
        WriteLn('[1] ......... Œ… 1.3.1.');
        WriteLn('[2] ......... Œ… 1.3.2.');
End;


Procedure MENU21;
Begin
        ClrScr;
        WriteLn('                                €Š’“€‹ˆ‡€–ˆŸ.');
        WriteLn('');
        WriteLn('[1] ......... ‚š‚…†„€….');
        WriteLn('[2] ......... Œ… 2.1.2.');
        WriteLn('[3] ......... Œ… 2.1.3.');
End;


Procedure MENU22;
Begin
        ClrScr;
        WriteLn('                                ‘€‚Š€.');
        WriteLn('');
        WriteLn('[1] ......... ˆŒ….');
        WriteLn('[2] ......... Œ… 2.2.2.');
End;


Procedure MENU23;
Begin
        ClrScr;
        WriteLn('                                Œ… 2.3.');
        WriteLn('');
        WriteLn('[1] ......... Œ… 2.3.1.');
        WriteLn('[2] ......... Œ… 2.3.2.');
        WriteLn('[2] ......... Œ… 2.3.3.');
End;



Begin
        ClrScr;
        Br := 1;

        I := 1;
        While (I<51) do Begin
                Kart1[1,I] := ' ';
                Kart1[2,I] := ' ';
                Kart1[3,I] := ' ';
                Kart2[I] := 0;
                I := I + 1;
        End; {endwhile}

        WriteLn('                                   Œ …  ');
        WriteLn('');
        WriteLn('                                   ­  …Œˆ‹');
        WriteLn('');
        WriteLn('');
        WriteLn('                           ²¨±­¥²¥ ª« ¢¨¸  (ENTER)!');
        ReadLn(Ch);

{ MENU }
        sLog := '7';

        While (sLog<>'6') And (sLog<>Chr(27)) do Begin

                While (sLog<>'1') And (sLog<>'2') And (sLog<>'6') And (sLog<>Chr(27)) do Begin
                        MENU;
                        MENU3;
                        sLog := ReadKey;
                        dLog := sLog;
                        sLog1 := sLog;
                End;
                If sLog<>Chr(27) then Begin
                        Write(sLog);
                        ReadLn(Ch);
                End; {endif}

{ MENU1 }
                While sLog1='1' do Begin
                        sLog1 := '7';
                        While (sLog1<>'6') And (sLog1<>Chr(27)) And (sLog1<>'1') And (sLog1<>'2') And (sLog1<>'3') do Begin
                                MENU1;
                                MENU3;
                                sLog1 := ReadKey;
                                sLog2 := sLog1;
                        End; {endwhile}
                        If sLog1<>Chr(27) then Begin
                                Write(sLog1);
                                ReadLn(Ch);
                        End; {endif}

{ MENU11 }
                        If sLog2='1' then Begin
                                sLog3 := '7';
                                While (sLog3<>'6') And (sLog3<>Chr(27)) And (sLog3<>'1') And (sLog3<>'2') do Begin
                                        MENU11;
                                        MENU3;
                                        sLog3 := ReadKey;
                                End; {endwhile}
                                If sLog3<>Chr(27) then Begin
                                        Write(sLog3);
                                        ReadLn(Ch);
                                End; {endif}
                                sLog1 := '1';
                        End; {endif}

{ MENU12 }
                        If sLog2='2' then Begin
                                sLog3 := '7';
                  While (sLog3<>'6') And (sLog3<>Chr(27)) And (sLog3<>'1') And (sLog3<>'2') And (sLog3<>'3') do Begin
                                        MENU12;
                                        MENU3;
                                        sLog3 := ReadKey;
                                End; {endwhile}
                                If sLog3<>Chr(27) then Begin
                                        Write(sLog3);
                                        ReadLn(Ch);
                                End; {endif}
                                sLog1 := '1';
                        End; {endif}

{ MENU13 }
                        If sLog2='3' then Begin
                                sLog3 := '7';
                                While (sLog3<>'6') And (sLog3<>Chr(27)) And (sLog3<>'1') And (sLog3<>'2') do Begin
                                        MENU13;
                                        MENU3;
                                        sLog3 := ReadKey;
                                End; {endwhile}
                                If sLog3<>Chr(27) then Begin
                                        Write(sLog3);
                                        ReadLn(Ch);
                                End; {endif}
                                sLog1 := '1';
                        End; {endif}
                End;

{ MENU2 }
                While sLog1='2' do Begin
                        sLog1 := '7';
                        While (sLog1<>'6') And (sLog1<>Chr(27)) And (sLog1<>'1') And (sLog1<>'2') And (sLog1<>'3') do Begin
                                MENU2;
                                MENU3;
                                sLog1 := ReadKey;
                                sLog2 := sLog1;
                        End; {endwhile}
                        If sLog1<>Chr(27) then Begin
                                Write(sLog1);
                                ReadLn(Ch);
                        End; {endif}

{ MENU21 }
                        If sLog2='1' then Begin
                                sLog3 := '7';
                While (sLog3<>'6') And (sLog3<>Chr(27)) And (sLog3<>'1') And (sLog3<>'2') And (sLog3<>'3') do Begin
                                        MENU21;
                                        MENU3;
                                        sLog3 := ReadKey;
                                End; {endwhile}
                                If sLog3<>Chr(27) then Begin
                                        Write(sLog3);
                                        ReadLn(Ch);
                                End; {endif}
                                If (sLog3='1') then Begin
                                        ClrScr;
                                        WriteLn('                                ‚š‚…†„€….');
                                        WriteLn('');
                                        Write('[1]              ˆŒ…: ');
                                        ReadLn(Kart1[1,Br]);
                                        Write('[2] ”€Š“‹’…’… Œ…: ');
                                        ReadLn(Kart1[2,Br]);
                                        Write('[3]            €„…‘: ');
                                        ReadLn(Kart1[3,Br]);
                                        Write('[4]            “‘…•: ');
                                        ReadLn(Kart2[Br]);
                                        Br := Br + 1;
                                        If (Br>50) then begin
                                                Br := 50;
                                                WriteLn('Œ ±¨¢º² ¥ ¯°¥¯º«­¥­ !');
                                        End; {endif}
                                sLog1 := '2';
                                End; {endif}
                        End; {endif}


{ MENU22 }
                        If sLog2='2' then Begin
                                sLog3 := '7';
                                While (sLog3<>'6') And (sLog3<>Chr(27)) And (sLog3<>'1') And (sLog3<>'2') do Begin
                                        MENU22;
                                        MENU3;
                                        sLog3 := ReadKey;
                                End; {endwhile}
                                If sLog3<>Chr(27) then Begin
                                        Write(sLog3);
                                        ReadLn(Ch);
                                End; {endif}
                                If (sLog3='1') then Begin
                                        Usp := '';
                                        ClrScr;
                                        WriteLn('                                 ˆŒ….');
                                        WriteLn('');
                                        Write('‚º¢¥¤¥²¥ ¨¬¥ §  ±¯° ¢ª : ');
                                        ReadLn(Usp);
                                        WriteLn('');
                                        WriteLn('');
                               WriteLn('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÏ');
                               WriteLn('Ó          ’ˆ’… ˆŒ…€          Ó”€Š. Œ…Ó           €„…‘          Ó “‘…• Ó');
                               WriteLn('ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÔ');
                               WriteLn('                                                                               ');
                                        sLog3 := '7';
                                        I := 1;
                                        While (I<51) do Begin
                                                If (Kart1[1,I]=Usp) then Begin
 WriteLn(' ', Kart1[1,I], '                   ', Kart1[2,I], '        ', Kart1[3,I], '     ', Kart2[I]);
                                                End; {endif}
                                        I := I + 1;
                                        End; {endwhile}
                                        WriteLn('                           ²¨±­¥²¥ ª« ¢¨¸  (ENTER)!');
                                        ReadLn(Ch);
                                End; {endif}
                                sLog1 := '2';
                        End; {endif}

{ MENU23 }
                        If sLog2='3' then Begin
                                sLog3 := '7';
             While (sLog3<>'6') And (sLog3<>Chr(27)) And (sLog3<>'1') And (sLog3<>'2') And (sLog3<>'3') do Begin
                                        MENU23;
                                        MENU3;
                                        sLog3 := ReadKey;
                                End; {endwhile}
                                If sLog3<>Chr(27) then Begin
                                        Write(sLog3);
                                        ReadLn(Ch);
                                End; {endif}
                                sLog1 := '2';
                        End; {endif}
                End;


                If (dLog<>Chr(27)) And (dLog<>'6') then Begin
                        sLog := '7';
                End;

        End; {endwhile}


{ END }
End.

