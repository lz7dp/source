{                                         (tm) of DPP-to & (c)1997             }
{                                                                              }
{ █████ █████ █   █ █   █ █████   ███ █████ █████ █   █  █████                 }
{ ╨╨█╨╨КУРСОВА █РАБОТА  █╨█╨╨╨█╨ █╨╨█╨█╨╨╨█╨█╨╨╨╨╨█╨ ██╨█╨╨╨╨█╨                }
{   █╨  ███╨ПО  █╨╨ █████╨█╨  █╨█╨╨ █╨█╨  █╨█╨    █╨█╨█╨╨█████╨                }
{   █╨  █╨╨╨   █╨█╨ █╨╨╨█╨█╨  █╨█╨  █╨█╨  █╨█╨    ██╨╨█╨   █╨█╨                }
{   █╨  █████╨█╨╨ █╨█╨  █╨█████╨█╨  █╨█████╨█╨    █╨╨ █╨ ██╨╨█╨                }
{   ╨╨  ╨╨╨╨╨╨╨╨  ╨╨╨╨  ╨╨╨╨╨╨╨╨╨╨ НА╨ПРОГРАМИРАНЕТО  ╨╨ ╨╨╨ ╨╨                }
{                                                                              }
{ на Дими▓║░ Пенков Павлов                                                     }
{       II К│░▒, I Г░│па, "ЕА"                                                 }
{              ТУ - Со┤и┐, ИПФ - Сливен                                        }

{ Вкл╛╖ваме в║н╕ни библио▓еки.                                                 }
Uses Crt, Dos;

{ Декла░и░аме по▓░еби▓ел▒ки ▓ипове.                                            }
Type
        Data = Record
               D : Integer;
        End;

{ Декла░и░аме п░оменливи▓е.                                                    }
Var
        Ch, Ch1, Ch2, Ch3 : Char;
        i,j,l,Len,ff,ii   : Integer;
        s                 : Data;
        f                 : File of Data;
        Ch4               : Array[1..140,1..32] of Char;
        A                 : Array[1..32] of Char;
        A1                : Array[1..32] of Char;
        A2                : Array[1..32] of Char;
        TA                : Array[1..4,1..120] of Word;

        Br1 : Integer;  { I         }
        Br2 : Integer;  { J         }
        X1  : String;   { KEY for IF}
        X2  : String;   { KEY for IF}
        K   : Integer;  { K         }
        N   : Integer;  { N         }
        T   : Integer;  { LOGIC CON }
        p   : Integer;  { Brojach   }

        T1, T2, T3, T4 : Word;

        VV, dVV, WW, KK, LL, dLL, NN, MM, RR, SS:Integer;


{ На╖ало на ▓┐ло▓о на п░ог░ама▓а.                                              }
Begin
{ Задаваме ▒▓ойно▒▓и на п░оменливи▓е.                                          }
    VV  := 100;
    dVV :=  10;
    WW  :=   5;
    KK  :=   6;
    LL  :=  27;
    dLL :=   1;
    NN  :=   1;
    MM  :=   1;
    RR  :=  10;
    SS  :=   2;

{ С║здаване на ек░ан МЕНЮ.                                                     }
    ClrScr;
    window(1,1,80,11);
    writeln('┌─────────────────────────────────< М Е Н Ю >─────────────────────────────────╧');
    writeln('╙   К│░▒ова ░або▓а по ТЕХНОЛОГИЯ НА ПРОГРАМИРАНЕТО на Дими▓║░ Пенков Павлов   ╙');
    writeln('╙                                                                             ╙');
    writeln('╙  [1] .............. ЗАРЕЖДАНЕ НА ТЕСТОВ ФАЙЛ test.db С ДАННИ.               ╙');
    writeln('╙  [2] .............. ЗАРЕЖДАНЕ НА ТЕСТОВ МАСИВ В ПАМЕТТА С ДАННИ ОТ ФАЙЛА.   ╙');
    writeln('╙  [3] .............. ПЪРВА ТЕСТОВА ЗАДАЧА.                                   ╙');
    writeln('╙  [4] .............. ВТОРА ТЕСТОВА ЗАДАЧА.                                   ╙');
    writeln('╙  [5] .............. ИЗВЕЖДАНЕ МАСИВА НА ЕКРАН.                              ╙');
    writeln('╙  [6] .............. КРАЙ НА РАБОТАТА.                                       ╙');
    writeln('└─────────────────────────────────────────────────────────────────────────────┘');

