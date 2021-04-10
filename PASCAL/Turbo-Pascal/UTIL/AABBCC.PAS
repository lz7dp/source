uses crt;
type zn=0..25;
var i:zn;
    ch:char;
begin
  for i:=0 to 25 do
  begin
    write(chr(ord('a')+i));
    write(chr(ord('A')+i));
    write(chr(ord('Z')-i));
    write(chr(ord('z')-i));
    writeln;
    if i=22 then
    begin
      write('на▓и▒не▓е п░оизволен клави╕');
      repeat until keypressed;
      while keypressed do
      ch:=readkey;
      end;
      end;
      end.
