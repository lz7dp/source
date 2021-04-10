{$V- ----------------------------------------------------------------------}
PROCEDURE Print_field                            { Извeждa пoлe нa eкpaнa  }
          (Field : D_pointer;{Aдpec нa в║зeлa, cв║pзвa╣ дaннни▓e нa  пoлe▓o}
           Mode  : Print_mode;                       { Peжим нa извeждaнe  }
       VAR S     : STRING);            { Извeдeни┐▓ нa eкpaнa cимвoлeн низ }
  VAR  Fore_clr, Back_clr: BYTE;
BEGIN { Print_field }
  WITH Field_pointer(D_get_data(Field))^ DO
    BEGIN     Back_clr := Back_field;
      CASE Mode OF                  { Фopмиpaнe нa ╢вe▓oвe▓e зa извeждaнe  }
        Normal_mode    :  Fore_clr := Fore_Field;
        Highlight_mode :  Fore_clr := Fore_field OR 8 ;
        Error_mode     :  BEGIN  Fore_clr := Error_fore_color;
                                 Back_clr := Error_back_color
                          END
      END { Case Mode };
      CASE Kind_field OF                  { Изxoднo п░еоб░аз│ване          }
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
PROCEDURE Disp_field;                                 { Извeждa eднo пoлe  }
  VAR S : STRING;
BEGIN  { Disp_field }
  WITH  Field_pointer(D_get_data(P))^  DO
    CASE Find_error  OF
      FALSE:  Print_field ( P, Normal_mode,S);        { H┐мa гpe╕кa        }
      TRUE :  Print_field ( P, Error_mode,S)          { Дoп│cнa▓a e гpe╕кa }
    END
END { Disp_field };
{$F-  ---------------------------------------------------------------------}
PROCEDURE Display;                      { Извeждa вcи╖ки пoлe▓a o▓ пaнeлa  }
  VAR B : BOOLEAN;
BEGIN { Display }
  Clear_window ;
  WITH Active_panel^ DO
   B := D_process_until (Root_field);
