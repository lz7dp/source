{ ŗ°ąŽĸ   ĄŽ˛  Ž °ŽŖ° Ŧ¨° ­Ĩ III }
{   ¨Ŧ¨˛ē° Ĩ­ĒŽĸ  ĸĢŽĸ           }

Program DPP_PAS;

Uses Crt;

Var   Ch : String;
     Bul : Char;
    Bul1 : Char;
    Bul2 : Char;
    Bul3 : Char;
    vBul : Char;
      He : String;
      P1 : String;
      P2 : String;
      P3 : String;
      P4 : String;
      P5 : String;
       B : Integer;
     Usp : Real;
      Br : Integer;
       I : Integer;
    Dim1 : Array[1..3,1..50] of String;
    Dim2 : Array[1..50] of Real;




Procedure MENU(Hed,S1,S2,S3,S4,S5:String; Bl:Integer);
Begin{Procedure MENU}
        ClrScr;
        WriteLn(Hed);
        WriteLn('');

        If Bl>=1 then Begin
                WriteLn('                                 <1> ',S1);
        end; {endif}

        If Bl>=2 then Begin
                WriteLn('                                 <2> ',S2);
        end; {endif}

        If Bl>=3 then Begin
                WriteLn('                                 <3> ',S3);
        end; {endif}

        If Bl>=4 then Begin
                WriteLn('                                 <4> ',S4);
        end; {endif}

        If Bl>=5 then Begin
                WriteLn('                                 <5> ',S5);
        end; {endif}
End;{Procedure MENU}


Procedure MENU3;
Begin { MENU3 }
       WriteLn('                                 <6> .');
       WriteLn(' ');
       WriteLn(' ');
       Write('                                  : ');
End; { MENU3 }


Begin { Program }
        Br := 1;
        I := 1;
        While (I<51) do Begin
                Dim1[1,I] := ' ';
                Dim1[2,I] := ' ';
                Dim1[3,I] := ' ';
                Dim2[I] := 0;
                I := I + 1;
        End; {endwhile}
        He := ' ';
        P1 := ' ';
        P2 := ' ';
        P3 := ' ';
        P4 := ' ';
        P5 := ' ';
        B := 0;

        ClrScr;
        WriteLn('                  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ×');
        WriteLn('                  Į                                          Į');
        WriteLn('                  Į                                      Į');
        WriteLn('                  Į                                          Į');
        WriteLn('                  Į         ­  ¨Ŧ¨˛ē° Ĩ­ĒŽĸ  ĸĢŽĸ         Į');
        WriteLn('                  Į                                          Į');
        WriteLn('                  Į         ˛¨ą­Ĩ˛Ĩ ĒĢ ĸ¨¸  [ENTER]!        Į');
        WriteLn('                  Į                                          Į');
        WriteLn('                  ČÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØ');

        ReadLn(Ch);

{ MENU }
        Bul := '7';

        While (Bul<>'6') And (Bul<>Chr(27)) do Begin

                While (Bul<>'1') And (Bul<>'2') And (Bul<>'6') And (Bul<>Chr(27)) do Begin
                        He := '                                -=<   >=-';
                        B := 2;
                        P1 := ' 1';
                        P2 := ' 2';
                        MENU(He,P1,P2,P3,P4,P5,B);
                        MENU3;
                        Bul := ReadKey;
                        vBul := Bul;
                        Bul1 := Bul;
                End;
                If Bul<>Chr(27) then Begin
                        Write(Bul);
                        ReadLn(Ch);
                End; {endif}

{ MENU1 }
                While Bul1='1' do Begin
                        Bul1 := '7';
While(Bul1<>'6')And(Bul1<>Chr(27))And(Bul1<>'1')And(Bul1<>'2')And(Bul1<>'3')And(Bul1<>'4') do Begin
                                He := '                                -=<   1 >=-';
                                B := 4;
                                P1 := ' 1.1';
                                P2 := ' 1.2';
                                P3 := ' 1.3';
                                P4 := ' 1.4';
                                MENU(He,P1,P2,P3,P4,P5,B);
                                MENU3;
                                Bul1 := ReadKey;
                                Bul2 := Bul1;
                        End; {endwhile}
                        If Bul1<>Chr(27) then Begin
                                Write(Bul1);
                                ReadLn(Ch);
                        End; {endif}

{ MENU11 }
                        If Bul2='1' then Begin
                                Bul3 := '7';
