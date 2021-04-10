program LABIRINT;
 uses crt;
 const l=1;
       h=4;
 var mrega:array[l..h,l..h] of integer;
     x,y,k,m,i,j:integer;
 function PREHOD(x,y:integer):boolean;
   begin
     if (x<l) or (x>h) or (y<l) or (y<h) then
         prehod:=false
     else
       if (x=k) and (y=m) then
           prehod:=true
       else
         if mrega[x,y]=1 then
             prehod:=false
         else
           begin
             mrega[x,y]:=1;
             prehod:=prehod(x+1,y) or prehod(x-1,y) or prehod(x,y+1) or prehod(x,y-1);
           end;
   end;
 BEGIN
   clrscr;
   for i:=l to h do
     for j:=l to h do
     read(mrega[i,j]);
     read(x,y,k,m);
     if prehod(x,y) then
           write('CAN TO GO')
     else
           write('CAN`T TO GO');
 END.