END { Display };
{--------------------------------------------------------------------------}
FUNCTION Input_convert                     { Изв║p╕вa вxoднo п░еоб░аз│ване }
          (In_str    : Str_field;          { Bxoдeн cимвoлeн низ           }
           Inp_field : D_pointer           { B║зeл нa c║o▓вe▓нo▓o пoлe     }
          ): BOOLEAN;                 { Peз│л▓a▓ o▓ в╡одно▓о п░еоб░аз│ване }
  VAR  B  : BOOLEAN;                            { Cпoмaгa▓eлни пpoмeнилви  }
    Field : Field_pointer;
    In_val: INTEGER;  S : Str_field;   C : CHAR;    R : REAL;
    Code  : INTEGER;                 { Koд зa peз│л▓a▓a o▓ п░еоб░аз│ване▓о }
    Back_clr, Fore_clr: BYTE;
    Last_panel: Panel_pointer;
  {------------------------------------------------------------------------}
  PROCEDURE Call_error_proc; { Oбpaбo▓вa гpe╕кa пpи вxoднo▓o п░еоб░аз│ване }
  BEGIN { Call_error_proc }
    WITH Active_panel^, Field^ DO
      Find_error := TRUE
  END { Call_error_proc };
  {------------------------------------------------------------------------}
  PROCEDURE Real_conv ;                        { П░еоб░аз│ва peaлнo ╖иcлo  }
  BEGIN { Real_conv }
    WITH Active_panel^, Field^ DO
      BEGIN  VAL (S, R, Code);
        IF Code = 0 THEN  {Aкo пpи п░еоб░аз│ване▓о VAL нe e o▓кpилa гpe╕кa }
          BEGIN         { Пpoвepкa дaли c▓oйнoc▓▓a e в дoп│c▓ими┐ ин▓epвaл }
            IF (R >= Min_real) AND (R <= Max_real) THEN
              BEGIN                       { Пpoвepкa в пpилoжнa▓a пpoгpaмa }
                IF @Test_proc <> NIL THEN
                  BEGIN              { C║xpaн┐вa дaнни▓e зa aк▓ивни┐ пaнeл }
                    Last_panel  := Active_panel;
                    IF Not Test_proc (R) THEN
                      Find_error := TRUE ;
                                  { B║зc▓aнoв┐вa дaнни▓e зa aк▓ивни┐ пaнeл }
                    Active_panel := Last_panel;
                    B := Set_window (Window_numb)
                  END
              END
            ELSE         { B║вeдeнa▓a c▓oйнoc▓ нe e в дoп│c▓ими┐ ин▓epвaл  }
              Call_error_proc;
            IF NOT Find_error THEN
              Rl^ := R;            { Aкo н┐мa гpe╕кa, c║xpaн┐вa c▓oйнoc▓▓a }
          END
        ELSE                           { Гpe╕кa пpи вxoднo▓o п░еоб░аз│ване }
          Call_error_proc
      END;
  END { Real_conv };
  {------------------------------------------------------------------------}
  PROCEDURE Integer_conv ;        { П░еоб░аз│ва ▒имволен низ в ╢┐лo ╖иcлo  }
  BEGIN  { Integer_conv }
    WITH Active_panel^, Field^ DO
      BEGIN  VAL (S, In_val, Code);
        IF Code = 0 THEN
          BEGIN
            IF (In_val >= Min_intg) AND (In_val <= Max_intg) THEN
              BEGIN                       { Пpoвepкa в пpилoжнa▓a пpoгpaмa }
                IF @Test_proc <> NIL THEN
                  BEGIN              { C║xpaн┐вa дaнни▓e зa aк▓ивни┐ пaнeл }
                    Last_panel   := Active_panel;
                    IF Not Test_proc (In_val) THEN
                      Find_error := TRUE;
                                  { B║зc▓aнoв┐вa дaнни▓e зa aк▓ивни┐ пaнeл }
                     Active_panel := Last_panel;
                     B := Set_window (Window_numb)
                   END
               END
             ELSE         { B║вeдeнa▓a c▓oйнoc▓ нe e в дoп│c▓ими┐ ин▓epвaл }
               Call_error_proc;
             IF Not Find_error THEN
               Intg^ := In_val     { Aкo н┐мa гpe╕кa, c║xpaн┐вa c▓oйнoc▓▓a }
           END
         ELSE                          { Гpe╕кa пpи вxoднo▓o п░еоб░аз│ванe }
           Call_error_proc
      END;
  END { Integer_conv };
  {------------------------------------------------------------------------}
  PROCEDURE String_conv ;                         { Aнaлизиpa cимвoлен низ }
  BEGIN  { String_conv }
    WITH Active_panel^, Field^ DO
      BEGIN
        IF @Test_proc <> NIL THEN
          BEGIN                     { C║xpaн┐вa дaнни▓e зa aк▓ивни┐ пaнeл  }
            Last_panel   := Active_panel;
            IF Test_proc (In_str) THEN
              St^ := In_str
            ELSE
              Find_error := TRUE; { B║зc▓aнoв┐вa дaнни▓e зa aк▓ивни┐ пaнeл }
              Active_panel := Last_panel;
              B := Set_window (Window_numb)
          END
        ELSE
          St^ := In_str            { Aкo н┐мa гpe╕кa, c║xpaн┐вa c▓oйнoc▓▓a }
      END
  END { String_conv };
  {------------------------------------------------------------------------}
  PROCEDURE Char_conv ;                        { Aнaлизиpa в║веден cимвoл  }
  BEGIN  { Char_conv }
    WITH Active_panel^, Field^ DO
      BEGIN
        IF LENGTH(In_str) <> 0 THEN
          BEGIN  C := In_str[1];              { Имa ли пoнe eдин cимвoл ?  }
            IF Pos(C,Inq_letters) <> 0 THEN
              BEGIN                          { Имa ли ▓ec▓oвa пpo╢eд│pa ?  }
                IF @Test_proc <> NIL THEN
                  BEGIN             { C║xpaн┐вa дaнни▓e зa aк▓ивни┐ пaнeл  }
                    Last_panel   := Active_panel;
                    IF Test_proc (C) THEN             { Aнaлиз нa cимвoлa  }
                      Ch^ := C
                    ELSE                                 { Heвepeн cимвoл  }
                      Find_error := TRUE;
                                 { B║зc▓aнoв┐вa дaнни▓e зa aк▓ивни┐ пaнeл  }
                    Active_panel := Last_panel;
                    B := Set_window (Window_numb)
                  END
                ELSE
                  Ch^ := C         { Aкo н┐мa гpe╕кa, c║xpaн┐вa c▓oйнoc▓▓a }
              END
            ELSE                      { Cимвoл║▓ нe e o▓ дoп│c▓ими┐ нaбop  }
              Call_error_proc
          END
        ELSE                                 { Гpe╕кa в бpo┐ нa cимвoли▓e  }
          Call_error_proc
      END
  END { Char_conv };
  {------------------------------------------------------------------------}
  PROCEDURE Enum_conv ;                    { Aнaлизиpa пoлe о▓ изб░оен ▓ип }
  BEGIN  { Enum_conv }
    WITH Active_panel^, Field^ DO
     IF @Test_proc <> NIL THEN
      BEGIN                          { C║xpaн┐вa дaнни▓e зa aк▓ивни┐ пaнeл }
        Last_panel   := Active_panel;
        IF NOT Test_proc (P_opt^) THEN                 { Aнaлиз нa cимвoлa }
          Find_error := TRUE;
        Active_panel := Last_panel;{B║зc▓aнoв┐вa дaнни▓e зa aк▓ивни┐ пaнeл }
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
            BEGIN               { Извли╖a нa╖aлни▓e и пocлeдни▓e ин▓epвaли }
              Prefix (S,' ');       Suffix (S,' ')
            END;
          CASE Kind_field OF
            Inp_float,
            Inp_fixed :  Real_conv;             { П░еоб░аз│ва peaлнo ╖иcлo }
            Inp_intg  :  Integer_conv;          { П░еоб░аз│ва ╢┐лo  ╖и▒ло  }
            Inp_Str   :  String_conv;           { П░еоб░аз│ва cимвoлeн низ }
            Inp_char  :  Char_conv;             { П░еоб░аз│ва cимвoлнo пoлe}
            Inp_enum  :  Enum_conv
          END {Case};
          Input_convert := NOT Find_error
        END { With }
    END { With active_panel^ }
  END { Input_convert };
{--------------------------------------------------------------------------}
FUNCTION Edit                                          { Упpaвл┐вa пaнeлa  }
         (VAR Curr_place: D_pointer):BYTE;
  VAR  Curr_field, New_field: Field_pointer;        { Укaзa▓eли к║м пoлe▓a }
    New_curr_place : D_pointer; {Укaзa▓eл к║м eлeмeн▓ на cпиc║кa о▓ пoлe▓a }
    Character      : CHAR;                       { Пocлeден в║вeдeн cимвoл }
    C_pos,C_new_pos: BYTE;       { O▓нocи▓eлнa пoзи╢и┐ нa к│░▒о░а в пoлe▓o }
    Result_OK      : BOOLEAN;        { Peз│л▓a▓ o▓ вxoднo▓o п░еоб░аз│ване  }
    Wrk_str        : STRING;                                { Paбo▓eн низ  }
    Change_field   : BOOLEAN;                 { Пpизнaк зa cм┐нa нa пoлe▓o }
    End_of_edit    : BOOLEAN;              { Пpизнaк зa зaв║p╕вaнe нa Edit }
    New_key        : INTEGER;              { Kл╛╖ зa ▓║pceнe нa пoлe       }
    Last_panel     : Panel_pointer;
    Bool           : BOOLEAN;
  {------------------------------------------------------------------------}
  PROCEDURE Change_field_proc;          { K│pcop║▓ пpeминaвa в нoвo пoлe   }
  BEGIN { Change_field_proc }
    C_new_pos := 0;       Change_field := TRUE;
  END { Change_field_proc };
  {------------------------------------------------------------------------}
  PROCEDURE Special_flags;           { Oбpaбo▓кa нa cпe╢иaлни▓e ┤лaгoвe    }
  BEGIN  { Special flags }
    WITH Active_panel^ DO
     BEGIN
       IF Go_to_flag THEN         { Имa ли зa┐вкa зa пpexoд в нoвo пoлe    }
         BEGIN   Print_field (Curr_place, Normal_mode, Wrk_str);
           Curr_place := Go_to_place;  C_pos := 0;  Go_to_flag := FALSE;
           Print_field (Curr_place, Highlight_mode, Wrk_str)
         END;
       IF Update_flag THEN     {Имa ли зa┐вкa зa aк▓│aлизa╢и┐ нa пoлe▓a▓a  }
         BEGIN  Display;  Update_flag := FALSE;
           Print_field (Curr_place,Highlight_mode,Wrk_str)
         END;
       IF Quit_flag THEN           { Имa ли зa┐вкa зa нaп│cкaнe нa пaнeлa  }
         BEGIN
           End_of_edit := TRUE;  Quit_flag := FALSE;   Edit := 2
         END
     END
  END { Special flags };
  {------------------------------------------------------------------------}
  PROCEDURE Call_init_proc;            { Ha╖aлнa ини╢иaлизa╢и┐ нa пoлe▓o   }
    VAR B : BOOLEAN;
  BEGIN  { Call_init_proc }
    WITH Curr_field^,Active_panel^ DO
      IF @Init_proc <> NIL THEN
        BEGIN                       { C║xpaн┐вa дaнни▓e зa aк▓ивни┐ пaнeл  }
          Last_panel := Active_panel;
          Init_proc (Init_field); { B║зc▓aнoв┐вa дaнни▓e зa aк▓ивни┐ пaнeл }
          Active_panel := Last_panel;
          B := Set_window (Window_numb);
        END
  END { Call_init_proc };
  {------------------------------------------------------------------------}
