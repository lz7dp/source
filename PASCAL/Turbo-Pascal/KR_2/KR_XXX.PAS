
{$N+}
{       ฅตญจทฅฑชจ ญจขฅฐฑจฒฅฒ - ฃฐ. ฎดจฟ,  - ฃฐ. ซจขฅญ                 }
{                                                                            }
{       ณฐฑฎข  ฐ กฎฒ  ฏฎ  I ญ  ฎฐญจถ  ฎญฅข  ฎฏฎข             }
{       I ชณฐฑ, "", I ฃฐณฏ                                                 }
{                                                                            }
{       ฐฎฃฐ ฌ  ง  ฃฅญฅฐจฐ ญฅ ญ  ฌ ฑจข ฑ จญดฎฐฌ ถจฟ ฎฒ ฅชฑฏฎญฅญถจ ซญ        }
{       ดณญชถจฟ.                                                             }
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


{ญ ท ซฎ ญ  ฏฐฎฃฐ ฌ ฒ ===================================}
Begin
    ClrScr;
    window(1,1,80,11);
    writeln('ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ<     >ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฯ');
    writeln('ำ          ณฐฑฎข  ฐ กฎฒ  ฏฎ  I ญ  ฎฐญจถ  ฎญฅข  ฎฏฎข           ำ');
    writeln('ำ  [1] ..............       -   [ฅ].      ำ');
    writeln('ำ  [2] ..............       -   F[x].ำ');
    writeln('ำ  [3] ..............    .                              ำ');
    writeln('ำ  [4] ..............   -      [A].ำ');
    writeln('ำ  [5] ..............     [n]   [x].                 ำ');
    writeln('ำ  [6] ..............    -   [ESC].                    ำ');
    writeln('ำ   งกฎฐบฒ ฑฅ ฎฑบนฅฑฒขฟข , ทฐฅง ญ ฒจฑช ญฅ ญ  ถจดฐฎขจฒฅ กณฒฎญจ ฎฒ 1 คฎ 5 !    ำ');
    writeln('ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู');
    window(1,11,80,24);
    writeln('ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ<                     >ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฯ');
    writeln('ำ                                                                             ำ');
    writeln('ำ                                                                             ำ');
    writeln('ำ                                                                             ำ');
    writeln('ำ                                                                             ำ');
    writeln('ำ                                                                             ำ');
    writeln('ำ                                                                             ำ');
    writeln('ำ                                                                             ำ');
    writeln('ำ                                                                             ำ');
    writeln('ำ                                                                             ำ');
    writeln('ำ                                                                             ำ');
    writeln('ำ                                                                             ำ');
    writeln('ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู');
    window(2,12,78,22);
    gotoxy(1,1);

    For i := 1 to 10 Do Begin
        nArr[i] := 0;
        xArr[i] := 0;
        For j := 1 to 2 Do Begin
                A[j,i] := 0.0;
        end; {endfor}
    end; {endfor}

    WriteLn('  !    :');

 Repeat
    Ch1:=ReadKey;
    Case Ch1 of
      '1': Begin
                WriteLn('    ... ');

                For j := 1 to 10 do Begin
                        A[1,j] := ABS(Mul_fact(xArr[j],nArr[j]) - Mul_fact(xArr[j],(nArr[j]-1)));
                End; {endfor}

                WriteLn('     -  [ฅ],   !');
                WriteLn(' ');
                WriteLn('  !    :');
           End;

      '2': Begin
                WriteLn('    ... ');

                For j := 1 to 10 do Begin
                        A[2,j] := e_X(xArr[j],nArr[j]);
                End; {endfor}

                WriteLn('     -   F[x],   !');
                WriteLn(' ');
                WriteLn('  !    :');
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
                        Write(' : [ESC]       ');
                        Ch2 := ReadKey;
                        Ch3 := Ch2;
                        WriteLn(' ');
                Until(Ord(Ch3)=27);
                WriteLn(' ');
                WriteLn('     .');
                WriteLn(' ');
                WriteLn('  !    :');
        End;

      '4': Begin
                WriteLn('    ... ');
                e_min := A[1,1];
                e_pos := 1;
                For j := 1 to 10 do Begin
                        If e_min>A[1,j] Then Begin
                                e_min := A[1,j];
                                e_pos := j;
                        End; {endif}
                End; {endfor}
                WriteLn(' -      [A]  = ', e_min);
                WriteLn('     ', e_pos);
                WriteLn(' ');
                WriteLn('  !    :');
        End;

      '5': Begin
                WriteLn('    ... ');
                For j := 1 to 10 do Begin
                        Write('    n[',j ,'] = ');
                        ReadLn(nArr[j]);
                End; {endfor}
                WriteLn(' ');
                WriteLn('     [n] !');

                For j := 1 to 10 do Begin
                        Write('    x[',j ,'] = ');
                        ReadLn(xArr[j]);
                End; {endfor}
                WriteLn(' ');
                WriteLn('     [x] !');

                WriteLn('  !    :');
        End;

    End;

 Until ((Ord(Ch1)=27) Or (Ch1='6'));
 ClrScr;
End.

