{--------------------------------------------------------------------------}
UNIT Crt_drv;  { Ma����o �a��c�� �o��� �a ��pa��e��e �a a�a��ep CGA (25x80)}
INTERFACE      {-----------------------------------------------------------}
  CONST  Max_width  = 80;                    { Ma�c��a��a ��p��a �a e�pa�a }
         Max_height = 25;                  { Ma�c��a��a ��co���a �a e�pa�a }
{--------------------------------------------------------------------------}
PROCEDURE Save_scr   { ������a �po�ope� o� e�pa�a � �o c�xpa���a � To_where}
          (Row, Col,                      { Koop���a�� �a ����� �op�� ���� }
           Height, Width : BYTE;          { B�co���a � ��p��a �a �po�ope�a }
           VAR To_where  : POINTER);   { M�c�o �a c�xpa���a�e �a �po�ope�a }
{------------------------------------------------------------------------- }
PROCEDURE Allocate_scr       { Pe�ep��pa �a�e� � o�e� 2*Height*Width �a��a }
                             { � c�xpa���a � ��x �po�ope�a o� e�pa�a       }
          (Row, Col,                    { Koop���a���e �a ����� �op�� ���� }
           Height, Width : BYTE;        { B�co���a � ��p��a �a �po�ope�a   }
           VAR To_where  : POINTER );  { M�c�o �a c�xpa���a�e �a �po�ope�a }
{--------------------------------------------------------------------------}
PROCEDURE Load_scr       { ���e��a �po�ope� � ���e�a c�pa���a ��� � ���epa }
          (Row, Col,                    { Koop���a���e �a ����� �op�� ���� }
           Height, Width : BYTE;        { B�co���a � ��p��a �a �po�ope�a   }
           From_where    : POINTER;    { M�c�o �a c�xpa���a�e �a �po�ope�a }
           Zero_page     : BOOLEAN);  { C�pa���a o� ���eo�a�e��a: TRUE     }
                                      { ���ep(��p��a�e� e�pa�): FALSE      }
{--------------------------------------------------------------------------}
PROCEDURE Move_buffer_to_screen;             { ���e��a ���epa ��px� e�pa�a }
{--------------------------------------------------------------------------}
PROCEDURE Release_mem    { Oc�o�o��a�a �a�e�, �ae�a �pe�� �o�a o� �po�ope� }
          (Height, Width  : BYTE;         { B�co���a � ��p��a �a �po�ope�a }
           VAR From_where : POINTER);  { M�c�o �a c�xpa���a�e �a �po�ope�a }
{--------------------------------------------------------------------------}
PROCEDURE Change_cursor      { A�������pa (Turn_on = TRUE) � �e�a�������pa }
          (Turn_on : BOOLEAN) ; { (Turn_on = FALSE) �������                }
{--------------------------------------------------------------------------}
FUNCTION Test_Size        { �po�ep��a �a �ope���oc� pa��ep��e �a �po�ope�a }
         (Row, Col       : BYTE;          { Koop���a�� �a ����� �op�� ���� }
          Height, Width  : BYTE;          { B�co���a � ��p��a �a �po�ope�a }
          Box            : Boolean        { C pa��a:TRUE; �e� pa��a: FALSE }
         ) : BOOLEAN;           { Pe����a�: TRUE - �a��ep��e ca �ope����   }
                                {          FALSE - �a��ep��e ca �e�ope���� }
{--------------------------------------------------------------------------}
PROCEDURE Write_string                    { ���e��a �a e�pa�a c���o�e� ��� }
          (S           : String;          { C���o�e� ���                   }
           Back, Fore,                    { ���� �a �o�a � c���o���e       }
           Row_pos,                       { Koop���a�� �a �a�a�o�o - pe� � }
           Col_pos     : BYTE);           { ������                         }
{--------------------------------------------------------------------------}
IMPLEMENTATION
  USES DOS, CRT;
  CONST Incr = 160;          { ������a (� �a��o�e) �a 1 pe� o� e�pa�a � O� }
      CGA_flag  = $3DA; { A�pec �a �op�a, �o��po��pa� o�pa���� xo� �a ���a }
      Base_scr0 = $B800;   { Ha�a�e� a�pec �a c�pa���a 0  o� ���eo�a�e��a  }
      Mask      = 8;       { Mac�a �a �ec��a�e �a ��� 3 o� �op� $3DA       }
  VAR Base_scr1 : POINTER ;          { Ha�a�e� a�pec �a ���ep�a�a c�pa���a }
{--------------------------------------------------------------------------}
PROCEDURE Save_scr;         { C�xpa���a �po�ope� o� e�pa�a � o�epa����a�a  }
                            { �a�e� c a�pec To_where                       }
VAR  Dest, Source : POINTER;
     Source_Incr  : LONGINT ABSOLUTE Source;
     Dest_incr    : LONGINT ABSOLUTE Dest;
     Index        : BYTE;                                       { ���e�c�  }
