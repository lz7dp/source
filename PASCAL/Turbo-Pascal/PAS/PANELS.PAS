{-------------------------------------------------------------------------}
{$I Panels.inc }
IMPLEMENTATION
USES Crt, Crt_drv, S_lists, D_lists, Strings, Keyboard;
{$I Panels1.pas }
{$I Panels2.pas }
{-------------------------------------------------------------------------}
BEGIN  { Panels }                              { �����a�������� �a �o���a }
                           { C���a�a�e �a �ECC �a c�xpa���a�e �a �a�e���e }
  S_init(Root_panel,S_null_proc,S_null_func ,Proc_Del_panel);
  Curr_fore_clr := LightGray;           { �o�pa���pa�� ce ��e�o�e         }
  Curr_back_clr := Cyan;
                                        { K�a���� �a ��pa��e��e �a �a�e�a }
  Move_keys     := [Del_key,  Back_space_key, F1, Ins_key, End_key,
                    Left_key, Right_key, Ctrl_left_key,
                    Ctrl_right_key, Pg_up_key, Pg_dn_key, Esc_key, Cr_key];
  Input_characters := [' '..'�'];
  Insert_mode      := TRUE;                          { Pe��� �a ���e��a�e }
  Error_fore_color := Black + Blink;       { ���� �a c���o���e �p� �pe��a }
  Error_back_color := Red;                      { ���� �a �o�a �p� �pe��a }
  @No_test  := NIL;     @No_help  := NIL;     @No_init  := NIL;
END { Panels }.
{-------------------------------------------------------------------------}
