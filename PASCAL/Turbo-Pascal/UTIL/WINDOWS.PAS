{--------------------------------------------------------------------------}
{$I WINDOWS.INC }                { Tø´o ≠a ¨o§≥´ ßa ≥Øpa¢´e≠®e ≠a Øpoßop∂® }
IMPLEMENTATION                   {-----------------------------------------}
  USES CRT, Crt_drv, L_lists;
  CONST  Max_windows        = 255;     { Ma™c®¨a´e≠ °po© ≠a Øpoßop∂®≤e     }
  TYPE                                 { T®Ø ≠a £pe∏™a≤a:                  }
    Type_err = (No_error,              {   ≠ø¨a £pe∏™a                     }
                Window_not_open,       {   Øpoßope∂∫≤ ≠e e o≤¢ope≠         }
                Window_number_error,   {   £pe∏™a ¢ ≠o¨epa ≠a Øpoßope∂a    }
                Parameters_error,      {   £pe∏™a ¢ Øapa¨e≤p®≤e            }
                Undefined_window,      {   ≠e§e¥®≠®pa≠ Øpoßope∂            }
                Window_already_open);  {   Øpoßope∂∫≤ ¢e∑e e o≤¢ope≠       }
                                       { åøc≤o ≠a £pe∏™a≤a:  ®¨e ≠a ¥≥≠™∂®ø}
    Place_err = (Nowhere, Define_err, Set_err,
                 Open_err, Close_err, Release_err, Move_to_err);
    Window_pointer = ^Window_rec; { T®Ø ≠a ≥™aßa≤e´ ™∫¨ §a≠≠® ßa Øpoßope∂a }
    Window_rec =                        { Ña≠≠® ßa ≥Øpa¢´e≠®e ≠a Øpoßope∂a }
      RECORD Col, Row : BYTE;            { Koop§®≠a≤® ≠a £op≠®ø ´ø¢ ∫£∫´   }
        Height, Width : BYTE;            { B®co∑®≠a ® ∏®pÆ∑®≠a ≠a Øpoßope∂a}
        Fore_color,                      { ñ¢ø≤ ≠a c®¨¢o´®≤e               }
        Back_color    : BYTE;            { ñ¢ø≤ ≠a ¥o≠a                    }
        Box           : Box_type;        { B®§ ≠a pa¨™a≤a                  }
        X_pos,Y_pos   : BYTE;            { Koop§®≠a≤® ≠a ™≥∞±Æ∞†           }
        Box_title     : Box_string;      { Ha§Ø®c ¢∫px≥ pa¨™a≤a            }
        Save_pointer  : POINTER          { ì™aßa≤e´ ™∫¨ Øpoßope∂a ¢ Oè     }
      END;
  VAR                          { É´o°a´≠® c≤a≤®∑≠® §a≠≠® ≠a ¨o§≥´a         }
    Open_list     : L_list;              { CØ®c∫™ ≠a o≤¢ope≠®≤e Øpoßop∂®   }
    Close_list    : L_list;              { CØ®c∫™ ≠a ßa≤¢ope≠®≤e Øpoßop∂®  }
    Free_windows  : SET OF 0..Max_windows;            { C¢o°o§≠® Øpoßop∂®  }
    Wind_error    : BYTE;         { C∫xpa≠ø¢a Øoc´e§≠a≤a §oØ≥c≠a≤a £pe∏™a  }
{--------------------------------------------------------------------------}
PROCEDURE Err_Window                             { îop¨®pa ™o§a ßa £pe∏™a  }
          (Place: Place_err;                          { Møc≤o ≠a £pe∏™a≤a  }
           Err  : Type_err);                          { T®Ø ≠a £pe∏™a≤a    }
BEGIN { Err_Window }
  Wind_error := ORD(Place) * 10 + ORD(Err)
END { Err_window };
{--------------------------------------------------------------------------}
PROCEDURE Clear_scr                    { áaØ∫´¢a Øpoßope∂a c ∂¢e≤a ≠a ¥o≠a }
          (Row, Col, Height, Width, Back: BYTE);  { èapa¨e≤p® ≠a Øpoßope∂a }
