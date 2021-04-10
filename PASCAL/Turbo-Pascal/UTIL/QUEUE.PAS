{--------------------------------------------------------------------------}
UNIT Queue;                       { Mo¤³« §a ³¯pa¢«e­¨e ­a c¢ºp§a­¨ o¯a¸ª¨ }
INTERFACE                         {----------------------------------------}
{$DEFINE Real_queue }          { Hac²po©¢a ¬o¤³«a §a pa¡o²  c pea«­¨ ¤a­­¨ }
  TYPE
{$IFDEF Real_queue } Queue_data = REAL;        { T¨¯ ­a ¤a­­¨²e ¢ o¯a¸ªa²a }
{$ELSE }             Queue_data = INTEGER;
{$ENDIF }
       Queue_pointer = ^Queue_obj;                 { “ªa§a²e« ªº¬ o¯a¸ªa²a }
       Q_pointer = ^Queue_node;           { “ªa§a²e« ªº¬ ¢º§e« o² o¯a¸ªa²a }
       Queue_obj =                                       { T¨¯ ­a o¯a¸ªa²a }
         RECORD                                   { „ecªp¨¯²op ­a o¯a¸ªa²a }
           First : Q_pointer;      { “ªa§a²e« ªº¬ ¯ºp¢¨¿ ¢º§e« o² o¯a¸ªa²a }
           Last  : Q_pointer    { “ªa§a²e« ªº¬ ¯oc«e¤­¨¿ ¢º§e« o² o¯a¸ªa²a }
         END;
       Queue_node =                             { T¨¯ ­a ¢º§e« o² o¯a¸ªa²a }
         RECORD
           Data : Queue_data;        { o«e §a ¤a­­¨ ¢º¢ ¢º§e« ®² o¯a¸ªa²a }
           Next : Q_pointer                 { “ªa§a²e« ªº¬ c«e¤¢a¹¨¿ ¢º§e« }
         END;
{--------------------------------------------------------------------------}
FUNCTION Put_in_queue                         { oc²a¢¿ e«e¬e­² ¢ o¯a¸ªa²a }
         (Node_data : Queue_data;            { „a­­¨, ¯oc²a¢¿­¨ ¢ o¯a¸ªa²a }
          Q         : Queue_pointer                               { O¯a¸ªa }
            ) : BOOLEAN;         { TRUE  - e«e¬e­²º² e ¯oc²a¢e­ ¢ o¯a¸ªa²a }
                                 { FALSE - ­¿¬a ¬¿c²o ¢ ¯a¬e²²a            }
{--------------------------------------------------------------------------}
FUNCTION Get_from_queue                      { ˆ§¢«¨·a e«e¬e­² o² o¯a¸ªa²a }
           (VAR Node_data : Queue_data;      { ˆ§¢«e·e­¨ o² o¯a¸ªa²a ¤a­­¨ }
            Q             : Queue_pointer                         { O¯a¸ªa }
           ) : BOOLEAN;         { TRUE  - e«e¬e­²º² e ¨§¢«e·e­ o² o¯a¸ªa²a }
                                { FALSE - ­¿¬a e«e¬e­²¨ ¢ o¯a¸ªa²a         }
{--------------------------------------------------------------------------}
FUNCTION Init_queue                                { ˆ­¨¶¨a«¨§¨pa o¯a¸ªa²a }
         (VAR Q : Queue_pointer                                   { O¯a¸ªa }
         ): BOOLEAN;             { TRUE  - ®¯a¸ªa²a e cº§¤a¤e­a            }
                                 { FALSE - ­¿¬a ¬¿c²o ¢ ¯a¬e²²a            }
{--------------------------------------------------------------------------}
IMPLEMENTATION
FUNCTION Put_in_queue;                        { oc²a¢¿ e«e¬e­² ¢ o¯a¸ªa²a }
  VAR P : Q_pointer;
BEGIN { Put_in_queue }
  IF MaxAvail > SizeOf (Queue_node) THEN       { ˆ¬a «¨ ¤oc²a²º·­o ¬¿c²o ? }
    BEGIN
      NEW (P);              { Pe§ep¢¨pa ce ¯a¬e² §a e¤¨­ ¢º§e« o² o¯a¸ªa²a }
      P^.Data := Node_data;            { „a­­¨²e ce §a¯¨c¢a² ¢ ­o¢¨¿ ¢º§e« }
      P^.Next := NIL;
      WITH Q^ DO
        BEGIN
          IF First = NIL THEN                   { B o¯a¸ªa²a ­¿¬a e«e¬e­²¨ }
            First := P
          ELSE                  { C¢ºp§¢a ­o¢¨¿ ¢º§e« ªº¬ ªpa¿ ­a o¯a¸ªa²a }
            Last^.Next := P;
          Last := P;
          Put_in_queue := TRUE      { Ho¢¨²e ¤a­­¨ ca ¯oc²º¯¨«¨ ¢ o¯a¸ªa²a }
        END
    END
  ELSE             { ƒpe¸ªa - ­¿¬a ¤oc²a²º·­o ¬¿c²o ¢ ¯a¬e²²a §a ­o¢ ¢º§e« }
    Put_in_queue := FALSE
END { Put_in_queue };
{--------------------------------------------------------------------------}
FUNCTION Get_from_queue;                     { ˆ§¢«¨·a e«e¬e­² o² o¯a¸ªa²a }
  VAR P: Q_pointer;
BEGIN  { Get_from_queue }
  WITH Q^ DO
    IF First <> NIL THEN                      { ˆ¬a «¨ e«e¬e­² ¢ o¯a¸ªa²a? }
      BEGIN   Node_data := First^.Data;                  { ˆ§¢«¨·a ¤a­­¨²e }
        P := First;             { O²¤e«¿ ¢º§e«a o² c²p³ª²³pa²a ­a o¯a¸ªa²a }
        First := First^.Next;
        DISPOSE (P);                 { Oc¢o¡o¦¤a¢a §ae²a²a o² ¢º§e«a ¯a¬e² }
        Get_from_queue := TRUE  { „a­­¨²e ³c¯e¸­o ca ¨§¢«e·e­¨ o² o¯a¸ªa²a }
      END
    ELSE                               { ƒpe¸ªa - ¢ o¯a¸ªa²a ­¿¬a e«e¬e­²¨ }
      Get_from_queue := FALSE
END { Get_from_queue };
{--------------------------------------------------------------------------}
FUNCTION Init_queue;                               { ˆ­¨¶¨a«¨§¨pa o¯a¸ªa²a }
BEGIN { Init_queue }
  IF MaxAvail > SizeOf (Queue_obj) THEN
    BEGIN     NEW (Q);
      Q^.First := NIL;     Q^.Last := NIL;     Init_queue := TRUE
    END
  ELSE                                     { ƒpe¸ªa - ­¿¬a ¬¿c²o ¢ ¯a¬e²²a }
    Init_queue := FALSE
END { Init_queue };
END { Queue }.
{--------------------------------------------------------------------------}
