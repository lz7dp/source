{--------------------------------------------------------------------------}
UNIT C_lists;  { Mo��� �a ��pa��e��e �a ������e� ������ e��oc��p�a� c��c�� }
INTERFACE      {-----------------------------------------------------------}
  USES Nodes;
TYPE    C_list_ptr = ^C_list;              { ��a�a�e� ��� o�e�� - c��c��   }
  C_list =
    OBJECT (Node)                 { ������e� e��oc��p�a� c��c��            }
      Last: Node_ptr;             { ��a�a�e� ��� �oc�e���� e�e�e��         }
      CONSTRUCTOR Init;           { C���a�a �pa�e� ������e� c��c��         }
      PROCEDURE Append            { �o�a�� �o� e�e�e�� � �pa� �a c��c��a   }
                (N: Node_ptr);
      DESTRUCTOR Done; VIRTUAL;         { ���p��a ��������� c��c��         }
      FUNCTION Empty: Boolean;          { �po�ep��a �pa�e� �� e c��c����   }
      FUNCTION First: Node_ptr;         { Bp��a ��a�a�e� ��� ��p��� e�e�e��}
      FUNCTION Next(N: Node_ptr): Node_ptr;{ ��a�a�e� ��� c�e��a��� e�e�e��}
      FUNCTION Prev(N: Node_ptr): Node_ptr;{ ��a�a�e� ��� �pe������ e�e�e��}
      PROCEDURE Delete (N: Node_ptr);   { O�c�pa���a e�e�e��a N^ o� c��c��a}
      PROCEDURE Process ; VIRTUAL         { O�xo��a e�e�e����e �a c��c��a  }
    END { C_list object };
  {------------------------------------------------------------------------}
IMPLEMENTATION
  PROCEDURE C_list.Append         { �o�a�� �o� e�e�e�� � �pa� �a c��c��a   }
            (N :  Node_ptr);      { ��a�a�e� ��� �o��� e�e�e��             }
  BEGIN { Append }
    IF Last = NIL THEN
      Last := N
    ELSE
      N^.Next_node := Last^.Next_node;
    Last^.Next_node := N;         { �o�e�o Next_node �a �oc�e���� e�e�e��  }
    Last := N                     { co�� ��� ��p��� e�e�e�� �a c��c��a     }
  END { Append };
  {------------------------------------------------------------------------}
  CONSTRUCTOR C_list.Init;        { C���a�a �pa�e� ������e� c��c��         }
  BEGIN { Init }
    Last := NIL
  END { Init };
  {------------------------------------------------------------------------}
  DESTRUCTOR C_list.Done;               { ���p��a ��������� c��c��         }
    VAR  P : Node_ptr;
  BEGIN  { Done }
    WHILE NOT Empty DO
      BEGIN   P := First;
        Delete(P);  DISPOSE(P, Done)
      END
  END { Done };
  {------------------------------------------------------------------------}
  FUNCTION C_list.Empty: BOOLEAN;       { �po�ep��a �pa�e� �� e c��c����   }
  BEGIN { Empty }
    Empty := Last = NIL
  END { Empty };
  {------------------------------------------------------------------------}
  FUNCTION C_list.First:    { Bp��a ��a�a�e� ��� ��p��� e�e�e�� �a c��c��a }
            Node_ptr;
  BEGIN { First }
    IF Last = NIL THEN
      First := NIL
    ELSE
      First := Last^.Next_node
  END { First };
  {------------------------------------------------------------------------}
  FUNCTION C_list.Next    { Bp��a ��a�a�e� ��� c�e��a��� e�e�e�� � c��c��a }
           (N: Node_ptr   { ��a�a�e� ��� e�e�e�� o� c��c��a                }
            ): Node_ptr;  { ��a�a�e� ��� c�e��a��� e�e�e�� � c��c��a       }
  BEGIN  { Next }
    IF N = Last THEN                              { E�e�e���� N e �oc�e�e� }
      Next := NIL
    ELSE
      Next := N^.Next_node
  END { Next };
  {------------------------------------------------------------------------}
  FUNCTION C_list.Prev    { Bp��a ��a�a�e� ��� �pe������ e�e�e�� � c��c��a }
           (N: Node_ptr   { ��a�a�e� ��� e�e�e�� o� c��c��a                }
            ): Node_ptr;  { ��a�a�e� ��� �pe������ e�e�e�� � c��c��a       }
    VAR P : Node_ptr;
  BEGIN { Prev }
    IF  N = First THEN                       { E�e�e���� e ��p�� � c��c��a }
      Prev := NIL
    ELSE
      BEGIN  P := First;             { O�xo��a�e �a c��c��a �o �a��pa�e �a }
        WHILE P^.Next_node <> N DO       { �pe��ec��e���a �a e�e�e��a N^   }
          P := P^.Next_node;
        Prev := P
      END
  END { Prev };
  {------------------------------------------------------------------------}
  PROCEDURE C_list.Delete              { O�c�pa���a e�e�e��a N^ o� c��c��a }
            (N: Node_ptr);             { E�e�e�� o� c��c��a                }
    VAR  P: Node_ptr;
  BEGIN { Delete }
    IF Last <> NIL THEN    { He �o�e �a ce ���p�e e�e�e�� o� �pa�e� c��c�� }
      BEGIN  P := Last;
        WHILE (P^.Next_node <> N) AND (P^.Next_node <> Last) DO
          P := P^.Next_node;
        IF P^.Next_node = N THEN
          BEGIN  P^.Next_node := N^.Next_node;
            IF Last = N  THEN            { E�e�e���� e �oc�e�e� � c��c��a }
              IF P = N THEN
                Last := NIL              { B c��c��a ���a �o�e�e e�e�e��� }
              ELSE
                Last := P
          END { If }
      END { If }
  END { Delete };
  {------------------------------------------------------------------------}
  PROCEDURE C_list.Process;               { O�xo��a e�e�e����e �a c��c��a  }
    VAR   P: Node_ptr;
  BEGIN { Process }
    IF NOT Empty THEN    { �e ce ����p��a o�xo��a�e, ��� �������� � ������ }
      BEGIN  P :=  First;
        REPEAT   P^.Process;              { O�pa�o��a ce �ope����� e�e�e�� }
          P := Next(P)
        UNTIL P = Last;
        P^.Process                        { O�pa�o��a ce �ope����� e�e�e�� }
      END
  END { Process };
END { C_lists }.
{--------------------------------------------------------------------------}
