Program MyMenu;

        Uses Crt;

        Var   Tmp : Integer; { �������� ���������� }
              Chr : String;  {*�������� ���������� }
	     sLog : Char;    {*������� ���������� �� ��������� �������� }
               Br : Real;    { ����� }
                X : Real;    { ����� }
                Y : Real;    { ����� }
                A : Integer; { ���� ����� - ����� }
                B : Integer; { ���� ����� - ����� }
                M : Integer; { ���� ����� - ����� }


Begin { Program }

While (sLog<>'3') do Begin
	sLog := ReadKey;
	WriteLn(sLog)
        End; {endwhile}

Writeln('���������� �������� ������! ���������!');
End. { Program }