BEGIN { Clear_scr }
  TextBackGround (Back);                           { áa§a¢a ∂¢e≤a ≠a ¥o≠a  }
  Change_cursor (FALSE);                           { Ñeßa™≤®¢®ß®pa ™≥∞±Æ∞† }
                  { áaØ∫´¢a Øpoßope∂a o≤ ´e¢®ø £ope≠ ™∫¨ §ec≠®ø §o´e≠ ∫£∫´ }
  Window (Col, Row, Col+PRED(Width DIV 3 +1), Row+PRED(Height DIV 3 +1));
  CLRSCR; DELAY (60);                           { M†´™† Ø†≥ß† - ß† ™∞†±Æ≤† }
  Window (Col, Row, Col+PRED(Width DIV 2+1), Row+PRED(Height DIV 2+1));
  CLRSCR; DELAY (60);
  Window (Col, Row, PRED (Col+Width), PRED (Row+Height));     CLRSCR;
  Change_cursor (TRUE)                               { A™≤®¢®ß®pa ™≥∞±Æ∞†  }
END { Clear_scr };
{--------------------------------------------------------------------------}
PROCEDURE Set_color               { áa§a¢a ≤e™≥π ∂¢ø≤ ≠a c®¨¢o´®≤e ® ¥o≠a  }
          (Fore, Back : BYTE);
BEGIN { Set_color }
  TextColor(Fore);                            { áa§a¢a ∂¢e≤a ≠a c®¨¢o´®≤e  }
  TextBackground(Back)                { áa§a¢a ∂¢e≤a ≠a ¥o≠a ≠a c®¨¢o´®≤e  }
END { Set_color };
{--------------------------------------------------------------------------}
FUNCTION Get_free_window;              { Bp∫πa ≠o¨ep ≠a c¢o°o§e≠ Øpoßope∂  }
  VAR I : BYTE;
BEGIN { Get_free_window }
  FOR I := 1 TO Max_windows DO
    IF I IN Free_windows THEN
      BEGIN                                    { Ha¨epe≠ e c¢o°o§e≠ ≠o¨ep  }
        Get_free_window := I; EXIT                 { àßxo§ o≤ Øpo∂e§≥pa≤a  }
      END
END { Get_free_window };
{--------------------------------------------------------------------------}
FUNCTION Top : L_pointer;               { Bp∫πa a§peca ≠a Øoc´e§≠®ø ¢∫ße´  }
BEGIN { Top }
  Top := L_get_last(Open_list)
END { Top };
{--------------------------------------------------------------------------}
PROCEDURE Fix_window; { ìc≤a≠o¢ø¢a Øo§xo§øπ® paß¨ep® ßa a™≤®¢≠®ø Øpoßope∂  }
BEGIN { Fix_window }
  WITH Window_pointer(L_get_data(Top))^ DO
    BEGIN
      Set_Color (Fore_color, Back_color);
      IF Box = No_box THEN      { Paß¨ep®≤e ßa¢®cø≤ o≤ ≤o¢a §a´® ®¨a pa¨™a }
        Window (Col, Row, PRED(Col + Width), PRED(Row + Height))
      ELSE
        Window (Succ(Col),Succ(Row),(Col + Width - 2),(Row + Height - 2))
    END
END { Fix_window };
{--------------------------------------------------------------------------}
PROCEDURE Display (P : L_pointer);         { àß¢e¶§a Øpoßope∂ ¢∫px≥ e™pa≠a }
BEGIN { Display }
  WITH Window_pointer(L_get_data(P))^ DO
    Load_scr (Row, Col, Height, Width, Save_pointer, TRUE)
END { Display };
{--------------------------------------------------------------------------}
{$F+ } { èpo∂e§≥pa≤a Fast_display ce ≤pa≠c´®pa Øo "§∫´∫£ ¨o§e´". Tø ce     }
    { Øo§a¢a ™a≤o Øapa¨e≤∫p ≠a Øpo∂e§≥pa≤a L_process_until ¢ Update_windows}
