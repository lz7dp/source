program KNIGHTS_TOUR;
 uses crt;
 const a:array[1..8] of integer=(-2,-1,1,2,2,1,-1,-2);
       b:array[1..8] of integer=(1,2,2,1,-1,-2,-2,-1);
       n=5;
 var c:array[1..n,1..n] of integer;
     i,j,x,y:integer;
     p:boolean;
 procedure  TRY(k,r,s:integer;var q:boolean);
  var q1:boolean;
      j,s1,r1:integer;
  begin
    j:=0;
    repeat
      j:=j+1;
      q1:=false;
      r1:=r+a[j];
      s1:=s+b[j];
      if (r1 in [1..n]) and (s1 in [1..n]) and (c[r1,s1]=0) then
        begin
          c[r1,s1]:=k+1;
          if (k+1)<n*n then
            begin
              try(k+1,r1,s1,q1);
              if not q1 then
                c[r1,s1]:=0;
            end
          else q1:=true;
        end;
    until (j=8) or q1;
    q:=q1;
  end;
BEGIN
  clrscr;
  for i:=1 to n do
   for j:=1 to n do
     c[i,j]:=0;
  repeat
    write('BEGIN_POZITION x=');
    readln(x);
  until x in [i..n];
  repeat
    write('BEGIN_POZITION y=');
    readln(y);
  until y in [1..n];
  c[x,y]:=1;
  try(1,x,y,p);
  if p then
   begin
     for i:=1 to n do
     begin
       for j:=1 to n do
       write(c[i,j]:3);
       writeln;
     end;
   end
  else
   writeln('if this begin_position ==>no solution ');
END.