BEGIN { Edit }              { Упpaвл┐вa в║вeждaнe▓o нa дaнни c пaнeлa      }
 WITH Active_panel^ DO
  BEGIN
   End_of_edit := FALSE;  New_curr_place := Curr_place;  C_pos := 0;
   Print_field (Curr_place, Highlight_mode, Wrk_Str);
   REPEAT                              { Дoc▓║п дo дaнни▓e нa п║pвo▓o пoлe }
    Curr_field := D_get_data(Curr_place);
    WITH Curr_field^ DO
      BEGIN  Call_init_proc;         { Ини╢иaлизиpa╣и дeйc▓ви┐ зa пoлe▓o   }
        Special_flags;
        IF End_of_edit THEN
          BEGIN
            Edit := 1; EXIT
          END;
        REPEAT
          GotoXY (Col_field+C_pos,Row_field); Change_field := FALSE;
          Character := Get_key;             { B║вeждaнe нa пopeдни┐ cимвoл }
          IF Character IN Move_keys THEN         { Упpaвл┐вa╣ клaви╕ ли е? }
            CASE Character OF
      Left_key: BEGIN                                    { C▓peлкa нaл┐вo  }
                  IF C_pos > 0 THEN  Dec (C_pos)
                  ELSE
                    BEGIN   { Пpeминaвaнe к║м пo-л┐вo в╡одно-из╡одно пoлe  }
                      IF Find_in_field (Curr_place,
                         New_curr_place, D_find_back) THEN
                        BEGIN             { Haмepeнo e в╡одно-из╡одно пoлe }
                          New_Field := D_get_data (New_curr_place);
                          C_new_pos := New_field^.Len_field - 1;
                          Change_field := TRUE
                        END
                    END
                END;
     Right_key: BEGIN                              { C▓peлкa нaд┐cнo       }
                  IF C_pos < Len_field - 1 THEN Inc (C_pos)
                  ELSE
                    BEGIN   { Пpeминaвaнe к║м пo-д┐cнo в╡одно-из╡одно пoлe }
                      IF Find_in_field (Curr_place,
                         New_curr_place, D_find_next) THEN
                      Change_field_proc   { Haмepeнo e в╡одно-из╡одно пoлe }
                    END
                END;
       Ins_key: Insert_mode := NOT Insert_mode;          { Cм┐нa нa peжимa }
       Del_key: DELETE (Wrk_str, C_pos+1, 1);  { Из▓pивaнe нa cимвoл       }
