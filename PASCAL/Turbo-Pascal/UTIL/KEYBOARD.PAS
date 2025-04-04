{--------------------------------------------------------------------------}
UNIT Keyboard;                 { Mo��� �a ��pa��e��e �a ��a��a��pa         }
INTERFACE                      {-------------------------------------------}
CONST         { �o-�a��� c���o��� �o�c�a���, ���e��a�� o� ��a��a��pa�a MIK }
  Null_key        = #0;       Bell_key        = #7;
  Back_space_key  = #8;
  Form_feed_key   = #12;      Cr_key          = #13;
  Esc_key         = #27;      Home_key        = #204;
  End_key         = #212;
  Up_key          = #205;     Down_key        = #213;
  Pg_up_key       = #206;     Pg_dn_key       = #214;
  Left_key        = #208;     Right_key       = #210;
  Ins_key         = #215;     Del_key         = #216;
  Ctrl_left_key   = #248;     Ctrl_right_key  = #249;

  F1  = #192;     ShF1 = #217;   CtrlF1 = 227;   AltF1 = #237;
  F2  = #193;     ShF2 = #218;   CtrlF2 = 228;   AltF2 = #238;
  F3  = #194;     ShF3 = #219;   CtrlF3 = 229;   AltF3 = #239;
  F4  = #195;     ShF4 = #220;   CtrlF4 = 230;   AltF4 = #240;
  F5  = #196;     ShF5 = #221;   CtrlF5 = 231;   AltF5 = #241;
  F6  = #197;     ShF6 = #222;   CtrlF6 = 232;   AltF6 = #242;
  F7  = #198;     ShF7 = #223;   CtrlF7 = 233;   AltF7 = #243;
  F8  = #199;     ShF8 = #224;   CtrlF8 = 234;   AltF8 = #244;
  F9  = #200;     ShF9 = #225;   CtrlF9 = 235;   AltF9 = #245;
  F10 = #201;     ShF10= #226;   CtrlF10= 236;   AltF10= #246;
  Offset = 133;
{--------------------------------------------------------------------------}
FUNCTION Get_key : CHAR;               { �e�e e��� c���o� o� ��a��a��pa�a  }
{--------------------------------------------------------------------------}
PROCEDURE Set_hot_keys                         { �e����pa a������ ��a����  }
          (Interrupt_no : BYTE;                { Ho�ep �a �pe��c�a�e�o     }
           Hot_keys     : STRING);             { A������ ��a����           }
{--------------------------------------------------------------------------}
PROCEDURE Get_hot_keys  { Bp��a �o�ep �a �pe��c�a�e�o � a�������e ��a����  }
          (VAR Interrupt_no : BYTE;            { Ho�ep �a �pe��c�a�e�o     }
           VAR Hot_keys     : STRING);         { A������ ��a����           }
{--------------------------------------------------------------------------}
IMPLEMENTATION
  USES CRT, DOS;                    { Crt � Dos ca c�a��ap��� �o����       }
  CONST     Hot_keys_string : STRING = '';
            Intr_no         : BYTE   = 0;
{--------------------------------------------------------------------------}
FUNCTION Get_key;                           { �e�e c���o� o� ��a��a��pa�a  }
  VAR C        : CHAR;                      { �po�e�e� c���o�              }
      Position : BYTE;
      Reg      : Registers;
BEGIN { Get_key }
  REPEAT     C := ReadKey;                  { �e�e c���o� o� ��a��a��pa�a  }
    REPEAT
      IF C = Null_key THEN             { A�o e �a��c�a� ��pa����a� ��a���, }
        BEGIN                          { ���e��a ce c�e��a���� c���o�      }
          C := ReadKey;
          IF C > #128 THEN       { B������a�a e �pe��a, ���e�e���� c���o�  }
            C := Null_key        {  �e ce o�pa�o��a                        }
          ELSE
            C := CHR (ORD(C) + Offset)
        END
    UNTIL C <> Null_key;
    Position := POS (C, Hot_keys_string);  { B��e�e� �� e "�ope�" ��a���?  }
    IF (Position <> 0)  AND (Intr_no <> 0) THEN
      BEGIN           { B��e�e� e "�ope�" ��a��� - c�xpa���a ce � �o�e Ax  }
        Reg.Ax := ORD (C);
        INTR (Intr_no, Reg)            { ����p��a ce �po�pa��o �pe��c�a�e  }
      END
  UNTIL Position = 0; {������� �a��p��a, a�o �a��c�a���� ��a��� �e e �ope� }
  Get_key := C
END { Get_key };
{--------------------------------------------------------------------------}
PROCEDURE Set_hot_keys;  { �e����pa �o�ep �a �pe��c�a�e � a������ ��a����  }
BEGIN  { Set_hot_keys }
  Intr_no := Interrupt_no;        Hot_keys_string := Hot_keys
END { Set_hot_keys };
{--------------------------------------------------------------------------}
PROCEDURE Get_hot_keys;    { Bp��a �o�ep �a �pe���a�e � a�������e ��a����  }
BEGIN  { Get_hot_keys }
  Interrupt_no := Intr_no;        Hot_keys  := Hot_keys_string
END { Set_hot_keys };
{--------------------------------------------------------------------------}
END { Keyboard }.                      { Mo����� ���a �����a����pa�a �ac�  }
{--------------------------------------------------------------------------}
