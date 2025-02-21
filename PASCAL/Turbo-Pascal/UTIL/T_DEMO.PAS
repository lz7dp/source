{$F+,V- *******************************************************************}
PROGRAM T_demo;  { ��������������� �������� �� ����������� �� ������ ����� }
  USES  Panels, Windows, Menus, CRT, Keyboard;
  CONST Txt      : ARRAY[1..2] OF STRING = ('��� 1', '��� 2');
  VAR  Operation: Arr_str_field;
       Operand_1, Operand_2, Result: REAL;
       Curr_oper: BYTE;
       Window_number: ARRAY [1..2] OF INTEGER;
{************************ ������� ���� ����� ������ ***********************}
PROCEDURE Print_message_from (File_name:STRING);
  VAR   Mess_file: TEXT;     S: STRING;   Ch: CHAR;
BEGIN {Print message_file}
  ASSIGN (Mess_file,File_name);{$I-} RESET (Mess_file);{$I+}
  IF IOResult = 0 THEN
    BEGIN
      WHILE NOT EOF (Mess_file) DO
        BEGIN  READLN (Mess_file,S);
          WRITELN (S)
        END;
      CLOSE (Mess_file);
    END
  ELSE
    WRITE ('������, ������ ���� ',File_name);
  Ch := Get_key;
END {Print_message_file};
{**********************  ������� ���������� �� ���������� *****************}
PROCEDURE Show_window (Row, Col:BYTE; File_name:STRING) ;
  VAR N: BYTE;  B:BOOLEAN;
BEGIN {Show_window}
  N := Get_free_window;               { ����� ����� �� �������� ��������   }
  IF Define_window (N {�����}, Row,Col {����� ��� ����}, 15,50 {�������},
                        Blue, White, Thin_box, '' ) THEN
    IF Open_Window(N) THEN
      BEGIN
        Print_message_from (File_name);
        B := Release_window (N)
      END
END {Show_window} ;
{******************* ������� ��������� ���������� *************************}
PROCEDURE Buisnes_information;
    VAR M : Menu_choices;       B : BOOLEAN;       N : BYTE;     Ch: CHAR;
BEGIN {Buisnes_information}
  N := Get_free_window;
  IF Define_window (N, 1, 1, 15,50,
                    White, Blue, Thick_box, '' ) THEN
    IF Open_Window(N) THEN
      BEGIN
        WRITELN;
        WRITELN ('  ������� ����� � ���������� � �� - �����. ');
        WRITELN ('  ������ �������� �� �������������� ����� ');
        WRITELN ('  ������, ������� � ��, ����������� ��������  ');
        WRITELN ('  ��������� ���������� �� ��������������� ��:');
        WRITELN (' 1. ���� �� ��������� ��������� �����������-��');
        WRITELN (' 2. ��� �� ��-�����, ����.���� X�.�����');
        WRITELN ;
        WRITELN ('      �� ������� ���.63-61, �.2469');
        WRITELN;
        WRITELN ('         ��������� ������ �� �� ����������');
        Ch := Get_key;
        B  := Release_window (N);
        IF Close_window (N)THEN;
      END;
END {Buisnes_information} ;
{************ ���������, ��������� ��� ��������� �� ������ F1 *************}
PROCEDURE Menu_help (M:INTEGER);
  VAR B: BOOLEAN;     N: BYTE;     Ch: CHAR;
BEGIN { Menu_help }
  N := Get_free_window;
  IF Define_window (N, 1, 8, 15,50,
                    Black, Red, Thick_box, '' ) THEN
    IF Open_Window(N) THEN
      BEGIN
        IF M IN [1..3] THEN
          WRITELN ('    ��������� RETURN  �� �� ��������');
        CASE M OF
          1: WRITELN ('    ������� ���������� �� ��������.');
          2: WRITELN ('    ������� ���������� �� ������.');
          3: WRITELN (    '������� ���������� �� ������.');
          4,5,6,7: WRITELN ('      �� � �������� ����������');
        END;
        WRITELN ('      B�� ����������� ���������� ');
        WRITELN;
        WRITELN ('         ��������� ������ �� �� ����������');
        Ch := Get_key;
        B  := Release_window (N);
      END;