Back_space_key: IF C_pos>0 THEN
                  BEGIN            { Из▓pивaнe нa eдин cимвoл пpeд к│pcopa }
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
                   ELSE             { T║pcи cлeдвa╕o▓o вxoднo-изxoднo пoлe }
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
                BEGIN                  { Пpи peжим нa вм║квaнe нa cимвoли  }
                  IF C_pos < Len_field THEN
                    BEGIN            { Aкo нe e дoc▓игнa▓ кpa┐▓ нa пoлe▓o  }
                      INSERT (Character,Wrk_str,C_pos+1);    { Bм║квaнe    }
                      INC(C_pos)                 { Пpeмec▓вaнe нa к│pcopa  }
                    END
                END
               ELSE
                BEGIN                          { Пpи peжим нa зaмec▓вaнe   }
                  IF C_pos < Len_field  THEN
                    BEGIN          { Aкo нe e дoc▓игнa▓ кpa┐ нa пoлe▓o     }
                      Wrk_str[C_pos + 1] := Character;   { Зaмec▓вaнe      }
                      INC(C_pos)             { Пpeмec▓вaнe нa к│pcopa      }
                    END
                END;
              IF Kind_field = Inp_char THEN   { Aкo пoлe▓o e cимвoлнo,     }
                Change_field_proc  { пpeдc▓oи дa ce пpeминe к║м cлeдвa╣o▓o }
            END;
        Wrk_str := Adj_right_string(Wrk_str,Len_field);      { Изpaвн┐вaнe }
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
FUNCTION Open_panel;                                       { O▓вap┐ пaнeл  }
  VAR Temp      : S_pointer;
      Curr_place: D_pointer;
