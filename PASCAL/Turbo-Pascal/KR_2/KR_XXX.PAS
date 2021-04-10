
{$N+}
{       ’¥µ­¨·¥±ª¨ “­¨¢¥°±¨²¥² - £°. ‘®´¨¿, ˆ” - £°. ‘«¨¢¥­                 }
{                                                                            }
{       Š³°±®¢  ° ¡®²  ¯® ƒ€Œˆ€… I ­  ‡®°­¨¶  „®­¥¢  ®¯®¢             }
{       I ª³°±, "…€", I £°³¯                                                 }
{                                                                            }
{       °®£° ¬  §  £¥­¥°¨° ­¥ ­  ¬ ±¨¢ ± ¨­´®°¬ ¶¨¿ ®² ¥ª±¯®­¥­¶¨ «­        }
{       ´³­ª¶¨¿.                                                             }
{                                                                            }


Uses Crt;


Var
        Ch, Ch1, Ch2, Ch3 : Char;
        i, j, e_pos       : Integer;
        A                 : Array[1..2,1..10] of Real;
        nArr              : Array[1..10] of Integer;
        xArr              : Array[1..10] of Integer;
        e_min             : Real;

Function Mul_fact(x_in:Integer; n_in:Integer):Real;
Var
   i, Fn, St : Integer;
Begin
   Fn := 1;
   i := 1;
   If n_in > 1 Then Begin
        For i := 2 to n_in Do Begin
                Fn := Fn * i;
        End; {endfor}
   End; {endif}
   St := x_in;
   For i := 2 to n_in Do Begin
        St := St * x_in;
   End; {endfor}
   Mul_fact := St / Fn;
End;

Function e_X(x_in:Integer; n_in:Integer):Real;
Var
   i    : Integer;
   eX   : Real;
Begin
   eX := 1 + x_in;
   For i := 2 to n_in Do Begin
        eX := eX + Mul_fact(x_in,i);
   End; {endfor}
   e_X := eX;
End;


