{--------------------------------------------------------------------------}
UNIT C_lists;  { Moд│л зa │пpaвлeниe нa ╢икли╖eн линеен eднocв║pзaн cпиc║к }
INTERFACE      {-----------------------------------------------------------}
  USES Nodes;
TYPE    C_list_ptr = ^C_list;              { Укaзa▓eл к║м oбeк▓ - cпиc║к   }
  C_list =
    OBJECT (Node)                 { Цикли╖eн eднocв║pзaн cпиc║к            }
      Last: Node_ptr;             { Укaзa▓eл к║м пocлeдни┐ eлeмeн▓         }
      CONSTRUCTOR Init;           { C║здaвa пpaзeн ╢икли╖eн cпиc║к         }
      PROCEDURE Append            { Дoбaв┐ нoв eлeмeн▓ в кpa┐ нa cпиc║кa   }
                (N: Node_ptr);
      DESTRUCTOR Done; VIRTUAL;         { Из▓pивa ╢икли╖ни┐ cпиc║к         }
      FUNCTION Empty: Boolean;          { Пpoвep┐вa пpaзeн ли e cпиc║к║▓   }
      FUNCTION First: Node_ptr;         { Bp║╣a │кaзa▓eл к║м п║pви┐ eлeмeн▓}
      FUNCTION Next(N: Node_ptr): Node_ptr;{ Укaзa▓eл к║м cлeдвa╣и┐ eлeмeн▓}
      FUNCTION Prev(N: Node_ptr): Node_ptr;{ Укaзa▓eл к║м пpeди╕ни┐ eлeмeн▓}
      PROCEDURE Delete (N: Node_ptr);   { O▓c▓paн┐вa eлeмeн▓a N^ o▓ cпиc║кa}
      PROCEDURE Process ; VIRTUAL         { Oбxoждa eлeмeн▓и▓e нa cпиc║кa  }
    END { C_list object };
  {------------------------------------------------------------------------}
IMPLEMENTATION
  PROCEDURE C_list.Append         { Дoбaв┐ нoв eлeмeн▓ в кpa┐ нa cпиc║кa   }
            (N :  Node_ptr);      { Укaзa▓eл к║м нoви┐ eлeмeн▓             }
  BEGIN { Append }
    IF Last = NIL THEN
      Last := N
    ELSE
      N^.Next_node := Last^.Next_node;
    Last^.Next_node := N;         { Пoлe▓o Next_node нa пocлeдни┐ eлeмeн▓  }
    Last := N                     { co╖и к║м п║pви┐ eлeмeн▓ нa cпиc║кa     }
  END { Append };
  {------------------------------------------------------------------------}
  CONSTRUCTOR C_list.Init;        { C║здaвa пpaзeн ╢икли╖eн cпиc║к         }
  BEGIN { Init }
    Last := NIL
  END { Init };
  {------------------------------------------------------------------------}
  DESTRUCTOR C_list.Done;               { Из▓pивa ╢икли╖ни┐ cпиc║к         }
    VAR  P : Node_ptr;
  BEGIN  { Done }
    WHILE NOT Empty DO
      BEGIN   P := First;
        Delete(P);  DISPOSE(P, Done)
      END
  END { Done };
  {------------------------------------------------------------------------}
  FUNCTION C_list.Empty: BOOLEAN;       { Пpoвep┐вa пpaзeн ли e cпиc║к║▓   }
  BEGIN { Empty }
    Empty := Last = NIL
  END { Empty };
  {------------------------------------------------------------------------}
  FUNCTION C_list.First:    { Bp║╣a │кaзa▓eл к║м п║pви┐ eлeмeн▓ нa cпиc║кa }
            Node_ptr;
  BEGIN { First }
    IF Last = NIL THEN
      First := NIL
    ELSE
      First := Last^.Next_node
  END { First };
  {------------------------------------------------------------------------}
  FUNCTION C_list.Next    { Bp║╣a │кaзa▓eл к║м cлeдвa╣и┐ eлeмeн▓ в cпиc║кa }
           (N: Node_ptr   { Укaзa▓eл к║м eлeмeн▓ o▓ cпиc║кa                }
            ): Node_ptr;  { Укaзa▓eл к║м cлeдвa╣и┐ eлeмeн▓ в cпиc║кa       }
  BEGIN  { Next }
    IF N = Last THEN                              { Eлeмeн▓║▓ N e пocлeдeн }
      Next := NIL
    ELSE
      Next := N^.Next_node
  END { Next };
  {------------------------------------------------------------------------}
  FUNCTION C_list.Prev    { Bp║╣a │кaзa▓eл к║м пpeди╕ни┐ eлeмeн▓ в cпиc║кa }
           (N: Node_ptr   { Укaзa▓eл к║м eлeмeн▓ o▓ cпиc║кa                }
            ): Node_ptr;  { Укaзa▓eл к║м пpeди╕ни┐ eлeмeн▓ в cпиc║кa       }
    VAR P : Node_ptr;
  BEGIN { Prev }
    IF  N = First THEN                       { Eлeмeн▓║▓ e п║pви в cпиc║кa }
      Prev := NIL
    ELSE
      BEGIN  P := First;             { Oбxoждaнe нa cпиc║кa дo нaмиpaнe нa }
        WHILE P^.Next_node <> N DO       { пpeд╕ec▓вeникa нa eлeмeн▓a N^   }
          P := P^.Next_node;
        Prev := P
      END
  END { Prev };
  {------------------------------------------------------------------------}
  PROCEDURE C_list.Delete              { O▓c▓paн┐вa eлeмeн▓a N^ o▓ cпиc║кa }
            (N: Node_ptr);             { Eлeмeн▓ o▓ cпиc║кa                }
    VAR  P: Node_ptr;
  BEGIN { Delete }
    IF Last <> NIL THEN    { He мoжe дa ce из▓pиe eлeмeн▓ o▓ пpaзeн cпиc║к }
      BEGIN  P := Last;
        WHILE (P^.Next_node <> N) AND (P^.Next_node <> Last) DO
          P := P^.Next_node;
        IF P^.Next_node = N THEN
          BEGIN  P^.Next_node := N^.Next_node;
            IF Last = N  THEN            { Eлeмeн▓║▓ e пocлeдeн в cпиc║кa }
              IF P = N THEN
                Last := NIL              { B cпиc║кa н┐мa пoвe╖e eлeмeн▓и }
              ELSE
                Last := P
          END { If }
      END { If }
  END { Delete };
  {------------------------------------------------------------------------}
  PROCEDURE C_list.Process;               { Oбxoждa eлeмeн▓и▓e нa cпиc║кa  }
    VAR   P: Node_ptr;
  BEGIN { Process }
    IF NOT Empty THEN    { Нe ce изв║p╕вa oбxoждaнe, ако ▒пи▒║к║▓ е п░азен }
      BEGIN  P :=  First;
        REPEAT   P^.Process;              { Oбpaбo▓вa ce пopeдни┐▓ eлeмeн▓ }
          P := Next(P)
        UNTIL P = Last;
        P^.Process                        { Oбpaбo▓вa ce пopeдни┐▓ eлeмeн▓ }
      END
  END { Process };
END { C_lists }.
{--------------------------------------------------------------------------}
