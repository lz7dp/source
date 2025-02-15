{--------------------------------------------------------------------------}
                                  { T��o �a �o��� �a ��pa��e��e �a �a�e��  }
     TYPE        { Bxo��o-��xo��� �o�e�a:    T��          �op�a�           }
                 {---------------------------------------------------------}
     Field_type = (Inp_float,      {         REAL      E�c�o�e�������      }
                   Inp_fixed,      {         REAL      �ece���e�           }
                   Inp_intg,       {         INTEGER   ���                 }
                   Inp_str,        {         STRING    C���o�e� ���        }
                   Inp_char,       {         CHAR      E��� c���o�         }
                   Inp_enum,       {                   ���poe� ���         }
                 {       ��xo��� �o�e�a:                                   }
                 {---------------------------------------------------------}
                   Out_float,      {         REAL      E�c�o�e�������      }
                   Out_fixed,      {         REAL      �ece���e�           }
                   Out_intg,       {         INTEGER   ���                 }
                   Out_str,        {         STRING    C���o�e� ���        }
                   Out_text,       {         Te�c�o� �op�a� �a �a����e     }
                   Out_char);      {         CHAR      E��� c���o�         }
  { Pe���� �a ���e��a�e: �op�a��a �p�oc�, �o���e�a �p�oc�, �e��� �a �pe��a }
     Print_mode = (Normal_mode, Highlight_mode, Error_mode);
     Status  = (Closed, Opened); { C�c�o���e �a �a�e�a: �a��ope�, ���ope�  }
     Field_pointer = ^Field_data;                   { ��a�a�e� ��� �o�e�o  }
     Field_data  =                                  { �a��� �a �o�e�o      }
       RECORD  Row_field, Col_field,               { Koop���a�� �a �o�e�o  }
         Len_field    : BYTE;                      { ������a �a �o�e�o     }
         Fore_field,
         Back_field   : BYTE;                  { ���� �a c���o���e � �o�a  }
         Help_field,                       { Ho�ep �� c�o��e��e �p� �o�o�  }
         Init_field   : BYTE;                 { Ho�ep �� c�o��e��e �p� ��  }
         Test_proc    : Field_test;       { ������� �a �ec��a�e �a �o�e�o  }
         Find_error   :    BOOLEAN;       { �����a�op �a �pe��a �a �o�e�o  }
         Kind_field   :    Field_type;                    { T�� �a �o�e�o  }
         CASE Field_type OF         { Bap�a���a �ac� �a �a����e �a �o�e�o  }
           Inp_float, Out_float,Inp_fixed, Out_fixed:
             ( Rl     :   ^REAL;      { ��a�a�e� ��� �o�e�o o� pea�e� ���  }
               Min_real,Max_real: REAL; { �pa���� �a c�o��oc��a �a �o�e�o  }
               Dec_pl : BYTE); { �po� �a ��a���e c�e� �ece����a�a �a�e�a�  }
           Inp_intg, Out_intg:
             ( Intg   :    ^INTEGER;   { ��a�a�e� ��� �o�e�o o� ��� ���    }
               Min_intg , Max_intg: INTEGER);     { �pa���� �a c�o��oc��a  }
           Inp_str, Out_str, Out_text:
             ( St: ^Str_field);     { ��a�a�e� ��� �o�e�o o� c������� ���  }
           Inp_char, Out_char:
             ( Ch     : ^CHAR;      { ��a�a�e� ��� �o�e�o o� c���o�e� ���  }
               Inq_letters: Str_field);               { �o��c���� c���o��  }
           Inp_enum   :
             ( P_Opt  : ^BYTE;       { ��a�a�e� ��� �po�e����a�a-pe����a�  }
               P_enum : ^Arr_str_field;   { ��a�a�e� ��� �e�c�o�e�e �a     }
                                          { a��ep�a�����e                  }
             Numb_enum: BYTE)             { �po� �a a��ep�a�����e          }
         END;
     Panel_pointer = ^Panel_data;                    { ��a�a�e� ��� �a�e�  }
     Panel_data =                                    { �a��� �a �a�e�      }
       RECORD Start_row,Start_col: BYTE; { Koop���a�� �a ������ ��� ����   }
         Height, Width    : BYTE;        { Pa��ep� �a �po�ope�a            }
         Window_numb      : BYTE;        { Ho�ep �a �po�ope�               }
         State            : Status;      { C�c�o���e �a �a�e�a             }
         Root_field       : D_list;      { ��a�a�e� ��� c��c��a o� �o�e�a  }
         Quit_flag,                      { ��a� �a �opc�pa� ��xo�          }
         Update_flag      : BOOLEAN;     { ��a� �a a���a����pa�e �a �a�e�a }
         Go_to_flag       : BOOLEAN;     { ��a� �a �po�e��pa�a Go_to       }
         Go_to_place      : D_pointer;   { �o�e �a �pexo�                  }
         Init_proc        : Panel_init_field; { �po�e��pa �a H�            }
         Help_proc        : Panel_help_field  { �po�e��pa �a �o�o�         }
       END;
  VAR
    Root_panel      : S_list;          { ��a�a�e� ��� c��c��a �a �a�e����  }
    Active_panel    : Panel_pointer;   { A����e� (�o�pa���pa� ce) �a�e�    }
    Curr_fore_clr   : BYTE;         { Te��� ���� �a c���o���e � �o�e�o     }
    Curr_back_clr   : BYTE;         { Te��� ���� �a �o�a � �o�e�o          }
    Error_fore_color: BYTE;         { Te��� ���� �a c���o���e �p� �pe��a   }
    Error_back_color: BYTE;         { Te��� ���� �a �o�a �p� �pe��a        }
    Insert_mode     : BOOLEAN; { Pe��� �a ���e��a�e - �����a�e/�a�ec��a�e  }
    Move_Keys,                       { M�o�ec��o o� c���o�� �a ��pa��e��e  }
    Input_characters: SET OF CHAR;   { M�o�ec��o o� �xo��� c���o��         }
{$F+ ----------------------------------------------------------------------}
PROCEDURE Proc_del_field                 { ���p��a ���op�a����a �a �o�e�o  }
          (Point : POINTER);             { ��a�a�e� ��� �a����e �a �o�e�o  }
