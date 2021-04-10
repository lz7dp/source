 { Example for Eof, Read, and Write }     
                                          
 var                                      
   f: text;                               
   ch: Char;
   d:Integer;
 begin
   { Get file to read from command line }
   Assign(f, 'dpp');
   Reset(f);
   d := 0;
   while not Eof(f) do
   begin
	if d=5 then Begin
		WriteLn(' ');
		WriteLn('Do tuk e 5');
	end;
	Read(f,ch);
	Write(ch); { Dump text file }
	d := d + 1;
   end;
 end.                                     
                                          
