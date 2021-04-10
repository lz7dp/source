
Program Proba;

Uses    Crt;

Var     I:Integer;
        X:Integer;
        K:Integer;
        J:Integer;
        N:Integer;
        A:Array[1..10] of Integer;

Begin
        ClrScr;
        N := 10;

        Randomize;
        For I := 1 to 10 do Begin
                A[I] := Random(256);
        End; {endfor}

        For I := 1 to 10 do Begin
                Write(' ', A[I]);
        End;
        WriteLn(' ');

        I := 1;
        Repeat
                X := A[I];
                K := I;
                J := I + 1;
                Repeat
                        If (X>A[J]) Then Begin
                                X := A[J];
                                K := J;
                        End;
                        J := J + 1;
                        Until (J>N);
                        A[K] := A[I];
                        A[I] := X;
                        I := I + 1;
        Until (I>(N-1));

        For I := 1 to 10 do Begin
                Write(' ', A[I]);
        End; {endfor}
        WriteLn(' ');

        End.