BEGIN { Proc_del_field }       { �po�e��pa�a ce ������a o� �o���a D_lists  }
  WITH Field_pointer (Point)^ DO
    IF Kind_field = Out_text THEN     { A�o �o�e�o e �e�c�o�o, ���p��a     }
      DISPOSE(St);                    { o��e�e�a�a �a �e�o �a�e�           }
  DISPOSE (Field_pointer(Point))      { Oc�o�o��a�a  �a�e��a �a �o�e�o     }
END { Proc_del_field };
{--------------------------------------------------------------------------}
PROCEDURE Disp_field (P:D_pointer); FORWARD; { ���e��a �a e�pa�a e��o �o�e }
{$F-  ---------------------------------------------------------------------}
FUNCTION Define_panel;                { O�����a oc�o����e �a��� �a �a�e�a  }
  VAR Found : S_pointer;       Bool  :  BOOLEAN;         Part  :  BYTE;
BEGIN { Define_panel }                         { T�pc� �a�e� c �o�ep Numb  }
  IF S_insert_node (Root_panel, Numb, Found) THEN
    BEGIN                             { A�o �e �a�ep� - o�����a �o� �a�e�  }
      NEW (Active_panel);             { Pe�ep��pa �a�e� �a �a�e�a          }
      Found^.S_data := Active_panel;
      WITH Active_panel^ DO           { B�e�a �o�ep �a c�o�o�e� �po�ope�   }
        BEGIN  Window_numb := Get_free_window;
          State := Closed;    { C���a�a �pa�e� ���c��p�a� c��c�� �a �o�e�a }
          D_init (Root_field, Disp_field, D_null_func, Proc_del_field);
        END
    END    { �a�e� c �o�� �o�ep �e�e c��ec����a - �apa�e�p��e �� �e ���a�  }
  ELSE       { �po�e�e�� � c�o��e�c���e c �o���e �apa�e�p� �a �po�e��pa�a  }
      Active_panel:= Found^.S_data;
  WITH Active_panel^ DO
    BEGIN
      IF State = Closed THEN
        BEGIN               { Kop���pa ��e�a �a c���o���e, a�o ��a �pe��a  }
         Fore_clr := Fore_clr AND (Blink + 7);  Back_clr := Back_clr AND 7;
                      { �a�a�a oc�o����e �apa�e�p� �a �po�ope�a �a �a�e�a  }
         IF Define_window (Window_numb, Row_pos, Col_pos, Height_panel,
                         Width_panel, Fore_clr, Back_clr, Box, Title) THEN
           BEGIN
             Define_panel := TRUE;
             IF Box = No_box THEN   { O�pe�e�� "�a�ap�����e" pa��ep� �a    }
               Part := 0            { �a�e� � �a��c��oc� o� �o�a �a�� ��a  }
             ELSE                   { pa��a ��� ���a                       }
               Part := 2;
             Height := Height_panel - Part;  Width := Width_panel  - Part;
             Init_proc  := Init_procedure;   Help_proc := Help_procedure;
             Update_flag      := FALSE; { ��a� �a a���a����pa�e �a �a�e�a  }
             Quit_flag        := FALSE;     { ��a� �a �a��c�a�e �a �a�e�a  }
             Go_to_flag       := FALSE          { ��a� �a �pexo� ��� �o�e  }
           END
         ELSE                        { �pe��a �p� o��ap��e�o �a �po�ope�a  }
           BEGIN
             Define_panel := FALSE;               { Oc�o�o��a�a �po�ope�a  }
             Bool := Release_window(Window_numb);
             Release_panel (Numb)
           END
        END
      ELSE
        Define_panel := FALSE
    END
