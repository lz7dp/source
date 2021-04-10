 { Example for Eof, Read, and Write }

Uses Crt;

Type
        Data = record
                D:Integer;
        End;

Var
        ch,ch1,ch2,ch3,ch4:char;
        i,j,k,len,ff:integer;
        s:Data;
        f:file of Data;

Begin
        Randomize;
        Assign(f, 'test.db');
        Reset(f);
        len:=FileSize(f);
        For i := 1 to 140 do Begin
              For j := 1 to 32 do Begin
                      READ(f,s);
                      write(Chr(s.D));
              end; {endfor}
        end; {endfor}
        Close(f);
 end.

