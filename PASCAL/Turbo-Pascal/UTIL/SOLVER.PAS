{--------------------------------------------------------------------------}
{$I Solver.inc}    {T��o �a �o��� �a ����c���a�e �a ap���e����� ��pa��     }
IMPLEMENTATION     {-------------------------------------------------------}
  USES Util, R_stack, Dat_solv, NB_trees, L_lists1, Scanner;
  TYPE   Equation_pointer = ^Equation_type;
    Equation_type =        { T��, c�xpa���a� �a����e �a ap���e������ ��pa� }
       RECORD
         Equation : L_list;          { ��a�a�e� ��� ap���e������ ��pa�     }
         Real_val : REAL             { C�o��oc� �a ap���e������ ��pa�      }
       END;
  VAR Var_root   : NB_tree;          { Kope� �a ��������� ��p�o            }
      Exit_place : WORD;             { M�c�o �a a�ap�e� ��xo�              }
      Last_error : STRING;           { Te�c� �a �oc�e����a �pe��a          }
{--------------------------------------------------------------------------}
{$F+}       { �������, �e����pa�a o�epa����a cpa����a�e �a c���o��� ���o�e }
  FUNCTION Compare_string (VAR X,Y ) : INTEGER;     { Pe����a� -1, 0 ��� 1 }
    VAR Xs : String_id ABSOLUTE X;   Ys : String_id ABSOLUTE Y;
  BEGIN { Compare_string }
    IF Xs < Ys THEN    Compare_string := -1
    ELSE  IF Xs = Ys THEN  Compare_string :=  0
          ELSE             Compare_string :=  1
  END { Compare_string };
{$F-} {--------------------------------------------------------------------}
PROCEDURE Error (Message :STRING);                   { O�pa�o��a �pe����e  }
BEGIN { Error }
  Last_error := Message;    Long_exit(Exit_place);
END { Error };
{--------------------------------------------------------------------------}
PROCEDURE No_error;                                          { H��a �pe��a }
BEGIN { No_error }
  Last_error := ''
END { No_error };
{--------------------------------------------------------------------------}
FUNCTION Get_last_error;                         { Bp��a �oc�e��a�a �pe��a }
BEGIN { Get_last_error }
  Get_last_error := Last_error;
END { Get_last_error };
{--------------------------------------------------------------------------}
PROCEDURE Set_message(Message :STRING);               { O�pa�o��a �pe����e }
BEGIN { Set_message }
  Last_error := Message;
END { Set_message };
{$F+ }{--------------------------------------------------------------------}
PROCEDURE Comp   { O�pa�o��a e��� e�e�e�� o� ��pa�, �a��ca� � �o�c�� �a��c }
          (L: L_pointer);                     { ��a�a�e� ��� ���� e�e�e��  }
  VAR Value,R1,R2 : REAL;
      Err   : BOOLEAN;         Key   : Oper;       Data  : POINTER;
BEGIN { Comp }     Err := TRUE;
  Key := L_get_key(L);                    { ������a ���a �a e�e�e��a       }
  Data:= L_get_data(L);                   { ������a �a����e �a e�e�e��a    }
  IF (Key = Variable) OR              { O�pa�o��a���� e�e�e�� e �po�e����a }
     (Key = Const_number) THEN        { O�pa�o��a���� e�e�e�� e �o�c�a��a  }
       Err := NOT Push ( REAL(Data^))
  ELSE                                 { O�pa�o��a���� e�e�e�� e o�epa���  }
    BEGIN
      IF Pop (R1) THEN              { O� c�e�a ce ������a ��p���� o�epa��  }
        CASE  Key  OF               { A�a��� �a ���a �a o�epa����a         }
          Un_plus  : Err := NOT Push (R1);          { ���������� ���c      }
          Un_minus : Err := NOT Push (-R1);         { ���������� ����c     }
          B_plus   : IF Pop (R2) THEN               { O�epa��� c���pa�e    }
                       Err := NOT Push (R1+R2);
          B_minus  : IF Pop (R2) THEN               { O�epa��� ���a��a�e   }
                       Err := NOT Push (R2-R1);
          Mult     : IF Pop (R2) THEN               { O�epa��� ���o�e��e   }
                       Err := NOT Push (R1*R2);
          Divide   : IF Pop (R2) THEN               { O�epa��� �e�e��e     }
                       IF ABS (R1) > 1.0E-20 THEN   { �e�e��e �a ���a ?    }
                         Err := NOT Push (R2/R1);
          Sin_op   : Err := NOT Push (SIN(R1));     { C���c                }
          Cos_op   : Err := NOT Push (COS(R1));     { Koc���c              }
          Exp_op   : Err := NOT Push (EXP(R1));     { E�c�o�e��a           }
          Ln_op    : Err := NOT Push (LN(R1));      { Ha��pa�e� �o�ap����  }
          Sqrt_op  : IF ABS(R1) > 1.0E-20 THEN      { K�a�pa�e� �ope�      }
                       Err := NOT Push (SQRT(R1));
          Tg_op    : IF POP (R2) THEN               { Ta��e�c              }
                       IF ABS(R1)> 1.E-10 THEN
                         Err := NOT Push(SIN(R2)/COS(R1))
        END { Case }
    END;
    IF Err THEN
      Error('He�pa���e� ��pa�')