END { Define_panel };
{--------------------------------------------------------------------------}
FUNCTION Test_in_field           { �po�ep��a �a�� �o�e�o e �xo��o-��xo��o  }
         (Place : D_pointer      { ��a�a�e� ��� c��c��a �a �o�e�a��        }
         ): BOOLEAN;        { Pe����a�:   TRUE  - �o�e�o e �xo��o-��xo��o  }
                            {             FALSE - �o�e�o e ��xo��o         }
BEGIN { Test_in_field }
  WITH Field_pointer (D_get_data(Place))^ DO
    IF Kind_field IN [Inp_float,Inp_fixed,Inp_str,
                      Inp_char, Inp_intg, Inp_enum] THEN
      Test_in_field := TRUE
    ELSE
      Test_in_field := FALSE
END { Test_in_field };
{--------------------------------------------------------------------------}
FUNCTION Find_in_field             { T�pc� c�e��a�o�o �xo��o-��xo��o �o�e  }
         (Curr_place    : D_pointer;    { Te���o �o�e - �a�a�o �a ��pce�e  }
      VAR New_curr_place: D_pointer;    { Ha�epe�o �o�e                    }
          Func          : Find_function { ������� �a ��pce�e               }
          ) : BOOLEAN;          { Pe����a� TRUE  - �a�epe�o e �a�o�a �o�e  }
                                {          FALSE - ���a �a�o�a �o�e        }
  VAR  Temp_place : D_pointer;
       Found      : BOOLEAN;
BEGIN { Find_in_field }
  Found := FALSE;      Temp_place := Curr_place;
  WHILE  NOT FOUND DO
    BEGIN                                         { T�pc� c�e��a�o�o �o�e  }
      IF Func (Temp_place, Temp_place) THEN
        BEGIN           { O��p��o e �o�e - �po�ep�a �a�� e �xo��o-��xo��o  }
          IF Test_in_field (Temp_place) THEN
            BEGIN           { �o�e�o e �xo��o-��xo��o - �pa� �a ��pce�e�o  }
              New_curr_place := Temp_place;
              Found := TRUE;          Find_in_field := TRUE
            END
        END
      ELSE
        BEGIN                   { He e o��p��o e �o�e - �pa� �a ��pce�e�o  }
          New_curr_place := Curr_place;
          Found := TRUE;             Find_in_field := FALSE
        END
    END { While}
