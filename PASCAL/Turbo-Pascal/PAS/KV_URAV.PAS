program kv_urav;
uses crt;
var a,b,c,d:real;
begin
  clrscr;
  write('ваведи a'); readln(a);
  write('в║веди b');readln(b);
  write('в║веди c');readln(c);
  if a=0 then
     if b=0 then write('│░авнение▓о не е де┤ини░ано') else
     write('│░авнение▓о е линейно','░е╕ение▓о е',-b/c )
  else
     begin
       d:=b*b-4*a*c;
       if d>0 then
          begin
            write('има 2 ░еални ко░ена');
            write('x1=',(-b-sqrt(d))/(2*a));
            write('x2=',(-b+sqrt(d))/(2*a));
          end
       else
        if d=0 then
          write('има един ░еален ко░ен','x=',-b/(2*a))
        else
          write('н┐ма ░еални ко░ени');
     end;


end.