{­ · «® ­  ¯°®£° ¬ ² ===================================}
Begin
    ClrScr;
    window(1,1,80,11);
    writeln('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ< Œ …   >ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÏ');
    writeln('Ó          Š³°±®¢  ° ¡®²  ¯® ƒ€Œˆ€… I ­  ‡®°­¨¶  „®­¥¢  ®¯®¢           Ó');
    writeln('Ó  [1] .............. ƒ……ˆ€… € …‹…Œ…’ˆ’… ’ Œ€‘ˆ‚ € - ƒ…˜Š€  [¥].      Ó');
    writeln('Ó  [2] .............. ƒ……ˆ€… € …‹…Œ…’ˆ’… ’ Œ€‘ˆ‚ € - ‘’‰‘’ˆ € F[x].Ó');
    writeln('Ó  [3] .............. ˆ‡‚…†„€… Œ€‘ˆ‚€ € …Š€.                              Ó');
    writeln('Ó  [4] .............. ˆ‡‚…†„€… € €‰-Œ€‹Š’ —ˆ‘‹ ’ š‚€’€ Š‹€ € [A].Ó');
    writeln('Ó  [5] .............. ‚š‚…†„€… € ‘’‰‘’ˆ ‡€ [n] ˆ ‡€ [x].                 Ó');
    writeln('Ó  [6] .............. Š€‰ € €’€’€ - ˆ‹ˆ Š‹€‚ˆ˜ [ESC].                    Ó');
    writeln('Ó   ˆ§¡®°º² ±¥ ®±º¹¥±²¢¿¢ , ·°¥§ ­ ²¨±ª ­¥ ­  ¶¨´°®¢¨²¥ ¡³²®­¨ ®² 1 ¤® 5 !    Ó');
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

    For i := 1 to 10 Do Begin
        nArr[i] := 0;
        xArr[i] := 0;
        For j := 1 to 2 Do Begin
                A[j,i] := 0.0;
        end; {endfor}
    end; {endfor}

    WriteLn(' ƒ’‚ ! ˆ‡……’… –ˆŸ ’ Œ…’:');

 Repeat
    Ch1:=ReadKey;
    Case Ch1 of
      '1': Begin
                WriteLn(' €—€‹ € –…‘€ ... ');

                For j := 1 to 10 do Begin
                        A[1,j] := ABS(Mul_fact(xArr[j],nArr[j]) - Mul_fact(xArr[j],(nArr[j]-1)));
                End; {endfor}

                WriteLn(' …‹…Œ…’ˆ’… ’ Œ€‘ˆ‚ € - ƒ…˜Š€ [¥], ‘€ ƒ……ˆ€ˆ !');
                WriteLn(' ');
                WriteLn(' ƒ’‚ ! ˆ‡……’… –ˆŸ ’ Œ…’:');
           End;

      '2': Begin
                WriteLn(' €—€‹ € –…‘€ ... ');

                For j := 1 to 10 do Begin
                        A[2,j] := e_X(xArr[j],nArr[j]);
                End; {endfor}

                WriteLn(' …‹…Œ…’ˆ’… ’ Œ€‘ˆ‚ € - ‘’‰‘’ˆ € F[x], ‘€ ƒ……ˆ€ˆ !');
                WriteLn(' ');
                WriteLn(' ƒ’‚ ! ˆ‡……’… –ˆŸ ’ Œ…’:');
           End;


      '3': Begin
                Repeat
                        For i := 1 to 10 do Begin
                                Write(' ', i, '  ');
                                For j := 1 to 2 do Begin
                                        Write(A[j,i],'   ');
                                End; {endfor}
                                WriteLn(' ');
                        End; {endfor}
                        Write(' Š‹€‚ˆ˜: [ESC] Š€‰ € €‡ƒ‹…†„€…’ ˆ ˆ‡•„ ŠšŒ Œ…');
                        Ch2 := ReadKey;
                        Ch3 := Ch2;
                        WriteLn(' ');
                Until(Ord(Ch3)=27);
                WriteLn(' ');
                WriteLn(' ‚ˆ… ˆŠ‹—ˆ•’… €‡ƒ‹…†„€…’ € Œ€‘ˆ‚€.');
                WriteLn(' ');
                WriteLn(' ƒ’‚ ! ˆ‡……’… –ˆŸ ’ Œ…’:');
        End;

      '4': Begin
                WriteLn(' €—€‹ € –…‘€ ... ');
                e_min := A[1,1];
                e_pos := 1;
                For j := 1 to 10 do Begin
                        If e_min>A[1,j] Then Begin
                                e_min := A[1,j];
                                e_pos := j;
                        End; {endif}
                End; {endfor}
                WriteLn(' €‰-Œ€‹Š’ —ˆ‘‹ ’ š‚€’€ Š‹€ € [A] … = ', e_min);
                WriteLn(' ‡ˆ–ˆŸ’€ € —ˆ‘‹’ … ', e_pos);
                WriteLn(' ');
                WriteLn(' ƒ’‚ ! ˆ‡……’… –ˆŸ ’ Œ…’:');
        End;

      '5': Begin
                WriteLn(' €—€‹ € –…‘€ ... ');
                For j := 1 to 10 do Begin
                        Write(' ‚š‚…„…’… ‘’‰‘’’€ € n[',j ,'] = ');
                        ReadLn(nArr[j]);
                End; {endfor}
                WriteLn(' ');
                WriteLn(' ‚ˆ… ˆŠ‹—ˆ•’… ‚š‚…†„€…’ € [n] !');

                For j := 1 to 10 do Begin
                        Write(' ‚š‚…„…’… ‘’‰‘’’€ € x[',j ,'] = ');
                        ReadLn(xArr[j]);
                End; {endfor}
                WriteLn(' ');
                WriteLn(' ‚ˆ… ˆŠ‹—ˆ•’… ‚š‚…†„€…’ € [x] !');

                WriteLn(' ƒ’‚ ! ˆ‡……’… –ˆŸ ’ Œ…’:');
        End;

    End;

 Until ((Ord(Ch1)=27) Or (Ch1='6'));
 ClrScr;
End.

