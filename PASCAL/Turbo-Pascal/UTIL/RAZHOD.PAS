program RazhodGorivo;
{��������� ������� �� ������ �� 100 ��.}
   var kilometri,litri,razhod:real;
   BEGIN
     writeln('���� �������� ��������� ������� �� ������');
     writeln('�� ����� ���������');
     writeln('����� ��������� ������������ �� ����������');
     writeln('����� ��������� �� ���������� ����� ���������');
     readln(kilometri);
     writeln('����� ����� ������� ��������� ���, �� �� ���������');
     writeln('������ ����������?');
     readln(litri);
     razhod:=litri*100/kilometri;
      if razhod>5 then
           writeln('��� ����� ����� �� ��-���������� ����');
      writeln('������ ���� ��� ������',razhod:2:3,'����� �� 100 ��.');
   END.