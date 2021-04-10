         {-----------------------------------------------------------------}
         { T┐лo нa мoд│л зa │пpaвлeниe нa дв│cв║pзaни cop▓иpaни cпиc║╢и    }
         {-----------------------------------------------------------------}
{$I D_lists.inc}
IMPLEMENTATION
  TYPE   Point_to_D_pointer = ^D_point;
    D_point = ^D_node;             { Tип нa │кaзa▓eл┐ к║м в║зeл o▓ cпиc║кa }
    D_node = RECORD                { Tип нa в║зeл o▓ cпиc║кa               }
               D_key  : D_key_type;{ Kл╛╖ нa в║зeлa                        }
               D_data : POINTER;   { Укaзa▓eл к║м ocнoвни▓e дaнни          }
               D_next : D_point;   { Укaзa▓eл к║м cлeдвa╣и┐ в║зeл          }
               D_back : D_point    { Укaзa▓eл к║м пpeди╕ни┐ в║зeл          }
             END;
    D_list_pointer = ^D_root;
    D_root = RECORD                        { Tип нa дecкpип▓opa нa cпиc║кa }
               D_Proc: D_users_procedure;  { Пpилoжни пpo╢eд│pи и ┤│нк╢ии  }
               D_Func: D_users_function;
               D_Del : D_users_del;
               D_next: D_point;           { Укaзa▓eл к║м п║pви┐ eлeмeн▓    }
               D_back: D_point            { Укaзa▓eл к║м пocлeдни┐ eлeмeн▓ }
             END;
{--------------------------------------------------------------------------}
FUNCTION D_get_data;       { Bp║╣a c▓oйнoc▓▓a нa пoлe▓o зa дaнни нa в║зeлa }
BEGIN  { D_get_data }
  D_get_data := D_point(X)^.D_data
END { D_get_data };
{--------------------------------------------------------------------------}
FUNCTION D_get_key;                  { Bp║╣a c▓oйнoc▓▓a нa кл╛╖a нa в║зeлa }
BEGIN { D_get_key }
  D_get_key := D_point(X)^.D_key
END { D_get_key };
{--------------------------------------------------------------------------}
FUNCTION D_find_node          { T║pcи в║зeл c║c c▓oйнoc▓ нa кл╛╖a Key_data }
          (Root      : D_list_pointer;                   { Kopeн нa в║зeлa }
           Key_data  : D_key_type;               { Kл╛╖ нa ▓║pceни┐ в║зeл  }
           VAR Pred_node : Point_to_D_pointer; { Укaзa▓eл к║м пoлe▓o D_next}
                                               { o▓ в║зeлa-пpeд╕ec▓вeник   }
           VAR Succ_node : D_point       { Укaзa▓eл к║м в║зeлa-нacлeдник   }
           ): BOOLEAN;   { Peз│л▓a▓ : TRUE  - ▓║pceни┐▓ в║зeл e нaмepeн    }
                         {            FALSE - в║зeл c ▓oзи кл╛╖ нe e о▓к░и▓}
  VAR Not_found : BOOLEAN;
BEGIN { D_find_node }
  Pred_node := @Root^.D_next; Succ_node := Root^.D_next;  Not_found := TRUE;
  WHILE (Succ_node <> NIL) AND Not_found DO
    BEGIN
      IF  Succ_node^.D_key < Key_data THEN
        BEGIN
          Pred_node := @Succ_node^.D_next;   Succ_node := Succ_node^.D_next
        END
      ELSE
        Not_found := FALSE
    END;
  IF Not_found THEN
    D_find_node := FALSE
  ELSE
    D_find_node := Succ_node^.D_key = Key_data
END { D_find_node };
{--------------------------------------------------------------------------}
FUNCTION D_search_node;                        { T║pcи в║зeл c дaдeн кл╛╖  }
  VAR Pred_node : Point_to_D_pointer;
      D_root    : D_list_pointer ABSOLUTE Root;
      Node      : D_point ABSOLUTE Succ_node;
BEGIN { D_search_node }
  D_search_node := D_find_node (D_root, Key_data, Pred_node, Node)
END { D_search_node };
{--------------------------------------------------------------------------}
FUNCTION D_insert_node;        { Bкл╛╖вa в cпиc║кa eлeмeн▓ c кл╛╖ Key_data }
  VAR New_node  : D_point;
      Pred_node : Point_to_D_pointer;
      D_root    : D_list_pointer ABSOLUTE Root;
      Node      : D_point ABSOLUTE Succ_node;
BEGIN { D_insert_node }
  IF D_find_node(D_root, Key_data, Pred_node, Node) THEN
    D_insert_node := FALSE
  ELSE
    BEGIN    NEW (New_node);
      WITH New_node^ DO
        BEGIN
          D_data := Data;            D_key      := Key_data;
          D_next := Succ_node;       Pred_node^ := New_node;
          IF Node <> NIL THEN
            BEGIN
              D_back := Node^.D_back;     Node^.D_back := New_node
            END
          ELSE
            BEGIN                           { Дoc▓игнa▓ e кpa┐▓ нa cпиc║кa }
              D_back := D_root^. D_back;  D_root^.D_back := New_node
            END;
          Node := New_node;               D_insert_node := TRUE
        END
    END
END { D_insert_node };
{--------------------------------------------------------------------------}
PROCEDURE D_position_after;         { T║pcи п║pви┐ в║зeл, нaмиpa╣ ce ▒лед  }
                                    { в║зeл c кл╛╖ Key_data                }
  VAR D_root    : D_list_pointer ABSOLUTE Root;
      Node      : D_point ABSOLUTE Succ_node;
BEGIN { D_position_after }
  IF D_Search_node (D_root, Key_data, Succ_node) THEN
    Node := Node^.D_next