END { Comp };
{--------------------------------------------------------------------------}
PROCEDURE Compute_value        { ����c���a ��pa��, �a��ca� � �o�c�� �a��c  }
          (Expr    : Equation_pointer;   { ��a�a�e� ��� ��pa�a             }
       VAR VALUE   : REAL;               { ����c�e�a c�o��oc�              }
       VAR  Rezult : BOOLEAN);   { Pe����a� o� �pec���a�e�o:FALSE - �pe��a }
  VAR  R : REAL;
BEGIN { Compute_value }
  Rezult := FALSE;    Init_stack ;      Exit_place := Save_exit;
  WITH Expr^ DO
    BEGIN                     { ����c����a ��pa�a, �a��ca� � �o�c�� �a��c  }
      IF NOT L_process_until (Equation, Null_func, Comp) THEN
        BEGIN                          { ����c�e��e�o e �p�������o �c�e��o }
          IF Pop (Value) THEN            { ������a�e �� pe����a�a o� c�e�a }
            BEGIN   Real_val := Value;
              Rezult :=  NOT Pop (R);      { A�o ��a �a��� � c�e�a - �pe��a}
            END
          ELSE
            Set_message ( 'He�pa���e� �o�c�� �a��c' )
        END
    END { With };
END { Compute_value };
{$F+  - -------------------------------------------------------------------}
PROCEDURE Del (L: L_pointer);           { Oc�o�o��a�a �a�e��a �a �o�c�a��� }
 VAR Real_pointer : ^REAL ;
BEGIN { Del }
  IF L_get_key(L) = Const_number THEN
    BEGIN   Real_pointer := L_get_data (L);
      DISPOSE (Real_pointer)
    END
