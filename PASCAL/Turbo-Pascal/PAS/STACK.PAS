{--------------------------------------------------------------------------}
UNIT Stack;                      { Mo��� �a ��pa��e��e �a c��p�a�� c�e�o�e }
INTERFACE                        {-----------------------------------------}
  TYPE Stack_data = REAL;                                 { T�� �a �a����e }
       Stack_pointer = ^Stack_node;          { ��a�a�e� ��� ���e� o� c�e�a }
       Stack_node =                                { T�� �a ���e� o� c�e�a }
         RECORD
           Data : Stack_data;           { �o�e �a �a��� ��� ���e� �� c�e�a }
           Next : Stack_pointer             { ��a�a�e� ��� c�e��a��� ���e� }
         END;
{--------------------------------------------------------------------------}
FUNCTION Push                                    { �oc�a�� e�e�e�� � c�e�a }
         (Node_data : Stack_data;               { �a���, �oc�a���� � c�e�a }
          VAR S     : Stack_pointer                                 { C�e� }
            ) : BOOLEAN;            { TRUE  - e�e�e���� e �oc�a�e� � c�e�a }
                                    { FALSE - ���a ��c�o � �a�e��a         }
{--------------------------------------------------------------------------}
FUNCTION Pop                                    { ������a e�e�e�� o� c�e�a }
           (VAR Node_data : Stack_data;         { ����e�e�� o� c�e�a �a��� }
            VAR S         : Stack_pointer                           { C�e� }
           ) : BOOLEAN;            { TRUE  - e�e�e���� e ����e�e� o� c�e�a }
                                   { FALSE - ���a e�e�e��� � c�e�a         }
{--------------------------------------------------------------------------}
PROCEDURE Init_stack                                  { �����a����pa c�e�a }
          (VAR S : Stack_pointer);                                  { C�e� }
{--------------------------------------------------------------------------}
IMPLEMENTATION
FUNCTION Push;                                   { �oc�a�� e�e�e�� � c�e�a }
  VAR P : Stack_pointer;
BEGIN { Push }
  IF MaxAvail > SizeOf (Stack_node) THEN       { ��a �� �oc�a����o ��c�o ? }
    BEGIN
      NEW (P);                 { Pe�ep��pa ce �a�e� �a e��� ���e� o� c�e�a }
      P^.Data := Node_data;            { �a����e ce �a��c�a� � �o��� ���e� }
      P^.Next := S;           { C��p��a �o��� ���e� � c�p����pa�a �a c�e�a }
      S := P;         Push := TRUE
    END
  ELSE             { �pe��a - ���a �oc�a����o ��c�o � �a�e��a �a �o� ���e� }
    Push := FALSE
END { Push };
{--------------------------------------------------------------------------}
FUNCTION Pop;                                   { ������a e�e�e�� o� c�e�a }
  VAR P: Stack_pointer;
BEGIN { Pop }
  IF S <> NIL THEN                               { ��a �� e�e�e�� � c�e�a? }
    BEGIN
      Node_data := S^.Data;                              { ������a �a����e }
      P := S;   S := S^.Next;      { O��e�� ���e�a o� c�p����pa�a �a c�e�a }
      DISPOSE (P);                   { Oc�o�o��a�a �ae�a�a o� ���e�a �a�e� }
      Pop := TRUE
    END
  ELSE                                    { �pe��a:  � c�e�a ���a e�e�e��� }
    Pop := FALSE
END { Pop };
{--------------------------------------------------------------------------}
PROCEDURE Init_stack;                                 { �����a����pa c�e�a }
BEGIN { Init_stack }
  S := NIL
END { Init_stack };
END { Stack }.
{--------------------------------------------------------------------------}
