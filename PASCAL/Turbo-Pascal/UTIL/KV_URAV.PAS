program kv_urav;
uses crt;
var a,b,c,d:real;
begin
  clrscr;
  write('������ a'); readln(a);
  write('������ b');readln(b);
  write('������ c');readln(c);
  if a=0 then
     if b=0 then write('����������� �� � ����������') else
     write('����������� � �������','��������� �',-b/c )
  else
     begin
       d:=b*b-4*a*c;
       if d>0 then
          begin
            write('��� 2 ������ ������');
            write('x1=',(-b-sqrt(d))/(2*a));
            write('x2=',(-b+sqrt(d))/(2*a));
          end
       else
        if d=0 then
          write('��� ���� ������ �����','x=',-b/(2*a))
        else
          write('���� ������ ������');
     end;


end.

