{--------------------------------------------------------------------------}
                                  { Tø´o ≠a ¨o§≥´ ßa ≥Øpa¢´e≠®e ≠a Øa≠e´®  }
     TYPE        { Bxo§≠o-®ßxo§≠® Øo´e≤a:    T®Ø          îop¨a≤           }
                 {---------------------------------------------------------}
     Field_type = (Inp_float,      {         REAL      E™cØo≠e≠∂®†´•≠      }
                   Inp_fixed,      {         REAL      Ñece≤®∑e≠           }
                   Inp_intg,       {         INTEGER   ñø´                 }
                   Inp_str,        {         STRING    C®¨¢o´e≠ ≠®ß        }
                   Inp_char,       {         CHAR      E§®≠ c®¨¢o´         }
                   Inp_enum,       {                   àß°poe≠ ≤®Ø         }
                 {       àßxo§≠® Øo´e≤a:                                   }
                 {---------------------------------------------------------}
                   Out_float,      {         REAL      E™cØo≠e≠∂®†´•≠      }
                   Out_fixed,      {         REAL      Ñece≤®∑e≠           }
                   Out_intg,       {         INTEGER   ñø´                 }
                   Out_str,        {         STRING    C®¨¢o´e≠ ≠®ß        }
                   Out_text,       {         Te™c≤o¢ ¥op¨a≤ ≠a §a≠≠®≤e     }
                   Out_char);      {         CHAR      E§®≠ c®¨¢o´         }
  { Pe¶®¨® ≠a ®ß¢e¶§a≠e: ≠op¨a´≠a øp™oc≤, Øo¢®∏e≠a øp™oc≤, ∞e¶®¨ ≠a £pe∏™a }
     Print_mode = (Normal_mode, Highlight_mode, Error_mode);
     Status  = (Closed, Opened); { C∫c≤oø≠®e ≠a Øa≠e´a: ßa≤¢ope≠, Æ≤¢ope≠  }
     Field_pointer = ^Field_data;                   { ì™aßa≤e´ ™∫¨ Øo´e≤o  }
     Field_data  =                                  { Ña≠≠® ßa Øo´e≤o      }
       RECORD  Row_field, Col_field,               { Koop§®≠a≤® ≠a Øo´e≤o  }
         Len_field    : BYTE;                      { Ñ∫´¶®≠a ≠a Øo´e≤o     }
         Fore_field,
         Back_field   : BYTE;                  { ñ¢ø≤ ≠a c®¨¢o´®≤e ® ¥o≠a  }
         Help_field,                       { Ho¨ep ≠† c∫o°πe≠®e Øp® Øo¨oπ  }
         Init_field   : BYTE;                 { Ho¨ep ≠† c∫o°πe≠®e Øp® çè  }
         Test_proc    : Field_test;       { î≥≠™∂®ø ßa ≤ec≤¢a≠e ≠a Øo´e≤o  }
         Find_error   :    BOOLEAN;       { à≠§®™a≤op ßa £pe∏™a ≠a Øo´e≤o  }
         Kind_field   :    Field_type;                    { T®Ø ≠a Øo´e≤o  }
         CASE Field_type OF         { Bap®a≠≤≠a ∑ac≤ ≠a §a≠≠®≤e ßa Øo´e≤o  }
           Inp_float, Out_float,Inp_fixed, Out_fixed:
             ( Rl     :   ^REAL;      { ì™aßa≤e´ ™∫¨ Øo´e≤o o≤ pea´e≠ ≤®Ø  }
               Min_real,Max_real: REAL; { Épa≠®∂® ßa c≤o©≠oc≤≤a ≠a Øo´e≤o  }
               Dec_pl : BYTE); { Åpo© ≠a ß≠a∂®≤e c´e§ §ece≤®∑≠a≤a ßaØe≤aø  }
           Inp_intg, Out_intg:
             ( Intg   :    ^INTEGER;   { ì™aßa≤e´ ™∫¨ Øo´e≤o o≤ ∂ø´ ≤®Ø    }
               Min_intg , Max_intg: INTEGER);     { Épa≠®∂® ßa c≤o©≠oc≤≤a  }
           Inp_str, Out_str, Out_text:
             ( St: ^Str_field);     { ì™aßa≤e´ ™∫¨ Øo´e≤o o≤ c®¨¢Æ´•≠ ≠®ß  }
           Inp_char, Out_char:
             ( Ch     : ^CHAR;      { ì™aßa≤e´ ™∫¨ Øo´e≤o o≤ c®¨¢o´e≠ ≤®Ø  }
               Inq_letters: Str_field);               { ÑoØ≥c≤®¨® c®¨¢o´®  }
           Inp_enum   :
             ( P_Opt  : ^BYTE;       { ì™aßa≤e´ ™∫¨ Øpo¨e≠´®¢a≤a-peß≥´≤a≤  }
               P_enum : ^Arr_str_field;   { ì™aßa≤e´ ™∫¨ ≤e™c≤o¢e≤e ≠a     }
                                          { a´≤ep≠a≤®¢®≤e                  }
             Numb_enum: BYTE)             { Åpo© ≠a a´≤ep≠a≤®¢®≤e          }
         END;
     Panel_pointer = ^Panel_data;                    { ì™aßa≤e´ ™∫¨ Øa≠e´  }
     Panel_data =                                    { Ña≠≠® ßa Øa≠e´      }
       RECORD Start_row,Start_col: BYTE; { Koop§®≠a≤® ≠a £Æ∞≠®ø ´ø¢ ∫£∫´   }
         Height, Width    : BYTE;        { Paß¨ep® ≠a Øpoßope∂a            }
         Window_numb      : BYTE;        { Ho¨ep ≠a Øpoßope∂               }
         State            : Status;      { C∫c≤oø≠®e ≠a Øa≠e´a             }
         Root_field       : D_list;      { ì™aßa≤e´ ™∫¨ cØ®c∫™a o≤ Øo´e≤a  }
         Quit_flag,                      { î´a£ ßa ¥opc®pa≠ ®ßxo§          }
         Update_flag      : BOOLEAN;     { î´a£ ßa a™≤≥a´®ß®pa≠e ≠a Øa≠e´a }
         Go_to_flag       : BOOLEAN;     { î´a£ ßa Øpo∂e§≥pa≤a Go_to       }
         Go_to_place      : D_pointer;   { èo´e ßa Øpexo§                  }
         Init_proc        : Panel_init_field; { èpo∂e§≥pa ßa Hè            }
         Help_proc        : Panel_help_field  { èpo∂e§≥pa ßa Øo¨oπ         }
       END;
  VAR
    Root_panel      : S_list;          { ì™aßa≤e´ ™∫¨ cØ®c∫™a ≠a Øa≠e´®≤•  }
    Active_panel    : Panel_pointer;   { A™≤®¢e≠ (Øo§paß°®paπ ce) Øa≠e´    }
    Curr_fore_clr   : BYTE;         { Te™≥π ∂¢ø≤ ≠a c®¨¢o´®≤e ¢ Øo´e≤o     }
    Curr_back_clr   : BYTE;         { Te™≥π ∂¢ø≤ ≠a ¥o≠a ¢ Øo´e≤o          }
    Error_fore_color: BYTE;         { Te™≥π ∂¢ø≤ ≠a c®¨¢o´®≤e Øp® £pe∏™a   }
    Error_back_color: BYTE;         { Te™≥π ∂¢ø≤ ≠a ¥o≠a Øp® £pe∏™a        }
    Insert_mode     : BOOLEAN; { Pe¶®¨ ßa ¢∫¢e¶§a≠e - ¢¨∫™¢a≠e/ßa¨ec≤¢a≠e  }
    Move_Keys,                       { M≠o¶ec≤¢o o≤ c®¨¢o´® ßa ≥Øpa¢´e≠®e  }
    Input_characters: SET OF CHAR;   { M≠o¶ec≤¢o o≤ ¢xo§≠® c®¨¢o´®         }
{$F+ ----------------------------------------------------------------------}
PROCEDURE Proc_del_field                 { àß≤p®¢a ®≠¥op¨a∂®ø≤a ßa Øo´e≤o  }
          (Point : POINTER);             { ì™aßa≤e´ ™∫¨ §a≠≠®≤e ≠a Øo´e≤o  }
