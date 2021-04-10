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
        ff := 0;
        Randomize;
        Assign(f, 'test.db');
        Reset(f);
        len:=FileSize(f);
        For i := 1 to 140 do Begin
                For j := 1 to 32 do Begin
                        Repeat
                                ff := random(255);
                        Until(((ff>127) And (ff<192)) Or ((ff>47) And (ff<58)));
                        s.D := ff;
                        WRITE(f,s);
                end; {endfor}
        end; {endfor}
        Close(f);
 end.

