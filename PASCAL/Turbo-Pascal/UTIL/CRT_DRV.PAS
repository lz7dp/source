{--------------------------------------------------------------------------}
UNIT Crt_drv;  { Ma∏®≠≠o ßa¢®c®¨ ¨o§≥´ ßa ≥Øpa¢´e≠®e ≠a a§aØ≤ep CGA (25x80)}
INTERFACE      {-----------------------------------------------------------}
  CONST  Max_width  = 80;                    { Ma™c®¨a´≠a ∏®p®≠a ≠a e™pa≠a }
         Max_height = 25;                  { Ma™c®¨a´≠a ¢®co∑®≠a ≠a e™pa≠a }
{--------------------------------------------------------------------------}
PROCEDURE Save_scr   { àß¢´®∑a Øpoßope∂ o≤ e™pa≠a ® £o c∫xpa≠ø¢a ¢ To_where}
          (Row, Col,                      { Koop§®≠a≤® ≠a ´•¢®ø £op•≠ ∫£∫´ }
           Height, Width : BYTE;          { B®co∑®≠a ® ∏®p®≠a ≠a Øpoßope∂a }
           VAR To_where  : POINTER);   { Møc≤o ≠a c∫xpa≠ø¢a≠e ≠a Øpoßope∂a }
{------------------------------------------------------------------------- }
PROCEDURE Allocate_scr       { Peßep¢®pa Øa¨e≤ ± o°e¨ 2*Height*Width °a©≤a }
                             { ® c∫xpa≠ø¢a ¢ ≤øx Øpoßope∂a o≤ e™pa≠a       }
          (Row, Col,                    { Koop§®≠a≤®≤e ≠a ´•¢®ø £op•≠ ∫£∫´ }
           Height, Width : BYTE;        { B®co∑®≠a ® ∏®p®≠a ≠a Øpoßope∂a   }
           VAR To_where  : POINTER );  { Møc≤o ≠a c∫xpa≠ø¢a≠e ≠a Øpoßope∂a }
{--------------------------------------------------------------------------}
PROCEDURE Load_scr       { àß¢e¶§a Øpoßope∂ ¢ ≠≥´e¢a c≤pa≠®∂a ®´® ¢ °≥¥epa }
          (Row, Col,                    { Koop§®≠a≤®≤e ≠a ´•¢®ø £op•≠ ∫£∫´ }
           Height, Width : BYTE;        { B®co∑®≠a ® ∏®p®≠a ≠a Øpoßope∂a   }
           From_where    : POINTER;    { Møc≤o ≠a c∫xpa≠ø¢a≠e ≠a Øpoßope∂a }
           Zero_page     : BOOLEAN);  { C≤pa≠®∂a o≤ ¢®§eoØa¨e≤≤a: TRUE     }
                                      { Å≥¥ep(¢®p≤≥a´e≠ e™pa≠): FALSE      }
{--------------------------------------------------------------------------}
PROCEDURE Move_buffer_to_screen;             { àß¢e¶§a °≥¥epa ¢∫px≥ e™pa≠a }
{--------------------------------------------------------------------------}
PROCEDURE Release_mem    { Oc¢o°o¶§a¢a Øa¨e≤, ßae≤a Øpe§® ≤o¢a o≤ Øpoßope∂ }
          (Height, Width  : BYTE;         { B®co∑®≠a ® ∏®p®≠a ≠a Øpoßope∂a }
           VAR From_where : POINTER);  { Møc≤o ≠a c∫xpa≠ø¢a≠e ≠a Øpoßope∂a }
{--------------------------------------------------------------------------}
PROCEDURE Change_cursor      { A™≤®¢®ß®pa (Turn_on = TRUE) ® §eßa™≤®¢®ß®pa }
          (Turn_on : BOOLEAN) ; { (Turn_on = FALSE) ™≥∞±Æ∞†                }
{--------------------------------------------------------------------------}
FUNCTION Test_Size        { èpo¢epø¢a ßa ™ope™≤≠oc≤ paß¨ep®≤e ≠a Øpoßope∂a }
         (Row, Col       : BYTE;          { Koop§®≠a≤® ≠a ´•¢®ø £op•≠ ∫£∫´ }
          Height, Width  : BYTE;          { B®co∑®≠a ® ∏®p®≠a ≠a Øpoßope∂a }
          Box            : Boolean        { C pa¨™a:TRUE; °eß pa¨™a: FALSE }
         ) : BOOLEAN;           { Peß≥´≤a≤: TRUE - ∞aß¨ep®≤e ca ™ope™≤≠®   }
                                {          FALSE - ∞aß¨ep®≤e ca ≠e™ope™≤≠® }
{--------------------------------------------------------------------------}
PROCEDURE Write_string                    { àß¢e¶§a ≠a e™pa≠a c®¨¢o´e≠ ≠®ß }
          (S           : String;          { C®¨¢o´e≠ ≠®ß                   }
           Back, Fore,                    { ñ¢ø≤ ≠a ¥o≠a ® c®¨¢o´®≤e       }
           Row_pos,                       { Koop§®≠a≤® ≠a ≠a∑a´o≤o - pe§ ® }
           Col_pos     : BYTE);           { ™Æ´Æ≠†                         }
{--------------------------------------------------------------------------}
IMPLEMENTATION
  USES DOS, CRT;
  CONST Incr = 160;          { Ñ∫´¶®≠a (¢ °a©≤o¢e) ≠a 1 pe§ o≤ e™pa≠a ¢ Oè }
      CGA_flag  = $3DA; { A§pec ≠a Øop≤a, ™o≠≤po´®paπ o°pa≤≠®ø xo§ ≠a ´∫∑a }
      Base_scr0 = $B800;   { Ha∑a´e≠ a§pec ≠a c≤pa≠®∂a 0  o≤ ¢®§eoØa¨e≤≤a  }
      Mask      = 8;       { Mac™a ßa ≤ec≤¢a≠e ≠a °®≤ 3 o≤ Øop≤ $3DA       }
  VAR Base_scr1 : POINTER ;          { Ha∑a´e≠ a§pec ≠a °≥¥ep≠a≤a c≤pa≠®∂a }
{--------------------------------------------------------------------------}
PROCEDURE Save_scr;         { C∫xpa≠ø¢a Øpoßope∂ o≤ e™pa≠a ¢ oØepa≤®¢≠a≤a  }
                            { Øa¨e≤ c a§pec To_where                       }
