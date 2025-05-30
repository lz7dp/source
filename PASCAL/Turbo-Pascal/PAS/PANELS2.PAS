{$V- ----------------------------------------------------------------------}
PROCEDURE Print_field                            { ���e��a �o�e �a e�pa�a  }
          (Field : D_pointer;{A�pec �a ���e�a, c��p��a� �a�����e �a  �o�e�o}
           Mode  : Print_mode;                       { Pe��� �a ���e��a�e  }
       VAR S     : STRING);            { ���e�e���� �a e�pa�a c���o�e� ��� }
  VAR  Fore_clr, Back_clr: BYTE;
BEGIN { Print_field }
  WITH Field_pointer(D_get_data(Field))^ DO
    BEGIN     Back_clr := Back_field;
      CASE Mode OF                  { �op��pa�e �a ��e�o�e�e �a ���e��a�e  }
        Normal_mode    :  Fore_clr := Fore_Field;
        Highlight_mode :  Fore_clr := Fore_field OR 8 ;
        Error_mode     :  BEGIN  Fore_clr := Error_fore_color;
                                 Back_clr := Error_back_color
                          END
      END { Case Mode };
      CASE Kind_field OF                  { ��xo��o �������������          }
         Inp_float,Out_float: S := Float_to_string (Rl^, Len_field);
         Inp_fixed,Out_fixed: S :=Fixed_to_string(Rl^, Len_field, Dec_pl);
         Inp_intg,Out_intg  : S :=Integer_to_string(Intg^, Len_field);
         Inp_str,Out_str,
                    Out_text: S := Adj_right_string (St^, Len_field);
         Inp_char, Out_char : S := Ch^;
         Inp_enum           : S := Adj_right_string
                                             (P_enum^[P_opt^], Len_field)
       END; {Case}
       Write_string (S, Back_clr, Fore_clr, Row_field, Col_field)
     END
END { Print_field };
{$F+ ----------------------------------------------------------------------}
PROCEDURE Disp_field;                                 { ���e��a e��o �o�e  }
  VAR S : STRING;
BEGIN  { Disp_field }
  WITH  Field_pointer(D_get_data(P))^  DO
    CASE Find_error  OF
      FALSE:  Print_field ( P, Normal_mode,S);        { H��a �pe��a        }
      TRUE :  Print_field ( P, Error_mode,S)          { �o��c�a�a e �pe��a }
    END
END { Disp_field };
{$F-  ---------------------------------------------------------------------}
PROCEDURE Display;                      { ���e��a �c���� �o�e�a o� �a�e�a  }
  VAR B : BOOLEAN;
BEGIN { Display }
  Clear_window ;
  WITH Active_panel^ DO
   B := D_process_until (Root_field);