While(Bul3<>'6')And(Bul3<>Chr(27))And(Bul3<>'1')And(Bul3<>'2') do Begin
                                        He := '                                -=<  1.1 >=-';
                                        B := 2;
                                        P1 := ' 1.1.1';
                                        P2 := ' 1.1.2';
                                        MENU(He,P1,P2,P3,P4,P5,B);
                                        MENU3;
                                        Bul3 := ReadKey;
                                End; {endwhile}
                                If Bul3<>Chr(27) then Begin
                                        Write(Bul3);
                                        ReadLn(Ch);
                                End; {endif}
                                Bul1 := '1';
                                Bul2 := '1';
                        End; {endif}

{ MENU12 }
                        If Bul2='2' then Begin
                                Bul3 := '7';
While (Bul3<>'6') And (Bul3<>Chr(27)) And (Bul3<>'1') And (Bul3<>'2') And (Bul3<>'3') do Begin
                                        He := '                                -=<  1.2 >=-';
                                        B := 3;
                                        P1 := ' 1.2.1';
                                        P2 := ' 1.2.2';
                                        P3 := ' 1.2.3';
                                        MENU(He,P1,P2,P3,P4,P5,B);
                                        MENU3;
                                        Bul3 := ReadKey;
                                End; {endwhile}
                                If Bul3<>Chr(27) then Begin
                                        Write(Bul3);
                                        ReadLn(Ch);
                                End; {endif}
                                Bul1 := '1';
                                Bul2 := '2';
                        End; {endif}

{ MENU13 }
                        If Bul2='3' then Begin
                                Bul3 := '7';
While (Bul3<>'6') And (Bul3<>Chr(27)) And (Bul3<>'1') And (Bul3<>'2') And (Bul3<>'3') And (Bul3<>'4') do Begin
                                        He := '                                -=<  1.3 >=-';
                                        B := 4;
                                        P1 := ' 1.3.1';
                                        P2 := ' 1.3.2';
                                        P3 := ' 1.3.3';
                                        P4 := ' 1.3.4';
                                        MENU(He,P1,P2,P3,P4,P5,B);
                                        MENU3;
                                        Bul3 := ReadKey;
                                End; {endwhile}
                                If Bul3<>Chr(27) then Begin
                                        Write(Bul3);
                                        ReadLn(Ch);
                                End; {endif}
                                Bul1 := '1';
                                Bul2 := '3';
                        End; {endif}

{ MENU14 }
                        If Bul2='4' then Begin
                                Bul3 := '7';
While (Bul3<>'6') And (Bul3<>Chr(27)) And (Bul3<>'1') And (Bul3<>'2') And (Bul3<>'3') do Begin
                                        He := '                                -=<  1.4 >=-';
                                        B := 3;
                                        P1 := ' 1.4.1';
                                        P2 := ' 1.4.2';
                                        P3 := ' 1.4.3';
                                        MENU(He,P1,P2,P3,P4,P5,B);
                                        MENU3;
                                        Bul3 := ReadKey;
                                End; {endwhile}
                                If Bul3<>Chr(27) then Begin
                                        Write(Bul3);
                                        ReadLn(Ch);
                                End; {endif}
                                Bul1 := '1';
                                Bul2 := '4';
                        End; {endif}

                End;

{ MENU2 }
                While Bul1='2' do Begin
                        Bul1 := '7';
While (Bul1<>'6') And (Bul1<>Chr(27)) And (Bul1<>'1') And (Bul1<>'2') And (Bul1<>'3') do Begin
                                He := '                                -=<  2 >=-';
                                B := 3;
                                P1 := '';
                                P2 := '';
                                P3 := ' 2.3';
                                MENU(He,P1,P2,P3,P4,P5,B);
                                MENU3;
                                Bul1 := ReadKey;
                                Bul2 := Bul1;
                        End; {endwhile}
                        If Bul1<>Chr(27) then Begin
                                Write(Bul1);
                                ReadLn(Ch);
                        End; {endif}

{ MENU21 }
                        If Bul2='1' then Begin
                                Bul3 := '7';