BEGIN { Proc_del_field }       { èpo∂e§≥pa≤a ce ®ß¢®™¢a o≤ ¨o§≥´a D_lists  }
  WITH Field_pointer (Point)^ DO
    IF Kind_field = Out_text THEN     { A™o Øo´e≤o e ≤e™c≤o¢o, ®ß≤p®¢a     }
      DISPOSE(St);                    { o≤§e´e≠a≤a ßa ≠e£o Øa¨e≤           }
  DISPOSE (Field_pointer(Point))      { Oc¢o°o¶§a¢a  Øa¨e≤≤a ßa Øo´e≤o     }
END { Proc_del_field };
{--------------------------------------------------------------------------}
PROCEDURE Disp_field (P:D_pointer); FORWARD; { àß¢e¶§a ≠a e™pa≠a e§≠o Øo´e }
{$F-  ---------------------------------------------------------------------}
FUNCTION Define_panel;                { O°ø¢ø¢a oc≠o¢≠®≤e §a≠≠® ßa Øa≠e´a  }
  VAR Found : S_pointer;       Bool  :  BOOLEAN;         Part  :  BYTE;
BEGIN { Define_panel }                         { T∫pc® Øa≠e´ c ≠o¨ep Numb  }
  IF S_insert_node (Root_panel, Numb, Found) THEN
    BEGIN                             { A™o ≠e ≠a¨ep® - o°ø¢ø¢a ≠o¢ Øa≠e´  }
      NEW (Active_panel);             { Peßep¢®pa Øa¨e≤ ßa Øa≠e´a          }
      Found^.S_data := Active_panel;
      WITH Active_panel^ DO           { Bße¨a ≠o¨ep ≠a c¢o°o§e≠ Øpoßope∂   }
        BEGIN  Window_numb := Get_free_window;
          State := Closed;    { C∫ß§a¢a Øpaße≠ §¢≥c¢∫pßa≠ cØ®c∫™ ßa Øo´e≤a }
          D_init (Root_field, Disp_field, D_null_func, Proc_del_field);
        END
    END    { èa≠e´ c ≤oß® ≠o¨ep ¢e∑e c∫πec≤¢≥¢a - Øapa¨e≤p®≤e ¨≥ πe °∫§a≤  }
  ELSE       { Øpo¨e≠e≠® ¢ c∫o≤¢e≤c≤¢®e c ≠o¢®≤e Øapa¨e≤p® ≠a Øpo∂e§≥pa≤a  }
      Active_panel:= Found^.S_data;
  WITH Active_panel^ DO
    BEGIN
      IF State = Closed THEN
        BEGIN               { Kop®£®pa ∂¢e≤a ≠a c®¨¢o´®≤e, a™o ®¨a £pe∏™a  }
         Fore_clr := Fore_clr AND (Blink + 7);  Back_clr := Back_clr AND 7;
                      { áa§a¢a oc≠o¢≠®≤e Øapa¨e≤p® ≠a Øpoßope∂a ßa Øa≠e´a  }
         IF Define_window (Window_numb, Row_pos, Col_pos, Height_panel,
                         Width_panel, Fore_clr, Back_clr, Box, Title) THEN
           BEGIN
             Define_panel := TRUE;
             IF Box = No_box THEN   { OØpe§e´ø "£a°ap®≤≠®≤e" paß¨ep® ≠a    }
               Part := 0            { Øa≠e´ ¢ ßa¢®c®¨oc≤ o≤ ≤o¢a §a´® ®¨a  }
             ELSE                   { pa¨™a ®´® ≠ø¨a                       }
               Part := 2;
             Height := Height_panel - Part;  Width := Width_panel  - Part;
             Init_proc  := Init_procedure;   Help_proc := Help_procedure;
             Update_flag      := FALSE; { î´a£ ßa a™≤≥a´®ß®pa≠e ≠a Øa≠e´a  }
             Quit_flag        := FALSE;     { î´a£ ßa ≠aØ≥c™a≠e ≠a Øa≠e´a  }
             Go_to_flag       := FALSE          { î´a£ ßa Øpexo§ ™∫¨ Øo´e  }
           END
         ELSE                        { Épe∏™a Øp® o≤¢apø≠e≤o ≠a Øpoßope∂a  }
           BEGIN
             Define_panel := FALSE;               { Oc¢o°o¶§a¢a Øpoßope∂a  }
             Bool := Release_window(Window_numb);
             Release_panel (Numb)
           END
        END
      ELSE
        Define_panel := FALSE
    END
