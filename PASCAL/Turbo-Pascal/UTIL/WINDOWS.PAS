{--------------------------------------------------------------------------}
{$I WINDOWS.INC }                { T��o �a �o��� �a ��pa��e��e �a �po�op�� }
IMPLEMENTATION                   {-----------------------------------------}
  USES CRT, Crt_drv, L_lists;
  CONST  Max_windows        = 255;     { Ma�c��a�e� �po� �a �po�op���e     }
  TYPE                                 { T�� �a �pe��a�a:                  }
    Type_err = (No_error,              {   ���a �pe��a                     }
                Window_not_open,       {   �po�ope��� �e e o��ope�         }
                Window_number_error,   {   �pe��a � �o�epa �a �po�ope�a    }
                Parameters_error,      {   �pe��a � �apa�e�p��e            }
                Undefined_window,      {   �e�e����pa� �po�ope�            }
                Window_already_open);  {   �po�ope��� �e�e e o��ope�       }
                                       { ��c�o �a �pe��a�a:  ��e �a �������}
    Place_err = (Nowhere, Define_err, Set_err,
                 Open_err, Close_err, Release_err, Move_to_err);
    Window_pointer = ^Window_rec; { T�� �a ��a�a�e� ��� �a��� �a �po�ope�a }
    Window_rec =                        { �a��� �a ��pa��e��e �a �po�ope�a }
      RECORD Col, Row : BYTE;            { Koop���a�� �a �op��� ��� ����   }
        Height, Width : BYTE;            { B�co���a � ��p����a �a �po�ope�a}
        Fore_color,                      { ���� �a c���o���e               }
        Back_color    : BYTE;            { ���� �a �o�a                    }
        Box           : Box_type;        { B�� �a pa��a�a                  }
        X_pos,Y_pos   : BYTE;            { Koop���a�� �a �������           }
        Box_title     : Box_string;      { Ha���c ��px� pa��a�a            }
        Save_pointer  : POINTER          { ��a�a�e� ��� �po�ope�a � O�     }
      END;
  VAR                          { ��o�a��� c�a����� �a��� �a �o���a         }
    Open_list     : L_list;              { C��c�� �a o��ope���e �po�op��   }
    Close_list    : L_list;              { C��c�� �a �a��ope���e �po�op��  }
    Free_windows  : SET OF 0..Max_windows;            { C�o�o��� �po�op��  }
    Wind_error    : BYTE;         { C�xpa���a �oc�e��a�a �o��c�a�a �pe��a  }
{--------------------------------------------------------------------------}
PROCEDURE Err_Window                             { �op��pa �o�a �a �pe��a  }
          (Place: Place_err;                          { M�c�o �a �pe��a�a  }
           Err  : Type_err);                          { T�� �a �pe��a�a    }
BEGIN { Err_Window }
  Wind_error := ORD(Place) * 10 + ORD(Err)
END { Err_window };
{--------------------------------------------------------------------------}
PROCEDURE Clear_scr                    { �a����a �po�ope�a c ��e�a �a �o�a }
          (Row, Col, Height, Width, Back: BYTE);  { �apa�e�p� �a �po�ope�a }
BEGIN { Clear_scr }
  TextBackGround (Back);                           { �a�a�a ��e�a �a �o�a  }
  Change_cursor (FALSE);                           { �e�a�������pa ������� }
                  { �a����a �po�ope�a o� �e��� �ope� ��� �ec��� �o�e� ���� }
  Window (Col, Row, Col+PRED(Width DIV 3 +1), Row+PRED(Height DIV 3 +1));
  CLRSCR; DELAY (60);                           { M���� ����� - �� ������� }
  Window (Col, Row, Col+PRED(Width DIV 2+1), Row+PRED(Height DIV 2+1));
  CLRSCR; DELAY (60);
  Window (Col, Row, PRED (Col+Width), PRED (Row+Height));     CLRSCR;
  Change_cursor (TRUE)                               { A�������pa �������  }
END { Clear_scr };
{--------------------------------------------------------------------------}
PROCEDURE Set_color               { �a�a�a �e��� ���� �a c���o���e � �o�a  }
          (Fore, Back : BYTE);
BEGIN { Set_color }
  TextColor(Fore);                            { �a�a�a ��e�a �a c���o���e  }
  TextBackground(Back)                { �a�a�a ��e�a �a �o�a �a c���o���e  }
