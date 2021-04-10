program primer1;
uses crt;
var x,koren:real;
begin
  clrscr;
  read(x);x:=abs(x);
  if x=0 then koren:=0
  else
  begin
   koren:=1;
   while abs(koren*koren-x)>0.0001 do
   koren:=(koren +x/koren)/2
  end;
write(koren);
end.