END { Find_in_field };
{--------------------------------------------------------------------------}
PROCEDURE Go_to;   { �c�a�o���a ������� ��� �xo��o-��xo��o �o�e c          }
                   { �oop���a�� Row, Col ��� � c�e��a�o�o �xo��o-��xo��o   }
                   { �o�e �a �a�e�a Numb. �a�e��� �p���a �a e o��ope�      }
  VAR Temp   : D_pointer;      T_panel: S_pointer;      Key_el : INTEGER;
BEGIN { Go_to }
  IF S_search_node (Root_panel, Numb, T_panel) THEN
    WITH Panel_pointer (T_panel^.S_data)^ DO
      IF State = Opened THEN                    {  �a�e��� o��ope� �� e ?  }
       BEGIN     Go_to_flag := FALSE;
         Key_el := (Row SHL 8) + Col;     { �op��pa�e �a ���� �a ��pce�e   }
                                          { T�pce�e � c��c��a �a �o�e�a�a  }
         IF D_search_node(Root_field, Key_el,Temp) THEN
           IF Test_in_field (Temp) THEN
             BEGIN                { �po�ep�a �a�� �o�e�o e �xo��o-��xo��o  }
               Go_to_place := Temp;          Go_to_flag := TRUE
             END
           ELSE               { T�pce�e �a c�e��a�o�o �xo��o-��xo��o �o�e  }
             IF Find_in_field (Temp, Temp, D_find_next) THEN
               BEGIN
                 Go_to_place := Temp;        Go_to_flag := TRUE
               END
       END
END { Go_to };
{--------------------------------------------------------------------------}
FUNCTION Close_panel;                          { ���p��a �a�e�a o� e�pa�a  }
  VAR Temp: S_pointer;
BEGIN { Close_panel }
  IF S_search_node (Root_panel, Numb, Temp) THEN
    BEGIN
      WITH Panel_pointer (Temp^.S_data)^ DO
        IF State = Opened THEN
          IF Close_window (Window_numb) THEN { �a��ap� �po�ope�a �a �a�e�a }
            State := Closed
          ELSE
            Close_panel := FALSE;
      Close_panel := TRUE
    END
  ELSE                                          { H��a �a�e� c �o�� �o�ep  }
    Close_panel := FALSE
END { Close_panel };
{--------------------------------------------------------------------------}
{$F+ } {�po�e��pa�a ce ������a o� Release_panel �ocpe�c��o� S_delete_node  }
PROCEDURE Proc_del_panel                 { ���p��a ���op�a����a �a �a�e�a  }
          (Point : POINTER);
  VAR B : BOOLEAN;                                   { �o�o��a �po�e����a  }
BEGIN  { Proc_del_panel }
  WITH Panel_pointer(Point)^ DO
    BEGIN                         { ���p��a ���op�a����a �a �c���� �o�e�a  }
      D_delete_list (Root_field);
      B := Release_window (Window_numb)           { Oc�o�o��a�a �po�ope�a  }
    END;
  DISPOSE (Panel_pointer(Point))
END { Proc_del_panel };
{$F- ----------------------------------------------------------------------}
PROCEDURE Release_panel;                  { ���p��a ���op�a����a �a �a�e�  }
  VAR B : BOOLEAN;
BEGIN { Release_panel }
  B := Close_panel(Numb);             { �a��ap� �a�e�a, a�o �e e �a��ope�  }
  B := S_delete_node (Root_panel, Numb)      { ���p��a �a����e �a ������   }
END { Release_panel };
{--------------------------------------------------------------------------}
FUNCTION Define_field           { B�����a �o�o �o�e � c��c��a �a �o�e�a��  }
         (Root_field     :  D_list;                { Ha�a�o �a c��c��a     }
          Row_pos,Col_pos:  BYTE                   { Koop���a�� �a �o�e�o  }
          ):                Field_pointer;     { ��a�a�e� ��� �o�o�o �o�e  }
  VAR Key_el    : INTEGER;                     { K��� �a �o�e�o            }
      Temp      : D_pointer;                   { ��a�a�e� ��� �o�e�o       }
      New_field : Field_pointer;         { ��a�a�e� ��� �a����� �a �o�e�o  }
      B         : BOOLEAN;                     { �o�o��a �po�e����a        }
