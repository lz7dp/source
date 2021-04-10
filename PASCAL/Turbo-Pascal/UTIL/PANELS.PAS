{-------------------------------------------------------------------------}
{$I Panels.inc }
IMPLEMENTATION
USES Crt, Crt_drv, S_lists, D_lists, Strings, Keyboard;
{$I Panels1.pas }
{$I Panels2.pas }
{-------------------------------------------------------------------------}
BEGIN  { Panels }                              { à≠®∂®a´®ß®∞†≠• ≠a ¨o§≥´a }
                           { C∫ß§a¢a≠e ≠a ãECC ßa c∫xpa≠ø¢a≠e ≠a Øa≠e´®≤e }
  S_init(Root_panel,S_null_proc,S_null_func ,Proc_Del_panel);
  Curr_fore_clr := LightGray;           { èo§paß°®paπ® ce ∂¢e≤o¢e         }
  Curr_back_clr := Cyan;
                                        { K´a¢®∏® ßa ≥Øpa¢´e≠®e ≠a Øa≠e´a }
  Move_keys     := [Del_key,  Back_space_key, F1, Ins_key, End_key,
                    Left_key, Right_key, Ctrl_left_key,
                    Ctrl_right_key, Pg_up_key, Pg_dn_key, Esc_key, Cr_key];
  Input_characters := [' '..'ø'];
  Insert_mode      := TRUE;                          { Pe¶®¨ ≠a ¢∫¢e¶§a≠e }
  Error_fore_color := Black + Blink;       { ñ¢ø≤ ≠a c®¨¢o´®≤e Øp® £pe∏™a }
  Error_back_color := Red;                      { ñ¢ø≤ ≠a ¥o≠a Øp® £pe∏™a }
  @No_test  := NIL;     @No_help  := NIL;     @No_init  := NIL;
END { Panels }.
{-------------------------------------------------------------------------}
