{--------------------------------------------------------------------------}
{$I S_lists.inc }                         { T┐лo нa мoд│л зa │пpaвлeниe нa }
IMPLEMENTATION { S_lists }                { eднocв║pзaни cop▓иpaни cпиc║╢и }
  TYPE Point_to_S_pointer= ^S_pointer;
{--------------------------------------------------------------------------}
FUNCTION S_find_node          { T║pcи в║зeл c║c c▓oйнoc▓ нa кл╛╖a Key_data }
          (Root      : S_list;                           { Oбeк▓-ЛECC      }
           Key_data  : S_key_type;               { Kл╛╖ нa ▓║pceни┐ в║зeл  }
           VAR Pred_node : Point_to_S_pointer; { Укaзa▓eл к║м пoлe▓o D_next}
                                               { o▓ в║зeлa-пpeд╕ec▓вeник   }
           VAR Succ_node : S_pointer   { Укaзa▓eл к║м в║зeлa нacлeдник     }
           ): BOOLEAN;  { Peз│л▓a▓ :  TRUE  - ▓║pceни┐▓ в║зeл е наме░ен    }
                        {             FALSE - в║зeл c ▓oзи кл╛╖ нe e o▓кpи▓}
  VAR Not_found : BOOLEAN;
BEGIN { S_find_node }
  Pred_node := @Root^.S_next;
  Succ_node := Root^.S_next;                Not_found := TRUE;
  WHILE (Succ_node <> NIL) AND Not_found DO
    BEGIN
      IF  Succ_node^.S_key < Key_data THEN
        BEGIN
          Pred_node := @Succ_node^.S_next;   Succ_node := Succ_node^.S_next
        END
      ELSE
        Not_found := FALSE
    END;
  IF Not_found THEN
    S_find_node := FALSE
  ELSE
    S_find_node := Succ_node^.S_key = Key_data
END { S_find_node };
{--------------------------------------------------------------------------}
FUNCTION S_insert_node;                   { Bкл╛╖вa в║зeл c oпpeдeлeн кл╛╖ }
  VAR Pred_node : Point_to_S_pointer;       Succ_node : S_pointer;
BEGIN { S_insert_node }
  IF S_find_node (Root, Key_data, Pred_node,Succ_node) THEN
    BEGIN  Node := Succ_node;          { B║зeл c ▓oзи кл╛╖ вe╖e c║╣ec▓в│вa }
      S_insert_node := FALSE
    END
  ELSE
    BEGIN   NEW (Node);              { C║здaвa ce нoв в║зeл c жeлaни┐ кл╛╖ }
      S_insert_node:= TRUE;
      Node^.S_key  := Key_data;   Node^.S_data := NIL;
      Node^.S_next := Succ_node;  Pred_node^   := Node
    END
END { S_insert_node };
{--------------------------------------------------------------------------}
FUNCTION S_search_node;                     { T║pcи в║зeл c oпpeдeлeн кл╛╖ }
  VAR Pred_node : Point_to_S_pointer;       Succ_node : S_pointer;
BEGIN { S_search_node }
  IF S_find_node (Root, Key_data, Pred_node, Succ_node) THEN
    BEGIN  Node := Succ_node;                { T║pceни┐▓ в║зeл e нaмepeн   }
      S_search_node := TRUE
    END
  ELSE                                      { T║pceни┐▓ в║зeл нe e нaмepeн }
    BEGIN
      Node := NIL;           S_search_node := FALSE
    END
END { S_search_node };
{--------------------------------------------------------------------------}
FUNCTION S_delete_node;                   { Из▓pивa в║зeл c oпpeдeлeн кл╛╖ }
  VAR Pred_node : Point_to_S_pointer;       Succ_node : S_pointer;
BEGIN { S_delete_node }
  IF S_find_node (Root, Key_data, Pred_node, Succ_node) THEN
    BEGIN                                    { B║зeл║▓ e нaмepeн в cпиc║кa }
      Pred_node^ := Succ_node^.S_next;       { Изкл╛╖вaнe o▓ cпиc║кa       }
      IF (Succ_node^.S_data <> NIL) AND (@Root^.S_del <> NIL) THEN
        Root^.S_del (Succ_node^.S_data);
      DISPOSE (Succ_node);  S_delete_node := TRUE
    END
  ELSE
    S_delete_node := FALSE
END { S_delete_node };
{--------------------------------------------------------------------------}
PROCEDURE S_delete_list;                            { Из▓pивa ╢eли┐ cпиc║к }
  VAR Next, Node : S_pointer;
BEGIN { S_delete_list }        Node := Root^.S_next;
  WHILE Node <> NIL DO
    BEGIN    Next := Node^.S_next;
      IF (Node^.S_data <> NIL) AND (@Root^.S_del <> NIL) THEN
        Root^.S_del (Node^.S_data);
      DISPOSE (Node);     Node := Next
   END;
  DISPOSE (Root);         Root := NIL
END { S_delete_list };
{--------------------------------------------------------------------------}
FUNCTION S_process_until;  { Oбxoждa вcи╖ки в║зли дo изп║лнeниe нa │cлoвиe }
  VAR Next    : S_pointer;     Not_end : BOOLEAN;
BEGIN { S_process_until }
  Next := Root^.S_next;           Not_end := TRUE;
  WHILE (Next <> NIL) AND Not_end DO
    WITH Root^ DO
      BEGIN
        IF @S_proc <> NIL THEN
          S_proc (Next);                { Извиквaнe  нa пpилoжнa пpo╢eд│pa }
        IF @S_func <> NIL THEN
          Not_end := NOT S_func (Next);          { Пpoвepкa зa зaв║p╕вaнe  }
        Next := Next^.S_next                     { нa oбpaбo▓кa▓a          }
      END;
  S_process_until := Next <> NIL
END { S_process_until };
{--------------------------------------------------------------------------}
PROCEDURE S_init;             { C║здaвa линeeн eднocв║pзaн cop▓иpaн cпиc║к }
BEGIN { S_init }      NEW (Root);
  WITH Root^ DO
    BEGIN
      S_proc := Proc;   S_func := Func;   S_del  := Del;    S_next := NIL
    END
END { S_init };
BEGIN { S_lists }
  @S_null_proc := NIL;    @S_null_func := NIL;     @S_null_del  := NIL;
END { S_lists }.
{--------------------------------------------------------------------------}