END { Set_color };
{--------------------------------------------------------------------------}
FUNCTION Get_free_window;              { Bp��a �o�ep �a c�o�o�e� �po�ope�  }
  VAR I : BYTE;
BEGIN { Get_free_window }
  FOR I := 1 TO Max_windows DO
    IF I IN Free_windows THEN
      BEGIN                                    { Ha�epe� e c�o�o�e� �o�ep  }
        Get_free_window := I; EXIT                 { ��xo� o� �po�e��pa�a  }
      END
END { Get_free_window };
{--------------------------------------------------------------------------}
FUNCTION Top : L_pointer;               { Bp��a a�peca �a �oc�e���� ���e�  }
BEGIN { Top }
  Top := L_get_last(Open_list)
END { Top };
{--------------------------------------------------------------------------}
PROCEDURE Fix_window; { �c�a�o���a �o�xo���� pa��ep� �a a������� �po�ope�  }
BEGIN { Fix_window }
  WITH Window_pointer(L_get_data(Top))^ DO
    BEGIN
      Set_Color (Fore_color, Back_color);
      IF Box = No_box THEN      { Pa��ep��e �a��c�� o� �o�a �a�� ��a pa��a }
        Window (Col, Row, PRED(Col + Width), PRED(Row + Height))
      ELSE
        Window (Succ(Col),Succ(Row),(Col + Width - 2),(Row + Height - 2))
    END
END { Fix_window };
{--------------------------------------------------------------------------}
PROCEDURE Display (P : L_pointer);         { ���e��a �po�ope� ��px� e�pa�a }
BEGIN { Display }
  WITH Window_pointer(L_get_data(P))^ DO
    Load_scr (Row, Col, Height, Width, Save_pointer, TRUE)
END { Display };
{--------------------------------------------------------------------------}
{$F+ } { �po�e��pa�a Fast_display ce �pa�c��pa �o "����� �o�e�". T� ce     }
    { �o�a�a �a�o �apa�e��p �a �po�e��pa�a L_process_until � Update_windows}
PROCEDURE Fast_display (P:L_pointer);     { ���e��a �po�ope� ��px� ���epa  }
BEGIN { Fast_display }
  WITH Window_pointer(L_get_data(P))^ DO
     Load_scr (Row, Col, Height, Width, Save_pointer, FALSE)
END { Fast_display };
{$F- }
{--------------------------------------------------------------------------}
PROCEDURE Update_windows;  { ���e��a �c���� �po�op�� c�ope� �o�pe��a�a ��  }
  VAR B : BOOLEAN;
BEGIN { Update_windows }  Change_cursor (FALSE);  { �e�a�������pa ��pcopa  }
                       { ���e��a �c���� �po�op�� o� Open_list ��px� ���epa }
    B := L_process_until(Open_list, Null_func, Fast_display);
    Move_buffer_to_screen;       { ���e��a ���epa ��px� e�pa�a             }
    Fix_window;                  { ���c�pa pa��ep��e �a a������� �po�ope�  }
    Change_cursor (TRUE)                             { A�������pa ��pcopa  }
END { Update_windows };
{--------------------------------------------------------------------------}
PROCEDURE Save_top_window (Numb:BYTE);      { C�xpa���a a������� �po�ope�  }
BEGIN { Save_top_window }         { �po�e��pa�a �po�ep��a �a�� �po�ope���  }
                    { c �o�ep Numb � a�������� �po�ope� e e��� � c��       }
                    { A�o Numb e a����e�, �po�e��pa�a �a��p��a;            }
                    { ��o Numb �e e a����e�, c�xpa���a a������� �po�ope�   }
  IF L_get_last(Open_list) <> NIL THEN { ��a �� �o�e e��� o��ope� �po�ope�?}
   IF Numb <> L_get_key(Top) THEN        { �po�ope��� Numb a����e� �� e?   }
    WITH Window_pointer(L_get_data(Top))^ DO    { A�o Numb �e e a����e�,   }
      BEGIN                                 { ��xpa���a a������� �po�ope�  }
        Save_scr (Row,Col,Height,Width,Save_pointer);
        X_Pos := WhereX;  Y_Pos := WhereY  { C�xpa���a �o������a �a �������}
      END
END { Save_top_window };
{--------------------------------------------------------------------------}
FUNCTION Set_window;                        { A�������pa o��ope� �po�ope�  }
  VAR B     : BOOLEAN;
      Found, Node : L_pointer;