END { Define_panel };
{--------------------------------------------------------------------------}
FUNCTION Test_in_field           { èpo¢epø¢a §a´® Øo´e≤o e ¢xo§≠o-®ßxo§≠o  }
         (Place : D_pointer      { ì™aßa≤e´ ™∫¨ cØ®c∫™a ≠a Øo´e≤a≤†        }
         ): BOOLEAN;        { Peß≥´≤a≤:   TRUE  - Øo´e≤o e ¢xo§≠o-®ßxo§≠o  }
                            {             FALSE - Øo´e≤o e ®ßxo§≠o         }
BEGIN { Test_in_field }
  WITH Field_pointer (D_get_data(Place))^ DO
    IF Kind_field IN [Inp_float,Inp_fixed,Inp_str,
                      Inp_char, Inp_intg, Inp_enum] THEN
      Test_in_field := TRUE
    ELSE
      Test_in_field := FALSE
END { Test_in_field };
{--------------------------------------------------------------------------}
FUNCTION Find_in_field             { T∫pc® c´e§¢aπo≤o ¢xo§≠o-®ßxo§≠o Øo´e  }
         (Curr_place    : D_pointer;    { Te™≥πo Øo´e - ≠a∑a´o ßa ≤∫pce≠e  }
      VAR New_curr_place: D_pointer;    { Ha¨epe≠o Øo´e                    }
          Func          : Find_function { î≥≠™∂®ø ßa ≤∫pce≠e               }
          ) : BOOLEAN;          { Peß≥´≤a≤ TRUE  - ≠a¨epe≠o e ≤a™o¢a Øo´e  }
                                {          FALSE - ≠ø¨a ≤a™o¢a Øo´e        }
  VAR  Temp_place : D_pointer;
       Found      : BOOLEAN;
