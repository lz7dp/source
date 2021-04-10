{-------------------------------------------------------------------------}
UNIT R_stack;                               { Mo¤³« §a ³¯pa¢«e­¨e ­a c²eª }
INTERFACE                                   {-----------------------------}
  TYPE  Element = REAL;                     { T¨¯ ­a e«e¬e­²¨²e ­a c²eªa  }
{-------------------------------------------------------------------------}
FUNCTION Push                               { oc²a¢¿ e«e¬e­² ¢ c²eªa     }
         (Numb : Element
         ) : BOOLEAN;           { Pe§³«²a²: TRUE - E«e¬e­²º² e ¯oc²a¢e­   }
                                {           FALSE - H¿¬a ¬¿c²o ¢ c²eªa    }
{-------------------------------------------------------------------------}
FUNCTION Pop                                { ˆ§¢«¨·a e«e¬e­² o² c²eªa    }
         (VAR Numb: Element
         ) : BOOLEAN;           { Pe§³«²a²: TRUE - E«e¬e­²º² e ¨§¢«e·e­   }
                                {           FALSE - H¿¬a e«e¬e­²¨ ¢ c²eªa }
{-------------------------------------------------------------------------}
 PROCEDURE Init_stack;                      { ˆ­¨¶¨a«¨§¨pa c²eªa          }
{-------------------------------------------------------------------------}
IMPLEMENTATION
  CONST Max = 20;                 { Maªc¨¬a«e­ ¡po© ­a e«e¬e­²¨²e ¢ c²eªa }
  VAR   Stack_data: ARRAY [1..Max] OF Element;                   { C²eª   }
        Top       : ShortInt;                            { Bpºx ­a c²eªa  }
{-------------------------------------------------------------------------}
FUNCTION Push;                              { oc²a¢¿ e«e¬e­² ¢ c²eªa     }
BEGIN { Push }
  IF Top >= Max THEN               { Maªc¨a«e­ ¡po© ­a e«e¬e­²¨²e ¢ c²eªa }
    Push := FALSE
  ELSE
    BEGIN
      Top  := Top + 1;     Stack_data[Top] := Numb;     Push := TRUE
    END
END { Push };
{-------------------------------------------------------------------------}
FUNCTION Pop;                               { ˆ§¢«¨·a e«e¬e­² o² c²eªa    }
BEGIN { Pop }
  IF Top <= 0 THEN
    Pop := FALSE
  ELSE
    BEGIN
      Numb := Stack_data[Top];     Top := Top - 1;      Pop  := TRUE
    END
END { Pop };
{-------------------------------------------------------------------------}
PROCEDURE Init_stack;                       { ˆ­¨¶¨a«¨§¨pa c²eªa          }
BEGIN { Init_stack }
  Top := 0
END { Init_stack };
{-------------------------------------------------------------------------}
BEGIN { R_stack }
  Init_stack
END. { R_stack }
{-------------------------------------------------------------------------}