PROCEDURE Fast_display (P:L_pointer);     { àß¢e¶§a Øpoßope∂ ¢∫px≥ °≥¥epa  }
BEGIN { Fast_display }
  WITH Window_pointer(L_get_data(P))^ DO
     Load_scr (Row, Col, Height, Width, Save_pointer, FALSE)
END { Fast_display };
{$F- }
{--------------------------------------------------------------------------}
PROCEDURE Update_windows;  { àß¢e¶§a ¢c®∑™® Øpoßop∂® cØope§ Øo§pe§°a≤a ®¨  }
  VAR B : BOOLEAN;
BEGIN { Update_windows }  Change_cursor (FALSE);  { Ñeßa™≤®¢®ß®pa ™≥pcopa  }
                       { àß¢e¶§a ¢c®∑™® Øpoßop∂® o≤ Open_list ¢∫px≥ °≥¥epa }
    B := L_process_until(Open_list, Null_func, Fast_display);
    Move_buffer_to_screen;       { àß¢e¶§a °≥¥epa ¢∫px≥ e™pa≠a             }
    Fix_window;                  { î®™c®pa paß¨ep®≤e ≠a a™≤®¢≠®ø Øpoßope∂  }
    Change_cursor (TRUE)                             { A™≤®¢®ß®pa ™≥pcopa  }
END { Update_windows };
{--------------------------------------------------------------------------}
PROCEDURE Save_top_window (Numb:BYTE);      { C∫xpa≠ø¢a a™≤®¢≠®ø Øpoßope∂  }
BEGIN { Save_top_window }         { èpo∂e§≥pa≤a Øpo¢epø¢a §a´® Øpoßope∂∫≤  }
                    { c ≠o¨ep Numb ® a™≤®¢≠®ø≤ Øpoßope∂ e e§®≠ ® c∫π       }
                    { A™o Numb e a™≤®¢e≠, Øpo∂e§≥pa≤a ßa¢∫p∏¢a;            }
                    { †™o Numb ≠e e a™≤®¢e≠, c∫xpa≠ø¢a a™≤®¢≠®ø Øpoßope∂   }
  IF L_get_last(Open_list) <> NIL THEN { à¨a ´® Øo≠e e§®≠ o≤¢ope≠ Øpoßope∂?}
   IF Numb <> L_get_key(Top) THEN        { èpoßope∂∫≤ Numb a™≤®¢e≠ ´® e?   }
    WITH Window_pointer(L_get_data(Top))^ DO    { A™o Numb ≠e e a™≤®¢e≠,   }
      BEGIN                                 { ±∫xpa≠ø¢a a™≤®¢≠®ø Øpoßope∂  }
        Save_scr (Row,Col,Height,Width,Save_pointer);
        X_Pos := WhereX;  Y_Pos := WhereY  { C∫xpa≠ø¢a Øoß®∂®ø≤a ≠a ™≥∞±Æ∞†}
      END
END { Save_top_window };
{--------------------------------------------------------------------------}
FUNCTION Set_window;                        { A™≤®¢®ß®pa o≤¢ope≠ Øpoßope∂  }
  VAR B     : BOOLEAN;
      Found, Node : L_pointer;