BEGIN { Find_in_field }
  Found := FALSE;      Temp_place := Curr_place;
  WHILE  NOT FOUND DO
    BEGIN                                         { T∫pc® c´e§¢aπo≤o Øo´e  }
      IF Func (Temp_place, Temp_place) THEN
        BEGIN           { O≤™p®≤o e Øo´e - Øpo¢ep™a §a´® e ¢xo§≠o-®ßxo§≠o  }
          IF Test_in_field (Temp_place) THEN
            BEGIN           { èo´e≤o e ¢xo§≠o-®ßxo§≠o - ™pa© ≠a ≤∫pce≠e≤o  }
              New_curr_place := Temp_place;
              Found := TRUE;          Find_in_field := TRUE
            END
        END
      ELSE
        BEGIN                   { He e o≤™p®≤o e Øo´e - ™pa© ≠a ≤∫pce≠e≤o  }
          New_curr_place := Curr_place;
          Found := TRUE;             Find_in_field := FALSE
        END
    END { While}
END { Find_in_field };
{--------------------------------------------------------------------------}
PROCEDURE Go_to;   { ìc≤a≠o¢ø¢a ™≥∞±Æ∞† ¢∫¢ ¢xo§≠o-®ßxo§≠o Øo´e c          }
                   { ™oop§®≠a≤® Row, Col ®´® ¢ c´e§¢aπo≤o ¢xo§≠o-®ßxo§≠o   }
                   { Øo´e ≠a Øa≠e´a Numb. èa≠e´∫≤ ≤pø°¢a §a e o≤¢ope≠      }
  VAR Temp   : D_pointer;      T_panel: S_pointer;      Key_el : INTEGER;
BEGIN { Go_to }
  IF S_search_node (Root_panel, Numb, T_panel) THEN
    WITH Panel_pointer (T_panel^.S_data)^ DO
      IF State = Opened THEN                    {  èa≠e´∫≤ o≤¢ope≠ ´® e ?  }
       BEGIN     Go_to_flag := FALSE;
         Key_el := (Row SHL 8) + Col;     { îop¨®pa≠e ≠a ™´æ∑ ßa ≤∫pce≠e   }
                                          { T∫pce≠e ¢ cØ®c∫™a ≠a Øo´e≤a≤a  }
         IF D_search_node(Root_field, Key_el,Temp) THEN
           IF Test_in_field (Temp) THEN
             BEGIN                { èpo¢ep™a §a´® Øo´e≤o e ¢xo§≠o-®ßxo§≠o  }
               Go_to_place := Temp;          Go_to_flag := TRUE
             END
           ELSE               { T∫pce≠e ≠a c´e§¢aπo≤o ¢xo§≠o-®ßxo§≠o Øo´e  }
             IF Find_in_field (Temp, Temp, D_find_next) THEN
               BEGIN
                 Go_to_place := Temp;        Go_to_flag := TRUE
               END
       END