END { Del };
{--------------------------------------------------------------------------}
FUNCTION Define_expression;                             { �e����pa ��pa�   }
  VAR Sym    : Symbol;                                  { T�� �a �e�ce�a�a }
      Id_val : String_id;                               { �e�ce�a          }
      Var_data : Equation_type;
      Name     : String_id;
      Success,Rezult : BOOLEAN;                       { �o�o��� �po�e����� }
      Place  : POINTER;
      S      : L_list;
{--------------------------------------------------------------------------}
  PROCEDURE Put_data      { B�����a �a��� �a ap���e������ ��pa� � c��c��a  }
            (Operat : Oper;                 { T�� �a o�epa����a            }
             Id     : String_id);           { C�o��oc� �a �e�ce�a�a        }
  VAR Node : POINTER;
      Code : INTEGER;         Real_pointer : ^REAL;     V  : L_pointer;
  BEGIN { Put_data }
    IF Operat <> No_op THEN
      BEGIN
        IF Operat = Variable THEN                { Pa��o��a�a e �po�e����a }
          BEGIN                  { ������a�e �a �e���� a�pec o� NB-��p�o�o }
            IF NB_where_node (Var_root, Id, Node) THEN
              L_insert_last (S, Operat,@Equation_pointer(Node)^.Real_val, V)
            ELSE                             { �po�e����a�a �e e � ��p�o�o }
              Error ('He�e����pa�a �po�e����a')
          END
        ELSE
          IF Operat = Const_number THEN           { Pa��o��a�a e �o�c�a��a }
            BEGIN  NEW (Real_pointer); { Pe�ep��pa ce ��c�o �a c�o��oc��a �}
              VAL (Id, Real_pointer^, Code);
              IF Code = 0 THEN
                L_insert_last (S, Operat, Real_pointer, V)
              ELSE
                BEGIN   DISPOSE (Real_pointer);
                  Error (' He�pa����o �������������')
                END
            END
          ELSE                         { Pa��o��a�a e o�epa��� ��� ������� }
            L_insert_last (S, Operat, NIL, V)
      END
  END { Put_data };
  {------------------------------------------------------------------------}
  PROCEDURE Expression;                     { A�a����pa ap���e���e� ��pa�  }
    VAR Op : Oper;      Id : String;
    {----------------------------------------------------------------------}
    PROCEDURE Term;                           { O�pa�o��a ��������� (����) }
      VAR Op : Oper;
      {--------------------------------------------------------------------}
      PROCEDURE Factor;                             { O�pa�o��a ��o���e�   }
        VAR Op : Oper;
      BEGIN { Factor }
        IF Sym = Ident THEN
          BEGIN Put_data (Variable, Id_val);    { Pa��o��a�a e �po�e����a  }
            Sym := Get_sym(Id_val)
          END
        ELSE
          IF Sym = Number THEN           { Pa��o��a�a e ���po�a �o�c�a��a  }
            BEGIN  Id := Id_val;                  Sym := Get_sym(Id_val);
              IF Sym = Period THEN            { A���� �a pea��a �o�c�a��a  }
                BEGIN Id := Id + Id_val;          Sym := Get_sym (Id_val);
                  IF Sym = Number THEN
                    BEGIN Id := Id + Id_val;      Sym := Get_sym (Id_val);
                      IF Sym = Exp_sym THEN
                        BEGIN  Id := Id + Id_val; Sym := Get_sym (Id_val);
                          IF Sym = Number THEN
                            BEGIN
                              Id := Id + Id_val;  Sym := Get_sym (Id_val)
                            END
                          ELSE
                            Error ('He�pa���e� ��pa�')
                        END
                    END
                  ELSE
                    Error ('He�pa���e� ��pa�')
                END;
              Put_data (Const_number, Id)
            END
          ELSE
            IF Sym = Left_par THEN
              BEGIN  Sym := Get_sym (Id_val);
                Expression;
                IF Sym = Right_par THEN
                  Sym := Get_sym(Id_val)
                ELSE
                  Error('���c�a ��c�a c�o�a '')''')
              END
            ELSE
              IF Sym IN [Sin_sym .. Tg_sym] THEN
                BEGIN
                  CASE Sym OF
                    Sin_sym : Op := Sin_op;
                    Cos_sym : Op := Cos_op;
                    Exp_sym : Op := Exp_op;
                    Ln_sym  : Op := Ln_op;
                    Sqrt_sym: Op := Sqrt_op;
                    Tg_sym  : Op := Tg_op
                  END;
                  Sym := Get_sym (Id_val);
                  IF Sym = Left_par THEN
                    BEGIN    Sym := Get_sym (Id_val);
                      Expression;
                      IF Sym = Right_par THEN
                        Sym := Get_sym(Id_val)
                      ELSE
                        Error('���c�a ��c�a c�o�a '')''');
                      Put_data (Op,'')
                    END
                END
              ELSE
                Error('He�pa���e� ��pa�')
      END { Factor };
    {----------------------------------------------------------------------}
    BEGIN { Term }         Factor;
      WHILE Sym IN [Asterisk,Slash] DO
        BEGIN
          CASE Sym OF
            Asterisk : Op := Mult;                { C�e��a���� c���o� e * }
            Slash    : Op := Divide               { C�e��a���� c���o� e / }
          END;
          Sym := Get_sym (Id_val);   Factor;   Put_data (Op,'')
        END
    END { Term };
    {----------------------------------------------------------------------}
  BEGIN { Expression }     Op := No_op;
    IF Sym IN [Plus, Minus] THEN       { A�a��� �a ���������� ���c � ����c }
      BEGIN
        CASE Sym OF
          Plus : Op := Un_plus;
          Minus: Op := Un_minus
        END;
        Sym := Get_sym(Id_val);
      END;
    Term;         Put_data (Op,'');
    WHILE Sym IN [Plus,Minus] DO
      BEGIN
        CASE Sym OF
          Plus : Op := B_plus;
          Minus: Op := B_minus
        END;
        Sym := Get_sym(Id_val);     Term;     Put_data(Op,'')
      END
  END { Expression };
  {------------------------------------------------------------------------}
  PROCEDURE Process_expression          { O�pa�o��a ��c�a�a �ac� �a ��pa�  }
            (VAR Success : BOOLEAN);
  BEGIN { Process_expression }
    Success := FALSE; Exit_place := Save_exit;         { ��xo� �p� �pe��a  }
    Expression;       Success := TRUE       { ��pa��� e �pec�e��a� �c�e��o }
  END { Process_expression };
{--------------------------------------------------------------------------}
BEGIN { Define_expression }            { �e����pa�e �a ap���e���e� ��pa�   }
  Success := FALSE;   No_error;
  IF Init_scanner (Memory, In_string) THEN
    BEGIN  Sym := Get_sym(Id_val);       { �o��o�o��a �a �e�c��a�e� a�a��� }
      IF Sym = Ident THEN    { ������a�e �a ��e������a�opa �a �po�e����a�a }
        BEGIN     { T�pc� �o�� ��e������a�op � ��p�o�o �a ��e������a�op��e }
          Name := Id_val;
          IF NB_where_node (Var_root, Id_val, Place) THEN
                                  { �po�e����a c�c c��o�o ��e e �e����pa�a }
          WITH Equation_pointer(Place)^ DO
            BEGIN  L_delete_list (Equation, Del); {O�c�pa���a c�ap�� ��pa� }
              L_init (Equation);         S := Equation;
            END
          ELSE
            BEGIN { Ho� ��e������a�op �a �po�e����a - ������a ce � ��p�o�o }
                           { C���a�a ce �o� �pa�e� c��c�� �a �o�c��� �a��c }
              L_init(Var_data.Equation);    S := Var_data.Equation;
              IF NOT NB_insert_node (Var_root, Id_val, Var_data)THEN
                BEGIN                                 { He����o�e� c���a�  }
                  Set_message(' B��pe��a �pe��a � NB_trees');
                  Define_expression := FALSE;     EXIT
                END
            END
       END
     ELSE
       BEGIN
         Set_message (' �pe��a � ��pa�a ');
         Define_expression := FALSE;     EXIT
       END;
     Sym := Get_sym(Id_val);    { ������a�e �a ��a�a �a pa�e�c��o '=' }
     IF Sym = Equal THEN
       BEGIN
         Sym:=Get_sym(Id_val);       Process_expression (Success);
       END
     ELSE
       BEGIN    Set_message (' ���c�a ��a� �a pa�e�c��o');
         Define_expression := FALSE;     EXIT
       END;
     IF Success THEN
       Success := Compute_expression (Name, Value);
     Define_expression := Success
  END
