{--------------------------------------------------------------------------}
{$I Menus.inc}                    { T��o �a �o��� �a ��pa��e��e �a �e���a  }
IMPLEMENTATION                    {----------------------------------------}
  USES Crt, Crt_drv, Windows, Strings, S_lists, Keyboard;
  TYPE                       { C�c�o���� �a �e���o: (�a��ope�o, ���ope�o)  }
    Status       = (Closed, Opened);
    Menu_pointer = ^Menu_data;    { T�� �a ��a�a�e� ��� �a����e �a �e���o  }
    Items_data_type               { T�� �a �e�c� �a a��ep�a�����e          }
                           = ARRAY [0..1] OF Menu_strings;
    Menu_data    =                                      { �a��� �a �e���o  }
      RECORD
        Back_clr, Fore_clr : BYTE;    { ���� �a c���o���e � �o�a           }
        Back_alt, Fore_alt : BYTE;    { ��e�o�e �a �oco�e�a�a a��ep�a���a  }
        Start_item,                   { Ho�ep �a �o�e�o � �op��� ��� ����  }
        Curr_item          : BYTE;    { Ho�ep �a �oco�e�a�a a��ep�a���a    }
        Items_data         : ^Items_data_type; {��a�a�e� ��� a��ep�a�����e }
        Items_number       : BYTE;    { �po� �a a��ep�a�����e              }
        Max_item_width     : BYTE;    { ������� �a e��a a��ep�a���a        }
        Max_colmns         : BYTE;    { �po� �a a��ep�a�����e � e��� pe�   }
        Max_rows           : BYTE;    { �po� �a pe�o�e�e                   }
        Max_disp_items     : BYTE;    { Ma�c������ �po� �a e��o�pe�e��o    }
                                      { ���e�e���e a��ep�a����             }
        State              : Status;  { C�c�o���e �a �e���o                }
        Window_numb        : BYTE;    { Ho�ep �a �po�ope�a                 }
        Key_letters        : STRING;  { �a��� �a ���op �o ��p�� c���o�     }
        Users_help         : F1_menu_procedure;  { �po�e��pa �a �o�o�(F1)  }
      END;
  VAR Root          : S_list;                { Kope� �a c��c��a o� �e���a  }
{--------------------------------------------------------------------------}
FUNCTION Min_byte                         { O�pe�e�� �����a��a�a c�o��oc�  }
         (A,B:BYTE) :BYTE;
  BEGIN
    IF A <= B THEN  Min_byte := A
    ELSE Min_byte := B
  END;
{--------------------------------------------------------------------------}
FUNCTION Define_Menu;                                      { O�����a �e��  }
  VAR  P    : S_pointer;  New_menu : Menu_pointer;
       Temp : BYTE;       Err      : BOOLEAN;   { C�o�a�a�e��� �po�e�����  }
BEGIN { Define_menu }    Err := TRUE;
  IF S_Insert_node (Root, Numb, P) THEN
    BEGIN                        { B����a �o�o �e�� � c��c��a �a �e���a�a  }
      Temp := Get_free_window;   { O�pe�e�� �o�ep �a c�o�o�e� �po�ope�     }
      IF Define_window (Temp, 1, 1, Rows+2, Columns*Items_width+2,
             Box_fore_color, Box_back_color, Thin_box, Title) THEN
        BEGIN                      { Pe�ep��pa �a�e� �a �a��� �a �e���o    }
          NEW (New_menu);         P^.S_data := New_menu;
          New_menu^.Window_numb := Temp;
          Getmem(New_menu^.Items_data, (Max_width+1)*(Items_numb+1));
          Err := FALSE
        END
    END
  ELSE
    BEGIN  New_menu := P^.S_data;     { Me�� c �o�� �o�ep �e�e c��ec����a  }
      WITH New_menu^ DO               { Oc�o�o��a�a c�apa�a �a�e�, �ae�a   }
        BEGIN                         { o� �e�c�o�e�e �a a��ep�a�����e     }
          Freemem(Items_data, (Max_width+1)*(Items_number+1));
                        { �ae�a �o�a �a�e� �a �e�c�o�e�e �a a��ep�a�����e  }
          Getmem(Items_data, (Max_width+1)*(Items_numb+1))
        END;
      Err := FALSE
    END;
  IF NOT Err THEN
    WITH New_menu^ DO
      BEGIN                                            { O�����a �po�ope�  }
        IF Define_window (Temp, 1, 1, Rows+2, Columns*Items_width+2,
           Box_fore_color, Box_back_color, Thin_box, Title)THEN
          BEGIN            { �a��c�a �a����e �a �e���o � c�p����pa�a �a��� }
            Back_clr := Back_color;       Fore_clr  := Fore_color;
            Back_alt := Altr_back_color;  Fore_alt  := Altr_fore_color;
            Start_item := 1;              Curr_item := 1;
            Items_number := Items_numb;   Max_item_width := Items_width;
            Max_rows := Rows;             Max_colmns := Columns;
            Max_disp_items := Max_rows * Max_colmns;
            State := Closed;              Key_letters := '';
            Items_data^[0] :=  Adj_right_string(' ',Max_item_width);
            Users_help := Help_proc;
            FOR Temp := 1 TO Items_number DO
              BEGIN
                Key_letters := Key_letters + UpCase(Items[Temp][1]);
                {$R- } { �o���c�a �po�ep�a�a �a �ope���oc� �a ���e�ca Temp }
                Items_data^[Temp] :=
                      Adj_right_string(Items[Temp],Max_item_width)
                {$R+ }
              END
          END
        ELSE
          Err := TRUE                 { �pe��a �p� o��ap��e�o �a �po�ope�  }
      END;
  Define_menu :=  NOT Err
