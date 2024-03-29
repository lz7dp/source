{--------------------------------------------------------------------------}
{                      Ma��� �a�po�po�ecop                                 }
{    �e����pa�e �a �a�poc�: #DEF ��e_�a_�a�poca C�o��oc�                   }
{        ��e�o �a �a�poca �p���a �a ���e ��e������a�op                     }
{        C�o��oc��a e �po���o�e� c���o�e� ��� (�o �pa� �a pe�a)            }
{    �e�c���e: Ma�po�po�ecop�� o�xo��a �xo����e �a��o�e � �a�ec��a ��e�o   }
{              �a �a�poca c �e�o�a�a c�o��oc�                              }
{    ������a�e: C_macro Bxo���_�a��o�e ��xo�e�_�a��                        }
{              Bxo����e � ��xo����e �a��o�e ca pa��e�e�� c ���ep�a��       }
{--------------------------------------------------------------------------}
PROGRAM C_macro;
  USES Strings, AVLtrees;
  TYPE Key_string = STRING[20];
  VAR  Key : Key_string;
{--------------------------------------------------------------------------}
{$F+}       { �������, �e����pa�a o�epa����a cpa����a�e �a c���o��� ���o�e }
  FUNCTION Compare_string
           (VAR X,Y                               { K���o�e                }
           ) : Compare;                           { Pe����a� LT, EQ ��� GT }
    VAR Xs : Key_string ABSOLUTE X;
        Ys : Key_string ABSOLUTE Y;
  BEGIN { Compare_string }
    IF Xs < Ys THEN Compare_string := LT
    ELSE
      IF Xs = Ys THEN  Compare_string := EQ
      ELSE  Compare_string := GT
  END { Compare_string };
{$F-   --------------------------------------------------------------------}
PROCEDURE Small_macro;                           { T��o �a �a�po�po�ecopa  }
  VAR Root     : AVL_tree;
      Files, I : BYTE;
      Inp,Out  : TEXT;
  {------------------------------------------------------------------------}
  PROCEDURE Error (Message:STRING);    { �po�e��pa, ���op��pa�a �a ���a �a }
  BEGIN { Error }                      {�pe��a�a � �pe�c�a�o���a�a pa�o�a�a}
    WRITELN (Message);   CLOSE (Out);   HALT
  END { Error };
 {-------------------------------------------------------------------------}
  PROCEDURE Get_next_ident       { ������a o� Line �  pa��o�a�a � Result   }
                       { �c���� c���o��, �o��o �pe��ec����a� ��e������a�op,}
                       { ���� �a���� ��e������a�op ce �a��c�a � Name       }
            (VAR Result : STRING;
             VAR Name   : Key_string;
             VAR Line   : STRING);
    VAR I         : BYTE;
        Not_found : BOOLEAN;
  BEGIN { Get_next_ident };
    I := 0;      Name := '';          Not_found := TRUE;
    WHILE (I < LENGTH(LINE)) AND Not_found DO
      BEGIN
        I := I + 1;
        IF Line[I] IN ['A'..'Z', 'a'..'z','_'] THEN
          BEGIN
            REPEAT    Name  := Name + Line[I];   I := I + 1;
            UNTIL NOT (Line[I] IN ['A'..'Z', 'a'..'z','_','0'..'9'])
                   OR (I >  LENGTH (Line));
            Not_found := FALSE;
            I := I - 1
          END
        ELSE
          Result := Result + Line[I]
      END { While };
    DELETE (Line,1,I)
  END { Get_next_ident };
  {------------------------------------------------------------------------}
  PROCEDURE Replace_macro                       { O�pa�o��a e��� pe�       }
            (VAR Result : STRING;               { O�pa�o�e���� �������� ���}
             VAR Line   : STRING);              { ��xo�e� ���              }
    VAR Name  : Key_string;    Found : STRING;        Rept  : BYTE;
  BEGIN  { Replace_macro }  Rept := 0;
    WHILE LENGTH(Line) > 0 DO
      BEGIN
        Get_next_ident (Result, Name, Line);
        IF AVL_search_node (Root, Name, Found) THEN
          Line := Found + Line
        ELSE
          Result := Result + Name;
        Rept := Rept + 1;
        IF Rept > 100 THEN Error (' Pe��pc���o o�p��a�e ��� �a�poc ');
      END { While }
  END { Replace_macro };
  {------------------------------------------------------------------------}
  PROCEDURE Process_file;             { O�pa�o��a �ope���� �xo�e� �a��     }
    CONST Define = '#DEF ';
    VAR Line  : STRING;               Result: STRING;
        Name  : Key_string;           Posit : BYTE;
        Bool  : BOOLEAN;
  BEGIN  { Process_file }
    WHILE NOT EOF(Inp) DO
      BEGIN   READLN (Inp,Line);
        IF COPY (Line,1,5) = Define THEN
          BEGIN                         { Pa��o��a�a e �e������� �a �a�poc }
            DELETE (Line,1,5);          { O�c�pa���a ��p���e �e� c���o�a   }
            Prefix (Line, ' ');         { O�c�pa���a c���o��-���ep�a��     }
            Posit := POS(' ',Line);     { O��e�� ��e�o �a �a�poca          }
            IF Posit > 0 THEN
              BEGIN                     { �a��c�a ����� � Name             }
                Name := COPY (Line, 1, Posit-1);  DELETE (Line, 1, Posit);
                          { B����a �o�a�a �e������� � ��p�o�o �a �a�poc��e }
                IF NOT AVL_insert_node (Root, Name, Line)THEN
                  BEGIN   { O�c�pa���a c�apa�a � �����a �o�a�a �e�������   }
                    Bool := AVL_delete_node (Root, Name) ;
                    Bool := AVL_insert_node (Root, Name, Line)
                  END
              END
          END
        ELSE
          BEGIN  Result := '';       { O�pa�o��a pe�, �a�ec��a��� �a�poc��e}
            Replace_macro (Result,Line);
            WRITELN (Out, Result)    { O�pa�o�e���� pe� ce �a��c�a         }
          END
      END
  END { Process_file };
{--------------------------------------------------------------------------}
BEGIN { Small_macro }              { C���a�a ce o�e�� - ��o���o ��p�o      }
  AVL_init (Root, AVL_Null_proc, AVL_Null_del, Compare_string,
           SizeOf(Key_string),SizeOf(STRING));
  Files := ParamCount;             { O�pe�e�� �po� �� �apa�e�p��e          }
  IF Files > 1 THEN
    BEGIN   ASSIGN (Out, ParamStr(Files));  { O��ap� ��xo���� �a��         }
      {$I-} REWRITE (Out); {$I+}
      IF IORESULT <> 0 THEN Error('�pe��a � ��xo���� �a��');
      FOR I := 1 TO PRED(Files) DO
        BEGIN  ASSIGN (Inp, ParamStr(I));
          {$I-} RESET (Inp); {$I+}
          IF IORESULT <> 0 THEN Error('�pe��a � �xo���� �a��');
          Process_file;              { O�pa�o��a �a �ope���� �xo�e� �a��   }
          CLOSE (Inp)
        END;
      CLOSE (Out)
    END
  ELSE
    Error ('�pe��a � �apa�e�p��e')
END { Small_macro };
{--------------------------------------------------------------------------}
BEGIN { C_macro }
  Small_macro
END { C_macro }.
{--------------------------------------------------------------------------}
