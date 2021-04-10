program say_number;
   uses crt;
   const name:array[1..16] of string[8]=('¥¤­®','¤¢¥','²°¨','·¥²¨°¨','¯¥²'

   ,'¸¥±²','±¥¤¥¬','®±¥¬','¤¥¢¥²','¤¥±¥²','¥¤¨','¤¢ ','­ ¤¥±¥²','±²®','±² ','±²®²¨­');
   var i:integer;
   ch:char;
   procedure SAY(n:integer);
     var s,d,e:byte;
     st:string[40];
     begin
       if (n<1) or (n>999) then exit;
       st:='';
       s:=n div 100;
       n:=n mod 100;
       case s of
         1:st:=name[14];
         2,3:st:=name[s]+name[15];
         4..9:st:=name[s]+name[10];
       end;
       d:=n div 10;
       e:=n mod 10;
       case d of
         0:if e>0 then st:=st+name[e];
         1:case e of
             0:st:=st+name[10];
             1,2:st:=st+name[e+10]+name[13]
             else st:=st+name[e]+name[13];
           end;
         2:begin
              st:=st+name[12]+name[10];
              if e>0 then
               st:=st+'   '+name[e]
           end
         else
           begin
             st:=st+name[d]+name[10];
             if e>0 then
                 st:=st+'   '+name[e];
           end;
       end;
       writeln(s,d,e,'---|>',st);
       ch:=readkey;
     end;{SAY}
     BEGIN
       clrscr;
       for i:=1 to 999 do say(i);
     END.




