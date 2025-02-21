{--------------------------------------------------------------------------}
PROGRAM Test_0;  { �po�pa�a, �e�o�c�p�pa�a ���o����a�e�o �a o�e���� ���o�e }
TYPE A = OBJECT
           R: REAL;
           PROCEDURE Init(P: REAL);
           PROCEDURE Print;
           FUNCTION Get : REAL
         END;
     {---------------------------------------------------------------------}
     B = OBJECT(A)              { O�e������ ��� B �ac�e���a o�e����� ��� A }
           S: REAL;
           PROCEDURE Init (P1, P2 : REAL);
           PROCEDURE Print
         END;
{------------------------------ Pea���a��� �a �e�o���e �a o�e��e� ��� A ---}
PROCEDURE A.Init (P: REAL);
BEGIN { Init }
  R := P
END { Init };
{--------------------------------------------------------------------------}
PROCEDURE A.Print;
BEGIN { Print }
  WRITELN ('R = ',R)
END { Print };
{--------------------------------------------------------------------------}
FUNCTION A.Get : REAL;
BEGIN { Get }
  Get := R
END { Get };
{------------------------------ Pea���a��� �a �e�o���e �a o�e��e� ��� B ---}
PROCEDURE B.Init (P1, P2: REAL);
BEGIN { Init }
  R := P1;   S:= P2
END { Init };
{--------------------------------------------------------------------------}
PROCEDURE B.Print;
BEGIN { Print }
  WRITELN ('R = ',R, '    S = ', S)
END { Print };
{--------------------------------------------------------------------------}
VAR   A_ob : A;           B_ob : B;          R    : REAL;
BEGIN { Test_0 }
     A_ob.Init(12.0);         A_ob.Print;
     B_ob.Init(10.0,11.0);    B_ob.Print;
     A_ob := B_ob;            A_ob.Print;
     R := B_ob.Get;           WRITELN(R);
     WRITELN(A_ob.R);         WRITELN(B_ob.S);       WRITELN(B_ob.R);
END { Test_0 }.
{--------------------------------------------------------------------------}