END { Go_to };
{--------------------------------------------------------------------------}
FUNCTION Close_panel;                          { àß≤p®¢a Øa≠e´a o≤ e™pa≠a  }
  VAR Temp: S_pointer;
BEGIN { Close_panel }
  IF S_search_node (Root_panel, Numb, Temp) THEN
    BEGIN
      WITH Panel_pointer (Temp^.S_data)^ DO
        IF State = Opened THEN
          IF Close_window (Window_numb) THEN { áa≤¢apø Øpoßope∂a ≠a Øa≠e´a }
            State := Closed
          ELSE
            Close_panel := FALSE;
      Close_panel := TRUE
    END
  ELSE                                          { Hø¨a Øa≠e´ c ≤oß® ≠o¨ep  }
    Close_panel := FALSE
END { Close_panel };
{--------------------------------------------------------------------------}
{$F+ } {èpo∂e§≥pa≤a ce ®ß¢®™¢a o≤ Release_panel Øocpe§c≤¢o¨ S_delete_node  }
PROCEDURE Proc_del_panel                 { àß≤p®¢a ®≠¥op¨a∂®ø≤a ßa Øa≠e´a  }
          (Point : POINTER);
  VAR B : BOOLEAN;                                   { èo¨oπ≠a Øpo¨e≠´®¢a  }
BEGIN  { Proc_del_panel }
  WITH Panel_pointer(Point)^ DO
    BEGIN                         { àß≤p®¢a ®≠¥op¨a∂®ø≤a ßa ¢c®∑™® Øo´e≤a  }
      D_delete_list (Root_field);
      B := Release_window (Window_numb)           { Oc¢o°o¶§a¢a Øpoßope∂a  }
    END;
  DISPOSE (Panel_pointer(Point))
END { Proc_del_panel };
{$F- ----------------------------------------------------------------------}
PROCEDURE Release_panel;                  { àß≤p®¢a ®≠¥op¨a∂®ø≤a ßa Øa≠e´  }
  VAR B : BOOLEAN;
BEGIN { Release_panel }
  B := Close_panel(Numb);             { áa≤¢apø Øa≠e´a, a™o ≠e e ßa≤¢ope≠  }
  B := S_delete_node (Root_panel, Numb)      { àß≤p®¢a §a≠≠®≤e ßa Ø†≠•´†   }
END { Release_panel };
{--------------------------------------------------------------------------}
FUNCTION Define_field           { B™´æ∑¢a ≠o¢o Øo´e ¢ cØ®c∫™a ≠a Øo´e≤a≤†  }
         (Root_field     :  D_list;                { Ha∑a´o ≠a cØ®c∫™a     }
          Row_pos,Col_pos:  BYTE                   { Koop§®≠a≤® ≠a Øo´e≤o  }
          ):                Field_pointer;     { ì™aßa≤e´ ™∫¨ ≠o¢o≤o Øo´e  }
  VAR Key_el    : INTEGER;                     { K´æ∑ ≠a Øo´e≤o            }
      Temp      : D_pointer;                   { ì™aßa≤e´ ™∫¨ Øo´e≤o       }
      New_field : Field_pointer;         { ì™aßa≤e´ ™∫¨ §a≠≠®≤• ≠a Øo´e≤o  }
      B         : BOOLEAN;                     { èo¨oπ≠a Øpo¨e≠´®¢a        }
BEGIN { Define_field }
  Key_el := (Row_pos SHL 8) + Col_pos;     { îop¨®pa≠e ≠a ™´æ∑ ßa ≤∫pce≠e  }
  IF D_search_node(Root_field, Key_el, Temp) THEN { A™o ®¨a Øo´e c ≤a™®¢a  }
    New_field := D_get_data(Temp)          { ™oop§®≠a≤®, ¢ße¨a a§peca ¨≥   }
  ELSE
    BEGIN   NEW (New_field);    { B™´æ∑¢a ≠o¢o Øo´e ¢ cØ®c∫™a ≠a Øo´e≤a≤a  }
      B := D_insert_node(Root_field, Key_el, POINTER(New_field), Temp);
    END;
  Define_field := New_field
