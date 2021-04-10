{--------------------------------------------------------------------------}
UNIT O_queues;            { Mo¤³« §a ³¯pa¢«e­¨e ­a ±¢º°§ ­  o¯a¸ªa         }
INTERFACE                 {------------------------------------------------}
  USES Nodes, C_lists;
TYPE  O_queue_ptr = ^O_queue;         { “ªa§a²e« ªº¬ o¡eª² - o¯a¸ªa        }
  O_queue =                           { K«ac - o¯a¸ªa                      }
    OBJECT (C_list)                   { Hac«e¤¿¢a ª«aca C_list             }
      CONSTRUCTOR Init;               { Cº§¤a¢a ®¡eª²-o¯a¸ªa               }
      PROCEDURE Put (N:Node_ptr);     { Bª«¾·¢a e«e¬e­² ¢ o¯a¸ªa           }
      FUNCTION Get (VAR N: Node_ptr): BOOLEAN       { ˆ§¢«¨·a e«e¬e­²      }
    END;
{--------------------------------------------------------------------------}
IMPLEMENTATION
  CONSTRUCTOR O_queue.Init;                { Cº§¤a¢a o¡eª²-o¯a¸ªa        }
  BEGIN  { Init }
    C_list.Init
  END { Init };
  {------------------------------------------------------------------------}
  PROCEDURE O_queue.Put                    { Bª«¾·¢a e«e¬e­² ¢ o¯a¸ªa      }
            (N : Node_ptr) ;               { “ªa§a²e« ªº¬ e«e¬e­²          }
  BEGIN { Put }
    Append (N)
  END { Put };
  {------------------------------------------------------------------------}
  FUNCTION O_queue.Get                     { ˆ§¢«¨·a e«e¬e­² o² ®¯ ¸ª      }
            (VAR N :  Node_ptr                 { “ªa§a²e« ªº¬ e«e¬e­²      }
             ): BOOLEAN;       { TRUE:   o² o¯a¸ªa²a e ¨§¢«e·e­ e«e¬e­²    }
                               { FALSE:  o² o¯a¸ªa²a ­e ¥ ¨§¢«e·e­ e«e¬e­² }
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