BEGIN { Save_scr }
  Width := Width SHL 1;                               { Width := 2 * Width }
  Source_Incr := Incr*Pred(Row) + (Pred(Col) SHL 1);
  Source := Ptr(Base_scr0, Source_incr);    Dest   := To_where;
  FOR Index := 1 TO Height DO
    BEGIN   { ���a��a �a�o��a�e�o �a o�pa���� xo� �a ���a �a ���eo�o���opa }
      REPEAT  UNTIL (Port[CGA_flag] AND Mask) <> 0;
      Move(Source^, Dest^, Width);
      Inc (Dest_incr, Width);             { Dest_incr := Dest_incr + Width }
      Inc (Source_incr, Incr)
    END;
END { Save_scr };
{--------------------------------------------------------------------------}
PROCEDURE Allocate_scr;      { Pe�ep��pa �a�e� � o�e� 2*Height*Width �a��a }
BEGIN { Allocate_scr }       { � c�xpa���a � ��x �po�ope�a o� e�pa�a       }
  GetMem (To_where,Width*(Height SHL 1));                { Pe�ep��pa �a�e� }
  Save_scr (Row, Col, Height, Width, To_where)       { C�xpa���a �po�ope�a }
END { Allocate_scr };
{--------------------------------------------------------------------------}
PROCEDURE Load_scr;       { ���e��a �a e�pa�a c�xpa�e� �pe�� �o�a �po�ope� }
VAR  Dest, Source: POINTER;
     Source_incr : LONGINT ABSOLUTE Source;
     Dest_Incr   : LONGINT ABSOLUTE Dest;
     Index       : BYTE;                                         { ���e�c� }
BEGIN { Load_scr }
  Width := Width SHL 1;        Source :=From_where;
  IF Zero_page THEN     { �op��pa�e �� a�peca �a c�pa���a 0 o� ���eo�a�e��a }
    Dest := Ptr(Base_scr0, 0)
  ELSE                    { �op��pa�e �� �������� a�pec �a ��p��a���� e�pa� }
    Dest := Base_scr1;
  Dest_incr :=  Dest_incr + Incr*Pred(Row) + (Pred(Col) SHL 1);
  FOR Index := 1 TO Height DO
    BEGIN                    { ���a��a �a�o��a�e�o �a o�pa���� xo� �a ���a  }
      IF Zero_page THEN      { �a ���eo�o���opa, a�o e �eo�xo���o           }
        REPEAT UNTIL (Port[CGA_flag] AND Mask) <> 0;
      Move(Source^,Dest^,Width);
      Inc (Source_incr, Width);        Inc (Dest_Incr, Incr)
    END
END { Load_scr };
{--------------------------------------------------------------------------}
PROCEDURE Move_buffer_to_screen;             { ���e��a ���epa ��px� e�pa�a }
  VAR Source, Dest : POINTER;
      Source_incr : LONGINT ABSOLUTE Source;
      Dest_Incr   : LONGINT ABSOLUTE Dest;
      Index       : BYTE;
BEGIN
   Source := Base_scr1;
   Dest   := PTR (Base_scr0,0);
   FOR Index := 1 TO 25  DO
     BEGIN  { ���a��a �a�o��a�e�o �a o�pa���� xo� �a ���a �a ���eo�o���opa }
       REPEAT UNTIL (Port[CGA_flag] AND Mask) <> 0;
       Move(Source^,Dest^, Incr);
       Inc (Source_incr, Incr);        Inc (Dest_Incr, Incr)
     END
END;
{--------------------------------------------------------------------------}
PROCEDURE  Release_mem; { Oc�o�o��a�a �a�e�, �ae�a �pe�� �o�a o� �po�ope�  }
BEGIN { Release_mem }
  FreeMem (From_where,Height*(Width SHL 1));
  From_where := NIL
END { Release_mem };
{--------------------------------------------------------------------------}
PROCEDURE Change_cursor;     { A�������pa (Turn_on = TRUE) � �e�a�������pa }
  VAR Reg : Registers;            { (Turn_on = FALSE) ��pcopa              }
BEGIN { Change_cursor }
  WITH Reg DO
    CASE Turn_On OF
      TRUE:  BEGIN  AH := 1;       { ������� �a �po���a pa��epa �a ��pcopa }
               CH := 6; CL := 7;   { CH -�a�a�e�, CL -�pae� pe� �a ��pcopa }
               Intr($10, Reg)
             END;
      FALSE: BEGIN  AH := 1;
               CH := 32; CL := 0;          { �apa�e�p� �a �e����� ��pcop   }
               Intr($10, Reg)
             END
    END
END { Change_cursor };
{--------------------------------------------------------------------------}
FUNCTION Test_size;       { �po�ep��a �a �ope���oc� pa��ep��e �a �po�ope�a }
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
PROCEDURE Write_string;                   { ���e��a �a e�pa�a c���o�e� ��� }
BEGIN { Write_string }
  GotoXY (Col_pos,Row_pos);     { �pe�ec��a ��pcopa � �eo�xo���a�a �o����� }
  TextColor (Fore);    TextBackground (Back);         { O�pe�e�� ��e�o�e�e }
  WRITE (S);
END { Write_string };
{--------------------------------------------------------------------------}
BEGIN           { Pe�ep��pa ��c�o �a ���ep�a�a c�pa���a (��p��a���� e�pa�) }
  GetMem (Base_Scr1, 4000)
END { Crt_drv }.
{--------------------------------------------------------------------------}
