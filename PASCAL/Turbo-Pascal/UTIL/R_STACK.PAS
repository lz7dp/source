{-------------------------------------------------------------------------}
UNIT R_stack;                               { Mo��� �a ��pa��e��e �a c�e� }
INTERFACE                                   {-----------------------------}
  TYPE  Element = REAL;                     { T�� �a e�e�e����e �a c�e�a  }
{-------------------------------------------------------------------------}
FUNCTION Push                               { �oc�a�� e�e�e�� � c�e�a     }
         (Numb : Element
         ) : BOOLEAN;           { Pe����a�: TRUE - E�e�e���� e �oc�a�e�   }
                                {           FALSE - H��a ��c�o � c�e�a    }
{-------------------------------------------------------------------------}
FUNCTION Pop                                { ������a e�e�e�� o� c�e�a    }
         (VAR Numb: Element
         ) : BOOLEAN;           { Pe����a�: TRUE - E�e�e���� e ����e�e�   }
                                {           FALSE - H��a e�e�e��� � c�e�a }
{-------------------------------------------------------------------------}
 PROCEDURE Init_stack;                      { �����a����pa c�e�a          }
{-------------------------------------------------------------------------}
IMPLEMENTATION
  CONST Max = 20;                 { Ma�c��a�e� �po� �a e�e�e����e � c�e�a }
  VAR   Stack_data: ARRAY [1..Max] OF Element;                   { C�e�   }
        Top       : ShortInt;                            { Bp�x �a c�e�a  }
{-------------------------------------------------------------------------}
FUNCTION Push;                              { �oc�a�� e�e�e�� � c�e�a     }
BEGIN { Push }
  IF Top >= Max THEN               { Ma�c�a�e� �po� �a e�e�e����e � c�e�a }
    Push := FALSE
  ELSE
    BEGIN
      Top  := Top + 1;     Stack_data[Top] := Numb;     Push := TRUE
    END
END { Push };
{-------------------------------------------------------------------------}
FUNCTION Pop;                               { ������a e�e�e�� o� c�e�a    }
BEGIN { Pop }
  IF Top <= 0 THEN
    Pop := FALSE
  ELSE
    BEGIN
      Numb := Stack_data[Top];     Top := Top - 1;      Pop  := TRUE
    END
END { Pop };
{-------------------------------------------------------------------------}
PROCEDURE Init_stack;                       { �����a����pa c�e�a          }
BEGIN { Init_stack }
  Top := 0
END { Init_stack };
{-------------------------------------------------------------------------}
BEGIN { R_stack }
  Init_stack
END. { R_stack }
{-------------------------------------------------------------------------}