BEGIN  { Set_window }
  Set_window := FALSE;
  IF Numb IN Free_windows THEN       { Épe∏™a - Øpoßope∂∫≤ ≠e e §e¥®≠®pa≠  }
    Err_window (Set_err, Undefined_window)
  ELSE
    BEGIN  Save_top_window (Numb);           { C∫xpa≠ø¢a a™≤®¢≠®ø Øpoßope∂ }
      IF Numb <> L_get_key(Top) THEN        { èpoßope∂∫≤ Numb a™≤®¢e≠ ´® e?}
        BEGIN                          { èpe¨ec≤¢a Øpoßope∂a ¢ ™paø ≠a ãEC }
          IF L_move_node (Open_list, Open_list, Numb, Found) THEN
            BEGIN
              Display (Found);{ àß¢e¶§a a™≤®¢≠®ø Øpoßope∂ ¢∫px≥ oc≤a≠a´®≤e }
              Fix_window;        { î®™c®pa paß¨ep®≤e ≠a a™≤®¢≠®ø Øpoßope∂  }
              Change_cursor (TRUE);                   { A™≤®¢®ß®pa ™≥∞±Æ∞† }
              Set_window := TRUE
            END
          ELSE
            Err_window (Set_err, Window_not_open)
        END
      ELSE                   { èpoßope∂∫≤ e a™≤®¢e≠ - Øpo∂e§≥pa≤a ßa¢∫p∏¢a }
        Set_window := TRUE
    END
END { Set_window };
{--------------------------------------------------------------------------}
PROCEDURE Draw_box                             { óep≤ae pa¨™a ≠a Øpoßope∂  }
          (W : Window_pointer);                { ì™aßa≤e´ ™∫¨ Øpoßope∂     }
  TYPE  Box_rec = RECORD
                    UL, UR, LL, LR, Horiz, Vert : CHAR
                  END;
  CONST  Boxes : ARRAY[Thin_box..Thick_box] OF Box_rec =
      ((UL : '⁄'; UR : 'œ'; LL : '¿';                 { E§®≠®∑e≠ Øpoßope∂  }
        LR : 'Ÿ'; Horiz  : 'ƒ'; Vert : '”'),
       (UL : '…'; UR : '◊'; LL : '»';                 { Ñ¢oe≠ Øpoßope∂     }
        LR : 'ÿ'; Horiz  : 'Õ'; Vert : '«'));
  VAR Counter : ShortInt;
BEGIN  { Draw_box }
  WITH W^ DO
    BEGIN
      Window(1, 1, Max_width, Max_height);{ Paß∏®pø¢a §o ¨a™c®¨a´≠® paß¨ep®}
      Set_Color(Fore_color, Back_color);
      GotoXY(Col, Row);
      WRITE(Boxes[Box].UL);                              { Éope≠ ´ø¢ ∫£∫´  }
      FOR Counter := 1 TO (Width - 2) DO
        WRITE(Boxes[Box].Horiz);               { Éop≠a xop®ßo≠≤a´≠a pa¨™a  }
      WRITE(Boxes[Box].UR);                    { Éope≠ §ece≠ ∫£∫´          }
      FOR Counter := 1 TO (Height - 2) DO
        BEGIN                                  { Bep≤®™a´≠® pa¨™®          }
          GotoXY(Col, Row + Counter);
          WRITE(Boxes[Box].Vert);
          GotoXY(Pred(Col + Width), WhereY);
          WRITE(Boxes[Box].Vert)
        END;
      GotoXY(Col, Pred(Row + Height));
      WRITE(Boxes[Box].LL);                              { Ño´e≠ ´ø¢ ∫£∫´  }
      FOR Counter := 1 TO (Width - 2) DO
        WRITE(Boxes[Box].Horiz);               { Ño´≠a xop®ßo≠≤a´≠a pa¨™a  }
      WRITE(Boxes[Box].LR);                            { Ño´e≠ §ece≠ ∫£∫´  }
      GotoXY (Col+(Width-Length(Box_title)) DIV 2, Row);
      WRITE (Box_title)                            { Ha§Ø®c ¢∫px≥ pa¨™a≤a  }
    END { With }
END { Draw_box };
{--------------------------------------------------------------------------}
FUNCTION Define_window;          { áa§a¢a oc≠o¢≠®≤e Øapa¨e≤p® ≠a Øpoßope∂  }
  VAR Found : L_pointer;
      New_window: Window_pointer;