END { Display };
{--------------------------------------------------------------------------}
FUNCTION Input_convert                     { ����p��a �xo��o ������������� }
          (In_str    : Str_field;          { Bxo�e� c���o�e� ���           }
           Inp_field : D_pointer           { B��e� �a c�o��e��o�o �o�e     }
          ): BOOLEAN;                 { Pe����a� o� �������� ������������� }
  VAR  B  : BOOLEAN;                            { C�o�a�a�e��� �po�e�����  }
    Field : Field_pointer;
    In_val: INTEGER;  S : Str_field;   C : CHAR;    R : REAL;
    Code  : INTEGER;                 { Ko� �a pe����a�a o� ��������������� }
    Back_clr, Fore_clr: BYTE;
    Last_panel: Panel_pointer;
  {------------------------------------------------------------------------}
  PROCEDURE Call_error_proc; { O�pa�o��a �pe��a �p� �xo��o�o ������������� }
  BEGIN { Call_error_proc }
    WITH Active_panel^, Field^ DO
      Find_error := TRUE
  END { Call_error_proc };
  {------------------------------------------------------------------------}
  PROCEDURE Real_conv ;                        { ����������� pea��o ��c�o  }
  BEGIN { Real_conv }
    WITH Active_panel^, Field^ DO
      BEGIN  VAL (S, R, Code);
        IF Code = 0 THEN  {A�o �p� ��������������� VAL �e e o��p��a �pe��a }
          BEGIN         { �po�ep�a �a�� c�o��oc��a e � �o��c����� ���ep�a� }
            IF (R >= Min_real) AND (R <= Max_real) THEN
              BEGIN                       { �po�ep�a � �p��o��a�a �po�pa�a }
                IF @Test_proc <> NIL THEN
                  BEGIN              { C�xpa���a �a����e �a a������� �a�e� }
                    Last_panel  := Active_panel;
                    IF Not Test_proc (R) THEN
                      Find_error := TRUE ;
                                  { B��c�a�o���a �a����e �a a������� �a�e� }
                    Active_panel := Last_panel;
                    B := Set_window (Window_numb)
                  END
              END
            ELSE         { B��e�e�a�a c�o��oc� �e e � �o��c����� ���ep�a�  }
              Call_error_proc;
            IF NOT Find_error THEN
              Rl^ := R;            { A�o ���a �pe��a, c�xpa���a c�o��oc��a }
          END
        ELSE                           { �pe��a �p� �xo��o�o ������������� }
          Call_error_proc
      END;
  END { Real_conv };
  {------------------------------------------------------------------------}
  PROCEDURE Integer_conv ;        { ����������� �������� ��� � ���o ��c�o  }
  BEGIN  { Integer_conv }
    WITH Active_panel^, Field^ DO
      BEGIN  VAL (S, In_val, Code);
        IF Code = 0 THEN
          BEGIN
            IF (In_val >= Min_intg) AND (In_val <= Max_intg) THEN
              BEGIN                       { �po�ep�a � �p��o��a�a �po�pa�a }
                IF @Test_proc <> NIL THEN
                  BEGIN              { C�xpa���a �a����e �a a������� �a�e� }
                    Last_panel   := Active_panel;
                    IF Not Test_proc (In_val) THEN
                      Find_error := TRUE;
                                  { B��c�a�o���a �a����e �a a������� �a�e� }
                     Active_panel := Last_panel;
                     B := Set_window (Window_numb)
                   END
               END
             ELSE         { B��e�e�a�a c�o��oc� �e e � �o��c����� ���ep�a� }
               Call_error_proc;
             IF Not Find_error THEN
               Intg^ := In_val     { A�o ���a �pe��a, c�xpa���a c�o��oc��a }
           END
         ELSE                          { �pe��a �p� �xo��o�o ������������e }
           Call_error_proc
      END;
  END { Integer_conv };
  {------------------------------------------------------------------------}
  PROCEDURE String_conv ;                         { A�a����pa c���o��� ��� }
  BEGIN  { String_conv }
    WITH Active_panel^, Field^ DO
      BEGIN
        IF @Test_proc <> NIL THEN
          BEGIN                     { C�xpa���a �a����e �a a������� �a�e�  }
            Last_panel   := Active_panel;
            IF Test_proc (In_str) THEN
              St^ := In_str
            ELSE
              Find_error := TRUE; { B��c�a�o���a �a����e �a a������� �a�e� }
              Active_panel := Last_panel;
              B := Set_window (Window_numb)
          END
        ELSE
          St^ := In_str            { A�o ���a �pe��a, c�xpa���a c�o��oc��a }
      END
  END { String_conv };
  {------------------------------------------------------------------------}
  PROCEDURE Char_conv ;                        { A�a����pa ������� c���o�  }
  BEGIN  { Char_conv }
    WITH Active_panel^, Field^ DO
      BEGIN
        IF LENGTH(In_str) <> 0 THEN
          BEGIN  C := In_str[1];              { ��a �� �o�e e��� c���o� ?  }
            IF Pos(C,Inq_letters) <> 0 THEN
              BEGIN                          { ��a �� �ec�o�a �po�e��pa ?  }
                IF @Test_proc <> NIL THEN
                  BEGIN             { C�xpa���a �a����e �a a������� �a�e�  }
                    Last_panel   := Active_panel;
                    IF Test_proc (C) THEN             { A�a��� �a c���o�a  }
                      Ch^ := C
                    ELSE                                 { He�epe� c���o�  }
                      Find_error := TRUE;
                                 { B��c�a�o���a �a����e �a a������� �a�e�  }
                    Active_panel := Last_panel;
                    B := Set_window (Window_numb)
                  END
                ELSE
                  Ch^ := C         { A�o ���a �pe��a, c�xpa���a c�o��oc��a }
              END
            ELSE                      { C���o��� �e e o� �o��c����� �a�op  }
              Call_error_proc
          END
        ELSE                                 { �pe��a � �po� �a c���o���e  }
          Call_error_proc
      END
  END { Char_conv };
  {------------------------------------------------------------------------}
  PROCEDURE Enum_conv ;                    { A�a����pa �o�e �� ������� ��� }
  BEGIN  { Enum_conv }
    WITH Active_panel^, Field^ DO
     IF @Test_proc <> NIL THEN
      BEGIN                          { C�xpa���a �a����e �a a������� �a�e� }
        Last_panel   := Active_panel;
        IF NOT Test_proc (P_opt^) THEN                 { A�a��� �a c���o�a }
          Find_error := TRUE;
        Active_panel := Last_panel;{B��c�a�o���a �a����e �a a������� �a�e� }
        B := Set_window (Window_numb)
      END
  END { Enum_conv };
  {------------------------------------------------------------------------}
