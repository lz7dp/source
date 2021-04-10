uses crt;
type fox=32..255;
var i:fox;
    ch:char;
begin
  for i:=32 to 255 do
  write(chr(i):8,i:5);

   begin
    if ((i-31) mod 6)=0 then
      writeln
    else write(chr(i):6,i:5);
   end;
end.