BEGIN { Open_panel }
  IF S_search_node (Root_panel, Numb, Temp) THEN    { Имa ли ▓aк║в пaнeл?  }
    BEGIN   Active_panel := Temp^.S_data;
      WITH Active_panel^ DO
        BEGIN
          CASE State OF            { Пpeдвapи▓eлнa пoдгo▓oвкa зa paбo▓a    }
            Opened:;
            Closed:  BEGIN                  { O▓вap┐ c║o▓вe▓ни┐ пpoзope╢   }
                       IF Open_window (Window_numb) THEN
                         State := Opened
                       ELSE         { Гpe╕кa пpи o▓вap┐нe▓o нa пpoзope╢a   }
                         BEGIN
                           Open_panel := 3; EXIT
                         END
                      END;
          END { Case };
          Display;                      { Извeждa вcи╖ки пoлe▓a o▓ пaнeлa  }
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
PROCEDURE Update_panel;         { Пpeдизвиквa aк▓│aлизиpaнe нa пaнeл Numb  }
  VAR Temp : S_pointer;
BEGIN { Update_panel }
  IF S_search_node (Root_panel, Numb,   Temp) THEN
    WITH Panel_pointer (Temp^.S_data)^ DO
      IF  State = Opened THEN
        Update_flag := TRUE
END { Update_panel };
{--------------------------------------------------------------------------}
PROCEDURE Quit_panel;               { Пpeдизвиквa нaп│cкaнe нa пaнeл Numb  }
   VAR Temp: S_pointer;
BEGIN { Quit_panel }
  IF S_search_node (Root_panel, Numb,   Temp) THEN
    WITH Panel_pointer (Temp^.S_data)^ DO
      IF  State = Opened THEN
        Quit_flag := TRUE
END { Quit_panel };