While (Bul3<>'6') And (Bul3<>Chr(27)) And (Bul3<>'1') And (Bul3<>'2') And (Bul3<>'3') And (Bul3<>'4') do Begin
                                        He := '                                -=<  >=-';
                                        B := 4;
                                        P1 := '';
                                        P2 := ' 2.1.2';
                                        P3 := ' 2.1.3';
                                        P4 := ' 2.1.4';
                                        MENU(He,P1,P2,P3,P4,P5,B);
                                        MENU3;
                                        Bul3 := ReadKey;
                                End; {endwhile}
                                If Bul3<>Chr(27) then Begin
                                        Write(Bul3);
                                        ReadLn(Ch);
                                End; {endif}
                                If (Bul3='1') then Begin
                                        ClrScr;
                                        WriteLn('                                .');
                                        WriteLn('');
                                        Write('.................: ');
                                        ReadLn(Dim1[1,Br]);
                                        Write('.... : ');
                                        ReadLn(Dim1[2,Br]);
                                        Write('...............: ');
                                        ReadLn(Dim1[3,Br]);
                                        Write('...............: ');
                                        ReadLn(Dim2[Br]);
                                        Br := Br + 1;
                                        If (Br>50) then begin
                                                Br := 50;
                                                WriteLn(' ą¨ĸē˛ Ĩ ¯°Ĩ¯ēĢ­Ĩ­ !');
                                                WriteLn('                           ˛¨ą­Ĩ˛Ĩ ĒĢ ĸ¨¸  [ENTER]!');
                                                ReadLn(Ch);
                                        End; {endif}
                                        Bul3 := '7';
                                End; {endif}
                                Bul1 := '2';
                                Bul2 := '1';
                        End; {endif}

{ MENU22 }
                        If Bul2='2' then Begin
                                Bul3 := '7';
While (Bul3<>'6') And (Bul3<>Chr(27)) And (Bul3<>'1') And (Bul3<>'2') And (Bul3<>'3') And (Bul3<>'4') do Begin
                                        He := '                                -=<  >=-';
                                        B := 4;
                                        P1 := '';
                                        P2 := ' 2.2.2';
                                        P3 := ' 2.2.3';
                                        P4 := ' 2.2.4';
                                        MENU(He,P1,P2,P3,P4,P5,B);
                                        MENU3;
                                        Bul3 := ReadKey;
                                End; {endwhile}
                                If Bul3<>Chr(27) then Begin
                                        Write(Bul3);
                                        ReadLn(Ch);
                                End; {endif}
                                If (Bul3='1') then Begin
                                        Usp := 0.0;
                                        ClrScr;
                                        WriteLn('                                 .');
                                        WriteLn('');
                                        Write('ēĸĨ¤Ĩ˛Ĩ ŗą¯Ĩĩ §  ą¯° ĸĒ : ');
                                        ReadLn(Usp);
                                        WriteLn('');
                                        WriteLn('');
                                        ClrScr;

                               WriteLn('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄĪ');
                               WriteLn('Ķ                                             Ķ');
                               WriteLn('ĀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄŲ');
                               WriteLn('                                                                               ');
                                        Bul3 := '7';
                                        I := 1;
                                        While (I<51) do Begin
                                                If (Dim2[I]=Usp) then Begin
                                                        WriteLn('');
                                                        WriteLn(' : ', Dim1[1,I]);
                                                        WriteLn(' Õ ', Dim1[2,I]);
                                                        WriteLn('      : ', Dim1[3,I]);
							WriteLn('      :', Dim2[I]);
                                                        WriteLn('');
                                                End; {endif}
                                        I := I + 1;
                                        End; {endwhile}
                                        WriteLn('                           ˛¨ą­Ĩ˛Ĩ ĒĢ ĸ¨¸  [ENTER]!');
                                        ReadLn(Ch);


                                End; {endif}
                                Bul1 := '2';
                                Bul2 := '2';
                        End; {endif}

{ MENU23 }
                        If Bul2='3' then Begin
                                Bul3 := '7';
While (Bul3<>'6') And (Bul3<>Chr(27)) And (Bul3<>'1') And (Bul3<>'2') And (Bul3<>'3') And (Bul3<>'4') do Begin
                                        He := '                                -=<  2.3 >=-';
                                        B := 4;
                                        P1 := ' 2.3.1';
                                        P2 := ' 2.3.2';
                                        P3 := ' 2.3.3';
                                        P4 := ' 2.3.4';
                                        MENU(He,P1,P2,P3,P4,P5,B);
                                        MENU3;
                                        Bul3 := ReadKey;
                                End; {endwhile}
                                If Bul3<>Chr(27) then Begin
                                        Write(Bul3);
                                        ReadLn(Ch);
                                End; {endif}
                                Bul1 := '2';
                                Bul2 := '3';
                        End; {endif}

                End;


                If (vBul<>Chr(27)) And (vBul<>'6') then Begin
                        Bul := '7';
                End;

        End; {endwhile}


        WriteLn('');
        WriteLn('');
        WriteLn('');
        WriteLn('                !');
End. { Program }

