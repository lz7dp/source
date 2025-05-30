{--------------------------------------------------------------------------}
UNIT O_stacks;          { Mo��� �a ��pa��e��e �a �������� �������, � ����� }
INTERFACE               { �� �������� �������� ������ o�e���               }
  USES Nodes, C_lists;  {--------------------------------------------------}
  TYPE   O_Stack_ptr = ^O_stack;          { ��a�a�e� ��� o�e��-c�e�        }
  O_Stack =    { B c�e�a �o�a� �a ce �oc�a��� e�e�e��� c ���o�e, �ac�e���� }
    OBJECT (C_list)                       { ���a Node, �������e��o c�e�o�e }
      Number : INTEGER;                   { �po� �a e�e�e����e � c�e�a     }
      CONSTRUCTOR Init;                          { C���a�a o�e��-c�e�      }
      PROCEDURE Push (N: Node_ptr);              { �oc�a�� e�e�e�� � c�e�  }
      FUNCTION Pop (VAR N: Node_ptr): BOOLEAN;   { ������a e�e�e�� o� c�e� }
      FUNCTION Size: INTEGER            { Bp��a �po� �a e�e�e����e � c�e�a }
    END;
  {------------------------------------------------------------------------}
IMPLEMENTATION
  CONSTRUCTOR O_stack.Init;                                { C���a�a c�e�a }
  BEGIN { Init }
    C_list.Init;        Number :=0
  END { Init };
  {------------------------------------------------------------------------}
  PROCEDURE O_stack.Push                         { �oc�a�� e�e�e�� � c�e�a }
            (N :  Node_ptr);
  BEGIN { Push }
    Number := Number+1;        Append (N)
  END { Push };
  {------------------------------------------------------------------------}
  FUNCTION O_stack.Pop                          { ������a e�e�e�� o� c�e�a }
           (VAR N :  Node_ptr
            ): BOOLEAN;
  BEGIN { Pop }
    IF Empty THEN
      Pop := FALSE
    ELSE
      BEGIN   N := Last;        Number := Number - 1;
        Delete (N);             Pop := TRUE
      END
  END { Pop };
  {------------------------------------------------------------------------}
  FUNCTION O_stack.Size ;               { Bp��a �po� �a e�e�e����e � c�e�a }
  BEGIN { Size }
    Size := Number
  END { Size };
END { O_stacks }.
{--------------------------------------------------------------------------}