VAR  Dest, Source : POINTER;
     Source_Incr  : LONGINT ABSOLUTE Source;
     Dest_incr    : LONGINT ABSOLUTE Dest;
     Index        : BYTE;                                       { à≠§e™c®  }
BEGIN { Save_scr }
  Width := Width SHL 1;                               { Width := 2 * Width }
  Source_Incr := Incr*Pred(Row) + (Pred(Col) SHL 1);
  Source := Ptr(Base_scr0, Source_incr);    Dest   := To_where;
  FOR Index := 1 TO Height DO
    BEGIN   { àß∑a™¢a ßaØo∑¢a≠e≤o ≠a o°pa≤≠®ø xo§ ≠a ´∫∑a ≠a ¢®§eo¨o≠®≤opa }
      REPEAT  UNTIL (Port[CGA_flag] AND Mask) <> 0;
      Move(Source^, Dest^, Width);
      Inc (Dest_incr, Width);             { Dest_incr := Dest_incr + Width }
      Inc (Source_incr, Incr)
    END;
END { Save_scr };
{--------------------------------------------------------------------------}
PROCEDURE Allocate_scr;      { Peßep¢®pa Øa¨e≤ ± o°e¨ 2*Height*Width °a©≤a }
BEGIN { Allocate_scr }       { ® c∫xpa≠ø¢a ¢ ≤øx Øpoßope∂a o≤ e™pa≠a       }
  GetMem (To_where,Width*(Height SHL 1));                { Peßep¢®pa Øa¨e≤ }
  Save_scr (Row, Col, Height, Width, To_where)       { C∫xpa≠ø¢a Øpoßope∂a }
END { Allocate_scr };
{--------------------------------------------------------------------------}
PROCEDURE Load_scr;       { àß¢e¶§a ≠a e™pa≠a c∫xpa≠e≠ Øpe§® ≤o¢a Øpoßope∂ }
VAR  Dest, Source: POINTER;
     Source_incr : LONGINT ABSOLUTE Source;
     Dest_Incr   : LONGINT ABSOLUTE Dest;
     Index       : BYTE;                                         { à≠§e™c® }