BEGIN { Define_field }
  Key_el := (Row_pos SHL 8) + Col_pos;     { �op��pa�e �a ���� �a ��pce�e  }
  IF D_search_node(Root_field, Key_el, Temp) THEN { A�o ��a �o�e c �a���a  }
    New_field := D_get_data(Temp)          { �oop���a��, ��e�a a�peca ��   }
  ELSE
    BEGIN   NEW (New_field);    { B�����a �o�o �o�e � c��c��a �a �o�e�a�a  }
      B := D_insert_node(Root_field, Key_el, POINTER(New_field), Temp);
    END;
  Define_field := New_field
END { Define_field };
{--------------------------------------------------------------------------}
PROCEDURE Copy_fields                 { �a��c�a oc�o����e �a��� �a �o�e�o  }
          (New_field      : Field_pointer;
           Row_pos,Col_pos: BYTE;         { ���������� �� ������           }
           Len            : BYTE;         { �������� �� ������             }
           Kind_Curr_field: Field_type;   { ��� �� ������                  }
           Help_num,                 { ��������� ����� �� ������ ��� ����� }
           Init_num       : BYTE;        {��������� ����� �� ������ ��� �� }
           Test_procedure : Field_test); { ������� �������                 }
BEGIN  { Copy_fields }
  WITH  New_field^ DO
    BEGIN
      Row_field  := Row_pos;         Col_field  := Col_pos;
      Help_field := Help_num;        Init_field := Init_num;
      Fore_field := Curr_fore_clr;   Back_field := Curr_back_clr;
      Kind_field := Kind_Curr_Field; Len_field  := Len;
      Find_error := FALSE;           Test_proc  := Test_procedure
    END
END { Copy_fields };
{--------------------------------------------------------------------------}
FUNCTION Test_field  { �po�ep��a �a�� �o�e�o �o�a�a � �pa�����e �a �a�e�a  }
         (Row_pos, Col_pos, Len,
          Height, Width: BYTE): BOOLEAN;
BEGIN { Tets_field }
  IF (Row_pos >= 1) AND (Row_pos <= Height) AND
     (Col_pos >= 1) AND (Col_pos+Len < Width) THEN
    Test_field := TRUE
  ELSE
    Test_field := FALSE
END { Test_field };
{--------------------------------------------------------------------------}
PROCEDURE In_out_float;                   { O�����a �xo��o-��xo��o �o�e �� }
  VAR New_field: Field_pointer;           { e�c�o�e������� �op�a�          }
BEGIN { In_out_float }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Pe�ep��pa �a��� �a �o�e�o  }
        New_field:= Define_field (Root_field,Row_pos,Col_pos);
                                              { Ko��pa o����e �a���        }
        Copy_fields (New_field, Row_pos, Col_pos, Len,
                     Inp_Float, Help_num, NP_num, Test_real);
        WITH  New_field^ DO
          BEGIN                  { Ko��pa c�e��������e �a��� �a �o�a �o�e  }
            Rl       := @R;
            Min_real := Min;    Max_real  := Max
          END
     END
END { In_out_float };
{--------------------------------------------------------------------------}
PROCEDURE In_out_fixed;  { O�����a �xo��o-��xo��o �o�e �� �ece���e� �op�a� }
  VAR  New_field: Field_pointer;
BEGIN { In_out_fixed }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Pe�ep��pa �a��� �a �o�e�o  }
        New_field:= Define_field (Root_field,Row_pos,Col_pos);
        Copy_fields (New_field, Row_pos, Col_pos, Len, Inp_Fixed,
                     Help_num, NP_num, Test_real);  { Ko��pa o����e �a��� }
        WITH  New_field^ DO     { Ko��pa c�e��������e �a��� �a �o�a �o�e  }
          BEGIN   Rl := @R;         Dec_pl   := Dec_p;
            Min_real := Min;        Max_real := Max
          END
      END
END { In_out_fixed };
{--------------------------------------------------------------------------}
PROCEDURE In_out_intg;           { O�����a �xo��o-��xo��o �o�e �� ��� ���  }
  VAR New_field: Field_pointer;
