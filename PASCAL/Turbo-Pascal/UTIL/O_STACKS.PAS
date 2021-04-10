{--------------------------------------------------------------------------}
UNIT O_stacks;          { Moд│л зa │пpaвлeниe нa ▒в║░зани ▒▓екове, в кои▓о }
INTERFACE               { ▒е по▒▓ав┐▓ ░азли╖ни ▓ипове oбeк▓и               }
  USES Nodes, C_lists;  {--------------------------------------------------}
  TYPE   O_Stack_ptr = ^O_stack;          { Укaзa▓eл к║м oбeк▓-c▓eк        }
  O_Stack =    { B c▓eкa мoгa▓ дa ce пoc▓aв┐▓ eлeмeн▓и c ▓ипoвe, нacлeдили }
    OBJECT (C_list)                       { ▓ипa Node, вкл╛╖и▓eлнo c▓eкoвe }
      Number : INTEGER;                   { Бpoй нa eлeмeн▓и▓e в c▓eкa     }
      CONSTRUCTOR Init;                          { C║здaвa oбeк▓-c▓eк      }
      PROCEDURE Push (N: Node_ptr);              { Пoc▓aв┐ eлeмeн▓ в c▓eк  }
      FUNCTION Pop (VAR N: Node_ptr): BOOLEAN;   { Извли╖a eлeмeн▓ o▓ c▓eк }
      FUNCTION Size: INTEGER            { Bp║╣a бpo┐ нa eлeмeн▓и▓e в c▓eкa }
    END;
  {------------------------------------------------------------------------}
IMPLEMENTATION
  CONSTRUCTOR O_stack.Init;                                { C║здaвa c▓eкa }
  BEGIN { Init }
    C_list.Init;        Number :=0
  END { Init };
  {------------------------------------------------------------------------}
  PROCEDURE O_stack.Push                         { Пoc▓aв┐ eлeмeн▓ в c▓eкa }
            (N :  Node_ptr);
  BEGIN { Push }
    Number := Number+1;        Append (N)
  END { Push };
  {------------------------------------------------------------------------}
  FUNCTION O_stack.Pop                          { Извли╖a eлeмeн▓ o▓ c▓eкa }
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
  FUNCTION O_stack.Size ;               { Bp║╣a бpo┐ нa eлeмeн▓и▓e в c▓eкa }
  BEGIN { Size }
    Size := Number
  END { Size };
END { O_stacks }.
{--------------------------------------------------------------------------}
