{                                         (tm) of DPP-to & (c)1997             }
{                                                                              }
{ ÛÛÛÛÛ ÛÛÛÛÛ Û   Û Û   Û ÛÛÛÛÛ   ÛÛÛ ÛÛÛÛÛ ÛÛÛÛÛ Û   Û  ÛÛÛÛÛ                 }
{ ÐÐÛÐÐ Û  ÛÐÛÐÐÐÛÐ ÛÐÐÛÐÛÐÐÐÛÐÛÐÐÐÐÐÛÐ ÛÛÐÛÐÐÐÐÛÐ                }
{   ÛÐ  ÛÛÛÐ  ÛÐÐ ÛÛÛÛÛÐÛÐ  ÛÐÛÐÐ ÛÐÛÐ  ÛÐÛÐ    ÛÐÛÐÛÐÐÛÛÛÛÛÐ                }
{   ÛÐ  ÛÐÐÐ   ÛÐÛÐ ÛÐÐÐÛÐÛÐ  ÛÐÛÐ  ÛÐÛÐ  ÛÐÛÐ    ÛÛÐÐÛÐ   ÛÐÛÐ                }
{   ÛÐ  ÛÛÛÛÛÐÛÐÐ ÛÐÛÐ  ÛÐÛÛÛÛÛÐÛÐ  ÛÐÛÛÛÛÛÐÛÐ    ÛÐÐ ÛÐ ÛÛÐÐÛÐ                }
{   ÐÐ  ÐÐÐÐÐÐÐÐ  ÐÐÐÐ  ÐÐÐÐÐÐÐÐÐÐ Ð  ÐÐ ÐÐÐ ÐÐ                }
{                                                                              }
{ ­  ¨¬¨²º° ¥­ª®¢  ¢«®¢                                                     }
{       II ³°±, I °³¯ , ""                                                 }
{               - ®´¨¿,  - «¨¢¥­                                        }

{ ª«¾·¢ ¬¥ ¢º­¸­¨ ¡¨¡«¨®²¥ª¨.                                                 }
Uses Crt, Dos;

{ ¥ª« °¨° ¬¥ ¯®²°¥¡¨²¥«±ª¨ ²¨¯®¢¥.                                            }
Type
        Data = Record
               D : Integer;
        End;

{ ¥ª« °¨° ¬¥ ¯°®¬¥­«¨¢¨²¥.                                                    }
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


{  · «® ­  ²¿«®²® ­  ¯°®£° ¬ ² .                                              }
Begin
{  ¤ ¢ ¬¥ ±²®©­®±²¨ ­  ¯°®¬¥­«¨¢¨²¥.                                          }
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

{ º§¤ ¢ ­¥ ­  ¥ª° ­ .                                                     }
    ClrScr;
    window(1,1,80,11);
    writeln('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ<     >ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÏ');
    writeln('Ó   ³°±®¢  ° ¡®²  ¯®    ­  ¨¬¨²º° ¥­ª®¢  ¢«®¢   Ó');
    writeln('Ó                                                                             Ó');
    writeln('Ó  [1] ..............     test.db  .               Ó');
    writeln('Ó  [2] ..............          .   Ó');
    writeln('Ó  [3] ..............   .                                   Ó');
    writeln('Ó  [4] ..............   .                                   Ó');
    writeln('Ó  [5] ..............    .                              Ó');
    writeln('Ó  [6] ..............   .                                       Ó');
    writeln('ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');

{ º§¤ ¢ ­¥ ­   .                                            }
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

{ ¥²¥ ª« ¢¨¸ ®² ª« ¢¨ ²³° ² .                                                 }
 Repeat
    Ch1 := ReadKey;
    Case Ch1 of
{ §¡®° §  ±º§¤ ¢ ­¥ ­  ´ ©« ± ¡³ª¢¥­®-¶¨´°®¢  ¨­´®°¬ ¶¨¿.                     }
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

{ °¥µ¢º°«¿­¥ ­  ¤ ­­¨²¥ ®² ´ ©«  ¢ ¬ ±¨¢ ®² ¯ ¬¥²² .                          }
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

{ §¯º«­¥­¨¥ ­  I-¢  ²¥±²®¢  § ¤ · .                                           }
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

{ ¡° ²­® ±®°²¨° ­¥ + ² ©¬¥°                                                   }
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

           WriteLn('   !');
           For l := 1 to (p-1) do Begin
                T1 := (TA[1,l+1]-TA[1,l]);
                T2 := (TA[2,l+1]-TA[2,l]);
                T3 := (TA[3,l+1]-TA[3,l]);
                T4 := (TA[4,l+1]-TA[4,l]);
                WriteLn('¥ª±¯¥°. ',l,' ',T1,' ',T2,' ',T3,' ',T4);
                Write(' ²¨±­¥²¥ [ENTER], §  ¤  ¢¨¤¨²¥ ®±² ­ «¨²¥');
                ReadLn(Ch3);
           End; {endfor}
           WriteLn(' ');
           WriteLn('  !    :');
           End; {ENDBEGIN}

{ §¯º«­¥­¨¥ ­  II-°  ²¥±²®¢  § ¤ · .                                          }
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

           WriteLn('   !');
           For l := 1 to p do Begin
                T1 := (TA[1,l+1]-TA[1,l]);
                T2 := (TA[2,l+1]-TA[2,l]);
                T3 := (TA[3,l+1]-TA[3,l]);
                T4 := (TA[4,l+1]-TA[4,l]);
                WriteLn('¥ª±¯¥°. ',l,' ',T1,' ',T2,' ',T3,' ',T4);
                l := l + 1;
           End; {endfor}
           WriteLn(' ');
           WriteLn('  !    :');
           End; {ENDBEGIN}


{ ¨§³ «¨§¨° ­¥ ­  ¥ª° ­  ¬ ±¨¢  ± ¤ ­­¨²¥.                                    }
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
                        Write('  : [ESC]-, : [A]-, [Z]-');
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
                WriteLn('     .');
                WriteLn(' ');
                WriteLn('  !    :');

           End;
{ ° © ­  ®¡° ¡®²ª ²  §  ¨§¡®° ®² ¬¥­¾²®.                                      }
    End;
 Until ((Ord(Ch1)=27) Or (Ch1='6'));

 ClrScr;
{ ° © ­  ¯°®£° ¬ ² .                                                          }
End.

{                                                                              }
{                                                                          }
{                                                                              }
{                                                    8900 ®¢   £®°           }
{                                                    ³«. º­·®  ¬®¢ 34        }
{                                                    ²¥«. 0457-23263           }
{                                                         0457-26937           }
{                                                    ´ ª±.0457-23263           }
{                                                                              }