{ С║здаване на ПОТРЕБИТЕЛСКИ ЕКРАН.                                            }
    window(1,11,80,24);
    writeln('┌──────────────────< П О Т Р Е Б И Т Е Л С К И   Е К Р А Н >──────────────────╧');
    writeln('╙                                                                             ╙');
    writeln('╙                                                                             ╙');
    writeln('╙                                                                             ╙');
    writeln('╙                                                                             ╙');
    writeln('╙                                                                             ╙');
    writeln('╙                                                                             ╙');
    writeln('╙                                                                             ╙');
    writeln('╙                                                                             ╙');
    writeln('╙                                                                             ╙');
    writeln('╙                                                                             ╙');
    writeln('╙                                                                             ╙');
    writeln('└─────────────────────────────────────────────────────────────────────────────┘');
    window(2,12,78,22);
    gotoxy(1,1);
    WriteLn(' ГОТОВ ! ИЗБЕРЕТЕ ОПЦИЯ ОТ МЕНЮТО:');

{ Че▓е клави╕ о▓ клавиа▓│░а▓а.                                                 }
 Repeat
    Ch1 := ReadKey;
    Case Ch1 of
{ Избо░ за ▒║здаване на ┤айл ▒ б│квено-╢и┤░ова ин┤о░ма╢и┐.                     }
      '1': Begin
                ff := 0;
                Randomize;
                Assign(f, 'Test.db');
                Reset(f);
                Len := FileSize(f);
                WriteLn(' НАЧАЛО НА ПРОЦЕСА ... ');
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
                WriteLn(' ФАЙЛЪТ Е ЗАРЕДЕН С БУКВЕНО-ЦИФРОВА ИНФОРМАЦИЯ !');
                WriteLn(' ');
                WriteLn(' ГОТОВ ! ИЗБЕРЕТЕ ОПЦИЯ ОТ МЕНЮТО:');
        End;

{ П░е╡в║░л┐не на данни▓е о▓ ┤айла в ма▒ив о▓ паме▓▓а.                          }
      '2': Begin
                ff := 0;
                Assign(f, 'Test.db');
                Reset(f);
                Len := FileSize(f);
                WriteLn(' НАЧАЛО НА ПРОЦЕСА ... ');
                For i := 1 to 140 do Begin
                        For j := 1 to 32 do Begin
                                Read(f,s);
                                ff := s.D;
                                Ch4[i,j] := Chr(ff);
                        End; {endfor}
                End; {endfor}
                Close(f);
                WriteLn(' МАСИВЪТ Е ЗАРЕДЕН С БУКВЕНО ЦИФРОВА ИНФОРМАЦИЯ !');
                WriteLn(' ');
                WriteLn(' ГОТОВ ! ИЗБЕРЕТЕ ОПЦИЯ ОТ МЕНЮТО:');
        End;

{ Изп║лнение на I-ва ▓е▒▓ова зада╖а.                                           }
      '3': Begin
           p := 0;
           For l := 1 to KK do Begin
                N := VV;
                Br1 := 1;

                Repeat
                        For i := 1 to LL do Begin
                                A[i] := Ch4[Br1,i];
                        End; {endfor}

                        K := Br1;

                        Br2 := Br1 + 1;

                        Repeat
                                T := 0;
                                If (A[1]=Ch4[Br2,1]) Then Begin
                                        X1 := A[10] + A[11];
                                        X2 := Ch4[Br2,10] + Ch4[Br2,11];
                                        If (X1>X2) Then Begin
                                                For i := 1 to LL do Begin
                                                        A[i] := Ch4[Br2,i];
                                                End; {endfor}
                                                K := Br2;
                                        End; {endif}
                                        T := 1;
                                End; {endif}
                                If (T=0) Then Begin
                                        If (A[1]>Ch4[Br2,1]) Then Begin
                                                For i := 1 to LL do Begin
                                                        A[i] := Ch4[Br2,i];
                                                End; {endfor}
                                                K := Br2;
                                        End; {ENDIF}
                                End; {ENDIF}
                                Br2 := Br2 + 1;
                        Until (Br2>N);

                        For i := 1 to LL do Begin
                                Ch4[K,i] := Ch4[Br1,i];
                                Ch4[Br1,i] := A[i];
                        End; {endfor}
                        WriteLn(Br1);
                        Br1 := Br1 + 1;
                Until (Br1>(N-1));

