program QUEENS_1;
uses crt;
const n=8;
var x:array[1..n] of integer;
    a:array[1..n] of boolean;
    b:array[-n+1..(n+1)] of boolean;
    c:array[n..2*n] of boolean;
    i:integer;
    p:boolean;
 procedure PRINT;
   var i:integer;
       ch:char;
   begin
      for i:=1 to n do
        write(x[i]:3);
      writeln;
      readln;
  end;
 procedure TRY(i:integer;var q:boolean);
    var j:integer;
    begin
      q:=false;
      j:=0;
      repeat
        j:=j+1;
        if (a[j]) and (b[i-j]) and (c[i+j]) then
        begin
          x[i]:=j;
          a[j]:=false;
          b[i-j]:=false;
          c[i+j]:=false;
          q:=true;
          if i<n then
            try(i+1,q);
          if (i=n) and q then
                print
          else
             begin
                 a[j]:=true;
                 b[i-j]:=true;
                 c[i+j]:=true;
                 q:=false;
             end;
       end;
      until q or (j=n);
   end;
BEGIN
  clrscr;
  for i:=1 to n do a[i]:=true;
   for i:=-n+1 to n-1 do b[i]:=true;
    for i:=n to 2*n do c[i]:=true;
    try(1,p); print;
END.