BEGIN { Input_convert }
  WITH Active_panel^ DO
    BEGIN  Field := D_get_data(Inp_field);       S := In_str;
      WITH Field^ DO
        BEGIN  Find_error := FALSE;
          IF Kind_field IN [Inp_float, Inp_fixed, Inp_intg] THEN
            BEGIN               { ������a �a�a����e � �oc�e����e ���ep�a�� }
              Prefix (S,' ');       Suffix (S,' ')
            END;
          CASE Kind_field OF
            Inp_float,
            Inp_fixed :  Real_conv;             { ����������� pea��o ��c�o }
            Inp_intg  :  Integer_conv;          { ����������� ���o  �����  }
            Inp_Str   :  String_conv;           { ����������� c���o�e� ��� }
            Inp_char  :  Char_conv;             { ����������� c���o��o �o�e}
            Inp_enum  :  Enum_conv
          END {Case};
          Input_convert := NOT Find_error
        END { With }
    END { With active_panel^ }
  END { Input_convert };
{--------------------------------------------------------------------------}
FUNCTION Edit                                          { ��pa����a �a�e�a  }
         (VAR Curr_place: D_pointer):BYTE;
  VAR  Curr_field, New_field: Field_pointer;        { ��a�a�e�� ��� �o�e�a }
    New_curr_place : D_pointer; {��a�a�e� ��� e�e�e�� �� c��c��a �� �o�e�a }
    Character      : CHAR;                       { �oc�e��� ���e�e� c���o� }
    C_pos,C_new_pos: BYTE;       { O��oc��e��a �o����� �a ������� � �o�e�o }
    Result_OK      : BOOLEAN;        { Pe����a� o� �xo��o�o �������������  }
    Wrk_str        : STRING;                                { Pa�o�e� ���  }
    Change_field   : BOOLEAN;                 { �p���a� �a c���a �a �o�e�o }
    End_of_edit    : BOOLEAN;              { �p���a� �a �a��p��a�e �a Edit }
    New_key        : INTEGER;              { K��� �a ��pce�e �a �o�e       }
    Last_panel     : Panel_pointer;
    Bool           : BOOLEAN;
  {------------------------------------------------------------------------}
  PROCEDURE Change_field_proc;          { K�pcop�� �pe���a�a � �o�o �o�e   }
  BEGIN { Change_field_proc }
    C_new_pos := 0;       Change_field := TRUE;
  END { Change_field_proc };
  {------------------------------------------------------------------------}
  PROCEDURE Special_flags;           { O�pa�o��a �a c�e��a����e ��a�o�e    }
  BEGIN  { Special flags }
    WITH Active_panel^ DO
     BEGIN
       IF Go_to_flag THEN         { ��a �� �a���a �a �pexo� � �o�o �o�e    }
         BEGIN   Print_field (Curr_place, Normal_mode, Wrk_str);
           Curr_place := Go_to_place;  C_pos := 0;  Go_to_flag := FALSE;
           Print_field (Curr_place, Highlight_mode, Wrk_str)
         END;
       IF Update_flag THEN     {��a �� �a���a �a a���a���a��� �a �o�e�a�a  }
         BEGIN  Display;  Update_flag := FALSE;
           Print_field (Curr_place,Highlight_mode,Wrk_str)
         END;
       IF Quit_flag THEN           { ��a �� �a���a �a �a��c�a�e �a �a�e�a  }
         BEGIN
           End_of_edit := TRUE;  Quit_flag := FALSE;   Edit := 2
         END
     END
  END { Special flags };
  {------------------------------------------------------------------------}
  PROCEDURE Call_init_proc;            { Ha�a��a �����a���a��� �a �o�e�o   }
    VAR B : BOOLEAN;
  BEGIN  { Call_init_proc }
    WITH Curr_field^,Active_panel^ DO
      IF @Init_proc <> NIL THEN
        BEGIN                       { C�xpa���a �a����e �a a������� �a�e�  }
          Last_panel := Active_panel;
          Init_proc (Init_field); { B��c�a�o���a �a����e �a a������� �a�e� }
          Active_panel := Last_panel;
          B := Set_window (Window_numb);
        END
  END { Call_init_proc };
  {------------------------------------------------------------------------}