END { Define_menu };
{--------------------------------------------------------------------------}
PROCEDURE Close_menu;         { �a��ap� �e���o (���p��a �e���o o� e�pa�a)  }
  VAR P:     S_pointer;
      Bool : BOOLEAN;
BEGIN { Close_menu }
  IF S_Search_node(Root, Numb, P) THEN
    BEGIN                              { �e�� c �o�ep Numb e �a�epe�o      }
      WITH Menu_pointer(P^.S_data)^ DO
        IF State = Opened THEN          {��� ������ � ��������, ������� �� }
          BEGIN  State := Closed;
            Bool := Close_window (Window_numb)
          END
    END
END { Close_menu };
{$F+ ----------------------------------------------------------------------}
PROCEDURE Del_menu_data { ���p��a �a����e �a �e���o o� o�epa����a�a �a�e�  }
          (P: POINTER);
  VAR S: Menu_pointer;
BEGIN { Del_menu_data }     S := P;
  FreeMem(S^.Items_data, (Max_width+1)*(S^.Items_number+1));
  DISPOSE (S);
END { Del_menu_data };
{$F- ----------------------------------------------------------------------}
PROCEDURE Release_menu; { �a��ap� �e���o � o�cpa���a �a����e �a �e�o o� O� }
  VAR B : BOOLEAN;
BEGIN { Release_menu }     Close_menu (Numb);
  B := S_delete_node (Root, Numb)
