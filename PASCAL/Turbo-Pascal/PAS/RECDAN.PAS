program RECDAN;
 uses crt;
 var ch:char;
     st:integer;
 procedure GRESKA;
 begin
   write('vav. e nedopustim simvol');
   read(ch);
 end;
 procedure MNOGITEL;FORWARD;
 procedure IZRAZ;
 begin
   mnogitel;
   if ch='*' then
     begin
      read(ch);
      izraz;
     end;
 end;
 procedure MNOGITEL;
 begin
   if ch='c' then
    begin
      read(ch);
      izraz;
      if ch=')' then
           read(ch)
      else
          greska;
    end
   else
     if ('0'<=ch) and (ch<='9') then
       begin
         st:=st*(ord(ch)-ord('0'));
         read(ch);
       end
     else
       greska;
   end;
BEGIN
  clrscr;
  st:=1;
  read(ch);
  izraz;
  write(st);
END.