BEGIN  { Set_window }
  Set_window := FALSE;
  IF Numb IN Free_windows THEN       { �pe��a - �po�ope��� �e e �e����pa�  }
    Err_window (Set_err, Undefined_window)
  ELSE
    BEGIN  Save_top_window (Numb);           { C�xpa���a a������� �po�ope� }
      IF Numb <> L_get_key(Top) THEN        { �po�ope��� Numb a����e� �� e?}
        BEGIN                          { �pe�ec��a �po�ope�a � �pa� �a �EC }
          IF L_move_node (Open_list, Open_list, Numb, Found) THEN
            BEGIN
              Display (Found);{ ���e��a a������� �po�ope� ��px� oc�a�a���e }
              Fix_window;        { ���c�pa pa��ep��e �a a������� �po�ope�  }
              Change_cursor (TRUE);                   { A�������pa ������� }
              Set_window := TRUE
            END
          ELSE
            Err_window (Set_err, Window_not_open)
        END
      ELSE                   { �po�ope��� e a����e� - �po�e��pa�a �a��p��a }
        Set_window := TRUE
    END
END { Set_window };
{--------------------------------------------------------------------------}
PROCEDURE Draw_box                             { �ep�ae pa��a �a �po�ope�  }
          (W : Window_pointer);                { ��a�a�e� ��� �po�ope�     }
  TYPE  Box_rec = RECORD
                    UL, UR, LL, LR, Horiz, Vert : CHAR
                  END;
  CONST  Boxes : ARRAY[Thin_box..Thick_box] OF Box_rec =
      ((UL : '�'; UR : '�'; LL : '�';                 { E�����e� �po�ope�  }
        LR : '�'; Horiz  : '�'; Vert : '�'),
       (UL : '�'; UR : '�'; LL : '�';                 { ��oe� �po�ope�     }
        LR : '�'; Horiz  : '�'; Vert : '�'));
  VAR Counter : ShortInt;
BEGIN  { Draw_box }
  WITH W^ DO
    BEGIN
      Window(1, 1, Max_width, Max_height);{ Pa���p��a �o �a�c��a��� pa��ep�}
      Set_Color(Fore_color, Back_color);
      GotoXY(Col, Row);
      WRITE(Boxes[Box].UL);                              { �ope� ��� ����  }
      FOR Counter := 1 TO (Width - 2) DO
        WRITE(Boxes[Box].Horiz);               { �op�a xop��o��a��a pa��a  }
      WRITE(Boxes[Box].UR);                    { �ope� �ece� ����          }
      FOR Counter := 1 TO (Height - 2) DO
        BEGIN                                  { Bep���a��� pa���          }
          GotoXY(Col, Row + Counter);
          WRITE(Boxes[Box].Vert);
          GotoXY(Pred(Col + Width), WhereY);
          WRITE(Boxes[Box].Vert)
        END;
      GotoXY(Col, Pred(Row + Height));
      WRITE(Boxes[Box].LL);                              { �o�e� ��� ����  }
      FOR Counter := 1 TO (Width - 2) DO
        WRITE(Boxes[Box].Horiz);               { �o��a xop��o��a��a pa��a  }
      WRITE(Boxes[Box].LR);                            { �o�e� �ece� ����  }
      GotoXY (Col+(Width-Length(Box_title)) DIV 2, Row);
      WRITE (Box_title)                            { Ha���c ��px� pa��a�a  }
    END { With }
END { Draw_box };
{--------------------------------------------------------------------------}
FUNCTION Define_window;          { �a�a�a oc�o����e �apa�e�p� �a �po�ope�  }
  VAR Found : L_pointer;
      New_window: Window_pointer;
