{--------------------------------------------------------------------------}
UNIT Nodes;                          { �a�o� (����epca�e�) ��ac �a o�e���  }
INTERFACE
  TYPE   Node_ptr = ^Node;
    Node = OBJECT                    { A�c�pa��e� ��� �a e�e�e�� o� c��c��a}
      Next_node  : Node_ptr;         { ��a�a�e� ��� c�e��a��� e�e�e��      }
      DESTRUCTOR Done; VIRTUAL;      { �c�o�o��a�a o�e��                   }
      PROCEDURE Process; VIRTUAL     { ��������� �����                     }
    END;
  {------------------------------------------------------------------------}
IMPLEMENTATION
  DESTRUCTOR Node.Done;         { �������� ����� �� �c�o�o��a�a�� �� o�e�� }
  BEGIN { Done }
  END { Done };
  {------------------------------------------------------------------------}
  PROCEDURE Node.Process;        { �������� ����� �� ����������� �� o�e��  }
  BEGIN { Process }
    WRITE('Error')
  END { Process };
END.
{--------------------------------------------------------------------------}
