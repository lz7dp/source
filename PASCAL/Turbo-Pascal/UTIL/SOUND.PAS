program gama_sound;
   uses crt;
   const f:array[1..13] of word=(230,349,370,392,
            415,440,466,494,523,554,588,622,660);
   var i,j:byte;
   BEGIN
     for j:=1 to 2 do
       for i:=1 to 13 do
         begin
           sound(j*f[i]);
           delay(100);
           nosound;
         end;
         for j:=2 downto 1 do
           for i:=1 to 13 do
             begin
               sound(j*f[i]);
               delay(100);
               nosound;
             end;
   END.