BEGIN { Define_window }          Define_window := FALSE;
  IF Numb IN Free_windows THEN  { A�o �o�ep�� Numb �a �po�ope� e c�o�o�e�, }
    BEGIN    { ������a ce ��� c��c��a �a �e����pa���e �a��ope�� �po�op��   }
      NEW (New_window);    { �ae�a �a�e� �a oc�o����e pa��ep� �a �po�ope�a }
      L_insert_last (Close_list, Numb, POINTER(New_window), Found)
    END
  ELSE
    IF NOT L_search_node(Close_list,Numb,Found) THEN
      BEGIN                       { �po�ope� c �a��� �o�ep e �e�e �������  }
        Err_window(Define_err, Window_already_open);     EXIT
      END;
  WITH Window_pointer(L_get_data(Found))^ DO
    BEGIN                       { Kope���� �� ca pa��ep��e �a �po�ope�a ?  }
      IF (BType <> No_box) AND  { Oco�e� c���a� - ���e� e�pa� c pa��a      }
         (Height1 = Max_height) AND (Width1 = Max_width)  THEN
        Err_window (Define_err, Parameters_error)
      ELSE                      { Hop�a�e� c���a� �a �po�ope�              }
        IF Test_size (Row1, Col1, Height1, Width1, BType <> No_box) THEN
          BEGIN     { C�xpa���a �a����e �a �po�ope�a � oc�o��a�a c�p����pa }
            Col := Col1;           Row := Row1;
            Height := Height1;     Width := Width1;
            Fore_color := Fore;    Back_color := Back;
            Box_title := COPY (Title, 1, Width1-2);
            Save_pointer := NIL;
            X_pos := 1;            Y_pos := 1;
            Box := BType;          Define_window := TRUE;
            {�������a �o��� �po�ope� o� ��o�ec��o�o �a c�o�o����e �po�op��}
            Free_windows := Free_windows - [Numb]
          END
        ELSE                    { �pe��a - �e�ope���� pa��ep� �a �po�ope�  }
          Err_window (Define_err, Parameters_error)
    END { With }
END { Define_window };
{--------------------------------------------------------------------------}
FUNCTION Open_window;                                   { O��ap� �po�ope�  }
  VAR B : BOOLEAN;            Found, Node: L_pointer;
BEGIN { Open_window }         Open_window := FALSE;
  IF Numb IN Free_windows THEN  {  �po�ope��� c �o�ep Numb �e e �e����pa�  }
    Err_window (Open_err, Undefined_window)
  ELSE
    BEGIN
      Save_top_window (Numb);               { C�xpa���a a������� �po�ope�  }
      IF L_move_node (Close_list, Open_list, Numb, Node) THEN
        BEGIN                         { O�����a �o��� �po�ope� �a a����e�  }
          WITH Window_pointer(L_get_data(Node))^ DO
            BEGIN                 { ����c��a e�pa�a �a o��ope��� �po�ope�  }
              Clear_scr (Row, Col, Height, Width, Back_color);
              IF Box <> No_box THEN  { �ep�ae pa��a�a ��, a�o ��a �a�a�a   }
                Draw_box(Window_pointer(L_get_data(Node)));
              Fix_window;    { �c�a�o���a pa��ep��e �a a������� �po�ope�   }
              GotoXY (X_Pos,Y_Pos);
                                 { Pe�ep��pa �a�e� �a o��ope��� �po�ope�   }
              Allocate_scr (Row,Col,Height,Width,Save_pointer);
              Open_window := TRUE
            END
        END
      ELSE
        BEGIN                  { �po�ope��� c �o�ep Numb  e �e�e o��ope�   }
          IF Set_window (Numb) THEN
            Open_window := TRUE
        END
    END
END { Open_window };
{--------------------------------------------------------------------------}
PROCEDURE Clear_window;                      { ����c��a a������� �po�ope�  }
BEGIN { Clear_window }
  Fix_window;                    { ���c�pa pa��ep��e �a a������� �po�ope�  }
  ClrScr; GotoXY(1, 1)                               { ����c��a �po�ope�a  }
END { Clear_window };
{--------------------------------------------------------------------------}
FUNCTION Close_window;              { ���p��a a������� �po�ope� o� e�pa�a  }
  VAR Dummy : BYTE;     Found : L_pointer;
BEGIN { Close_window }
  IF Numb IN Free_windows THEN
    BEGIN                                         { H��a o��ope� �po�ope�  }
      Err_window(Close_err, Window_not_open);     Close_window := FALSE
    END
  ELSE
    BEGIN   Save_top_window (Numb);          { C�xpa���a a������� �po�ope� }
      IF L_Move_node (Open_list, Close_list, Numb, Found) THEN
        BEGIN { Oc�o�o��a�a �a�e��a,�ae�a �a c���p�a��e�o �a �po�ope�a Numb}
          WITH Window_pointer(L_get_data(Found))^ DO
            Release_mem (Height, Width, Save_pointer);
          Update_windows ;        { ���e��a �c���� �po�op�� e��� c�e� �p�� }
          Close_window := TRUE
        END
     ELSE
       BEGIN                                       { H��a o��ope� �po�ope� }
         Err_window(Close_err, Window_not_open);   Close_window := FALSE
       END
   END