END { D_position_after };
{--------------------------------------------------------------------------}
PROCEDURE D_position_before;      { T║pcи п║pви┐  в║зeл, нaмиpa╣ ce п░ед   }
                                  { в║зeл c кл╛╖ Key_data                  }
  VAR D_root    : D_list_pointer ABSOLUTE Root;
      Node      : D_point ABSOLUTE Succ_node;
BEGIN { D_position_before }
  IF D_Search_node (D_root, Key_data, Succ_node) THEN
    Node := Node^.D_back
END { D_position_before };
{--------------------------------------------------------------------------}
PROCEDURE D_delete_list;                            { Из▓pивa ╢eли┐ cпиc║к }
  VAR Node      : D_point;
      Next_node : D_point;
      D_root    : D_list_pointer ABSOLUTE Root;
BEGIN { D_delete_list }
  Node := D_root^.D_next;
    WHILE Node <> NIL DO
      BEGIN
        IF (Node^.D_data <> NIL) AND (@D_root^.D_del <> NIL) THEN
          D_root^.D_del (Node^.D_data);
        Next_node := Node^.D_next;
        DISPOSE (Node);              Node := Next_node
      END;
  DISPOSE (D_root);                  D_root := NIL
END { D_delete_list };
{--------------------------------------------------------------------------}
FUNCTION D_delete_node;        { Из▓pивa o▓ cпиc║кa в║зeл c oпpeдeлeн кл╛╖ }
  VAR Found_node : D_pointer;        Next_node: D_point;
      Node       : D_point ABSOLUTE Found_node;
      D_root     : D_list_pointer ABSOLUTE Root;
BEGIN { D_delete_node }
  IF D_Search_node (D_root, Key_data, Found_node) THEN
    WITH Node^ DO
      BEGIN
        D_next^.D_back := D_back;    D_back^.D_next := D_next;
        IF (D_data <> NIL) AND (@D_root^.D_del <> NIL) THEN
          D_root^.D_del (D_data);
        DISPOSE (Node);              D_Delete_node := TRUE
      END
    ELSE
      D_Delete_node := FALSE
END { D_delete_node };
{$F+ ----------------------------------------------------------------------}
FUNCTION D_find_next_node    { T║pcи в cпиc║кa eлeмeн▓a, cлeдвa╣ Curr_node }
          (Curr_node : D_pointer;
       VAR Succ_node : D_pointer          { Укaзa▓eл к║м нaмepeни┐ eлeмeн▓ }
           ): BOOLEAN;     {  Peз│л▓a▓ :  TRUE  - нaмepeн e cлeдвa╣ в║зeл  }
                           {              FALSE - н┐мa ▓aк║в в║зeл         }
VAR C_node : D_point ABSOLUTE Curr_node;
    S_node : D_point ABSOLUTE Succ_node;
BEGIN { D_find_next_node }
  S_node := C_node;                  D_find_next_node := FALSE;
  IF C_node <> NIL THEN
    IF C_node^.D_next <> NIL  THEN
      BEGIN
        S_node := C_node^.D_next;    D_find_next_node := TRUE
      END
END { D_find_next_node };
{--------------------------------------------------------------------------}
FUNCTION D_find_back_node                      { T║pcи в cпиc║кa eлeмeн▓a, }
          (Curr_node : D_pointer;              { пpeд╕ec▓в│вa╣  Curr_node  }
       VAR Pred_node : D_pointer          { Укaзa▓eл к║м нaмepeни┐ eлeмeн▓ }
           ) : BOOLEAN;    {  Peз│л▓a▓ :  TRUE  - нaмepeн e пpeди╕eн в║зeл }
                           {              FALSE - н┐мa ▓aк║в в║зeл         }
VAR C_node : D_point ABSOLUTE Curr_node;
    P_node : D_point ABSOLUTE Pred_node;
BEGIN { D_find_back_node }
  P_node   := C_node;                     D_find_back_node := FALSE;
  IF C_node <> NIL THEN
    IF C_node^.D_back <> NIL  THEN
      BEGIN
        P_node   := C_node^.D_back;       D_find_back_node := TRUE
      END
END { D_find_back_node };
{$F- ----------------------------------------------------------------------}
FUNCTION D_process_until;  { Oбxoждa вcи╖ки в║зли дo изп║лнeниe нa │cлoвиe }
  VAR Next    : D_point;     Not_end : BOOLEAN;
      D_root    : D_list_pointer ABSOLUTE Root;
BEGIN { D_process_until }
  Next := D_root^.D_next;       Not_end := TRUE;
  WHILE (Next <> NIL) AND Not_end DO
    WITH D_root^ DO
      BEGIN
        IF @D_proc <> NIL THEN
          D_proc (Next);
        IF @D_func <> NIL THEN
          Not_end := NOT D_func (Next);
        Next := Next^.D_next
      END;
  D_process_until := Next <> NIL
END { D_process_until };
{--------------------------------------------------------------------------}
PROCEDURE D_init;                          { C║здaвa нoв дв│cв║pзaн cпиc║к }
  VAR D_root : D_list_pointer ABSOLUTE Root;
BEGIN { D_init }
  NEW (D_root);            D_root^.D_Next := NIL;    D_root^.D_back := NIL;
  D_root^.D_proc := Proc;  D_root^.D_func := Func;   D_root^.D_del := Del
END { D_init };
{--------------------------------------------------------------------------}
BEGIN { D_lists }
  @D_null_proc := NIL;   @D_null_func := NIL;    @D_null_del  := NIL;
  D_find_next  := D_find_next_node;     D_find_back  := D_find_back_node
END { D_lists }.
{--------------------------------------------------------------------------}
