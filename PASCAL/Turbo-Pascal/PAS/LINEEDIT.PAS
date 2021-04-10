program LINE_EDIT;
 uses crt;
 const len=15;{¤º«¦¨­  ­  °¥¤}
       leftk=#75;{ <-- }
       rightk=#77;{ --> }
       homek=#71;
       endk=#79;
       bskk=#8;
       delk=#83;
       insk=#82;
       retk=#13;{enter}
 type sl=string[len];
      s2=string[2];
 var lin:sl;{²¥ª³¹¨¿ °¥¤}
     r,c:integer;{Õ ­  °¥¤ ¨ ª®«®­ }
 function GETKEY:s2;
   var ch:char;
   begin
     ch:=readkey;
     if (ch=#0) and keypressed then
       begin
         ch:=readkey;
         getkey:=#0 + ch;{ASCII ª®¤ ­  ±¯¥¶¨ «¥­ ±¨¬¢®«}
       end
     else
       getkey:=ch;
   end;
 procedure LEDIT(var line:sl;x,y,l:integer);
{line-°¥¤ ª²¨° ­¨¿ °¥¤,x,y-ª®®°¤¨­ ²¨,l-max ¤®¯³±²¨¬  ¤º«¦. ­  °¥¤}
   var insmode:boolean;
       pos,nc:integer;{pos-²¥ª³¹  ¯®§¨¶¨¿ ­  °¥¤ }
       smb:s2;
   begin
      insmode:=true;
      nc:={lenght(line);
      pos:=nc+1;
      repeat
        gotoxy(x,y);
        write(line);{±º¤º°¦ ­¨¥ ­  °¥¤ }
       { clreol;
        gotoxy(x+pos-1,y);
        smb:=getkey;
        case smb[2] of
             #0:case smb[1] of
                     homek:pos:=1;
                     endk:pos:=nc+1;
                     insk:insmod:=not insmod;
                     leftk:if pos>1 then
                              pos:=pos-1;
                     rightk:if pos<nc+1 then
                               pos:=pos+1;
                     delk:if pos<=nc then
                             begin
                               delete(line,pos,1);
                               nc:=nc-1;
                             end;
                end;
             bspk:if pos>1 then
                     begin
                       pos:=pos-1;
                       delete(line,pos,1);{°¥¤,¯®§¨¶¨¿,¡°®© ±¨¬¢®«¨}
                       nc:=nc-1;
                     end;
             retk:       ;
          else{case}
             if insmode then
                begin
                  if nc<l then
                     begin
                       insert(smb[1],line,pos);
                       pos:=pos+1;
                       nc:=nc+1;
                     end;
                end
             else
                if pos<=l then
                   begin
                     if pos<=nc then
                         line[pos]:=smb[1]
                     else
                         line:=line+smb[1];
                   end;
        until smb[1]=retk;
   end;{ledit}
 BEGIN
   r:=10;
   c:=30;
   clrskr;
   lin:='';
   Ledit(lin,c,r,len);
   gotoxy(c,20);
   writeln('‘š„š†€ˆ…’Ž € …„€ …: ');
   writeln('----I>',lin,'<I----');
 END.

