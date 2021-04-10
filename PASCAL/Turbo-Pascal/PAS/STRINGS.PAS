{--------------------------------------------------------------------------}
UNIT Strings;               { Moд│л зa │пpaвлeниe нa cимвoлни низoвe       }
INTERFACE                   {----------------------------------------------}
FUNCTION Adj_right_string               { Изpaвн┐вa cимвoлeн низ o▓д┐cнo   }
         (In_string : String;           { Bxoдeн cимвoлeн низ              }
          Len       : BYTE              { Иcкaнa д║лжинa                   }
          ) : String;                   { Изpaвнeн cимвoлeн низ            }
{--------------------------------------------------------------------------}
FUNCTION Center_string                  { Цeн▓pиpa cимвoлeн низ            }
         (S         : String;           { Bxoдeн cимвoлeн низ              }
          To_length : BYTE              { Иcкaнa д║лжинa                   }
          ) : String;                   { Цeн▓pиpaн cимвoлeн низ           }
{--------------------------------------------------------------------------}
FUNCTION Integer_to_string         { Пpeoбpaз│вa ╢┐л изpaз в cимвoлeн низ  }
         (Intg     : INTEGER;           { Ц┐л изpaз                        }
          Width    : BYTE               { Д║лжинa нa cимвoлни┐ низ         }
          ): String;          { Пoл│╖eн cлeд пpeoбpaз│вaнe▓о cимвoлeн низ  }
{--------------------------------------------------------------------------}
FUNCTION Float_to_string      { Пpeoбpaз│вa peaлeн изpaз в cимвoлeн низ    }
         (Real_numb : REAL;              { Peaлeн изpaз                    }
          Width     : BYTE               { Д║лжинa нa cимвoлни┐ низ        }
          ): String;          { Пoл│╖eн cлeд пpeoбpaз│вaнe▓о cимвoлeн низ  }
{--------------------------------------------------------------------------}
FUNCTION Fixed_to_string      { Пpeoбpaз│вa peaлeн изpaз в cимвoлeн низ c  }
                              { дece▓и╖eн ┤opмa▓                           }
         (Real_numb    : REAL; { Peaлeн изpaз                              }
          Width, Dec_p : BYTE { Д║лжинa нa пoлe▓o и дpoбнa▓a м│ ╖ac▓       }
          ): String;          { Пoл│╖eн cлeд пpeoбpaз│вaнe▓о cимвoлeн низ  }
{--------------------------------------------------------------------------}
PROCEDURE Prefix               { O▓c▓paн┐вa o▓ cимвoлни┐ низ S нa╖aлни     }
          (VAR S: STRING;      { cимвoлa, paвни нa cимвoлa C               }
               C: CHAR);
{--------------------------------------------------------------------------}
PROCEDURE Suffix               { O▓c▓paн┐вa o▓ cимвoлни┐ низ S пocлeдни    }
          (VAR S: STRING;      { cимвoлa, paвни нa cимвoлa C               }
               C: CHAR);
{--------------------------------------------------------------------------}
FUNCTION Up_case               { Пpeoбpaз│вa мaлки в глaвни б│кви (MIK)    }
         (Ch : CHAR            { Bxoдeн cимвoл /киpили╢a или лa▓ини╢a/     }
         ) : CHAR;             { Пpeoбpaз│вaн cимвoл                       }
{--------------------------------------------------------------------------}
IMPLEMENTATION
FUNCTION Adj_right_string;           { Изpaвн┐вa o▓д┐cнo cимвoлeн низ /CH  }
BEGIN { Adj_right_string }
  IF LENGTH(In_string) > Len THEN       { Aкo д║лжинa▓a нa CH e пo-гoл┐мa  }
    DELETE(In_string, SUCC(Len), LENGTH(In_string)-Len)  { CH ce o▓p┐звa   }
  ELSE
    WHILE LENGTH(In_string) < Len DO    { Aкo д║лжинa▓a нa CH e пo-мaлкa   }
      In_string := In_string + ' ';   { CH ce дoп║лвa o▓д┐cнo c ин▓epвaли  }
  Adj_right_string := In_string;
END { Adj_right_string } ;
{--------------------------------------------------------------------------}
FUNCTION Center_string;                 { Цeн▓pиpa cимвoлeн низ            }
  VAR Counter : INTEGER;
BEGIN { Center_string }
  FOR Counter := 1 TO (To_length - LENGTH(S)) DIV 2 DO
    S := ' ' + S + ' ';
  Center_string := Adj_right_string (S,To_length);
END { Center_string } ;
{--------------------------------------------------------------------------}
FUNCTION Integer_to_string;        { Пpeoбpaз│вa ╢┐л изpaз в cимвoлeн низ  }
  VAR Work_string : STRING;
BEGIN { Integer_to_string }
  STR (Intg: Width, Work_String);
  Integer_to_string := Work_string;
END { Integer_to_string };
{--------------------------------------------------------------------------}
FUNCTION Float_to_string;     { Пpeoбpaз│вa peaлeн изpaз в cимвoлeн низ    }
  VAR Work_string : STRING;
BEGIN { Real_to_string }
  STR (Real_numb: Width, Work_String);
  Float_to_string := Work_string;
END { Real_to_string };
{--------------------------------------------------------------------------}
FUNCTION Fixed_to_string;     { Пpeoбpaз│вa peaлeн изpaз в cимвoлeн низ c  }
                              { дece▓и╖eн ┤opмa▓                           }
  VAR Work_string : STRING;
BEGIN { Real_to_string }
  STR (Real_numb:Width:Dec_p, Work_String);
  Fixed_to_string := Work_string;
END { Real_to_string };
{--------------------------------------------------------------------------}
PROCEDURE Prefix;              { O▓c▓paн┐вa o▓ cимвoлни┐ низ S нa╖aлни     }
BEGIN  { Prefix }              { cимвoли, paвни нa cимвoлa C               }
  WHILE (S[1] = C) AND (LENGTH(S) > 0) DO
    S := COPY(S,2,LENGTH(S)-1);
END { Prefix };
{--------------------------------------------------------------------------}
PROCEDURE Suffix;              { O▓c▓paн┐вa o▓ cимвoлни┐ низ S пocлeдни    }
BEGIN  { Suffix }              { cимвoли, paвни нa cимвoлa C               }
  WHILE (S[LENGTH(S)] = C) AND (LENGTH(S) > 0) DO
    S := COPY(S,1,LENGTH(S)-1);
END { Suffix };
{--------------------------------------------------------------------------}
FUNCTION Up_case;              { Пpeoбpaз│вa мaлки в гoлeми б│кви (MIK)    }
BEGIN { Up_case }
  IF Ch IN ['a'..'z', 'а'..'┐'] THEN
    Up_case := CHR(ORD(Ch) - 32)
  ELSE
    Up_case := Ch
END { Up_case };
END.
{--------------------------------------------------------------------------}
