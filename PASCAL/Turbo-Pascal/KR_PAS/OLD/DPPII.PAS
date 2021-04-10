
{ä≥∞±Æ¢† ∞†°Æ≤† ØÆ è∞Æ£∞†¨®∞†≠• III ∑†±≤}
{ç† Ñ®¨®≤∫∞ è•≠™Æ¢ è†¢´Æ¢}

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
                        WriteLn('                èêéÉêÄåÄ áÄ ëêÖÑçé-ÄêàíåÖíàóçé çÄ éÅãÄëíà éí åÄíêàñÄ');
                        WriteLn('');
                        WriteLn('[1] ......... åÖçû 1.');
                        WriteLn('[2] ......... åÖçû 2.');
                        WriteLn('[3] ......... àáïéÑ Ç DOS.');
                        WriteLn(' ');
                        WriteLn(' ');
                        Write('çÄèêÄÇÖíÖ ÇÄòàüí àáÅéê => ');
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
        WriteLn('                å Ö ç û   ë à ë í Ö å Ä   è é   á Ä Ñ Ä ç à Ö');
        WriteLn('');
        WriteLn('                                   ≠† DPP');
        WriteLn('');
        WriteLn('                         II ™≥∞± ÖÄ ¥†™.’ 95013001');
        WriteLn('');
        Write('                  ç†≤®±≠•≤• ™´†¢®∏† (ENTER) ß† Ø∞Æ§∫´¶•≠®•!');
	ReadLn(Ch);

	LL := '4';
	ClrScr;

	While (LL = '4') do Begin
		LL := MENU1(sLog2);
	End;

	WriteLn('ÑÆ¢®¶§†≠• !!!');
End.

