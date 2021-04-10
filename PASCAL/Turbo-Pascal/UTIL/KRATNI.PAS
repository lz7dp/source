program kratni;
{извежда к░а▓ни на 7}
  uses crt;
  var a,b,p,br:integer;
  BEGIN
    clrscr;
    write('в║веде▓е ╖и▒ло ╒1:');
    read(a);
    write('в║веде▓е ╖и▒ло ╒2:');
    read(b);
    if a>b then
    begin
      p:=a;
      a:=b;
      b:=p;
    end;
    br:=0;
    while a<b do
    begin
      if a mod 7=0 then write(a);
      a:=a+1;
      br:=br+1;
      if br=5 then
      begin
        writeln;
        br:=0;
      end;
    end;
  END.