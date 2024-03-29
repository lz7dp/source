{--------------------------------------------------------------------------}
{$F+ Tpa�c��pa �o���a �o "����� �o�e�" ------------------------------------}
UNIT Z_stack;                { Mo��� �a ��pa��e��e �a c��p�a�� c�e�o�e     }
INTERFACE                    {---------------------------------------------}
  TYPE Stack = POINTER;
       Stack_operation = FUNCTION (VAR Data; S: Stack):BOOLEAN;
  PROCEDURE Create_stack                                    { C���a�a c�e� }
            ( VAR S           : Stack;    { C�e��� �a�o c�p����pa o� �a��� }
              Number_of_bytes : WORD;     { Pa��ep �a e�e�e�� o� c�e�a     }
              VAR Push_stack  : Stack_operation;   { �oc�a���e �a e�e�e��  }
              VAR Pop_stack   : Stack_operation    { ������a�e �a e�e�e��  }
             );
{--------------------------------------------------------------------------}
IMPLEMENTATION                   { Mo��� �a ��pa��e��e �a c��p�a�� c�e�o�e }
  TYPE Stack_root_pointer = ^Stack_root;     { ��a�a�e� ��� c�e�a-o�e��    }
       Stack_pointer = ^Stack_node;          { ��a�a�e� ��� ���e� o� c�e�a }
       Stack_root =                          { �ec�p���op �a c�e�a              }
         RECORD
           Next : Stack_pointer;          { ��a�a�e� ��� �oc�e���� e�e�e�� }
           Size : WORD                    { Pa��ep �a e�e�e�� �a c�e�a     }
         END;
       Stack_node =                                { T�� �a ���e� o� c�e�a }
         RECORD
           Data : POINTER;          { ��a�a�e� �a �a��� ��� ���e� o� c�e�a }
           Next : Stack_pointer             { ��a�a�e� ��� c�e��a��� ���e� }
         END;
{--------------------------------------------------------------------------}
FUNCTION Push_in                                  { �oc��� e�e�e�� � c�e�a }
         (VAR Node_data ;                       { �a���, �oc�a���� � c�e�a }
              S : Stack                                             { C�e� }
         ) : BOOLEAN;               { TRUE  - e�e�e���� e �oc�a�e� � c�e�a }
                                    { FALSE - ���a ��c�o � �a�e��a         }
  VAR P  : Stack_pointer;
      St : Stack_root_pointer ABSOLUTE S;  { St � S ca pa��o�o�e�� ��px�   }
BEGIN { Push_in }                          { e��� � c��� o�e� �a�e�        }
  WITH St^ DO
    IF MaxAvail > Size+SizeOf(Stack_node) THEN  { ��a �� �oc�a����o ��c�o ?}
      BEGIN
        NEW(P);                { Pe�ep��pa ce �a�e� �a e��� ���e� o� c�e�a }
        GetMem(P^.Data, Size);   { Pe�ep��pa ce �a�e� �a �a����e o� c�e�a  }
        MOVE (Node_data, P^.Data^, Size);{�a����e ce �a��c�a� � �o��� ���e�}
        P^.Next := Next; { C��p��a�e �a �o��� ���e� � c�p����pa�a �a c�e�a }
        Next := P;  Push_in := TRUE          { O�epa����a  e �c�e��a       }
      END
    ELSE           { �pe��a - ���a �oc�a����o ��c�o � �a�e��a �a �o� ���e� }
      Push_in := FALSE
END { Push_in };
{--------------------------------------------------------------------------}
FUNCTION Pop_from                               { ������a e�e�e�� o� c�e�a }
           (VAR Node_data ;                     { ����e�e�� o� c�e�a �a��� }
                S: Stack                                            { C�e� }
           ) : BOOLEAN;            { TRUE  - e�e�e���� e ����e�e� o� c�e�a }
                                   { FALSE - ���a e�e�e��� � c�e�a         }
  VAR P  :  Stack_pointer;
      St :  Stack_root_pointer ABSOLUTE S;
BEGIN { Pop_from }
  WITH St^ DO
    IF Next <> NIL THEN                          { ��a �� e�e�e�� � c�e�a? }
      BEGIN
        MOVE (Next^.Data^,Node_data, Size);         { ������a�e �a �a����e }
        FreeMem (Next^.Data,Size);  { Oc�o�o��a�a �ae�a�a o� �a����e �a�e� }
        P := Next;                 { O��e�� ���e�a o� c�p����pa�a �a c�e�a }
        Next := Next^.Next;
        DISPOSE (P);                 { Oc�o�o��a�a �ae�a�a o� ���e�a �a�e� }
        Pop_from := TRUE    { O�epa����a "������a�e �a e�e�e��" e �c�e��a  }
      END
    ELSE                                  { �pe��a:  � c�e�a ���a e�e�e��� }
      Pop_from := FALSE
END { Pop_from };
{--------------------------------------------------------------------------}
PROCEDURE Create_stack;                               { �����a����pa c�e�a }
  VAR St:Stack_root_pointer ABSOLUTE S;
BEGIN { Create_stack }
  NEW (St);                      { Pe�ep��pa �a�e� �a �ec�p���opa �a c�e�a }
  St^.Next   := NIL;           St^.Size  := Number_of_bytes;
  Push_stack := Push_in;       Pop_stack := Pop_from;
END { Create_stack };
END { Z_stack }.
{$F- ----------------------------------------------------------------------}
