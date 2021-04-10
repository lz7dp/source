{--------------------------------------------------------------------------}
UNIT Nodes;                          { Бaзoв (│нивepcaлeн) клac зa oбeк▓и  }
INTERFACE
  TYPE   Node_ptr = ^Node;
    Node = OBJECT                    { Aбc▓paк▓eн ▓ип зa eлeмeн▓ o▓ cпиc║кa}
      Next_node  : Node_ptr;         { Укaзa▓eл к║м cлeдвa╣и┐ eлeмeн▓      }
      DESTRUCTOR Done; VIRTUAL;      { Оcвoбoждaвa oбeк▓                   }
      PROCEDURE Process; VIRTUAL     { Об░або▓ва обек▓                     }
    END;
  {------------------------------------------------------------------------}
IMPLEMENTATION
  DESTRUCTOR Node.Done;         { Плани░ан ме▓од за оcвoбoждaвaне на oбeк▓ }
  BEGIN { Done }
  END { Done };
  {------------------------------------------------------------------------}
  PROCEDURE Node.Process;        { Плани░ан ме▓од за об░або▓ване на oбeк▓  }
  BEGIN { Process }
    WRITE('Error')
  END { Process };
END.
{--------------------------------------------------------------------------}