END { Define_field };
{--------------------------------------------------------------------------}
PROCEDURE Copy_fields                 { áaØ®c¢a oc≠o¢≠®≤e §a≠≠® ßa Øo´e≤o  }
          (New_field      : Field_pointer;
           Row_pos,Col_pos: BYTE;         { äÆÆ∞§®≠†≤® ≠† ØÆ´•≤Æ           }
           Len            : BYTE;         { ò®∞Æ∑®≠† ≠† ØÆ´•≤Æ             }
           Kind_Curr_field: Field_type;   { í®Ø ≠† ØÆ´•≤Æ                  }
           Help_num,                 { ãÆ£®∑•±™® ≠Æ¨•∞ ≠† ØÆ´•≤Æ Ø∞® ØÆ¨Æπ }
           Init_num       : BYTE;        {ãÆ£®∑•±™® ≠Æ¨•∞ ≠† ØÆ´•≤Æ Ø∞® çè }
           Test_procedure : Field_test); { í•±≤Æ¢† ¥≥≠™∂®ø                 }
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
FUNCTION Test_field  { èpo¢epø¢a §a´® Øo´e≤o ØoØa§a ¢ £pa≠®∂®≤e ≠a Øa≠e´a  }
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
PROCEDURE In_out_float;                   { O°ø¢ø¢a ¢xo§≠o-®ßxo§≠o Øo´e ß† }
  VAR New_field: Field_pointer;           { e™cØo≠e≠∂®†´•≠ ¥op¨a≤          }
BEGIN { In_out_float }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Peßep¢®pa §a≠≠® ßa Øo´e≤o  }
        New_field:= Define_field (Root_field,Row_pos,Col_pos);
                                              { KoØ®pa o°π®≤e §a≠≠®        }
        Copy_fields (New_field, Row_pos, Col_pos, Len,
                     Inp_Float, Help_num, NP_num, Test_real);
        WITH  New_field^ DO
          BEGIN                  { KoØ®pa cØe∂®¥®∑≠®≤e §a≠≠® ßa ≤o¢a Øo´e  }
            Rl       := @R;
            Min_real := Min;    Max_real  := Max
          END
     END
END { In_out_float };
{--------------------------------------------------------------------------}
PROCEDURE In_out_fixed;  { O°ø¢ø¢a ¢xo§≠o-®ßxo§≠o Øo´e ß† §ece≤®∑e≠ ¥op¨a≤ }
  VAR  New_field: Field_pointer;
BEGIN { In_out_fixed }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Peßep¢®pa §a≠≠® ßa Øo´e≤o  }
        New_field:= Define_field (Root_field,Row_pos,Col_pos);
        Copy_fields (New_field, Row_pos, Col_pos, Len, Inp_Fixed,
                     Help_num, NP_num, Test_real);  { KoØ®pa o°π®≤e §a≠≠® }
        WITH  New_field^ DO     { KoØ®pa cØe∂®¥®∑≠®≤e §a≠≠® ßa ≤o¢a Øo´e  }
          BEGIN   Rl := @R;         Dec_pl   := Dec_p;
            Min_real := Min;        Max_real := Max
          END
      END
END { In_out_fixed };
{--------------------------------------------------------------------------}
PROCEDURE In_out_intg;           { O°ø¢ø¢a ¢xo§≠o-®ßxo§≠o Øo´e ß† ∂ø´ ≤®Ø  }
  VAR New_field: Field_pointer;
BEGIN { In_out_intg }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Peßep¢®pa §a≠≠® ßa Øo´e≤o  }
        New_field:= Define_field (Root_field,Row_pos,Col_pos);
                                      { KoØ®pa≤ ce o°π®≤e §a≠≠® ßa Øo´e≤o  }
        Copy_fields (New_field, Row_pos, Col_pos, Len,
                    Inp_intg, Help_num, NP_num, Test_intg);
        WITH  New_field^ DO
          BEGIN                  { KoØ®pa cØe∂®¥®∑≠®≤e §a≠≠® ßa ≤o¢a Øo´e  }
            Intg := @I;    Min_intg := Min;         Max_intg := Max
          END
      END
END { In_out_intg };
{--------------------------------------------------------------------------}
PROCEDURE In_out_enum;        { O°ø¢ø¢a ¢xo§≠o-®ßxo§≠o Øo´e ß† ®ß°poe≠ ≤®Ø }
  VAR New_field: Field_pointer;
