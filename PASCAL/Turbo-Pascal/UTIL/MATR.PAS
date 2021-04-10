program matrica;
 uses crt;
 type vector=array[1..7] of integer;
      matrix=array[1..5] of array[1..7] of integer;
      rvector=array[1..5] of integer;
  var A:matrix;
      d:vector;
      f:rvector;
      i,j:integer;
  BEGIN
    clrscr;
    for i:=1 to 5 do
      for j:=1 to 7 do
        begin
          write('в║веди A[',i,',',j,']: ');
          readln(A[i,j]);
        end;
      for j:=1 to 7 do
        begin
          write('в║веди d[',j,']: ');
          readln(d[j]);
        end;
      for i:=1 to 5 do
         f[i]:=0;
      for i:=1 to 5 do
       begin
         for j:=1 to 7 do
         f[i]:=f[i] + A[i,j]*d[j];
       end;
  END.