END { Release_menu };
{--------------------------------------------------------------------------}
FUNCTION Open_menu;                             { O��ap� �e���o �a ���op }
  VAR  Active_menu : Menu_pointer;
       P           : S_pointer;
  {------------------------------------------------------------------------}
  PROCEDURE Print_item               { ���e��a �e�c�a �� e��a a��ep�a���a  }
            (Item_pos   : BYTE;                { Ho�ep �a a��ep�a���a�a    }
             Item       : Menu_strings;        { Te�c� �a a��ep�a���a�a    }
             B_clr,F_clr: BYTE);               { ���� �a �o�a � c���o���e  }
    VAR  Row, Col : BYTE;
  BEGIN { Print_item }
    WITH Active_menu^ DO
      BEGIN  Row := (Item_pos - Start_item + Max_colmns) DIV Max_colmns;
        Col := SUCC ((Item_pos - Start_item) MOD Max_colmns);
        Write_string (Item, B_clr, F_clr, Row, Succ(Pred(Col)*Max_item_width))
      END
  END { Print_item };
  {------------------------------------------------------------------------}
  PROCEDURE Print;            { ���e��a �e�c�a �a a��ep�a�����e �a �e���o  }
    VAR  It, Last, Count : BYTE;
  BEGIN { Print }
    WITH Active_menu^ DO
      BEGIN                   { O�pe�e�� �o�epa �a �oc�e��a�a a��ep�a���a  }
        IF Items_number - Start_item + 1 > Max_disp_items THEN
          Last := PRED(Start_item + Max_Disp_items)
        ELSE
          Last := Items_number;
        Count := 0;                     { ���e��a �e�c�a �a a��ep�a�����e  }
        FOR It := Start_item TO Last DO
          BEGIN Count := Count + 1;
            {$R- } Print_item (It,Items_data^[It],Back_clr,Fore_clr); {$R+ }
          END;                                        { ���e��a ���ep�a��  }
        FOR Count := Last+1 TO PRED(Start_Item)+Max_disp_items DO
          Print_item (Count, Items_data^[0], Back_clr, Fore_clr);
        {$R- }                 { ���e��a �e�c�a �a �oco�e�a�a a��ep�a���a  }
        Print_item (Curr_item,Items_data^[Curr_item], Back_alt, Fore_alt);
        {$R+ }  Change_cursor(FALSE)       { O�c�pa���a ��pcopa o� e�pa�a  }
      END
  END { Print };
  {------------------------------------------------------------------------}
  FUNCTION Process : BYTE;           { O�pa�o��a �o�a����e �a �o�pe���e��  }
    VAR New_pos, New_start_pos : BYTE;     Ch : CHAR;
    {----------------------------------------------------------------------}
    PROCEDURE Set_new_choice;              { C�e�� �oco�e�a�a a��ep�a���a  }
    BEGIN { Set_new_choice }
      WITH Active_menu^ DO
        IF New_Start_pos <> Start_item THEN
          BEGIN  Curr_item := New_pos;
            Start_item := New_start_pos;      Print
          END
        ELSE
          BEGIN  {$R- }
            Print_item(Curr_item,Items_data^[Curr_item],Back_clr,Fore_clr);
            Curr_item := New_pos;      Start_item := New_start_pos;
            Print_item(Curr_item,Items_data^[Curr_item],Back_alt,Fore_alt)
            {$R+ }
          END
    END { Set_new_choice };
    {----------------------------------------------------------------------}
    PROCEDURE Process_up_key;             { O�pa�o��a �p� ����e��e �a�ope  }
    BEGIN { Process_up_key }
      WITH Active_menu^ DO
        IF Curr_item - Start_item >= Max_colmns THEN
          New_pos := Curr_item - Max_colmns
        ELSE
          IF (Start_item DIV Max_colmns) > 0 THEN
            BEGIN   New_pos := Curr_item - Max_colmns;
              New_Start_pos := Start_item - Max_colmns
            END
    END { Process_up_key };
    {----------------------------------------------------------------------}
    PROCEDURE Process_down_key;           { O�pa�o��a �p� ����e��e �a�o��  }
    BEGIN { Process_down_key }
      WITH Active_menu^ DO
        IF Curr_item +Max_colmns <= Items_number THEN
          IF (Curr_item + Max_colmns - Start_item) < Max_disp_items THEN
            New_pos := Curr_item + Max_colmns
          ELSE
            BEGIN   New_pos := Curr_item + Max_colmns;
              New_Start_pos := Start_item + Max_colmns
            END
    END {Process_down_key};
    {----------------------------------------------------------------------}
    PROCEDURE Process_left_key;           { O�pa�o��a �p� ����e��e �a���o  }
    BEGIN { Process_left_key }
      WITH Active_menu^ DO
        IF Curr_Item > Start_item THEN
          New_pos := Curr_item - 1
        ELSE
          IF Start_item > 1 THEN
            BEGIN   New_pos := Curr_item - 1;
              New_start_pos := Start_item - Max_colmns
            END
    END { Process_left_key };
    {----------------------------------------------------------------------}
    PROCEDURE Process_right_key;          { O�pa�o��a �p� ����e��e �a��c�o }
    BEGIN { Process_right_key }
      WITH Active_menu^ DO
        BEGIN
          IF Curr_Item < Items_number THEN
            New_pos := Curr_item + 1;
          IF Pred(Start_item+Max_disp_items) = Curr_item THEN
            New_start_pos := Start_item + Max_colmns
        END
    END { Process_right_key };
    {----------------------------------------------------------------------}
    PROCEDURE Process_F1_key      { O�pa�o��a �p� ��������� �� ��a��� F1   }
              (Help_point: F1_menu_procedure;
               Number : BYTE);
      VAR Save_menu_pointer: Menu_pointer;
          B : BOOLEAN;
    BEGIN { Process_F1_key }
     IF @Active_menu^.Users_help <> NIL THEN
       BEGIN                           { A�o e o���e�a �po�e��pa �a �o�o�  }
         Save_menu_pointer := Active_menu;
         Active_menu^.Users_help (Number);
         Active_menu := Save_menu_pointer;
         { Te�� o�epa��� ca �eo�xo���� � c���a��e, �o�a�o �o�pe���e���     }
         { e o��ap�� �po�op�� ��� e �po�e��� pa��ep��e �a e�pa�a           }
         B := Set_window (Active_menu^.Window_numb);
         Window (Lo(WindMin)+1, Hi(WindMin)+1, Lo(WindMax)+2,Hi(WindMax)+1);
         Change_cursor(FALSE)               { O�c�pa���a ��pcopa o� e�pa�a }
       END
    END { Process_F1_key };
  {------------------------------------------------------------------------}
  BEGIN { Process }
    Change_cursor (FALSE);
    WITH Active_menu^ DO
      BEGIN
        REPEAT
          Ch := Up_case(Get_key); {�e�e�e �a �ope���� c���o� o� ��a��a��pa�a}
          New_start_pos :=  Start_item;
          New_pos := POS (Ch, COPY (Key_letters,Start_item,
                  Min_byte (Start_item +Max_disp_items-1,Items_number) ));
          IF New_pos = 0 THEN
            CASE Ch OF
              Up_key   : Process_up_key;      { ����e��e �a�ope            }
              Down_key : Process_down_key;    { ����e��e �a�o��            }
              Left_key : Process_left_key;    { ����e��e �a���o            }
              Right_key: Process_right_key;   { ����e��e �a��c�o           }
              Cr_key   : New_pos := 0;        { ���op �a a��ep�a���a       }
              Esc_key  : ; { He ce c�e�� a��ep�a���a�a - �e���o ce �a��c�a }
              F1,'?'   : Process_F1_key (Users_help, Curr_item)
            END
          ELSE
            New_pos := New_pos + PRED(Start_item);
          IF New_pos <> 0 THEN
            Set_new_choice
        UNTIL Ch IN [Esc_key,Cr_key];
        IF Ch = Esc_key THEN   Process := 0
        ELSE   Process := Curr_item
      END;
      Change_cursor (TRUE)
  END { Process };
{--------------------------------------------------------------------------}
BEGIN { Open_menu }                                       { O��ap� �e���o  }
  Open_menu := FALSE;
  IF S_search_node(Root, Numb, P) THEN  { A�o �e�� c �o�ep Numb e �a�epe�o }
    BEGIN
      Active_menu := P^.S_data;
      IF Move_window_to (Active_menu^.Window_numb,Row, Col)THEN
        BEGIN                               { C�e�� �oop���a���e �a �e���o }
          IF Active_menu^.State = Closed THEN
            BEGIN
              IF Open_window (Active_menu^.Window_numb) THEN
                BEGIN      { �po�ope��� ����c��e�o ce pa���p��a, �a �a ce  }
                   { o�c�pa�� e�e���� c�po���� �p� ��ca�e �a �oc�e���� pe� }
                  Window (Lo(WindMin)+1, Hi(WindMin)+1,
                          Lo(WindMax)+2, Hi(WindMax)+1);
                  Print;  Open_menu := TRUE; Active_menu^.State := Opened;
                  Option := Process
                END
            END
          ELSE    { A�o �e���o e o��ope�o, �e ce �a�a�a �o��op�o ���e��a�e }
            IF Set_window (Active_menu^.Window_numb) THEN
              BEGIN
                 Window (Lo(WindMin)+1, Hi(WindMin)+1,
                         Lo(WindMax)+2, Hi(WindMax)+1);
                Option := Process;    Open_menu := TRUE
              END
        END
    END
END { Open_menu };
{--------------------------------------------------------------------------}
BEGIN { Menus }  { �����a����pa�a�a �ac� c���a�a �pa�e� c��c�� �a �e���a   }
  S_init (Root, S_null_proc, S_null_func, Del_menu_data);   @F1_null := NIL
END { Menus }.
{--------------------------------------------------------------------------}
