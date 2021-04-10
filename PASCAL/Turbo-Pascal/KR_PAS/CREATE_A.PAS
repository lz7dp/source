 { Example for Eof, Read, and Write }

 var
   f: text;
   ch: Char;
   d:Integer;

 begin
   Randomize;
{ Get file to read from command line }
   Assign(f, 'test.txt');
   Reset(f);
   For d := 1 to 100 do Begin
      For d := 1 to 32 do Begin
        ch := Chr(Random(256));
        Write(f,ch);
      end; {endfor}
      WriteLn(f,'');
   end; {endfor}
   Close(f)
 end.