BEGIN { Edit }              { ��pa����a ���e��a�e�o �a �a��� c �a�e�a      }
 WITH Active_panel^ DO
  BEGIN
   End_of_edit := FALSE;  New_curr_place := Curr_place;  C_pos := 0;
   Print_field (Curr_place, Highlight_mode, Wrk_Str);
   REPEAT                              { �oc��� �o �a����e �a ��p�o�o �o�e }
    Curr_field := D_get_data(Curr_place);
    WITH Curr_field^ DO
      BEGIN  Call_init_proc;         { �����a����pa�� �e�c���� �a �o�e�o   }
        Special_flags;
        IF End_of_edit THEN
          BEGIN
            Edit := 1; EXIT
          END;
        REPEAT
          GotoXY (Col_field+C_pos,Row_field); Change_field := FALSE;
          Character := Get_key;             { B��e��a�e �a �ope���� c���o� }
          IF Character IN Move_keys THEN         { ��pa����a� ��a��� �� �? }
            CASE Character OF
      Left_key: BEGIN                                    { C�pe��a �a���o  }
                  IF C_pos > 0 THEN  Dec (C_pos)
                  ELSE
                    BEGIN   { �pe���a�a�e ��� �o-���o ������-������� �o�e  }
                      IF Find_in_field (Curr_place,
                         New_curr_place, D_find_back) THEN
                        BEGIN             { Ha�epe�o e ������-������� �o�e }
                          New_Field := D_get_data (New_curr_place);
                          C_new_pos := New_field^.Len_field - 1;
                          Change_field := TRUE
                        END
                    END
                END;
     Right_key: BEGIN                              { C�pe��a �a��c�o       }
                  IF C_pos < Len_field - 1 THEN Inc (C_pos)
                  ELSE
                    BEGIN   { �pe���a�a�e ��� �o-��c�o ������-������� �o�e }
                      IF Find_in_field (Curr_place,
                         New_curr_place, D_find_next) THEN
                      Change_field_proc   { Ha�epe�o e ������-������� �o�e }
                    END
                END;
       Ins_key: Insert_mode := NOT Insert_mode;          { C���a �a pe���a }
       Del_key: DELETE (Wrk_str, C_pos+1, 1);  { ���p��a�e �a c���o�       }
