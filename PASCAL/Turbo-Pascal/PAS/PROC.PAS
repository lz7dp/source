{--------------------------------------------------------------------------}
{$F+}                        { ���a�a �po�pa�a ce �o�����pa �o ����� �o�e� }
PROGRAM Proc_test;           { �po�pa�a, �e�o�c�p�pa�a ���o����a�e�o �a    }
                             { �o��po�pa��� �po�e����� �a�o �apa�e�p�      }
  TYPE Proc_type = PROCEDURE (X : REAL; VAR Y: REAL);
  VAR I : INTEGER;
{--------------------------------------------------------------------------}
PROCEDURE Sin_proc (X : REAL; VAR Y: REAL);
BEGIN    Y := SIN (X)
END;
{--------------------------------------------------------------------------}
PROCEDURE Cos_proc (X : REAL; VAR Y: REAL);
BEGIN    Y := COS (X)
END;
{--------------------------------------------------------------------------}
PROCEDURE Print (Proc : Proc_type; X: REAL);
  VAR Y : REAL;
BEGIN
  Proc (X,Y);       WRITELN (X,'  ',Y)
END;
{--------------------------------------------------------------------------}
BEGIN
  WRITELN ('C���c: ');
  FOR I := 0 TO 10 DO
    Print (Sin_proc, 0.1*Pi*I);
  WRITELN ('Koc���c: ');
  FOR I := 0 TO 10 DO
    Print (Cos_proc, 0.1*Pi*I)
END.
{--------------------------------------------------------------------------}
