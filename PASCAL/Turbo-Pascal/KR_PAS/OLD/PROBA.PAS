
Program Proba;

Uses    Crt;

Var     Br1:Integer;   { I }
        X1:String[2];  { X }
        X2:String[2];  {   }
        K:Integer;     { K }
        Br2:Integer;   { J }
        N:Integer;     { N }

Begin
        N := 100;
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
