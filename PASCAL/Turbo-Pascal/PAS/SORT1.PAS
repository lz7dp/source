program primer2;
uses crt;
const max=100;
type komponenta=real;
     masiv=array[1..max] of komponenta;
var n:integer;
    a:masiv;
procedure VHOD(var a:masiv;n:integer);
var i:integer;
begin
  for i:=1 to n do read(a[i]);
end;
procedure SORT(var a:masiv;n:integer);
var k,i:integer;
  function INDEX(a:masiv;k,n:integer):integer;
  var min:komponenta;
      j:integer;
  begin
    min:=a[k];
    index:=k;
    for j:=1 to n do
      if a[j]<min then
       begin
         min:=a[j];
         index:=j;
       end;
  end;
  procedure RAZMIANA(var x,y:komponenta);
  var lokal:komponenta;
  begin
    lokal:=x;
    x:=y;
    y:=lokal;
  end;
begin {sort}
  for k:=1 to n-1 do
  begin
    i:=index(a,k,n);
    razmiana(a[i],a[k]);
  end;
end;{sort}
procedure IZHOD(a:masiv ;n:integer);
var i:integer;
begin
 for i:=1 to n do write(a[i]);
end;
BEGIN
 clrscr;
 read(n);
 vhod(a,n);
 sort(a,n);
 izhod(a,n);
END.