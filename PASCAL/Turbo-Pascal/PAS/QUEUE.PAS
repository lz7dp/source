{--------------------------------------------------------------------------}
UNIT Queue;                       { Mo��� �a ��pa��e��e �a c��p�a�� o�a��� }
INTERFACE                         {----------------------------------------}
{$DEFINE Real_queue }          { Hac�po��a �o���a �a pa�o�� c pea��� �a��� }
  TYPE
{$IFDEF Real_queue } Queue_data = REAL;        { T�� �a �a����e � o�a��a�a }
{$ELSE }             Queue_data = INTEGER;
{$ENDIF }
       Queue_pointer = ^Queue_obj;                 { ��a�a�e� ��� o�a��a�a }
       Q_pointer = ^Queue_node;           { ��a�a�e� ��� ���e� o� o�a��a�a }
       Queue_obj =                                       { T�� �a o�a��a�a }
         RECORD                                   { �ec�p���op �a o�a��a�a }
           First : Q_pointer;      { ��a�a�e� ��� ��p��� ���e� o� o�a��a�a }
           Last  : Q_pointer    { ��a�a�e� ��� �oc�e���� ���e� o� o�a��a�a }
         END;
       Queue_node =                             { T�� �a ���e� o� o�a��a�a }
         RECORD
           Data : Queue_data;        { �o�e �a �a��� ��� ���e� �� o�a��a�a }
           Next : Q_pointer                 { ��a�a�e� ��� c�e��a��� ���e� }
         END;
{--------------------------------------------------------------------------}
FUNCTION Put_in_queue                         { �oc�a�� e�e�e�� � o�a��a�a }
         (Node_data : Queue_data;            { �a���, �oc�a���� � o�a��a�a }
          Q         : Queue_pointer                               { O�a��a }
            ) : BOOLEAN;         { TRUE  - e�e�e���� e �oc�a�e� � o�a��a�a }
                                 { FALSE - ���a ��c�o � �a�e��a            }
{--------------------------------------------------------------------------}
FUNCTION Get_from_queue                      { ������a e�e�e�� o� o�a��a�a }
           (VAR Node_data : Queue_data;      { ����e�e�� o� o�a��a�a �a��� }
            Q             : Queue_pointer                         { O�a��a }
           ) : BOOLEAN;         { TRUE  - e�e�e���� e ����e�e� o� o�a��a�a }
                                { FALSE - ���a e�e�e��� � o�a��a�a         }
{--------------------------------------------------------------------------}
FUNCTION Init_queue                                { �����a����pa o�a��a�a }
         (VAR Q : Queue_pointer                                   { O�a��a }
         ): BOOLEAN;             { TRUE  - ��a��a�a e c���a�e�a            }
                                 { FALSE - ���a ��c�o � �a�e��a            }
{--------------------------------------------------------------------------}
IMPLEMENTATION
FUNCTION Put_in_queue;                        { �oc�a�� e�e�e�� � o�a��a�a }
  VAR P : Q_pointer;
BEGIN { Put_in_queue }
  IF MaxAvail > SizeOf (Queue_node) THEN       { ��a �� �oc�a����o ��c�o ? }
    BEGIN
      NEW (P);              { Pe�ep��pa ce �a�e� �a e��� ���e� o� o�a��a�a }
      P^.Data := Node_data;            { �a����e ce �a��c�a� � �o��� ���e� }
      P^.Next := NIL;
      WITH Q^ DO
        BEGIN
          IF First = NIL THEN                   { B o�a��a�a ���a e�e�e��� }
            First := P
          ELSE                  { C��p��a �o��� ���e� ��� �pa� �a o�a��a�a }
            Last^.Next := P;
          Last := P;
          Put_in_queue := TRUE      { Ho���e �a��� ca �oc������ � o�a��a�a }
        END
    END
  ELSE             { �pe��a - ���a �oc�a����o ��c�o � �a�e��a �a �o� ���e� }
    Put_in_queue := FALSE
END { Put_in_queue };
{--------------------------------------------------------------------------}
FUNCTION Get_from_queue;                     { ������a e�e�e�� o� o�a��a�a }
  VAR P: Q_pointer;
BEGIN  { Get_from_queue }
  WITH Q^ DO
    IF First <> NIL THEN                      { ��a �� e�e�e�� � o�a��a�a? }
      BEGIN   Node_data := First^.Data;                  { ������a �a����e }
        P := First;             { O��e�� ���e�a o� c�p����pa�a �a o�a��a�a }
        First := First^.Next;
        DISPOSE (P);                 { Oc�o�o��a�a �ae�a�a o� ���e�a �a�e� }
        Get_from_queue := TRUE  { �a����e �c�e��o ca ����e�e�� o� o�a��a�a }
      END
    ELSE                               { �pe��a - � o�a��a�a ���a e�e�e��� }
      Get_from_queue := FALSE
END { Get_from_queue };
{--------------------------------------------------------------------------}
FUNCTION Init_queue;                               { �����a����pa o�a��a�a }
BEGIN { Init_queue }
  IF MaxAvail > SizeOf (Queue_obj) THEN
    BEGIN     NEW (Q);
      Q^.First := NIL;     Q^.Last := NIL;     Init_queue := TRUE
    END
  ELSE                                     { �pe��a - ���a ��c�o � �a�e��a }
    Init_queue := FALSE
END { Init_queue };
END { Queue }.
{--------------------------------------------------------------------------}