END { Menu_help };
{**************************************************************************}
PROCEDURE Panel_help (N:INTEGER);
BEGIN { Panel_help }
  CASE N OF
   1: Show_window (6,1, 'Text5');
   2: Show_window (6,30,'Text5');
   3: Show_window (6,15,'Text6');
  END;
END { Panel_help };
{**************************************************************************}
PROCEDURE Init_field(N:INTEGER);
BEGIN { Init_field }
  CASE Curr_oper OF
    1: Result := Operand_1 + Operand_2;
    2: Result := Operand_1 - Operand_2;
    3: Result := Operand_1 * Operand_2;
    4: IF ABS(Operand_2)>1E-15 THEN
         Result := Operand_1 / Operand_2
  END;
  Update_panel(1);
END { Init_field };
{**************************************************************************}
FUNCTION Test_oper(VAR R):BOOLEAN;
BEGIN { Test_oper }
  IF ABS(REAL(R))>1E-15 THEN
    Test_oper := TRUE
  ELSE
    Test_oper := FALSE ;
END { Test_oper };
{********  ���������, ������������� ������������ ��������� �� �����  ******}
PROCEDURE Show_panel;
  VAR    Ch : BYTE;     B: BOOLEAN;
BEGIN { Show_panel }
  IF Define_panel (1, Blue,Yellow, 2,22,6,40, Thin_box,
                  ' ������������ �� ����� ', Panel_help, Init_field) THEN
    BEGIN  Operand_1:= 1.0; Operand_2:=1.0; Curr_oper:=1;    Result := 1.0;
       Set_field_color (Brown,Blue);
       Output_text( 2,2, '������ �� ����� ����������',25);
       In_out_fixed (4,2, Operand_1, 7,2, -100.0,100.0, 1,1, No_test);
       In_out_enum  (4,11,Operation,4,1,Curr_oper, 3,3, No_test);
       In_out_fixed (4,13, Operand_2, 7,2,-100.0,100.0, 2,2, Test_oper);
       Output_text (4,22,'=',1);
       Set_field_color (Blue,Brown);
       Output_fixed (4,24, Result,6,2);
       Output_text(15,5,'Ha��c�e�e ESC �a �a �po������e',30);
       Ch:=Open_panel(1);
       Release_panel(1);
    END;
END {Show_panel} ;
{************************* ��������� �������� *****************************}
PROCEDURE Five_windows;
VAR  I : INTEGER;         Ch: CHAR;
BEGIN { Five_windows }
  FOR I := 1 TO 5 DO
    BEGIN
      IF Define_window  (I,2+2*i,2+5*I,10,40,10-i,1+i, thin_Box,'')THEN
        IF Open_window(I) THEN
          BEGIN
             WRITELN;
             WRITELN ('       � � � � � - 0        ' );
             WRITELN ('    ������ ��������� �������' );
             WRITELN ('        / ������ ������� /'   );
             WRITELN ;
             WRITELN ('  ��������� ������ �� �� ����������');
             DELAY (400);
           END;
    END;
  REPEAT                                { ����� �� ��������� �� ���������� }
    FOR I := 1 TO 5 DO
      BEGIN
        IF NOT Set_window(I) THEN
          WRITELN ('������ � Set_window:', Window_error)
      END;
  UNTIL KeyPressed;
  Ch := Get_key;
  FOR I := 1 TO 5 DO                         { ������������� �� ���������� }
    IF NOT Release_window(I) THEN
      WRITELN ('������ � Release_window', Window_error)
END { Five_windows };
{**************************************************************************}
PROCEDURE No_message;
  VAR Ch : CHAR;  B : BOOLEAN;  N:INTEGER;
