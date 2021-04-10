
Program Mihail;

Uses Crt;

Var     Sim : String;
        A, A1, A2, A3, B1 : Char;
        He, P1, P2, P3, P4, P5 : String;
        B : Integer;


Procedure MENU(Hed,St1,St2,St3,St4,St5:String; Br:Integer);
Begin
        ClrScr;
        WriteLn(Hed);
        WriteLn('');

        If Br>=1 then Begin
                WriteLn('');
                WriteLn('');
                WriteLn('                                 [1] ',St1);
        end;

        If Br>=2 then Begin
                WriteLn('');
                WriteLn('');
                WriteLn('                                 [2] ',St2);
        end;

        If Br>=3 then Begin
                WriteLn('');
                WriteLn('');
                WriteLn('                                 [3] ',St3);
        end;

        If Br>=4 then Begin
                WriteLn('');
                WriteLn('');
                WriteLn('                                 [4] ',St4);
        end;

        If Br>=5 then Begin
                WriteLn('');
                WriteLn('');
                WriteLn('                                 [5] ',St5);
        end;
End;


Procedure MENU3;
Begin
       WriteLn(' ');
       WriteLn(' ');
       WriteLn('                                 [6] àáïéÑ.');
       WriteLn(' ');
       WriteLn(' ');
       Write('                      ÇöÇÖÑÖíÖ ÇÄòàüí àáÅéê > ');
End;


Begin
       He := ' ';
       P1 := ' ';
       P2 := ' ';
       P3 := ' ';
       P4 := ' ';
       P5 := ' ';
        B := 0;

        ClrScr;
        WriteLn('                                                              ');
        WriteLn('                                    å Ö ç û                   ');
        WriteLn('                                                              ');
        WriteLn('                                                              ');
        WriteLn('                                ç†≤®±≠® (ENTER)!              ');
        WriteLn('                                                              ');

        ReadLn(Sim);


        A := '7';
        While (A<>'6') And (A<>Chr(27)) do Begin
                While (A<>'1') And (A<>'2') And (A<>'6') And (A<>Chr(27)) do Begin
                        He := '                                    åÖçû èêéÉêÄåÄ    ';
                        B := 2;
                        P1 := 'åÖçû 1';
                        P2 := 'åÖçû 2';
                        MENU(He,P1,P2,P3,P4,P5,B);
                        MENU3;
                        A := ReadKey;
                        B1 := A;
                        A1 := A;
                End;
                If A<>Chr(27) then Begin
                        Write(A);
                        ReadLn(Sim);
                End;

{ MENU1 }
                While A1='1' do Begin
                        A1 := '7';
While(A1<>'6')And(A1<>Chr(27))And(A1<>'1')And(A1<>'2')And(A1<>'3')And(A1<>'4') do Begin
                                He := '                                     åÖçû 1    ';
                                B := 4;
                                P1 := 'åÖçû 1.1';
                                P2 := 'åÖçû 1.2';
                                P3 := 'åÖçû 1.3';
                                P4 := 'åÖçû 1.4';
                                MENU(He,P1,P2,P3,P4,P5,B);
                                MENU3;
                                A1 := ReadKey;
                                A2 := A1;
                        End;
                        If A1<>Chr(27) then Begin
                                Write(A1);
                                ReadLn(Sim);
                        End;

                        If A2='1' then Begin
                                A3 := '7';
                        While (A3<>'6') And (A3<>Chr(27)) And (A3<>'1') And (A3<>'2') do Begin
                                        He := '                                    åÖçû 1.1    ';
                                        B := 2;
                                        P1 := 'åÖçû 1.1.1';
                                        P2 := 'åÖçû 1.1.2';
                                        MENU(He,P1,P2,P3,P4,P5,B);
                                        MENU3;
                                        A3 := ReadKey;
                                End;
                                If A3<>Chr(27) then Begin
                                        Write(A3);
                                        ReadLn(Sim);
                                End;
                                A1 := '1';
                                A2 := '1';
                        End;

                        If A2='2' then Begin
                                A3 := '7';
While (A3<>'6') And (A3<>Chr(27)) And (A3<>'1') And (A3<>'2') And (A3<>'3') do Begin
                                        He := '                                    åÖçû 1.2    ';
                                        B := 3;
                                        P1 := 'åÖçû 1.2.1';
                                        P2 := 'åÖçû 1.2.2';
                                        P3 := 'åÖçû 1.2.3';
                                        MENU(He,P1,P2,P3,P4,P5,B);
                                        MENU3;
                                        A3 := ReadKey;
                                End;
                                If A3<>Chr(27) then Begin
                                        Write(A3);
                                        ReadLn(Sim);
                                End;
                                A1 := '1';
                                A2 := '2';
                        End;

                        If A2='3' then Begin
                                A3 := '7';
