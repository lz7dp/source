
{ģ°ąŪĒ  ° ĄŪē  ŊŪ °ŪĢ° ŽĻ° ­Ĩ III · ąē}
{  ĻŽĻēš° Ĩ­ŠŪĒ  ĒŦŪĒ}

Program MyMenu;

        Uses Crt;

        Var    Ch : String;
	       LL : Char;
            sLog2 : Char;

	Function MENU1(Log2:Char):Char;
		Var Log1 : Char;
	Begin
		Log2 := '4';
		While (Log2='4') do Begin
			ClrScr;
                        WriteLn('                  -    ');
                        WriteLn('');
                        WriteLn('[1] .........  1.');
                        WriteLn('[2] .........  2.');
                        WriteLn('[3] .........   DOS.');
                        WriteLn(' ');
                        WriteLn(' ');
                        Write('   => ');
			Log1 := ReadKey;

			If (Log1='1') then Begin
				Write(Log1);
				ReadLn(Ch);
				Log2 := '4';
                        End;

			If (Log1='2') then Begin
				Write(Log1);
				ReadLn(Ch);
				Log2 := '4';
			End;

			Log2 := '4';

			If (Log1='3') then Begin
				Write(Log1);
				ReadLn(Ch);
				Log2 := '3';
			End;
                End;
        End;

Begin
        ClrScr;
        WriteLn('                                         ');
        WriteLn('');
        WriteLn('                                   ­  DPP');
        WriteLn('');
        WriteLn('                         II Šģ°ą  ī Š.Õ 95013001');
        WriteLn('');
        Write('                   ēĻą­ĨēĨ ŠŦ ĒĻļ  (ENTER) §  Ŋ°ŪĪšŦĶĨ­ĻĨ!');
	ReadLn(Ch);

	LL := '4';
	ClrScr;

	While (LL = '4') do Begin
		LL := MENU1(sLog2);
	End;

	WriteLn('ŪĒĻĶĪ ­Ĩ !!!');
End.