BEGIN {No_message}
  N := Get_free_window;
  IF Define_window (N, 3, 10, 8,50, White, Green, Thick_box, '' ) THEN
    IF Open_Window(N) THEN
      BEGIN
        WRITELN;
        WRITELN ('Ta�� ���� �� ������ �� � �������� � ���������');
        WRITELN;
        WRITELN;
        WRITELN ('  ��������� ������ �� �� ����������');
        Ch := Get_key;
        B  := Release_window(N);
      END;
END {No_message} ;
{**************************************************************************}
PROCEDURE Initial_part;
  VAR I, Option : BYTE;      B: BOOLEAN;       Ch: CHAR;
        T: Menu_choices;
BEGIN { Initial_part }
  Five_windows;
  IF Define_window (2, 2,5 , 18,69, White, Red,  Thick_box, '' )THEN
    IF Open_window (2) THEN
      BEGIN        WRITELN;
        WRITELN ('    �A��C e ����� o� �����������, �pe��a��a�e� �a op�a����pa�e');
        WRITELN (' �a �p��e���e� ��a�o� o� �p��o��� �po�pa�� �a ��������');
        WRITELN (' ���op������� ����� ���� ��-�������, ��-�, �����-�, ');
        WRITELN (' �����-������ 5.0/5.5,/6.0.  ���o� �o-�a��� oco�e�oc�� �a ������');
        WRITELN (' ��:  op�a���a��� �a pa������ ���o�e �po�op��, ������, ��-');
        WRITELN (' pa��o ���e��a�e �a pa��oo�pa��� ���o�e �a���, pea���a���');
        WRITELN (' �a �e�c�o�� pe�a��op�, �������������� �������� �� a�a���  ');
        WRITELN (' �a �po��e��o-op�e���pa�� e����, ������������� �������� �� ');
        WRITELN (' ���������� �������, ���������� ��������� � ��. ');
        WRITELN ('    ���� ������� ������� ���� ��a�� ���� �� ������ �����, �����' );
        WRITELN (' � ������� � "�������� ������������ � �����-������" �� �.�������,');
        WRITELN (' ����������� "�������", �����, 1991  ');
        WRITELN ;
        WRITELN ('                               Ha��c�e�e ��a��� �a �a �po������e. ');
        Ch := Get_key;
        B := Close_window(2)
      END
    ELSE
      WRITELN ('������');
END {Initial_part};
{**************************************************************************}
PROCEDURE Main_menu;                           { ��������� �������� ����   }
  VAR I, Option : BYTE;      B: BOOLEAN;     Ch: CHAR;   T: Menu_choices;
BEGIN { Main_menu }
    T[1]:= '���o����a�e �a �po�op��';
    T[2]:= '�������� �a �e���a';
    T[3]:= '��pa��o ���e��a�e �a �a��� ';
    T[4]:= '�e�c�o� pe�a��op';
    T[5]:= '������� �������';
    T[6]:= '���������� ��������� ';
    T[7]:= '����� ��������� ���������� ';
    T[8]:= '��������� �� ������';
    B := Define_menu (1, ' B���o��oc�� �a �a��c ',Green,White, Green,White,
                      Blue,Red, 8, T, 40,1,8 , Menu_help );
    IF B THEN
      BEGIN
        REPEAT
          IF Open_menu (1,10,20, Option) THEN
            CASE Option OF
              1: Show_window (1,25,'Text2');
              2: Show_window (1, 1,'Text1');
              3: BEGIN
                   Show_window(1,10,'Text3');
                   Show_panel;
                 END;
          4,5,6: No_message;
              7: Buisnes_information;
            END
          ELSE
            BEGIN
              Option := 0;
              WRITE('������');
            END;
        UNTIL (Option = 8) OR (Option = 0);
        Close_menu (1);
        Release_menu(1);
      END;
END {Start_menu};
{**************************************************************************}
BEGIN { T_demo }
  Operation [1] :=  '+';
  Operation [2] :=  '-';
  Operation [3] :=  '*';
  Operation [4] :=  '/';
  TextBackground(0);
  CLRSCR;
  Initial_part;
  Main_menu;
END { T_demo }.