{ Об░а▓но ▒о░▓и░ане + ▓айме░                                                   }
                N := VV;
                Br1 := 1;
                p := p + 1;
                GetTime(TA[1,p],TA[2,p],TA[3,p],TA[4,p]);
                Repeat
                        For i := 1 to LL do Begin
                                A[i] := Ch4[Br1,i];
                        End; {endfor}

                        K := Br1;

                        Br2 := Br1 + 1;

                        Repeat
                                T := 0;
                                If (A[1]=Ch4[Br2,1]) Then Begin
                                        X1 := A[10] + A[11];
                                        X2 := Ch4[Br2,10] + Ch4[Br2,11];
                                        If (X1<X2) Then Begin
                                                For i := 1 to LL do Begin
                                                        A[i] := Ch4[Br2,i];
                                                End; {endfor}
                                                K := Br2;
                                        End; {endif}
                                        T := 1;
                                End; {endif}
                                If (T=0) Then Begin
                                        If (A[1]<Ch4[Br2,1]) Then Begin
                                                For i := 1 to LL do Begin
                                                        A[i] := Ch4[Br2,i];
                                                End; {endfor}
                                                K := Br2;
                                        End; {ENDIF}
                                End; {ENDIF}
                                Br2 := Br2 + 1;
                        Until (Br2>N);

                        For i := 1 to LL do Begin
                                Ch4[K,i] := Ch4[Br1,i];
                                Ch4[Br1,i] := A[i];
                        End; {endfor}
                        WriteLn(Br1);
                        If (Br1=10) And (Br1=10) And (Br1=10) And (Br1=10) And (Br1=10) And (Br1=10) Then Begin
                                p := p + 1;
                                GetTime(TA[1,p],TA[2,p],TA[3,p],TA[4,p]);
                        End; {endif}

                        Br1 := Br1 + 1;
                Until (Br1>(N-1));
                LL := LL + dLL
           End; {ENDFOR}

           WriteLn(' ТЕСТА ПРИКЛЮЧИ !');
           For l := 1 to (p-1) do Begin
                T1 := (TA[1,l+1]-TA[1,l]);
                T2 := (TA[2,l+1]-TA[2,l]);
                T3 := (TA[3,l+1]-TA[3,l]);
                T4 := (TA[4,l+1]-TA[4,l]);
                WriteLn('ек▒пе░. ',l,' ',T1,' ',T2,' ',T3,' ',T4);
                Write('На▓и▒не▓е [ENTER], за да види▓е о▒▓анали▓е');
                ReadLn(Ch3);
           End; {endfor}
           WriteLn(' ');
           WriteLn(' ГОТОВ ! ИЗБЕРЕТЕ ОПЦИЯ ОТ МЕНЮТО:');
           End; {ENDBEGIN}

