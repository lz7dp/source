{--------------------------------------------------------------------------}
UNIT Strings;               { Mo��� �a ��pa��e��e �a c���o��� ���o�e       }
INTERFACE                   {----------------------------------------------}
FUNCTION Adj_right_string               { ��pa����a c���o�e� ��� o���c�o   }
         (In_string : String;           { Bxo�e� c���o�e� ���              }
          Len       : BYTE              { �c�a�a ������a                   }
          ) : String;                   { ��pa��e� c���o�e� ���            }
{--------------------------------------------------------------------------}
FUNCTION Center_string                  { �e��p�pa c���o�e� ���            }
         (S         : String;           { Bxo�e� c���o�e� ���              }
          To_length : BYTE              { �c�a�a ������a                   }
          ) : String;                   { �e��p�pa� c���o�e� ���           }
{--------------------------------------------------------------------------}
FUNCTION Integer_to_string         { �peo�pa���a ��� ��pa� � c���o�e� ���  }
         (Intg     : INTEGER;           { ��� ��pa�                        }
          Width    : BYTE               { ������a �a c���o���� ���         }
          ): String;          { �o���e� c�e� �peo�pa���a�e�� c���o�e� ���  }
{--------------------------------------------------------------------------}
FUNCTION Float_to_string      { �peo�pa���a pea�e� ��pa� � c���o�e� ���    }
         (Real_numb : REAL;              { Pea�e� ��pa�                    }
          Width     : BYTE               { ������a �a c���o���� ���        }
          ): String;          { �o���e� c�e� �peo�pa���a�e�� c���o�e� ���  }
{--------------------------------------------------------------------------}
FUNCTION Fixed_to_string      { �peo�pa���a pea�e� ��pa� � c���o�e� ��� c  }
                              { �ece���e� �op�a�                           }
         (Real_numb    : REAL; { Pea�e� ��pa�                              }
          Width, Dec_p : BYTE { ������a �a �o�e�o � �po��a�a �� �ac�       }
          ): String;          { �o���e� c�e� �peo�pa���a�e�� c���o�e� ���  }
{--------------------------------------------------------------------------}
PROCEDURE Prefix               { O�c�pa���a o� c���o���� ��� S �a�a���     }
          (VAR S: STRING;      { c���o�a, pa��� �a c���o�a C               }
               C: CHAR);
{--------------------------------------------------------------------------}
PROCEDURE Suffix               { O�c�pa���a o� c���o���� ��� S �oc�e���    }
          (VAR S: STRING;      { c���o�a, pa��� �a c���o�a C               }
               C: CHAR);
{--------------------------------------------------------------------------}
FUNCTION Up_case               { �peo�pa���a �a��� � ��a��� ����� (MIK)    }
         (Ch : CHAR            { Bxo�e� c���o� /��p����a ��� �a�����a/     }
         ) : CHAR;             { �peo�pa���a� c���o�                       }
{--------------------------------------------------------------------------}
IMPLEMENTATION
FUNCTION Adj_right_string;           { ��pa����a o���c�o c���o�e� ��� /CH  }
BEGIN { Adj_right_string }
  IF LENGTH(In_string) > Len THEN       { A�o ������a�a �a CH e �o-�o���a  }
    DELETE(In_string, SUCC(Len), LENGTH(In_string)-Len)  { CH ce o�p���a   }
  ELSE
    WHILE LENGTH(In_string) < Len DO    { A�o ������a�a �a CH e �o-�a��a   }
      In_string := In_string + ' ';   { CH ce �o����a o���c�o c ���ep�a��  }
  Adj_right_string := In_string;
END { Adj_right_string } ;
{--------------------------------------------------------------------------}
FUNCTION Center_string;                 { �e��p�pa c���o�e� ���            }
  VAR Counter : INTEGER;
BEGIN { Center_string }
  FOR Counter := 1 TO (To_length - LENGTH(S)) DIV 2 DO
    S := ' ' + S + ' ';
  Center_string := Adj_right_string (S,To_length);
END { Center_string } ;
{--------------------------------------------------------------------------}
FUNCTION Integer_to_string;        { �peo�pa���a ��� ��pa� � c���o�e� ���  }
  VAR Work_string : STRING;
BEGIN { Integer_to_string }
  STR (Intg: Width, Work_String);
  Integer_to_string := Work_string;
END { Integer_to_string };
{--------------------------------------------------------------------------}
FUNCTION Float_to_string;     { �peo�pa���a pea�e� ��pa� � c���o�e� ���    }
  VAR Work_string : STRING;
BEGIN { Real_to_string }
  STR (Real_numb: Width, Work_String);
  Float_to_string := Work_string;
END { Real_to_string };
{--------------------------------------------------------------------------}
FUNCTION Fixed_to_string;     { �peo�pa���a pea�e� ��pa� � c���o�e� ��� c  }
                              { �ece���e� �op�a�                           }
  VAR Work_string : STRING;
BEGIN { Real_to_string }
  STR (Real_numb:Width:Dec_p, Work_String);
  Fixed_to_string := Work_string;
END { Real_to_string };
{--------------------------------------------------------------------------}
PROCEDURE Prefix;              { O�c�pa���a o� c���o���� ��� S �a�a���     }
BEGIN  { Prefix }              { c���o��, pa��� �a c���o�a C               }
  WHILE (S[1] = C) AND (LENGTH(S) > 0) DO
    S := COPY(S,2,LENGTH(S)-1);
END { Prefix };
{--------------------------------------------------------------------------}
PROCEDURE Suffix;              { O�c�pa���a o� c���o���� ��� S �oc�e���    }
BEGIN  { Suffix }              { c���o��, pa��� �a c���o�a C               }
  WHILE (S[LENGTH(S)] = C) AND (LENGTH(S) > 0) DO
    S := COPY(S,1,LENGTH(S)-1);
END { Suffix };
{--------------------------------------------------------------------------}
FUNCTION Up_case;              { �peo�pa���a �a��� � �o�e�� ����� (MIK)    }
BEGIN { Up_case }
  IF Ch IN ['a'..'z', '�'..'�'] THEN
    Up_case := CHR(ORD(Ch) - 32)
  ELSE
    Up_case := Ch
END { Up_case };
END.
{--------------------------------------------------------------------------}
