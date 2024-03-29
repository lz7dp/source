{$V-  *********************************************************************}
PROGRAM T_panel;   { ���������� ����������� ������������� �� ������ Panels }
USES Windows, Panels, Keyboard,CRT;

  VAR I_1 : INTEGER;   R_1,R_2 : REAL;   Ch_1 : CHAR;
     Index : BYTE;     String_1: STRING; B    : BYTE;
     Enum_data : Arr_str_field;
{$F+ }
PROCEDURE Help_1(N:INTEGER);        { ������� �� � ��������� �� ������� F1 }
  VAR Wind : BYTE; Ch  : CHAR;  B : BOOLEAN;
BEGIN
  Wind := Get_free_window;
  IF Define_window(Wind, 4+2*N,30,7,48,Black,White,Thin_box,'') THEN
    IF Open_window(Wind) THEN
      BEGIN
        IF N<>6 THEN
          WRITELN ('���������� � �� �������� ');
        CASE N OF
          1: WRITELN('���� ����� � ��������� �� 0 �o 100 .');
          2,3: WRITELN('������ ����� � ��������� �� 100.0 �o 100.0 .');
          4: WRITELN (' �������� ���. ');
          5: WRITELN ('���� �� ��������� a s d f');
          6: BEGIN
               WRITELN ('�������� e��� �� ���������� ���������');
               WRITELN ('���� ��������� �� ������� ��������. ');
             END;
        END;
        WRITELN;
        WRITELN ( '��������� ������ �� �� ����������.');
        Ch := Get_key;
        B:= Release_window(Wind);
      END
END;
{$F-}
PROCEDURE Start_panel;
BEGIN
  IF Define_panel (1, Blue,green, 2,9,18,30, Thin_box,
                     ' ������������ �� ����� ',Help_1, No_init) THEN
    BEGIN                                 { ��������� �� ��������� ������  }
      I_1 := 0; R_1:= 0.0; R_2 := 0.0; String_1 := ''; Ch_1 := ' '; Index:=1;
      Set_field_color(Brown,Black);
      Output_text (1,2,'������ ������ :',15);
      Output_text (3,2,'�����������   :',15);
      Output_text (5,2,'���������     :',15);
      Output_text (7,2,'��������������:',15);
      Output_text (9,2,'�������� ���  :',15);
      Output_text (11,2,'������ ���    :',15);
      Output_text (13,2,'������� ���   :',15);
      Set_field_color(Magenta, Cyan); {��������� �� ������-��������� ������}
      In_out_intg  (3,18, I_1, 4,    0,100,      1,1, No_test);
      In_out_fixed (5,18, R_1, 8,1,-100.0,100.0, 2,1, No_test);
      In_out_float (7,18, R_2, 8,  -100.0,100.0, 3,1, No_test);
      In_out_string(9,18,String_1, 8,            4,1, No_test);
      In_out_char (11,18, Ch_1,'asdfg',          5,1, No_test);
      In_out_enum (13,18,Enum_data,5,7,Index,    6,1, No_test);
      Set_field_color (Blue,Green);
      Output_text (15,2,'��������� F1 �� �����.',25);
      B:=open_panel(1);
      Release_panel(1);
   END;
END { Start_panel };
{**************************************************************************}
BEGIN { T_panel }
  Enum_data[1] := 'Text_1';
  Enum_data[2] := 'Text_2';
  Enum_data[3] := 'Text_3';
  Enum_data[4] := 'Text_4';
  Enum_data[5] := 'Text_5';
  ClrScr;
  Start_panel
END { T_panel }.
