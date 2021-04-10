{--------------------------------------------------------------------------}
{$F+ Tpa­c«¨pa ¬o¤³«a ¯o "¤º«º£ ¬o¤e«" ------------------------------------}
UNIT Z_stack;                { Mo¤³« §a ³¯pa¢«e­¨e ­a c¢ºp§a­¨ c²eªo¢e     }
INTERFACE                    {---------------------------------------------}
  TYPE Stack = POINTER;
       Stack_operation = FUNCTION (VAR Data; S: Stack):BOOLEAN;
  PROCEDURE Create_stack                                    { Cº§¤a¢a c²eª }
            ( VAR S           : Stack;    { C²eªº² ªa²o c²p³ª²³pa o² ¤a­­¨ }
              Number_of_bytes : WORD;     { Pa§¬ep ­a e«e¬e­² o² c²eªa     }
              VAR Push_stack  : Stack_operation;   { oc²a¢¿­e ­a e«e¬e­²  }
              VAR Pop_stack   : Stack_operation    { ˆ§¢«¨·a­e ­a e«e¬e­²  }
             );
{--------------------------------------------------------------------------}
IMPLEMENTATION                   { Mo¤³« §a ³¯pa¢«e­¨e ­a c¢ºp§a­¨ c²eªo¢e }
  TYPE Stack_root_pointer = ^Stack_root;     { “ªa§a²e« ªº¬ c²eªa-o¡eª²    }
       Stack_pointer = ^Stack_node;          { “ªa§a²e« ªº¬ ¢º§e« o² c²eªa }
       Stack_root =                          { „ecªp¨¯²op ­a c²eªa              }
         RECORD
           Next : Stack_pointer;          { “ªa§a²e« ªº¬ ¯oc«e¤­¨¿ e«e¬e­² }
           Size : WORD                    { Pa§¬ep ­a e«e¬e­² ­a c²eªa     }
         END;
       Stack_node =                                { T¨¯ ­a ¢º§e« o² c²eªa }
         RECORD
           Data : POINTER;          { “ªa§a²e« §a ¤a­­¨ ¢º¢ ¢º§e« o² c²eªa }
           Next : Stack_pointer             { “ªa§a²e« ªº¬ c«e¤¢a¹¨¿ ¢º§e« }
         END;
{--------------------------------------------------------------------------}
FUNCTION Push_in                                  { oc²¢¿ e«e¬e­² ¢ c²eªa }
         (VAR Node_data ;                       { „a­­¨, ¯oc²a¢¿­¨ ¢ c²eªa }
              S : Stack                                             { C²eª }
         ) : BOOLEAN;               { TRUE  - e«e¬e­²º² e ¯oc²a¢e­ ¢ c²eªa }
                                    { FALSE - ­¿¬a ¬¿c²o ¢ ¯a¬e²²a         }
  VAR P  : Stack_pointer;
      St : Stack_root_pointer ABSOLUTE S;  { St ¨ S ca pa§¯o«o¦e­¨ ¢ºpx³   }
BEGIN { Push_in }                          { e¤¨­ ¨ cº¹¨ o¡e¬ ¯a¬e²        }
  WITH St^ DO
    IF MaxAvail > Size+SizeOf(Stack_node) THEN  { ˆ¬a «¨ ¤oc²a²º·­o ¬¿c²o ?}
      BEGIN
        NEW(P);                { Pe§ep¢¨pa ce ¯a¬e² §a e¤¨­ ¢º§e« o² c²eªa }
        GetMem(P^.Data, Size);   { Pe§ep¢¨pa ce ¯a¬e² §a ¤a­­¨²e o² c²eªa  }
        MOVE (Node_data, P^.Data^, Size);{„a­­¨²e ce §a¯¨c¢a² ¢ ­o¢¨¿ ¢º§e«}
        P^.Next := Next; { C¢ºp§¢a­e ­a ­o¢¨¿ ¢º§e« ¢ c²p³ª²³pa²a ­a c²eªa }
        Next := P;  Push_in := TRUE          { O¯epa¶¨¿²a  e ³c¯e¸­a       }
      END
    ELSE           { ƒpe¸ªa - ­¿¬a ¤oc²a²º·­o ¬¿c²o ¢ ¯a¬e²²a §a ­o¢ ¢º§e« }
      Push_in := FALSE
END { Push_in };
{--------------------------------------------------------------------------}
FUNCTION Pop_from                               { ˆ§¢«¨·a e«e¬e­² o² c²eªa }
           (VAR Node_data ;                     { ˆ§¢«e·e­¨ o² c²eªa ¤a­­¨ }
                S: Stack                                            { C²eª }
           ) : BOOLEAN;            { TRUE  - e«e¬e­²º² e ¨§¢«e·e­ o² c²eªa }
                                   { FALSE - ­¿¬a e«e¬e­²¨ ¢ c²eªa         }
  VAR P  :  Stack_pointer;
      St :  Stack_root_pointer ABSOLUTE S;
BEGIN { Pop_from }
  WITH St^ DO
    IF Next <> NIL THEN                          { ˆ¬a «¨ e«e¬e­² ¢ c²eªa? }
      BEGIN
        MOVE (Next^.Data^,Node_data, Size);         { ˆ§¢«¨·a­e ­a ¤a­­¨²e }
        FreeMem (Next^.Data,Size);  { Oc¢o¡o¦¤a¢a §ae²a²a o² ¤a­­¨²e ¯a¬e² }
        P := Next;                 { O²¤e«¿ ¢º§e«a o² c²p³ª²³pa²a ­a c²eªa }
        Next := Next^.Next;
        DISPOSE (P);                 { Oc¢o¡o¦¤a¢a §ae²a²a o² ¢º§e«a ¯a¬e² }
        Pop_from := TRUE    { O¯epa¶¨¿²a "¨§¢«¨·a­e ­a e«e¬e­²" e ³c¯e¸­a  }
      END
    ELSE                                  { ƒpe¸ªa:  ¢ c²eªa ­¿¬a e«e¬e­²¨ }
      Pop_from := FALSE
END { Pop_from };
{--------------------------------------------------------------------------}
PROCEDURE Create_stack;                               { ˆ­¨¶¨a«¨§¨pa c²eªa }
  VAR St:Stack_root_pointer ABSOLUTE S;
BEGIN { Create_stack }
  NEW (St);                      { Pe§ep¢¨pa ¯a¬e² §a ¤ecªp¨¯²opa ­a c²eªa }
  St^.Next   := NIL;           St^.Size  := Number_of_bytes;
  Push_stack := Push_in;       Pop_stack := Pop_from;
END { Create_stack };
END { Z_stack }.
{$F- ----------------------------------------------------------------------}
