{--------------------------------------------------------------------------}
{                      Ma«ºª ¬aªpo¯po¶ecop                                 }
{    „e´¨­¨pa­e ­a ¬aªpoc¨: #DEF ˆ¬e_­a_¬aªpoca C²o©­oc²                   }
{        ˆ¬e²o ­a ¬aªpoca ²p¿¡¢a ¤a ¡º¤e ¨¤e­²¨´¨ªa²op                     }
{        C²o©­oc²²a e ¯po¨§¢o«e­ c¨¬¢o«e­ ­¨§ (¤o ªpa¿ ­a pe¤a)            }
{    „e©c²¢¨e: Maªpo¯po¶ecopº² o¡xo¦¤a ¢xo¤­¨²e ´a©«o¢e ¨ §a¬ec²¢a ¨¬e²o   }
{              ­a ¬aªpoca c ­e£o¢a²a c²o©­oc²                              }
{    ˆ§¢¨ª¢a­e: C_macro Bxo¤­¨_´a©«o¢e ˆ§xo¤e­_´a©«                        }
{              Bxo¤­¨²e ¨ ¨§xo¤­¨²e ´a©«o¢e ca pa§¤e«e­¨ c ¨­²ep¢a«¨       }
{--------------------------------------------------------------------------}
PROGRAM C_macro;
  USES Strings, AVLtrees;
  TYPE Key_string = STRING[20];
  VAR  Key : Key_string;
{--------------------------------------------------------------------------}
{$F+}       { ”³­ª¶¨¿, ¤e´¨­¨pa¹a o¯epa¶¨¿²a cpa¢­¿¢a­e ­a c¨¬¢o«­¨ ­¨§o¢e }
  FUNCTION Compare_string
           (VAR X,Y                               { K«¾·o¢e                }
           ) : Compare;                           { Pe§³«²a² LT, EQ ¨«¨ GT }
    VAR Xs : Key_string ABSOLUTE X;
        Ys : Key_string ABSOLUTE Y;
  BEGIN { Compare_string }
    IF Xs < Ys THEN Compare_string := LT
    ELSE
      IF Xs = Ys THEN  Compare_string := EQ
      ELSE  Compare_string := GT
  END { Compare_string };
{$F-   --------------------------------------------------------------------}
PROCEDURE Small_macro;                           { T¿«o ­a ¬aªpo¯po¶ecopa  }
  VAR Root     : AVL_tree;
      Files, I : BYTE;
      Inp,Out  : TEXT;
  {------------------------------------------------------------------------}
  PROCEDURE Error (Message:STRING);    { po¶e¤³pa, ¨­´op¬¨pa¹a §a ²¨¯a ­a }
  BEGIN { Error }                      {£pe¸ªa²a ¨ ¯pe³c²a­o¢¿¢a¹a pa¡o²a²a}
    WRITELN (Message);   CLOSE (Out);   HALT
  END { Error };
 {-------------------------------------------------------------------------}
  PROCEDURE Get_next_ident       { ˆ§¢«¨·a o² Line ¨  pa§¯o«a£a ¢ Result   }
                       { ¢c¨·ª¨ c¨¬¢o«¨, ªo¨²o ¯pe¤¸ec²¢³¢a² ¨¤e­²¨´¨ªa²op,}
                       { ª ²® ±a¬¨¿² ¨¤e­²¨´¨ªa²op ce §a¯¨c¢a ¢ Name       }
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
  PROCEDURE Replace_macro                       { O¡pa¡o²¢a e¤¨­ pe¤       }
            (VAR Result : STRING;               { O¡pa¡o²e­¨¿² ±¨¬¢®«¥­ ­¨§}
             VAR Line   : STRING);              { ˆ§xo¤e­ ­¨§              }
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
        IF Rept > 100 THEN Error (' Peª³pc¨¢­o o¡pº¹a­e ªº¬ ¬aªpoc ');
      END { While }
  END { Replace_macro };
  {------------------------------------------------------------------------}
  PROCEDURE Process_file;             { O¡pa¡o²¢a ¯ope¤­¨¿ ¢xo¤e­ ´a©«     }
    CONST Define = '#DEF ';
    VAR Line  : STRING;               Result: STRING;
        Name  : Key_string;           Posit : BYTE;
        Bool  : BOOLEAN;
  BEGIN  { Process_file }
    WHILE NOT EOF(Inp) DO
      BEGIN   READLN (Inp,Line);
        IF COPY (Line,1,5) = Define THEN
          BEGIN                         { Pa§¯o§­a²a e ¤e´¨­¨¶¨¿ ­a ¬aªpoc }
            DELETE (Line,1,5);          { O²c²pa­¿¢a ¯ºp¢¨²e ¯e² c¨¬¢o«a   }
            Prefix (Line, ' ');         { O²c²pa­¿¢a c¨¬¢o«¨-¨­²ep¢a«¨     }
            Posit := POS(' ',Line);     { O²¤e«¿ ¨¬e²o ­a ¬aªpoca          }
            IF Posit > 0 THEN
              BEGIN                     { ‡a¯¨c¢a ¨¬¥²® ¢ Name             }
                Name := COPY (Line, 1, Posit-1);  DELETE (Line, 1, Posit);
                          { B¬ºª¢a ­o¢a²a ¤e´¨­¨¶¨¿ ¢ ¤ºp¢o²o ­a ¬aªpoc¨²e }
                IF NOT AVL_insert_node (Root, Name, Line)THEN
                  BEGIN   { O²c²pa­¿¢a c²apa²a ¨ ¢¬ºª¢a ­o¢a²a ¤e´¨­¨¶¨¿   }
                    Bool := AVL_delete_node (Root, Name) ;
                    Bool := AVL_insert_node (Root, Name, Line)
                  END
              END
          END
        ELSE
          BEGIN  Result := '';       { O¡pa¡o²¢a pe¤, §a¬ec²¢a©ª¨ ¬aªpoc¨²e}
            Replace_macro (Result,Line);
            WRITELN (Out, Result)    { O¡pa¡o²e­¨¿² pe¤ ce §a¯¨c¢a         }
          END
      END
  END { Process_file };
{--------------------------------------------------------------------------}
BEGIN { Small_macro }              { Cº§¤a¢a ce o¡eª² - ¤¢o¨·­o ¤ºp¢o      }
  AVL_init (Root, AVL_Null_proc, AVL_Null_del, Compare_string,
           SizeOf(Key_string),SizeOf(STRING));
  Files := ParamCount;             { O¯pe¤e«¿ ¡po¿ ­  ¯apa¬e²p¨²e          }
  IF Files > 1 THEN
    BEGIN   ASSIGN (Out, ParamStr(Files));  { O²¢ap¿ ¨§xo¤­¨¿ ´a©«         }
      {$I-} REWRITE (Out); {$I+}
      IF IORESULT <> 0 THEN Error('ƒpe¸ªa ¢ ¨§xo¤­¨¿ ´a©«');
      FOR I := 1 TO PRED(Files) DO
        BEGIN  ASSIGN (Inp, ParamStr(I));
          {$I-} RESET (Inp); {$I+}
          IF IORESULT <> 0 THEN Error('ƒpe¸ªa ¢ ¢xo¤­¨¿ ´a©«');
          Process_file;              { O¡pa¡o²ªa ­a ¯ope¤­¨¿ ¢xo¤e­ ´a©«   }
          CLOSE (Inp)
        END;
      CLOSE (Out)
    END
  ELSE
    Error ('ƒpe¸ªa ¢ ¯apa¬e²p¨²e')
END { Small_macro };
{--------------------------------------------------------------------------}
BEGIN { C_macro }
  Small_macro
END { C_macro }.
{--------------------------------------------------------------------------}