BEGIN { In_out_intg }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Pe�ep��pa �a��� �a �o�e�o  }
        New_field:= Define_field (Root_field,Row_pos,Col_pos);
                                      { Ko��pa� ce o����e �a��� �a �o�e�o  }
        Copy_fields (New_field, Row_pos, Col_pos, Len,
                    Inp_intg, Help_num, NP_num, Test_intg);
        WITH  New_field^ DO
          BEGIN                  { Ko��pa c�e��������e �a��� �a �o�a �o�e  }
            Intg := @I;    Min_intg := Min;         Max_intg := Max
          END
      END
END { In_out_intg };
{--------------------------------------------------------------------------}
PROCEDURE In_out_enum;        { O�����a �xo��o-��xo��o �o�e �� ���poe� ��� }
  VAR New_field: Field_pointer;
BEGIN { In_out_intg }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Pe�ep��pa �a��� �a �o�e�o  }
        New_field:= Define_field (Root_field,Row_pos,Col_pos);
                                          { Ko��pa o����e �a��� �a �o�e�o  }
        Copy_fields (New_field, Row_pos, Col_pos, Len,
                     Inp_enum, Help_num, NP_num, Test_enum);
        WITH  New_field^ DO      { Ko��pa c�e��������e �a��� �a �o�a �o�e  }
          BEGIN  P_opt := @Option;  P_enum := @Enum;   Numb_enum := N_enum;
            IF (Option < 1) OR (Option > N_enum) THEN
              Option := 1
          END
      END
END { In_out_intg };
{--------------------------------------------------------------------------}
PROCEDURE In_out_string;    { O�����a �xo��o-��xo��o �o�e �� c���o�e� ���  }
  VAR  New_field: Field_pointer;
BEGIN { In_out_string }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Pe�ep��pa �a��� �a �o�e�o  }
        New_field := Define_field (Root_field,Row_pos,Col_pos);
                                          { Ko��pa o����e �a��� �a �o�e�o  }
        Copy_fields (New_field, Row_pos, Col_pos, Len,
                     Inp_Str, Help_num, NP_num, Test_string);
        New_field^.St := @S
      END
END { In_out_string };
{--------------------------------------------------------------------------}
PROCEDURE In_out_char;      { O�����a �xo��o-��xo��o �o�e o� c���o�e� ���  }
 VAR  New_field:  Field_pointer;
BEGIN { In_out_char }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, 1, Height, Width) THEN
      BEGIN                                   { Pe�ep��pa �a��� �a �o�e�o  }
        New_field := Define_field (Root_field,Row_pos,Col_pos);
                                          { Ko��pa o����e �a��� �a �o�e�o  }
        Copy_fields (New_field, Row_pos, Col_pos, 1,
                     Inp_char, Help_num, NP_num, Test_char);
        WITH  New_field^ DO
          BEGIN                  { Ko��pa c�e��������e �a��� �a �o�a �o�e  }
            Ch := @C;        Inq_letters := Letters
          END
      END
END { In_out_char };
{--------------------------------------------------------------------------}
PROCEDURE Output_float;   { O�����a ��xo��o �o�e �� e�c�o�e������� �op�a�  }
 VAR  New_field : Field_pointer;
BEGIN { Output_float }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Pe�ep��pa �a��� �a �o�e�o  }
        New_field := Define_field (Root_field,Row_pos,Col_pos);
                                          { Ko��pa o����e �a��� �a �o�e�o  }
        Copy_fields (New_field,Row_pos,Col_pos,Len,Out_float,0,0,No_test);
        New_field^.Rl := @R
      END
END { Output_float };
{--------------------------------------------------------------------------}
PROCEDURE Output_fixed;        { O�����a ��xo��o �o�e �� �ece���e� �op�a�  }
  VAR  New_field: Field_pointer;
BEGIN { Output_fixed }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Pe�ep��pa �a��� �a �o�e�o  }
        New_field:= Define_field (Root_field,Row_pos,Col_pos);
                                          { Ko��pa o����e �a��� �a �o�e�o  }
        Copy_fields (New_field,Row_pos,Col_pos,Len,Out_Fixed,0,0,No_test);
        New_field^.Rl  := @R;    { Ko��pa c�e��������e �a��� �a �o�a �o�e  }
        New_field^.Dec_pl := Dec_p
      END