BEGIN { Define_window }          Define_window := FALSE;
  IF Numb IN Free_windows THEN  { A™o ≠o¨ep∫≤ Numb ≠a Øpoßope∂ e c¢o°o§e≠, }
    BEGIN    { ¢™´æ∑¢a ce ™∫¨ cØ®c∫™a ≠a §e¥®≠®pa≠®≤e ßa≤¢ope≠® Øpoßop∂®   }
      NEW (New_window);    { áae¨a Øa¨e≤ ßa oc≠o¢≠®≤e paß¨ep® ≠a Øpoßope∂a }
      L_insert_last (Close_list, Numb, POINTER(New_window), Found)
    END
  ELSE
    IF NOT L_search_node(Close_list,Numb,Found) THEN
      BEGIN                       { èpoßope∂ c ≤a™∫¢ ≠o¨ep e ¢e∑e Æ≤¢Æ∞•≠  }
        Err_window(Define_err, Window_already_open);     EXIT
      END;
  WITH Window_pointer(L_get_data(Found))^ DO
    BEGIN                       { Kope™≤≠® ´® ca paß¨ep®≤e ≠a Øpoßope∂a ?  }
      IF (BType <> No_box) AND  { Oco°e≠ c´≥∑a© - Ø∫´e≠ e™pa≠ c pa¨™a      }
         (Height1 = Max_height) AND (Width1 = Max_width)  THEN
        Err_window (Define_err, Parameters_error)
      ELSE                      { Hop¨a´e≠ c´≥∑a© ≠a Øpoßope∂              }
        IF Test_size (Row1, Col1, Height1, Width1, BType <> No_box) THEN
          BEGIN     { C∫xpa≠ø¢a §a≠≠®≤e ßa Øpoßope∂a ¢ oc≠o¢≠a≤a c≤p≥™≤≥pa }
            Col := Col1;           Row := Row1;
            Height := Height1;     Width := Width1;
            Fore_color := Fore;    Back_color := Back;
            Box_title := COPY (Title, 1, Width1-2);
            Save_pointer := NIL;
            X_pos := 1;            Y_pos := 1;
            Box := BType;          Define_window := TRUE;
            {àß™´æ∑¢a ≠o¢®ø Øpoßope∂ o≤ ¨≠o¶ec≤¢o≤o ≠a c¢o°o§≠®≤e Øpoßop∂®}
            Free_windows := Free_windows - [Numb]
          END
        ELSE                    { Épe∏™a - ≠e™ope™≤≠® paß¨ep® ≠a Øpoßope∂  }
          Err_window (Define_err, Parameters_error)
    END { With }
END { Define_window };
{--------------------------------------------------------------------------}
FUNCTION Open_window;                                   { O≤¢apø Øpoßope∂  }
  VAR B : BOOLEAN;            Found, Node: L_pointer;
BEGIN { Open_window }         Open_window := FALSE;
  IF Numb IN Free_windows THEN  {  èpoßope∂∫≤ c ≠o¨ep Numb ≠e e §e¥®≠®pa≠  }
    Err_window (Open_err, Undefined_window)
  ELSE
    BEGIN
      Save_top_window (Numb);               { C∫xpa≠ø¢a a™≤®¢≠®ø Øpoßope∂  }
      IF L_move_node (Close_list, Open_list, Numb, Node) THEN
        BEGIN                         { O°ø¢ø¢a ≠o¢®ø Øpoßope∂ ßa a™≤®¢e≠  }
          WITH Window_pointer(L_get_data(Node))^ DO
            BEGIN                 { àß∑®c≤¢a e™pa≠a ≠a o≤¢ope≠®ø Øpoßope∂  }
              Clear_scr (Row, Col, Height, Width, Back_color);
              IF Box <> No_box THEN  { óep≤ae pa¨™a≤a ¨≥, a™o ®¨a ≤a™a¢a   }
                Draw_box(Window_pointer(L_get_data(Node)));
              Fix_window;    { ìc≤a≠o¢ø¢a paß¨ep®≤e ≠a a™≤®¢≠®ø Øpoßope∂   }
              GotoXY (X_Pos,Y_Pos);
                                 { Peßep¢®pa Øa¨e≤ ßa o≤¢ope≠®ø Øpoßope∂   }
              Allocate_scr (Row,Col,Height,Width,Save_pointer);
              Open_window := TRUE
            END
        END
      ELSE
        BEGIN                  { èpoßope∂∫≤ c ≠o¨ep Numb  e ¢e∑e o≤¢ope≠   }
          IF Set_window (Numb) THEN
            Open_window := TRUE
        END
    END