BEGIN { In_out_intg }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Peßep¢®pa §a≠≠® ßa Øo´e≤o  }
        New_field:= Define_field (Root_field,Row_pos,Col_pos);
                                          { KoØ®pa o°π®≤e §a≠≠® ßa Øo´e≤o  }
        Copy_fields (New_field, Row_pos, Col_pos, Len,
                     Inp_enum, Help_num, NP_num, Test_enum);
        WITH  New_field^ DO      { KoØ®pa cØe∂®¥®∑≠®≤e §a≠≠® ßa ≤o¢a Øo´e  }
          BEGIN  P_opt := @Option;  P_enum := @Enum;   Numb_enum := N_enum;
            IF (Option < 1) OR (Option > N_enum) THEN
              Option := 1
          END
      END
END { In_out_intg };
{--------------------------------------------------------------------------}
PROCEDURE In_out_string;    { O°ø¢ø¢a ¢xo§≠o-®ßxo§≠o Øo´e ß† c®¨¢o´e≠ ≠®ß  }
  VAR  New_field: Field_pointer;
BEGIN { In_out_string }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Peßep¢®pa §a≠≠® ßa Øo´e≤o  }
        New_field := Define_field (Root_field,Row_pos,Col_pos);
                                          { KoØ®pa o°π®≤e §a≠≠® ßa Øo´e≤o  }
        Copy_fields (New_field, Row_pos, Col_pos, Len,
                     Inp_Str, Help_num, NP_num, Test_string);
        New_field^.St := @S
      END
END { In_out_string };
{--------------------------------------------------------------------------}
PROCEDURE In_out_char;      { O°ø¢ø¢a ¢xo§≠o-®ßxo§≠o Øo´e o≤ c®¨¢o´e≠ ≤®Ø  }
 VAR  New_field:  Field_pointer;
BEGIN { In_out_char }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, 1, Height, Width) THEN
      BEGIN                                   { Peßep¢®pa §a≠≠® ßa Øo´e≤o  }
        New_field := Define_field (Root_field,Row_pos,Col_pos);
                                          { KoØ®pa o°π®≤e §a≠≠® ßa Øo´e≤o  }
        Copy_fields (New_field, Row_pos, Col_pos, 1,
                     Inp_char, Help_num, NP_num, Test_char);
        WITH  New_field^ DO
          BEGIN                  { KoØ®pa cØe∂®¥®∑≠®≤e §a≠≠® ßa ≤o¢a Øo´e  }
            Ch := @C;        Inq_letters := Letters
          END
      END
END { In_out_char };
{--------------------------------------------------------------------------}
PROCEDURE Output_float;   { O°ø¢ø¢a ®ßxo§≠o Øo´e ß† e™cØo≠e≠∂®†´•≠ ¥op¨a≤  }
 VAR  New_field : Field_pointer;
BEGIN { Output_float }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Peßep¢®pa §a≠≠® ßa Øo´e≤o  }
        New_field := Define_field (Root_field,Row_pos,Col_pos);
                                          { KoØ®pa o°π®≤e §a≠≠® ßa Øo´e≤o  }
        Copy_fields (New_field,Row_pos,Col_pos,Len,Out_float,0,0,No_test);
        New_field^.Rl := @R
      END
END { Output_float };
{--------------------------------------------------------------------------}
PROCEDURE Output_fixed;        { O°ø¢ø¢a ®ßxo§≠o Øo´e ß† §ece≤®∑e≠ ¥op¨a≤  }
  VAR  New_field: Field_pointer;
BEGIN { Output_fixed }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Peßep¢®pa §a≠≠® ßa Øo´e≤o  }
        New_field:= Define_field (Root_field,Row_pos,Col_pos);
                                          { KoØ®pa o°π®≤e §a≠≠® ßa Øo´e≤o  }
        Copy_fields (New_field,Row_pos,Col_pos,Len,Out_Fixed,0,0,No_test);
        New_field^.Rl  := @R;    { KoØ®pa cØe∂®¥®∑≠®≤e §a≠≠® ßa ≤o¢a Øo´e  }
        New_field^.Dec_pl := Dec_p
      END
END { Output_fixed };
{--------------------------------------------------------------------------}
PROCEDURE Output_intg;                  { O°ø¢ø¢a ®ßxo§≠o Øo´e ß† ∂ø´ ≤®Ø  }
  VAR  New_field: Field_pointer;
BEGIN { Output_intg }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Peßep¢®pa §a≠≠® ßa Øo´e≤o  }
        New_field:= Define_field (Root_field,Row_pos,Col_pos);
                                          { KoØ®pa o°π®≤e §a≠≠® ßa Øo´e≤o  }
        Copy_fields (New_field,Row_pos,Col_pos, Len,Out_intg,0,0,No_test);
        New_field^.Intg  := @I
      END