END { Close_window };
{$F+ ----------------------------------------------------------------------}
PROCEDURE Delete_data  {Oc�o�o��a�a �a�e��a, �ae�a �a �a����e �a �po�ope�a }
          (L: L_pointer);
  VAR P: Window_pointer;
BEGIN { Delete_data}
  P := Window_pointer(L_get_data(L));          DISPOSE (P)
END { Delete_data };
{$F- ----------------------------------------------------------------------}
FUNCTION Release_window;  { ���p��a �po�ope� � oc�o�o��a�a �a�e��a �a �e�o }
  VAR Found: L_pointer;      B: BOOLEAN;
BEGIN  { Release_window }
  IF Numb IN Free_windows THEN
    BEGIN                                          { H��a o��ope� �po�ope� }
      Err_window(Release_err, Window_not_open);    Release_window := FALSE
    END
  ELSE                             { A�o �po�ope��� e o��ope�, �a��ap� ce  }
    BEGIN   B := Close_window (Numb);
      B := L_delete_node (Close_list, Numb, Delete_data);
      Free_windows := Free_windows + [Numb];       Release_window := TRUE
    END
END { Release_window };
{--------------------------------------------------------------------------}
FUNCTION Move_window_to;   { �pe�ec��a �po�ope� Numb � o�pe�e�e�a �o�����  }
  VAR Found : L_pointer;          Update, B : BOOLEAN;
BEGIN { Move_window_to }          Move_window_to := FALSE;
  IF Numb IN Free_windows THEN
    Err_window(Move_to_err, Undefined_window)
  ELSE
    BEGIN  { Ako �po�ope��� Numb �e e a����e�, c�xpa���a a������� �po�ope� }
      Save_top_window (Numb);     Update := FALSE;
      IF L_search_node (Open_list, Numb, Found) THEN
        Update := TRUE      { A�o �po�ope��� e o��ope�, c�e� �pe�ec��a�e�o }
      ELSE                  { e�pa��� �p���a �a ce o��o��                  }
        IF L_search_node (Close_list, Numb, Found) THEN
          Update := FALSE;              { T�� �e��a e �a ce o�pe�e�� Found }
      WITH Window_pointer(L_get_data(Found))^ DO
        BEGIN                    { Kope���� �� ca pa��ep��e �a �po�ope�a?  }
          IF Test_size (Row_pos, Col_pos, Height, Width, Box<>No_box) THEN
            BEGIN            { Heo�xo���o �� e �a ce �pe�ec�� �po�ope���?  }
              IF (Row <> Row_pos) OR (Col <> Col_pos) THEN
                BEGIN              { �pe�ec��a �po�ope�a � �o�a�a �o�����  }
                  Row := Row_pos;     Col := Col_pos;
                  IF Update THEN  { A�o e �eo�xo���o, o��o���a �e��� e�pa� }
                    Update_windows;
                  Move_window_to := TRUE
                END
              ELSE
                BEGIN  Move_window_to := TRUE;
                  IF Update THEN   { ���������� �� ������� �a c��o�o ��c�o }
                    B := Set_window(Numb)
                END
            END { If Test_size }
          ELSE
            Err_window (Move_to_err, Parameters_error)
        END { With }
    END
END { Move_window_to };
{--------------------------------------------------------------------------}
FUNCTION Window_error: BYTE;   { Bp��a �o� �a �oc�e��a�a �������a�a �pe��a }
BEGIN { Window_error }     Window_error := Wind_error;
  Err_window (Nowhere, No_error)           { ����c��a�e �a �pe����a �pe��a }
END { Window_error };
{--------------------------------------------------------------------------}
PROCEDURE Init_windows;                              { �����a����pa �o���a }
  VAR Found : L_pointer;           New_window: Window_pointer;
BEGIN { Init_Windows }
  Free_windows := [0..Max_windows];
  Wind_error := 0;                        { �����a����pa �o� �a �pe��a - 0 }
  L_init (Close_list); L_init (Open_list);
  IF Save_screen THEN              { C�xpa���a �e��� e�pa� �a�o �po�ope� 0 }
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