END { Open_window };
{--------------------------------------------------------------------------}
PROCEDURE Clear_window;                      { àß∑®c≤¢a a™≤®¢≠®ø Øpoßope∂  }
BEGIN { Clear_window }
  Fix_window;                    { î®™c®pa paß¨ep®≤e ≠a a™≤®¢≠®ø Øpoßope∂  }
  ClrScr; GotoXY(1, 1)                               { àß∑®c≤¢a Øpoßope∂a  }
END { Clear_window };
{--------------------------------------------------------------------------}
FUNCTION Close_window;              { àß≤p®¢a a™≤®¢≠®ø Øpoßope∂ o≤ e™pa≠a  }
  VAR Dummy : BYTE;     Found : L_pointer;
BEGIN { Close_window }
  IF Numb IN Free_windows THEN
    BEGIN                                         { Hø¨a o≤¢ope≠ Øpoßope∂  }
      Err_window(Close_err, Window_not_open);     Close_window := FALSE
    END
  ELSE
    BEGIN   Save_top_window (Numb);          { C∫xpa≠ø¢a a™≤®¢≠®ø Øpoßope∂ }
      IF L_Move_node (Open_list, Close_list, Numb, Found) THEN
        BEGIN { Oc¢o°o¶§a¢a Øa¨e≤≤a,ßae≤a ßa c∫§∫p¶a≠®e≤o ≠a Øpoßope∂a Numb}
          WITH Window_pointer(L_get_data(Found))^ DO
            Release_mem (Height, Width, Save_pointer);
          Update_windows ;        { àß¢e¶§a ¢c®∑™® Øpoßop∂® e§®≠ c´e§ §p≥£ }
          Close_window := TRUE
        END
     ELSE
       BEGIN                                       { Hø¨a o≤¢ope≠ Øpoßope∂ }
         Err_window(Close_err, Window_not_open);   Close_window := FALSE
       END
   END
END { Close_window };
{$F+ ----------------------------------------------------------------------}
PROCEDURE Delete_data  {Oc¢o°o¶§a¢a Øa¨e≤≤a, ßae≤a ßa §a≠≠®≤e ≠a Øpoßope∂a }
          (L: L_pointer);
  VAR P: Window_pointer;
BEGIN { Delete_data}
  P := Window_pointer(L_get_data(L));          DISPOSE (P)
END { Delete_data };
{$F- ----------------------------------------------------------------------}
FUNCTION Release_window;  { àß≤p®¢a Øpoßope∂ ® oc¢o°o¶§a¢a Øa¨e≤≤a ßa ≠e£o }
  VAR Found: L_pointer;      B: BOOLEAN;
BEGIN  { Release_window }
  IF Numb IN Free_windows THEN
    BEGIN                                          { Hø¨a o≤¢ope≠ Øpoßope∂ }
      Err_window(Release_err, Window_not_open);    Release_window := FALSE
    END
  ELSE                             { A™o Øpoßope∂∫≤ e o≤¢ope≠, ßa≤¢apø ce  }
    BEGIN   B := Close_window (Numb);
      B := L_delete_node (Close_list, Numb, Delete_data);
      Free_windows := Free_windows + [Numb];       Release_window := TRUE
    END
END { Release_window };
{--------------------------------------------------------------------------}
FUNCTION Move_window_to;   { èpe¨ec≤¢a Øpoßope∂ Numb ¢ oØpe§e´e≠a Øoß®∂®ø  }
  VAR Found : L_pointer;          Update, B : BOOLEAN;