END { Output_intg };
{--------------------------------------------------------------------------}
PROCEDURE Output_string;           { O°ø¢ø¢a ®ßxo§≠o Øo´e ß† c®¨¢o´e≠ ≠®ß  }
  VAR  New_field: Field_pointer;
BEGIN { Output_string }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Peßep¢®pa §a≠≠® ßa Øo´e≤o  }
        New_field := Define_field (Root_field,Row_pos,Col_pos);
                                          { KoØ®pa o°π®≤e §a≠≠® ßa Øo´e≤o  }
        Copy_fields (New_field,Row_pos,Col_pos,Len,Out_str,0,0,No_test);
        New_field^.St := @S
      END
END { Output_string };
{--------------------------------------------------------------------------}
PROCEDURE Output_text;                            { O°ø¢ø¢a ≤e™c≤o¢o Øo´e  }
  VAR  New_field: Field_pointer;
BEGIN { Output_text }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, Len, Height, Width) THEN
      BEGIN                                   { Peßep¢®pa §a≠≠® ßa Øo´e≤o  }
        New_field := Define_field (Root_field,Row_pos,Col_pos);
                                          { KoØ®pa o°π®≤e §a≠≠® ßa Øo´e≤o  }
        Copy_fields (New_field,Row_pos,Col_pos,Len,Out_text,0,0,No_test);
        NEW (New_field^.St); { Peßep¢®pa ce Øa¨e≤ ßa ≤e™c≤a ≠a  ≤o¢a Øo´e  }
        New_field^.St^ := S                   { KoØ®∞† ≤e™c≤† ¢ ≤aß® Øa¨e≤ }
      END
END { Output_text };
{--------------------------------------------------------------------------}
PROCEDURE Output_char;             { O°ø¢ø¢a ®ßxo§≠o Øo´e o≤ c®¨¢o´e≠ ≤®Ø  }
  VAR  New_field: Field_pointer;
BEGIN { Output_char }
  WITH Active_panel^ DO
    IF Test_field (Row_pos, Col_pos, 1, Height, Width) THEN
      BEGIN                                   { Peßep¢®pa §a≠≠® ßa Øo´e≤o  }
        New_field := Define_field (Root_field,Row_pos,Col_pos);
                                          { KoØ®pa o°π®≤e §a≠≠® ßa Øo´e≤o  }
        Copy_fields (New_field,Row_pos,Col_pos,1,Out_char, 0, 0, No_test);
        New_field^.Ch := @C
      END
END { Output_char };
{--------------------------------------------------------------------------}
PROCEDURE Set_field_color;  { áa§a¢a ∂¢ø≤ ≠a c®¨¢o´®≤e ® ¥o≠a ßa Øo´e≤a≤a  }
BEGIN { Set_field_color }
  Curr_fore_clr := Fore AND (Blink OR 7);
  Curr_back_clr := Back AND 7
END { Set_field_color };
{--------------------------------------------------------------------------}
PROCEDURE Set_error_color;   { áa§a¢a ∂¢ø≤ ≠a c®¨¢o´®≤e ® ¥o≠a Øp® £pe∏™a  }
BEGIN { Set_error_color }
  Error_fore_color := Fore AND (Blink OR 7);
  Error_back_color := Back AND 7
END { Set_error_color };
{--------------------------------------------------------------------------}
PROCEDURE Remove_field;       { O≤c≤pa≠ø¢† Øo´e c ™oop§®≠a≤® Row, Col o≤   }
  VAR Temp   : BOOLEAN;       { Øa≠e´a Numb. èa≠e´∫≤ ≤pø°¢a §a e a™≤®¢e≠   }
      T_panel: S_pointer;      Key_el : INTEGER;
BEGIN { Remove_field }                   { T∫pc® Øa≠e´ c Øoco∑e≠®ø ≠o¨ep   }
  IF S_search_node (Root_panel, Numb, T_panel) THEN
    WITH Panel_pointer (T_panel^.S_data)^ DO
      BEGIN  Key_el := (Row SHL 8) + Col;      { îop¨®pa ™´æ∑ ßa ≤∫pce≠e   }
        Temp := D_delete_node (Root_field, Key_el)  { àß≤p®¢a ≠≥¶≠o≤o Øo´e }
      END
END { Remove_field };
