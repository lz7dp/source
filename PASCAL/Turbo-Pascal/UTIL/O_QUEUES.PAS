{--------------------------------------------------------------------------}
UNIT O_queues;            { Mo��� �a ��pa��e��e �a �������� o�a��a         }
INTERFACE                 {------------------------------------------------}
  USES Nodes, C_lists;
TYPE  O_queue_ptr = ^O_queue;         { ��a�a�e� ��� o�e�� - o�a��a        }
  O_queue =                           { K�ac - o�a��a                      }
    OBJECT (C_list)                   { Hac�e���a ��aca C_list             }
      CONSTRUCTOR Init;               { C���a�a ��e��-o�a��a               }
      PROCEDURE Put (N:Node_ptr);     { B�����a e�e�e�� � o�a��a           }
      FUNCTION Get (VAR N: Node_ptr): BOOLEAN       { ������a e�e�e��      }
    END;
{--------------------------------------------------------------------------}
IMPLEMENTATION
  CONSTRUCTOR O_queue.Init;                { C���a�a o�e��-o�a��a        }
  BEGIN  { Init }
    C_list.Init
  END { Init };
  {------------------------------------------------------------------------}
  PROCEDURE O_queue.Put                    { B�����a e�e�e�� � o�a��a      }
            (N : Node_ptr) ;               { ��a�a�e� ��� e�e�e��          }
  BEGIN { Put }
    Append (N)
  END { Put };
  {------------------------------------------------------------------------}
  FUNCTION O_queue.Get                     { ������a e�e�e�� o� ������     }
            (VAR N :  Node_ptr                 { ��a�a�e� ��� e�e�e��      }
             ): BOOLEAN;       { TRUE:   o� o�a��a�a e ����e�e� e�e�e��    }
                               { FALSE:  o� o�a��a�a �e � ����e�e� e�e�e�� }
  BEGIN { Get }
    IF Empty THEN
      Get := FALSE
    ELSE
      BEGIN  N := First;
        Delete (N);  Get := TRUE
      END
  END { Get };
END { O_queues }.
{--------------------------------------------------------------------------}
