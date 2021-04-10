
Program Stojanka;

Var     x:Integer;
      Log:Integer;
        i:Integer;
        j:Integer;
      Tmp:Real;
        T:Real;
	A:Array[1..10,1..10] of Real;
        B:Array[1..100] of Real;



Begin
{       Randomize;}
        for i := 1 to 10 do Begin
                for j  := 1 to 10 do Begin
{		A[i,j] := Random(100);}
		A[i,j] := cos((i/j)*10);
                end; {endfor}
        end; {endfor}

	x := 1;
        for i := 1 to 5 do Begin
		for j := i to 10 do Begin
		B[x] := A[i,j];
		x := x + 1;
                end; {endfor}
        end; {endfor}

	for i := 6 to 10 do Begin
		for j := (11-i) to 10 do Begin
		B[x] := A[i,j];
		x := x + 1;
                end; {endfor}
        end; {endfor}

  Log := 1;
  While (Log = 1) do Begin
	Log := 0;
	for i := 1 to x do Begin
		if (B[i-1]>B[i]) Then Begin
		T := B[i];
		B[i] := B[i-1];
		B[i-1] := T;
		Log := 1;
                end; {endif}
        end; {endfor}
  end; {endWhile}

        for i := 1 to 10 do Begin
                Writeln('');
		for j := 1 to 10 do Begin
		Write('  ',A[i,j]);
                end; {endfor}
        end; {endfor}

end.