BEGIN { Load_scr }
  Width := Width SHL 1;        Source :=From_where;
  IF Zero_page THEN     { îop¨®pa≠e ≠† a§peca ≠a c≤pa≠®∂a 0 o≤ ¢®§eoØa¨e≤≤a }
    Dest := Ptr(Base_scr0, 0)
  ELSE                    { îop¨®pa≠e ≠† ≠†∑†´≠®ø a§pec ≠a ¢®p≤≥a´≠®ø e™pa≠ }
    Dest := Base_scr1;
  Dest_incr :=  Dest_incr + Incr*Pred(Row) + (Pred(Col) SHL 1);
  FOR Index := 1 TO Height DO
    BEGIN                    { àß∑a™¢a ßaØo∑¢a≠e≤o ≠a o°pa≤≠®ø xo§ ≠a ´∫∑a  }
      IF Zero_page THEN      { ≠a ¢®§eo¨o≠®≤opa, a™o e ≠eo°xo§®¨o           }
        REPEAT UNTIL (Port[CGA_flag] AND Mask) <> 0;
      Move(Source^,Dest^,Width);
      Inc (Source_incr, Width);        Inc (Dest_Incr, Incr)
    END
END { Load_scr };
{--------------------------------------------------------------------------}
PROCEDURE Move_buffer_to_screen;             { àß¢e¶§a °≥¥epa ¢∫px≥ e™pa≠a }
  VAR Source, Dest : POINTER;
      Source_incr : LONGINT ABSOLUTE Source;
      Dest_Incr   : LONGINT ABSOLUTE Dest;
      Index       : BYTE;
BEGIN
   Source := Base_scr1;
   Dest   := PTR (Base_scr0,0);
   FOR Index := 1 TO 25  DO
     BEGIN  { àß∑a™¢a ßaØo∑¢a≠e≤o ≠a o°pa≤≠®ø xo§ ≠a ´∫∑a ≠a ¢®§eo¨o≠®≤opa }
       REPEAT UNTIL (Port[CGA_flag] AND Mask) <> 0;
       Move(Source^,Dest^, Incr);
       Inc (Source_incr, Incr);        Inc (Dest_Incr, Incr)
     END
END;
{--------------------------------------------------------------------------}
PROCEDURE  Release_mem; { Oc¢o°o¶§a¢a Øa¨e≤, ßae≤a Øpe§® ≤o¢a o≤ Øpoßope∂  }
BEGIN { Release_mem }
  FreeMem (From_where,Height*(Width SHL 1));
  From_where := NIL
END { Release_mem };
{--------------------------------------------------------------------------}
PROCEDURE Change_cursor;     { A™≤®¢®ß®pa (Turn_on = TRUE) ® §eßa™≤®¢®ß®pa }
  VAR Reg : Registers;            { (Turn_on = FALSE) ™≥pcopa              }
BEGIN { Change_cursor }
  WITH Reg DO
    CASE Turn_On OF
      TRUE:  BEGIN  AH := 1;       { î≥≠™∂®ø ßa Øpo¨ø≠a paß¨epa ≠a ™≥pcopa }
               CH := 6; CL := 7;   { CH -≠a∑a´e≠, CL -™pae≠ pe§ ≠a ™≥pcopa }
               Intr($10, Reg)
             END;
      FALSE: BEGIN  AH := 1;
               CH := 32; CL := 0;          { èapa¨e≤p® ßa ≠e¢®§®¨ ™≥pcop   }
               Intr($10, Reg)
             END
    END
END { Change_cursor };
{--------------------------------------------------------------------------}
FUNCTION Test_size;       { èpo¢epø¢a ßa ™ope™≤≠oc≤ paß¨ep®≤e ≠a Øpoßope∂a }
BEGIN { Test_size }
  IF Box THEN
    Test_size :=
      (Col >= 1) AND (Width >= 3) AND (Row >= 1) AND (Height >= 4) AND
      (PRED (Col + Width) <= Max_width) AND
      (PRED (Row + Height)<= Max_height)
  ELSE
    Test_size :=
      (Col >= 1) AND (Width >= 1) AND (Row >= 1) AND (Height >= 2) AND
      (PRED (Col + Width) <= Max_width) AND
      (PRED (Row + Height)<= Max_height)
END { Test_size };
{--------------------------------------------------------------------------}
PROCEDURE Write_string;                   { àß¢e¶§a ≠a e™pa≠a c®¨¢o´e≠ ≠®ß }
BEGIN { Write_string }
  GotoXY (Col_pos,Row_pos);     { èpe¨ec≤¢a ™≥pcopa ¢ ≠eo°xo§®¨a≤a Øoß®∂®ø }
  TextColor (Fore);    TextBackground (Back);         { OØpe§e´ø ∂¢e≤o¢e≤e }
  WRITE (S);
END { Write_string };
{--------------------------------------------------------------------------}
BEGIN           { Peßep¢®pa ¨øc≤o ßa °≥¥ep≠a≤a c≤pa≠®∂a (¢®p≤≥a´≠®ø e™pa≠) }
  GetMem (Base_Scr1, 4000)
END { Crt_drv }.
{--------------------------------------------------------------------------}