While (A3<>'6') And (A3<>Chr(27)) And (A3<>'1') And (A3<>'2') And (A3<>'3') And (A3<>'4') do Begin
                                        He := '                                    åÖçû 1.3    ';
                                        B := 4;
                                        P1 := 'åÖçû 1.3.1';
                                        P2 := 'åÖçû 1.3.2';
                                        P3 := 'åÖçû 1.3.3';
                                        P4 := 'åÖçû 1.3.4';
                                        MENU(He,P1,P2,P3,P4,P5,B);
                                        MENU3;
                                        A3 := ReadKey;
                                End;
                                If A3<>Chr(27) then Begin
                                        Write(A3);
                                        ReadLn(Sim);
                                End;
                                A1 := '1';
                                A2 := '3';
                        End;

                        If A2='4' then Begin
                                A3 := '7';
While (A3<>'6') And (A3<>Chr(27)) And (A3<>'1') And (A3<>'2') And (A3<>'3') do Begin
                                        He := '                                    åÖçû 1.4    ';
                                        B := 3;
                                        P1 := 'åÖçû 1.4.1';
                                        P2 := 'åÖçû 1.4.2';
                                        P3 := 'åÖçû 1.4.3';
                                        MENU(He,P1,P2,P3,P4,P5,B);
                                        MENU3;
                                        A3 := ReadKey;
                                End;
                                If A3<>Chr(27) then Begin
                                        Write(A3);
                                        ReadLn(Sim);
                                End;
                                A1 := '1';
                                A2 := '4';
                        End;

                End;

                While A1='2' do Begin
                        A1 := '7';
While (A1<>'6') And (A1<>Chr(27)) And (A1<>'1') And (A1<>'2') And (A1<>'3') do Begin
                                He := '                                    åÖçû 2    ';
                                B := 3;
                                P1 := 'ÄäíìÄãàáÄñàü';
                                P2 := 'ëèêÄÇäÄ';
                                P3 := 'åÖçû 2.3';
                                MENU(He,P1,P2,P3,P4,P5,B);
                                MENU3;
                                A1 := ReadKey;
                                A2 := A1;
                        End;
                        If A1<>Chr(27) then Begin
                                Write(A1);
                                ReadLn(Sim);
                        End;


                        If A2='1' then Begin
                                A3 := '7';
While (A3<>'6') And (A3<>Chr(27)) And (A3<>'1') And (A3<>'2') And (A3<>'3') And (A3<>'4') do Begin
                                        He := '                                    ÄäíìÄãàáÄñàü    ';
                                        B := 4;
                                        P1 := 'ÇöÇÖÜÑÄçÖ';
                                        P2 := 'åÖçû 2.1.2';
                                        P3 := 'åÖçû 2.1.3';
                                        P4 := 'åÖçû 2.1.4';
                                        MENU(He,P1,P2,P3,P4,P5,B);
                                        MENU3;
                                        A3 := ReadKey;
                                End;
                                If A3<>Chr(27) then Begin
                                        Write(A3);
                                        ReadLn(Sim);
                                End;
                                A1 := '2';
                                A2 := '1';
                        End;


                        If A2='2' then Begin
                                A3 := '7';
While (A3<>'6') And (A3<>Chr(27)) And (A3<>'1') And (A3<>'2') And (A3<>'3') And (A3<>'4') do Begin
                                        He := '                                    ëèêÄÇäÄ    ';
                                        B := 4;
                                        P1 := 'ìëèÖï';
                                        P2 := 'åÖçû 2.2.2';
                                        P3 := 'åÖçû 2.2.3';
                                        P4 := 'åÖçû 2.2.4';
                                        MENU(He,P1,P2,P3,P4,P5,B);
                                        MENU3;
                                        A3 := ReadKey;
                                End;
                                If A3<>Chr(27) then Begin
                                        Write(A3);
                                        ReadLn(Sim);
                                End;
                                A1 := '2';
                                A2 := '2';
                        End;


                        If A2='3' then Begin
                                A3 := '7';
While (A3<>'6') And (A3<>Chr(27)) And (A3<>'1') And (A3<>'2') And (A3<>'3') And (A3<>'4') do Begin
                                        He := '                                    åÖçû 2.3    ';
                                        B := 4;
                                        P1 := 'åÖçû 2.3.1';
                                        P2 := 'åÖçû 2.3.2';
                                        P3 := 'åÖçû 2.3.3';
                                        P4 := 'åÖçû 2.3.4';
                                        MENU(He,P1,P2,P3,P4,P5,B);
                                        MENU3;
                                        A3 := ReadKey;
                                End;
                                If A3<>Chr(27) then Begin
                                        Write(A3);
                                        ReadLn(Sim);
                                End;
                                A1 := '2';
                                A2 := '3';
                        End;

                End;


                If (B1<>Chr(27)) And (B1<>'6') then Begin
                        A := '7';
                End;
        End;


        WriteLn('ÑéÇàÜÑÄçÖ !');
End.
