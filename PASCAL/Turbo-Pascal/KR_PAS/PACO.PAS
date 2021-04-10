
uses crt;
type
        Item_i = array[1..2,1..5] of string;  {®¯°¥¤¥«¿¬¥ ¤¢³¬¥°¥­ ¬ ±¨¢}
student = record                              {¨¬¥ ­  § ¯¨±}
    Name:string[20];                          {¢ § ¯¨± }
    FakNum:0..99999999;
    Uspeh:real;
end;

var                                         {§ ¤ ¢ ­¥ ¢¨¤  ­  ¯°®¬¥­«¨¢¨²¥}
  ch,ch1,ch2,ch3,ch4:char;
  i,j,k,NumItems,len,ff:integer;
  Item:Item_i;
  s:student;
  f:file of student;
  adr:string[30];
  nam:string[20];
  u:real;
  fn:0..99999999;

 {¯°®¶¥¤³° ²  SubMenu ®´®°¬¿ ¯®¤¬¥­¾² ²  ­  ¯®§¨¶¨¿ µ,³ ±º±
 ±º¤º°¦ ­¨¿²  ­  °¥¤®¢¥²¥ ¨ ¡°®¿ ¨¬}
procedure SubMenu(x,y:integer;Item:Item_i;NumChr:integer);
begin
  gotoxy(x,y);
  write('Ú');
  for i:=1 to NumChr do
    write('Ä');
    write('Ï');
  for i:=1 to NumItems do
  begin
    gotoxy(x,y+i);
    write('Ó',Item[1][i]);
    k:=NumChr-length(Item[1][i]);
    for j:=1 to k do
      write(' ');
    write('Ó');
  end;
  gotoxy(x,y+i+1);
  write('À');
  for i:=1 to NumChr do
    write('Ä');
    write('Ù');
    window(x+NumChr+2,y+1,80,25);
    clrscr;
    window(1,y+NumItems+2,80,25);
    clrscr;
    window(1,1,80,25);
end;

{² §¨ ¯°®¶¥¤³°  ¯®ª §¢ , ·¥ ¬¥­¾²® ­¥ ¥  ª²¨¢­®}
procedure NoActiv;
begin
  ch3:=readkey;
  if ((ch1<>'2') or (ch2<>'1') or (ch2<>'3'))  then
  begin
    k:=ord(ch3)-48;
    if ((k>=1) and (k<=NumItems)) then
    begin
      gotoxy(29,15);
      write('Œ¥­¾²® ­¥ ¥  ª²¨¢­®...');
      delay(1000);
      gotoxy(29,15);
      write('                      ');
    end;
  end;
end;

{¨§¢¥¦¤  ­  ¥ª° ­  ±¯° ¢ª¨²¥ §  ¨¬¥, ´ ª. Õ ¨ ³±¯¥µ}
procedure sprawka;
begin
  begin
    window(1,13,80,25);
    assign(f,'Paco.dta');
    reset(f);
      begin
        gotoxy(1,1);
        write('“±¯¥µ: ');
        readln(u);
        while not eof(f) do
        begin
          read(f,s);
          if s.Uspeh=u then
          begin
            writeln('ˆ¬¥  :',s.Name);
            writeln('” ª.Õ:',s.FakNum);
          end;
        end;
      end;
    end;
  ch4:=readkey;
  clrscr;
  window(1,1,80,25);
  close(f);
end;

{¯°®¶¥¤³° ²  Menu 1 ®´®°¬¿ ¯®¤¬¥­¾²® 1}
procedure menu1;
begin
  Item[1][1]:='1. Œ¥­¾';
  Item[1][2]:='2. Œ¥­¾';
  Item[1][3]:='3. Œ¥­¾';
  Item[1][4]:='4. Œ¥­¾';
  Item[1][5]:='5. Œ¥­¾';
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

{¯°®¶¥¤³° ²  Menu 2 ®´®°¬¿ ¯®¤¬¥­¾²® 2}
procedure menu2;
begin
  repeat
    Item[1][1]:='1. €ª²³ «¨§ ¶¨¿';
    Item[1][2]:='2. ‘¯° ¢ª¨';
    Item[1][3]:='3. Œ¥­¾';
    Item[1][4]:='';
    NumItems:=3;
    SubMenu(34,3,Item,15);
    ch2:=readkey;
    case ch2 of
      '1':
        repeat
          NumItems:=4;
          Item[1][1]:='1. ‚º¢¥¦¤ ­¥';
          Item[1][2]:='2. Œ¥­¾';
          Item[1][3]:='3. Œ¥­¾';
          Item[1][4]:='4. Œ¥­¾';
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
              write('ˆ¬¥:');
              readln(s.Name);
              if s.Name<>'' then
              begin
                ff:=1;
                write('” ª. Õ:');
                readln(s.FakNum);
                write('“±¯¥µ:');
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
          Item[1][1]:='1. ˆ¬¥';
          Item[1][2]:='2. ” ª³«²¥²¥­ Õ';
          Item[1][3]:='3. “±¯¥µ';
          SubMenu(37,6,Item,15);
          NoActiv;
          if ch3='3'  then
              sprawka;
          until ord(ch3)=27;
        end;
      '3':
        repeat
          NumItems:=3;
          Item[1][1]:='1. Œ¥­¾';
          Item[1][2]:='2. Œ¥­¾';
          Item[1][3]:='3. Œ¥­¾';
          SubMenu(37,7,Item,7);
          NoActiv;
        until ord(ch3)=27;
      end;
    until ord(ch2)=27;
end;

{­ · «® ­  ¯°®£° ¬ ² }
begin
  repeat
    clrscr;
    window(1,1,80,11);
    writeln('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ< Œ …   >ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÏ');
    writeln('Ó                                                                             Ó');
    writeln('Ó [1] .............. ‡€…†„€… € Œ€‘ˆ‚€ ’ ”€‰‹ test.                        Ó');
    writeln('Ó [2] .............. š‚€ ’…‘’‚€ ‡€„€—€.                                    Ó');
    writeln('Ó [3] .............. ‚’€ ’…‘’‚€ ‡€„€—€.                                    Ó');
    writeln('Ó [4] .............. ˆ‡‚…†„€… € Œ€‘ˆ‚€ € …Š€.                            Ó');
    writeln('Ó [5] .............. Š€‰ € €’€’€.                                        Ó');
    writeln('Ó                                                                             Ó');
    writeln('Ó €’ˆ‘…’… Š‹€‚ˆ˜A ‘ Œ…€ € ˆ‡€€’€ ‡ˆ–ˆŸ !                           Ó');
    writeln('ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
    window(1,12,80,24);

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