END { Define_expression };
{$F+ }{--------------------------------------------------------------------}
PROCEDURE Release_var     { ���p��a �a����e, c��p�a�� c ���e� o� NB_��p�o  }
          (Data : POINTER);
BEGIN { Release_var }
 IF Data <> NIL THEN
   WITH Equation_pointer(Data)^ DO
     IF Equation <> NIL THEN
       L_delete_list (Equation ,Del);  { ���p��a c��c��a, c���p�a� ��pa�a }
END { Release_var };
{$F- }{-------------------------------------------------------------------}
PROCEDURE Release_variable;           { Oc�o�o��a�a �a�e��a �a �po�e����a }
  VAR Sym    : Symbol;          Id_val : String_id;
BEGIN { Release_variable }      No_error;
  IF Init_scanner (Memory, In_string) THEN
    BEGIN                         { ������a ��e������a�opa �a �po�e����a�a }
      Sym := Get_sym (Id_val);
      IF Sym = Ident THEN
        BEGIN                          { ���p��a ��e������a�opa o� ��p�o�o }
          IF NOT NB_delete_node (Var_root, Id_val) THEN
            Set_message ('He�e����pa�a �po�e����a')
        END
      ELSE
        Set_message ('He�pa���e� ��e������a�op')
    END
END { Release_variable };
{---------------------------------------------------------------------------}
FUNCTION Compute_expression;       { �pec���a ��pa�, �a��ca� � �o�c�� �a��c }
  VAR Expr   : POINTER;     Rezult : BOOLEAN;    Sym    : Symbol;
      Id_val : String_id;
BEGIN { Comp_expression }
  Compute_expression := FALSE;
  No_error;
  IF Init_scanner (Memory, In_string) THEN
    BEGIN  Sym := Get_sym(Id_val);         { ������a ��e�o �a �po�e����a�a }
      IF Sym = Ident THEN
        BEGIN                        { T�pc� � ��p�o�o �a ��e������a�op��e }
          IF NB_where_node (Var_root, Id_val, Expr) THEN
            BEGIN                              { T�pce���� ���e� e �a�epe� }
              Compute_value (Expr, Value, Rezult);
              IF Rezult THEN
                Compute_expression := TRUE
            END
        END
    END
END { Comp_expression };
{-------------------------------------------------------------------------}
BEGIN { Solver }     No_error;
  NB_init (Var_root, NB_null_proc, Release_var, Compare_string,
           SizeOf(String_id), SizeOf(Equation_type) )
END { Solver }.
{-------------------------------------------------------------------------}