END { Output_fixed };
{--------------------------------------------------------------------------}
PROCEDURE Output_intg;                  { O�����a ��xo��o �o�e �� ��� ���  }
  VAR  New_field: Field_pointer;
BEGIN { Output_intg }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Pe�ep��pa �a��� �a �o�e�o  }
        New_field:= Define_field (Root_field,Row_pos,Col_pos);
                                          { Ko��pa o����e �a��� �a �o�e�o  }
        Copy_fields (New_field,Row_pos,Col_pos, Len,Out_intg,0,0,No_test);
        New_field^.Intg  := @I
      END
END { Output_intg };
{--------------------------------------------------------------------------}
PROCEDURE Output_string;           { O�����a ��xo��o �o�e �� c���o�e� ���  }
  VAR  New_field: Field_pointer;
BEGIN { Output_string }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Pe�ep��pa �a��� �a �o�e�o  }
        New_field := Define_field (Root_field,Row_pos,Col_pos);
                                          { Ko��pa o����e �a��� �a �o�e�o  }
        Copy_fields (New_field,Row_pos,Col_pos,Len,Out_str,0,0,No_test);
        New_field^.St := @S
      END
END { Output_string };
{--------------------------------------------------------------------------}
PROCEDURE Output_text;                            { O�����a �e�c�o�o �o�e  }
  VAR  New_field: Field_pointer;
BEGIN { Output_text }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Pe�ep��pa �a��� �a �o�e�o  }
        New_field := Define_field (Root_field,Row_pos,Col_pos);
                                          { Ko��pa o����e �a��� �a �o�e�o  }
        Copy_fields (New_field,Row_pos,Col_pos,Len,Out_text,0,0,No_test);
        NEW (New_field^.St); { Pe�ep��pa ce �a�e� �a �e�c�a �a  �o�a �o�e  }
        New_field^.St^ := S                   { Ko���� �e�c�� � �a�� �a�e� }
      END
END { Output_text };
{--------------------------------------------------------------------------}
PROCEDURE Output_char;             { O�����a ��xo��o �o�e o� c���o�e� ���  }
  VAR  New_field: Field_pointer;
BEGIN { Output_char }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, 1, Height, Width) THEN
      BEGIN                                   { Pe�ep��pa �a��� �a �o�e�o  }
        New_field := Define_field (Root_field,Row_pos,Col_pos);
                                          { Ko��pa o����e �a��� �a �o�e�o  }
        Copy_fields (New_field,Row_pos,Col_pos,1,Out_char, 0, 0, No_test);
        New_field^.Ch := @C
      END
END { Output_char };
{--------------------------------------------------------------------------}
PROCEDURE Set_field_color;  { �a�a�a ���� �a c���o���e � �o�a �a �o�e�a�a  }
BEGIN { Set_field_color }
  Curr_fore_clr := Fore AND (Blink OR 7);
  Curr_back_clr := Back AND 7
END { Set_field_color };
{--------------------------------------------------------------------------}
PROCEDURE Set_error_color;   { �a�a�a ���� �a c���o���e � �o�a �p� �pe��a  }
BEGIN { Set_error_color }
  Error_fore_color := Fore AND (Blink OR 7);
  Error_back_color := Back AND 7
END { Set_error_color };
{--------------------------------------------------------------------------}
PROCEDURE Remove_field;       { O�c�pa���� �o�e c �oop���a�� Row, Col o�   }
  VAR Temp   : BOOLEAN;       { �a�e�a Numb. �a�e��� �p���a �a e a����e�   }
      T_panel: S_pointer;      Key_el : INTEGER;
BEGIN { Remove_field }                   { T�pc� �a�e� c �oco�e��� �o�ep   }
  IF S_search_node (Root_panel, Numb, T_panel) THEN
    WITH Panel_pointer (T_panel^.S_data)^ DO
      BEGIN  Key_el := (Row SHL 8) + Col;      { �op��pa ���� �a ��pce�e   }
        Temp := D_delete_node (Root_field, Key_el)  { ���p��a ����o�o �o�e }
      END
END { Remove_field };
