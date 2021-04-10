uses crt;
type
        Item_i = array[1..2,1..5] of string;  {оп░едел┐ме дв│ме░ен ма▒ив}
student = record                              {име на запи▒}
    Name:string[20];                          {в запи▒а}
    FakNum:0..99999999;
    Uspeh:real;
end;

var                                         {задаване вида на п░оменливи▓е}
  ch,ch1,ch2,ch3,ch4:char;
  i,j,k,NumItems,len,ff:integer;
  Item:Item_i;
  s:student;
  f:file of student;
  adr:string[30];
  nam:string[20];
  u:real;
  fn:0..99999999;

 {п░о╢ед│░а▓а SubMenu о┤о░м┐ подмен╛▓а▓а на пози╢и┐ ╡,│ ▒║▒
 ▒║д║░жани┐▓а на ░едове▓е и б░о┐ им}
procedure SubMenu(x,y:integer;Item:Item_i;NumChr:integer);
begin
  gotoxy(x,y);
  write('┌');
  for i:=1 to NumChr do
    write('─');
    write('╧');
  for i:=1 to NumItems do
  begin
    gotoxy(x,y+i);
    write('╙',Item[1][i]);
    k:=NumChr-length(Item[1][i]);
    for j:=1 to k do
      write(' ');
    write('╙');
  end;
  gotoxy(x,y+i+1);
  write('└');
  for i:=1 to NumChr do
    write('─');
    write('┘');
    window(x+NumChr+2,y+1,80,25);
    clrscr;
    window(1,y+NumItems+2,80,25);
    clrscr;
    window(1,1,80,25);
end;

{▓ази п░о╢ед│░а показва, ╖е мен╛▓о не е ак▓ивно}
procedure NoActiv;
begin
  ch3:=readkey;
  if ((ch1<>'2') or (ch2<>'1') or (ch2<>'3'))  then
  begin
    k:=ord(ch3)-48;
    if ((k>=1) and (k<=NumItems)) then
    begin
      gotoxy(29,15);
      write('Мен╛▓о не е ак▓ивно...');
      delay(1000);
      gotoxy(29,15);
      write('                      ');
    end;
  end;
end;

{извежда на ек░ана ▒п░авки▓е за име, ┤ак. ╒ и │▒пе╡}
procedure sprawka;
begin
  begin
    window(1,13,80,25);
    assign(f,'Paco.dta');
    reset(f);
      begin
        gotoxy(1,1);
        write('У▒пе╡: ');
        readln(u);
        while not eof(f) do
        begin
          read(f,s);
          if s.Uspeh=u then
          begin
            writeln('Име  :',s.Name);
            writeln('Фак.╒:',s.FakNum);
          end;
        end;
      end;
    end;
  ch4:=readkey;
  clrscr;
  window(1,1,80,25);
  close(f);
end;

{п░о╢ед│░а▓а Menu 1 о┤о░м┐ подмен╛▓о 1}
procedure menu1;
begin
  Item[1][1]:='1. Мен╛';
  Item[1][2]:='2. Мен╛';
  Item[1][3]:='3. Мен╛';
  Item[1][4]:='4. Мен╛';
  Item[1][5]:='5. Мен╛';
  repeat
    NumItems:=5;
    SubMenu(5,3,Item,7);
    ch2:=readkey;
    case ch2 of
      '1':
        repeat
          NumItems:=3;
          SubMenu(8,5,Item,7);
          NoActiv;
        until ord(ch3)=27;
      '2':
        repeat
          NumItems:=4;
          SubMenu(8,6,Item,7);
          NoActiv;
        until ord(ch3)=27;
       '3':
         repeat
           NumItems:=2;
           SubMenu(8,7,Item,7);
           NoActiv;
         until ord(ch3)=27;
       '4':
         repeat
           NumItems:=3;
           SubMenu(8,8,Item,7);
           NoActiv;
         until ord(ch3)=27;
       '5':
         repeat
           NumItems:=3;
           SubMenu(8,9,Item,7);
           NoActiv;
         until ord(ch3)=27;
       end;
  until ord(ch2)=27;
end;

{п░о╢ед│░а▓а Menu 2 о┤о░м┐ подмен╛▓о 2}
procedure menu2;
begin
  repeat
    Item[1][1]:='1. Ак▓│ализа╢и┐';
    Item[1][2]:='2. Сп░авки';
    Item[1][3]:='3. Мен╛';
    Item[1][4]:='';
    NumItems:=3;
    SubMenu(34,3,Item,15);
    ch2:=readkey;
    case ch2 of
      '1':
        repeat
          NumItems:=4;
          Item[1][1]:='1. В║веждане';
          Item[1][2]:='2. Мен╛';
          Item[1][3]:='3. Мен╛';
          Item[1][4]:='4. Мен╛';
          SubMenu(37,5,Item,12);
          NoActiv;
          if ch3='1' then
          begin
            assign(f,'Paco.dta');
            reset(f);
            len:=FileSize(f);
            seek(f,len);
            window(1,15,80,25);
            repeat
              write('Име:');
              readln(s.Name);
              if s.Name<>'' then
              begin
                ff:=1;
                write('Фак. ╒:');
                readln(s.FakNum);
                write('У▒пе╡:');
                readln(s.Uspeh);
                clrscr;
                write(f,s);
              end
              else ff:=0;
            until ff=0;
            window(1,1,80,25);
            close(f);
          end;
        until ord(ch3)=27;
      '2':
        begin
          repeat
          NumItems:=3;
          Item[1][1]:='1. Име';
          Item[1][2]:='2. Фак│л▓е▓ен ╒';
          Item[1][3]:='3. У▒пе╡';
          SubMenu(37,6,Item,15);
          NoActiv;
          if ch3='3'  then
              sprawka;
          until ord(ch3)=27;
        end;
      '3':
        repeat
          NumItems:=3;
          Item[1][1]:='1. Мен╛';
          Item[1][2]:='2. Мен╛';
          Item[1][3]:='3. Мен╛';
          SubMenu(37,7,Item,7);
          NoActiv;
        until ord(ch3)=27;
      end;
    until ord(ch2)=27;
end;

{на╖ало на п░ог░ама▓а}
begin
  repeat
    clrscr;
    writeln('┌─────────────────────────────────────────────────────────────────────────────╧');
    writeln('╙ 1. Мен╛                      2. Мен╛                       3. Из╡од к║м ДОС ╙');
    write  ('└─────────────────────────────────────────────────────────────────────────────┘');
    gotoxy(1,1);
    ch1:=readkey;
    case ch1 of
      '1':
        Menu1;
      '2':
        Menu2;
    end;
  until ((ord(ch1)=27) or (ch1='3'));
  clrscr;
end.
