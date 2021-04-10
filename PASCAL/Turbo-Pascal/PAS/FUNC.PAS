{--------------------------------------------------------------------------}
PROGRAM Func_test; { èpo£pa¨a, §e¨o≠c≤p®paπa ®ßØo´ß≥¢a≠e ≠a Øo§Øpo£pa¨≠®   }
                   { ≤®Øo¢e                                                }
  TYPE Func_type = FUNCTION (X : REAL): REAL;
  VAR I,J  : INTEGER;
      Func : ARRAY[1..2] OF Func_type;
      P,R : Func_type;
{$F+}{---------------------------------------------------------------------}
FUNCTION Sin_func (X : REAL): REAL;
BEGIN { Sin_func }
  Sin_func := SIN (X)
END { Sin_func };
{--------------------------------------------------------------------------}
FUNCTION Cos_func (X : REAL): REAL;
BEGIN { Cos_func }
  Cos_func := COS (X)
END { Cos_func };
{$F-}{---------------------------------------------------------------------}
PROCEDURE Print ( Proc : Func_type; X: REAL);
  VAR Y : REAL;
BEGIN  { Print }
  Y := Proc (X);        WRITELN (X,'  ',Y)
END { Print };
{--------------------------------------------------------------------------}
PROCEDURE Ret_proc (X : Func_type; VAR Y : Func_type);
BEGIN  { Ret_proc }
  Y := X;
END { Ret_proc };
{--------------------------------------------------------------------------}
BEGIN
  Func[1] := Sin_func;                   Func[2] := Cos_func;
  FOR J := 1 TO 2 DO
    BEGIN
      WRITELN ('î≥≠™∂®ø:', J);
      FOR I := 0 TO 10 DO
        Print (Func[J], 0.1*Pi*I)
    END;
  WRITELN ('Tec≤: ');
  Ret_proc (Cos_func, P);
  R := Cos_func;
  WRITELN (R(0.1*Pi),P(0.1*Pi));
  WRITELN (Func[1](0.1*Pi), Func[2](0.1*Pi))
END.
{--------------------------------------------------------------------------}
