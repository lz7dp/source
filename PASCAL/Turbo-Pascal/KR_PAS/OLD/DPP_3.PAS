Program MyMenu;

        Uses Crt;

        Var   Tmp : Integer; { В░еменна п░оменлива }
              Chr : String;  {*Символна п░оменлива }
	     sLog : Char;    {*Чи▒лова п░оменлива за логи╖е▒ки п░ове░ки }
               Br : Real;    { Б░о┐╖ }
                X : Real;    { Б░о┐╖ }
                Y : Real;    { Б░о┐╖ }
                A : Integer; { Ц┐ло ╖и▒ло - Б░о┐╖ }
                B : Integer; { Ц┐ло ╖и▒ло - Б░о┐╖ }
                M : Integer; { Ц┐ло ╖и▒ло - Б░о┐╖ }


Begin { Program }

While (sLog<>'3') do Begin
	sLog := ReadKey;
	WriteLn(sLog)
        End; {endwhile}

Writeln('П░ог░ама▓а п░икл╛╖и ░або▓а! Довиждане!');
End. { Program }