BEGIN { Move_window_to }          Move_window_to := FALSE;
  IF Numb IN Free_windows THEN
    Err_window(Move_to_err, Undefined_window)
  ELSE
    BEGIN  { Ako Øpoßope∂∫≤ Numb ≠e e a™≤®¢e≠, c∫xpa≠ø¢a a™≤®¢≠®ø Øpoßope∂ }
      Save_top_window (Numb);     Update := FALSE;
      IF L_search_node (Open_list, Numb, Found) THEN
        Update := TRUE      { A™o Øpoßope∂∫≤ e o≤¢ope≠, c´e§ Øpe¨ec≤¢a≠e≤o }
      ELSE                  { e™pa≠∫≤ ≤pø°¢a §a ce o°≠o¢®                  }
        IF L_search_node (Close_list, Numb, Found) THEN
          Update := FALSE;              { T≥™ ∂e´≤a e §a ce oØpe§e´® Found }
      WITH Window_pointer(L_get_data(Found))^ DO
        BEGIN                    { Kope™≤≠® ´® ca paß¨ep®≤e ≠a Øpoßope∂a?  }
          IF Test_size (Row_pos, Col_pos, Height, Width, Box<>No_box) THEN
            BEGIN            { Heo°xo§®¨o ´® e §a ce Øpe¨ec≤® Øpoßope∂∫≤?  }
              IF (Row <> Row_pos) OR (Col <> Col_pos) THEN
                BEGIN              { èpe¨ec≤¢a Øpoßope∂a ¢ ≠o¢a≤a Øoß®∂®ø  }
                  Row := Row_pos;     Col := Col_pos;
                  IF Update THEN  { A™o e ≠eo°xo§®¨o, o°≠o¢ø¢a ∂e´®ø e™pa≠ }
                    Update_windows;
                  Move_window_to := TRUE
                END
              ELSE
                BEGIN  Move_window_to := TRUE;
                  IF Update THEN   { è∞ÆßÆ∞•∂∫≤ ±• ®ß¢•¶§† ≠a c∫πo≤o ¨øc≤o }
                    B := Set_window(Numb)
                END
            END { If Test_size }
          ELSE
            Err_window (Move_to_err, Parameters_error)
        END { With }
    END
END { Move_window_to };
{--------------------------------------------------------------------------}
FUNCTION Window_error: BYTE;   { Bp∫πa ™o§ ≠a Øoc´e§≠a≤a ¢∫ß≠®™≠a´a £pe∏™a }
BEGIN { Window_error }     Window_error := Wind_error;
  Err_window (Nowhere, No_error)           { àß∑®c≤¢a≠e ≠a Øpe§®∏≠a £pe∏™a }
END { Window_error };
{--------------------------------------------------------------------------}
PROCEDURE Init_windows;                              { à≠®∂®a´®ß®pa ¨o§≥´a }
  VAR Found : L_pointer;           New_window: Window_pointer;
BEGIN { Init_Windows }
  Free_windows := [0..Max_windows];
  Wind_error := 0;                        { à≠®∂®a´®ß®pa ™o§ ≠a £pe∏™a - 0 }
  L_init (Close_list); L_init (Open_list);
  IF Save_screen THEN              { C∫xpa≠ø¢a ∂e´®ø e™pa≠ ™a≤o Øpoßope∂ 0 }
    BEGIN Free_windows := Free_windows -[0];
      NEW (New_window);
      L_insert_last (Open_list, 0, New_window, Found);
      WITH Window_pointer (L_get_data(Found))^ DO
        BEGIN Row := 1;             Col := 1;
          Height  := Max_height;    Width := Max_width;
          Fore_color := White;      Back_color := Blue;
          Box := No_box;            Box_title := '';
          X_pos := 1;               Y_pos := 1;
          Allocate_scr (Row, Col, Height, Width, Save_pointer)
        END
    END
END { Init_Windows };
{--------------------------------------------------------------------------}
BEGIN  { Windows }
  Init_windows (TRUE)
END { Windows }.
{--------------------------------------------------------------------------}