{ Изп║лнение на II-░а ▓е▒▓ова зада╖а.                                          }
      '4': Begin
           N := VV;
           p := 0;
           For l := 1 to WW do Begin

                LL := 32;
                Br1 := 1;
                Repeat
                        For i := 1 to LL do Begin
                                A[i] := Ch4[Br1,i];
                        End; {endfor}

                        K := Br1;

                        Br2 := Br1 + 1;

                        Repeat
                                T := 0;
                                If (A[1]=Ch4[Br2,1]) Then Begin
                                        X1 := A[10] + A[11];
                                        X2 := Ch4[Br2,10] + Ch4[Br2,11];
                                        If (X1>X2) Then Begin
                                                For i := 1 to LL do Begin
                                                        A[i] := Ch4[Br2,i];
                                                End; {endfor}
                                                K := Br2;
                                        End; {endif}
                                        T := 1;
                                End; {endif}
                                If (T=0) Then Begin
                                        If (A[1]>Ch4[Br2,1]) Then Begin
                                                For i := 1 to LL do Begin
                                                        A[i] := Ch4[Br2,i];
                                                End; {endfor}
                                                K := Br2;
                                        End; {ENDIF}
                                End; {ENDIF}
                                Br2 := Br2 + 1;
                        Until (Br2>N);

                        For i := 1 to LL do Begin
                                Ch4[K,i] := Ch4[Br1,i];
                                Ch4[Br1,i] := A[i];
                        End; {endfor}
                        WriteLn(Br1);
                        Br1 := Br1 + 1;
                Until (Br1>(N-1));


                LL := 32;
                Br1 := 1;
                p := p + 1;
                GetTime(TA[1,p],TA[2,p],TA[3,p],TA[4,p]);
                Repeat
                        For i := 1 to LL do Begin
                                A[i] := Ch4[Br1,i];
                        End; {endfor}

                        K := Br1;

                        Br2 := Br1 + 1;

                        Repeat
                                T := 0;
                                If (A[1]=Ch4[Br2,1]) Then Begin
                                        X1 := A[10] + A[11];
                                        X2 := Ch4[Br2,10] + Ch4[Br2,11];
                                        If (X1<X2) Then Begin
                                                For i := 1 to LL do Begin
                                                        A[i] := Ch4[Br2,i];
                                                End; {endfor}
                                                K := Br2;
                                        End; {endif}
                                        T := 1;
                                End; {endif}
                                If (T=0) Then Begin
                                        If (A[1]<Ch4[Br2,1]) Then Begin
                                                For i := 1 to LL do Begin
                                                        A[i] := Ch4[Br2,i];
                                                End; {endfor}
                                                K := Br2;
                                        End; {ENDIF}
                                End; {ENDIF}
                                Br2 := Br2 + 1;
                        Until (Br2>N);

                        For i := 1 to LL do Begin
                                Ch4[K,i] := Ch4[Br1,i];
                                Ch4[Br1,i] := A[i];
                        End; {endfor}
                        WriteLn(Br1);
                        Br1 := Br1 + 1;
                Until (Br1>(N-1));

                p := p + 1;
                GetTime(TA[1,p],TA[2,p],TA[3,p],TA[4,p]);
                N := N + dVV
           End; {ENDFOR}

           WriteLn(' ТЕСТА ПРИКЛЮЧИ !');
           For l := 1 to p do Begin
                T1 := (TA[1,l+1]-TA[1,l]);
                T2 := (TA[2,l+1]-TA[2,l]);
                T3 := (TA[3,l+1]-TA[3,l]);
                T4 := (TA[4,l+1]-TA[4,l]);
                WriteLn('ек▒пе░. ',l,' ',T1,' ',T2,' ',T3,' ',T4);
                l := l + 1;
           End; {endfor}
           WriteLn(' ');
           WriteLn(' ГОТОВ ! ИЗБЕРЕТЕ ОПЦИЯ ОТ МЕНЮТО:');
           End; {ENDBEGIN}


{ Виз│ализи░ане на ек░ана ма▒ива ▒ данни▓е.                                    }
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
                        Write(' ИЗПОЛЗВАЙТЕ КЛАВИШИ: [ESC]-ИЗХОД, СКРОЛ: [A]-ГОРЕ, [Z]-ДОЛУ');
                        Ch2 := ReadKey;
                        Ch3 := Ch2;
                        WriteLn(' ');

                        if (Ch2='A') Or (Ch2='a') then Begin
                                ii := ii - 1;
                                if ii<0 then begin
                                   ii := 0;
                                End; {endif}
                        End;

                        if (Ch2='Z') Or (Ch2='z') then Begin
                                ii := ii + 1;
                                if ii>130 then Begin
                                   ii := 130;
                                End; {endif}
                        End;
                Until(Ord(Ch3)=27);
                WriteLn(' ');
                WriteLn(' ВИЕ ПРИКЛЮЧИХТЕ РАЗГЛЕЖДАНЕТО НА МАСИВА.');
                WriteLn(' ');
                WriteLn(' ГОТОВ ! ИЗБЕРЕТЕ ОПЦИЯ ОТ МЕНЮТО:');

           End;
{ К░ай на об░або▓ка▓а за избо░ о▓ мен╛▓о.                                      }
    End;
 Until ((Ord(Ch1)=27) Or (Ch1='6'));

 ClrScr;
{ К░ай на п░ог░ама▓а.                                                          }
End.

{                                                                              }
{                                   К Р А Й                                    }
{                                                                              }
{                                                    8900 Нова Заго░а          }
{                                                    │л. К║н╖о Чамов 34        }
{                                                    ▓ел. 0457-23263           }
{                                                         0457-26937           }
{                                                    ┤ак▒.0457-23263           }
{                                                                              }