Back_space_key: IF C_pos>0 THEN
                  BEGIN            { ���p��a�e �a e��� c���o� �pe� ��pcopa }
                    DELETE (Wrk_str, C_pos, 1);   C_pos := C_pos - 1
                  END;
     Pg_up_key: IF Find_in_field (Curr_place,
                                  New_curr_place, D_find_back) THEN
                  Change_field_proc;
     Pg_dn_key: IF Find_in_field  (Curr_place,
                                   New_curr_place, D_find_next) THEN
                  Change_field_proc;
 Ctrl_right_key: BEGIN
                   New_key := (D_get_key(Curr_place) SHR 8 )  SHL 8;
                   D_position_before (Active_panel^.Root_field,
                                      New_key, New_curr_place);
                   IF Test_in_field (New_curr_place) THEN
                     Change_field_proc
                   ELSE             { T�pc� c�e��a�o�o �xo��o-��xo��o �o�e }
                     IF Find_in_field (New_curr_place,
                                       New_curr_place, D_find_next) THEN
                       Change_field_proc
                  END;
        Esc_key: BEGIN    Edit := 1;
                   End_of_edit := TRUE;      Change_field := TRUE
                 END;
        End_key: BEGIN    Edit := 0;
                   End_of_edit := TRUE;      Change_field := TRUE
                 END;
         Cr_key: BEGIN  Bool := Find_in_field (Curr_place, New_curr_place,
                                 D_find_next);
                   Change_field_proc
                 END;
             F1: WITH Active_panel^ DO
                   IF @Help_proc <> NIL THEN
                     BEGIN   Last_panel := Active_panel;
                       Help_proc (Help_field);
                       Active_panel := Last_panel
                     END
            END { Case }
          ELSE
          IF Character IN Input_characters THEN
            BEGIN
              IF (Kind_field = Inp_enum) THEN
                BEGIN
                  IF  (Character =' ')  THEN
                    BEGIN   P_opt^ := (P_opt^) MOD Numb_enum + 1;
                      Wrk_str := Adj_right_string(P_enum^[P_opt^], Len_field);
                    END
                END
              ELSE
               IF Insert_mode THEN
                BEGIN                  { �p� pe��� �a �����a�e �a c���o��  }
                  IF C_pos < Len_field THEN
                    BEGIN            { A�o �e e �oc����a� �pa�� �a �o�e�o  }
                      INSERT (Character,Wrk_str,C_pos+1);    { B����a�e    }
                      INC(C_pos)                 { �pe�ec��a�e �a ��pcopa  }
                    END
                END
               ELSE
                BEGIN                          { �p� pe��� �a �a�ec��a�e   }
                  IF C_pos < Len_field  THEN
                    BEGIN          { A�o �e e �oc����a� �pa� �a �o�e�o     }
                      Wrk_str[C_pos + 1] := Character;   { �a�ec��a�e      }
                      INC(C_pos)             { �pe�ec��a�e �a ��pcopa      }
                    END
                END;
              IF Kind_field = Inp_char THEN   { A�o �o�e�o e c���o��o,     }
                Change_field_proc  { �pe�c�o� �a ce �pe���e ��� c�e��a�o�o }
            END;
        Wrk_str := Adj_right_string(Wrk_str,Len_field);      { ��pa����a�e }
        Write_string(Wrk_str,Back_field,Fore_field OR 8,Row_field,Col_field)
      UNTIL Change_field OR (Character IN [Esc_key]) OR
            Go_to_flag OR Quit_flag OR Update_flag;
      IF Input_convert (Wrk_str, Curr_place) THEN
        BEGIN
          IF Kind_field = Inp_char THEN
            BEGIN
              IF NOT (Character IN Move_keys) THEN
                IF Find_in_field (Curr_place,
                                  New_curr_place, D_find_next)THEN
                  Change_field_proc
            END;
          Print_field (Curr_place, Normal_mode, Wrk_str);
          Curr_place := New_curr_place;
          Print_field (Curr_place, Highlight_mode, Wrk_str);
          C_pos := C_new_pos
        END
      ELSE
        Write_string (Wrk_str, Error_back_color, Error_fore_color,
                      Row_field, Col_field)
      END;
      Special_flags
    UNTIL End_of_edit
  END
END { Edit };
{--------------------------------------------------------------------------}
FUNCTION Open_panel;                                       { O��ap� �a�e�  }
  VAR Temp      : S_pointer;
      Curr_place: D_pointer;
BEGIN { Open_panel }
  IF S_search_node (Root_panel, Numb, Temp) THEN    { ��a �� �a��� �a�e�?  }
    BEGIN   Active_panel := Temp^.S_data;
      WITH Active_panel^ DO
        BEGIN
          CASE State OF            { �pe��ap��e��a �o��o�o��a �a pa�o�a    }
            Opened:;
            Closed:  BEGIN                  { O��ap� c�o��e���� �po�ope�   }
                       IF Open_window (Window_numb) THEN
                         State := Opened
                       ELSE         { �pe��a �p� o��ap��e�o �a �po�ope�a   }
                         BEGIN
                           Open_panel := 3; EXIT
                         END
                      END;
          END { Case };
          Display;                      { ���e��a �c���� �o�e�a o� �a�e�a  }
          D_position_after (Root_field, 0,Curr_place);
          IF Test_in_field (Curr_place) THEN
            Open_panel := Edit(Curr_Place)
          ELSE
            IF Find_in_field (Curr_place, Curr_place, D_find_next) THEN
              Open_panel := Edit(Curr_Place)
        END
    END
END { Open_panel };
{--------------------------------------------------------------------------}
PROCEDURE Update_panel;         { �pe�������a a���a����pa�e �a �a�e� Numb  }
  VAR Temp : S_pointer;
BEGIN { Update_panel }
  IF S_search_node (Root_panel, Numb,   Temp) THEN
    WITH Panel_pointer (Temp^.S_data)^ DO
      IF  State = Opened THEN
        Update_flag := TRUE
END { Update_panel };
{--------------------------------------------------------------------------}
PROCEDURE Quit_panel;               { �pe�������a �a��c�a�e �a �a�e� Numb  }
   VAR Temp: S_pointer;
BEGIN { Quit_panel }
  IF S_search_node (Root_panel, Numb,   Temp) THEN
    WITH Panel_pointer (Temp^.S_data)^ DO
      IF  State = Opened THEN
        Quit_flag := TRUE
END { Quit_panel };
