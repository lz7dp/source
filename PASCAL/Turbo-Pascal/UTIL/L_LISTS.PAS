{--------------------------------------------------------------------------}
{$I L_lists.inc}                      { T┐лo нa мoд│л зa │пpaвлeниe нa ЛEC }
IMPLEMENTATION                        {------------------------------------}
  TYPE  L_point = ^L_node;                 { Tип нa │кaзa▓eл к║м в║зeл     }
    L_node =  RECORD                       { Tип нa в║зли▓e                }
                L_key  : L_key_type;       { Kл╛╖ нa в║зeлa                }
                L_data : POINTER;          { Укaзa▓eл к║м ocнoвни▓e дaнни  }
                L_next : L_point           { Укaзa▓eл к║м cлeдвa╣и┐ в║зeл  }
              END;
    L_list_pointer = ^L_list_node; { Укaзa▓eл к║м линeен едноcв║pзaн cпиc║к}
    L_list_node = RECORD  { Tип нa де▒к░ип▓о░а на линeен еднocв║pзaн cпиc║к}
                    L_first : L_point;      { Укaзa▓eл к║м п║pвo▓o пoлe    }
                    L_last  : L_point       { Укaзa▓eл к║м пocлeднo▓o пoлe }
                  END;
  VAR P : POINTER;
{--------------------------------------------------------------------------}
FUNCTION L_get_data;       { Bp║╣a c▓oйнoc▓▓a нa пoлe▓o зa дaнни нa в║зeлa }
  VAR P: L_point ABSOLUTE X;
BEGIN { L_get_data }
  L_get_data := P^.L_data
END { L_get_data };
{--------------------------------------------------------------------------}
FUNCTION L_get_key;                  { Bp║╣a c▓oйнoc▓▓a нa кл╛╖a нa в║зeлa }
BEGIN { L_get_key }
  L_get_key := L_point(X)^.L_key
END { L_get_key };
{--------------------------------------------------------------------------}
FUNCTION L_get_last;      { Bp║╣a │кaзa▓eл к║м пocлeдни┐ eлeмeн▓ в cпиc║кa }
  VAR P: L_list_pointer ABSOLUTE X;
BEGIN { L_get_last }
  L_get_last := P^.L_last
END { L_get_last };
{--------------------------------------------------------------------------}
PROCEDURE L_init;                  { C║здaвa нoв линeeн едноcв║pзaн cпиc║к }
  VAR L_root : L_list_pointer ABSOLUTE Root;
BEGIN { L_init }
  NEW (L_root);                    { Зaeмa пaмe▓ зa дecкpип▓opa нa cпиc║кa }
  L_root^.L_first := NIL;        L_root^.L_last  := NIL
END { L_init };
{--------------------------------------------------------------------------}
PROCEDURE L_insert_last;                { Дoбaв┐ eлeмeн▓ в кpa┐ нa cпиc║кa }
  VAR L_root : L_list_pointer ABSOLUTE Root;
      L_node : L_point ABSOLUTE Node;
BEGIN { L_insert_last }       NEW (L_node); { Резе░ви░а паме▓ за нов в║зел }
  WITH L_node^,L_root^ DO
    BEGIN   L_key := Key_data;   L_data := Data;     L_next := NIL;
      IF L_last <> NIL THEN              { B cпиc║кa имa пoнe eдин eлeмeн▓ }
        L_last^.L_next := Node
      ELSE                                             { Cпиc║к║▓ e пpaзeн }
        L_first := Node;
      L_last := Node
    END
END { L_insert_last };
{--------------------------------------------------------------------------}
PROCEDURE L_insert_first;           { Дoбaв┐ eлeмeн▓ в нa╖aлo▓o нa cпиc║кa }
  VAR L_root : L_list_pointer ABSOLUTE Root;
      L_node : L_point ABSOLUTE Node;
BEGIN { L_insert_first }      NEW (L_node); { Резе░ви░а паме▓ за нов в║зел }
  WITH L_node^,L_root^ DO
    BEGIN   L_key := Key_data;   L_data := Data;
      L_next := L_first;   L_first := Node;
      IF L_next = NIL THEN
        L_last := Node                                 { Cпиc║к║▓ e пpaзeн }
    END
END { L_insert_first };
{--------------------------------------------------------------------------}
FUNCTION L_find_node                   { T║pcи в║зeл в cв║pзaн cпиc║к      }
         (Root      : L_list_pointer;  { Cпиc║к                            }
          Key_data  : L_key_type;      { Kл╛╖ нa в║зeлa                    }
          VAR Pred_node  : L_point;    { Aдpec нa в║зeлa пpeд╕ec▓вeник     }
          VAR Found_node : L_point     { Aдpec нa ▓║pceни┐ в║зeл           }
          ):BOOLEAN;              { Peз│л▓a▓ TRUE  - в║зeл║▓ e нaмepeн     }
                                  {          FALSE - в║зeл║▓ нe e нaмepeн  }
  VAR Not_found : BOOLEAN;
BEGIN { L_find_node }
  Pred_node  := NIL;     Found_node := Root^.L_first;   Not_found  := TRUE;
  WHILE (Found_node <> NIL) AND  Not_found DO { Цик║л║▓ ce изп║лн┐вa,дoкa▓o}
    BEGIN      { ce нaмepи ▓║pceни┐▓ кл╛╖ или ce дoc▓игнe кpa┐▓ нa cпиc║кa }
      IF (Found_node^.L_key =  Key_data) THEN
        Not_found := FALSE                   { T║pceни┐▓ eлeмeн▓ e нaмepeн }
      ELSE
        BEGIN
          Pred_node :=Found_node; Found_node := Found_node^.L_next
        END
    END;
  L_find_node := NOT (Not_Found)
END { L_find_node };
{--------------------------------------------------------------------------}
FUNCTION L_search_node;                         { T║pcи в║зeл c дaдeн кл╛╖ }
  VAR Pred_node  : L_point;
      L_root : L_list_pointer ABSOLUTE Root;
      L_node : L_point ABSOLUTE Node;
BEGIN { L_search_node }
  L_search_node := L_find_node (L_root, Key_data, Pred_node, L_node)
END { L_search_node };
{--------------------------------------------------------------------------}
FUNCTION L_delete_node;                       { Из▓pивa в║зeл c дaдeн кл╛╖ }
  VAR Pred_node, Found_node : L_point;
      L_root : L_list_pointer ABSOLUTE Root;
BEGIN { L_delete_node }
  IF L_find_node (L_root, Key_data, Pred_node, Found_node) THEN
    WITH L_root^ DO
      BEGIN                                    { Haмepeн e ▓║pceни┐▓ в║зeл }
        IF Pred_node = NIL THEN
          L_first := Found_node^.L_next
        ELSE
          Pred_node^.L_next := Found_node^.L_next;  { Изкл╛╖вaнe нa в║зeлa }
        IF L_last = Found_node THEN
          IF L_first = L_last THEN
            BEGIN                 { B║зeл║▓, кoй▓o ce из▓pивa, e eдинc▓вeн }
              L_first := NIL;    L_last  := NIL
            END
          ELSE  { B║зeл║▓, кoй▓o ce из▓pивa, e пocлeдeн, нo нe e eдинc▓вeн }
            L_last := Pred_node;
        IF (Found_node^.L_data <> NIL) AND (@Del_proc <> NIL) THEN
          Del_proc (Found_node);        { Извиквa пo▓peби▓ел▒ка пpo╢eд│pa  }
        DISPOSE (Found_node);        { Ocвoбoждaвa зae▓a▓a o▓ в║зeлa пaмe▓ }
        L_delete_node := TRUE
      END
  ELSE
    L_delete_node := FALSE
END { L_delete_node };
{--------------------------------------------------------------------------}
PROCEDURE L_delete_list;                            { Из▓pивa ╢eли┐ cпиc║к }
  VAR Next, R : L_point;
      L_root : L_list_pointer ABSOLUTE Root;
BEGIN { L_delete_list }
  R := L_root^.L_first;
  WHILE R <> NIL DO
    BEGIN   Next := R^.L_next;
      IF (R^.L_data <> NIL) AND (@Del_proc <> @Null_del) THEN
        Del_proc (R);               { Oбpaбo▓вa cв║pзaни▓e c в║зeлa дaнни  }
      DISPOSE (R);                                       { Из▓pивa в║зeлa  }
      R := Next
    END;
  DISPOSE (L_root);  L_root := NIL      { Из▓pивa дecкpип▓opa нa cпиc║кa   }
END { L_delete_list };
{--------------------------------------------------------------------------}
FUNCTION L_move_node;  { Пpeмec▓вa в║зeл o▓ cпиc║кa Source в cпиc║кa Dest  }
  VAR Pred_node, Found_node : L_point;
      L_source : L_list_pointer ABSOLUTE Source;
      L_dest   : L_list_pointer ABSOLUTE Dest  ;
BEGIN { L_move_node }                      { Имa ли в║зeл c кл╛╖ Key_data? }
  IF L_find_node (L_source, Numb, Pred_node, Found_node) THEN
    BEGIN                               { Изкл╛╖вa в║зeл o▓ cпиc║кa Source }
      IF Pred_node = NIL THEN      { O▓ Source ce o▓c▓paн┐вa п║pви┐▓ в║зeл }
          L_source^.L_first := Found_node^.L_next
      ELSE
        Pred_node^.L_next := Found_node^.L_next;
      IF L_source^.L_last = Found_node THEN
        L_source^.L_last := Pred_node; { Aкo изкл╛╖вaни┐▓ в║зeл e пocлeдeн,}
                        { вкл╛╖вa c║╣и┐ в║зeл кa▓o пocлeдeн в ▒пи▒║ка Dest }
      Found_node^.L_next := NIL;
      IF L_dest^.L_first = NIL THEN
        L_dest^.L_first := Found_node
      ELSE
        L_dest^.L_last^.L_next := Found_node;
      L_dest^.L_last := Found_node;
      Node := Found_node;              L_move_node := TRUE
    END
 ELSE
   L_move_node := FALSE
END { L_move_node };
{--------------------------------------------------------------------------}
FUNCTION L_process_until;  { Oбxoждa вcи╖ки в║зли дo изп║лнeниe нa │cлoвиe }
  VAR Next    : L_point;    Not_end : BOOLEAN;
      L_root  : L_list_pointer ABSOLUTE Root;
BEGIN { L_process_until }
  Next := L_root^.L_first;    Not_end := TRUE;
  WHILE (Next <> NIL) AND Not_end DO
    BEGIN             { Пoдгo▓oвкa зa извиквaнe нa плaниpaнa▓a пpo╢eд│pa   }
      IF @Proc <> @Null_proc THEN      { зa oбpaбo▓кa нa дaнни▓e нa в║зeлa }
        Proc (Next);
      IF @Until_cond <> NIL THEN          { Извиквa плaниpaнa▓a ┤│нк╢и┐ зa }
        Not_end := NOT Until_cond (Next);  { пpoвepкa зa кpaй нa oбxoждaнe }
      Next := Next^.L_next
    END;
  L_process_until := Next <> NIL
END { L_process_until };
{--------------------------------------------------------------------------}
FUNCTION L_remove_first;             { O▓c▓paн┐вa п║pви┐ в║зeл нa cпиc║кa  }
  VAR L_root : L_list_pointer ABSOLUTE Root;
      L_node : L_point ABSOLUTE Node;
BEGIN { L_remove_first }
  WITH L_node^, L_Root^ DO
    BEGIN     L_node := L_first;
      IF L_node = NIL THEN
          L_remove_first := FALSE                     { Cпиc║к║▓ e пpaзeн  }
      ELSE
        BEGIN  L_first:= L_node^.L_next; {Cпиc║к║▓ c║д║pжa caмo eдин в║зeл }
          IF L_first^.L_next = NIL THEN
            L_last := L_first;
          L_remove_first := TRUE
        END
    END
END { L_remove_first };
{--------------------------------------------------------------------------}
BEGIN { L_lists }
  P := NIL;                                   { Фopмиpa ┤ик▓ивнa пpo╢eд│pa }
  Null_func :=  Users_function  (P);     { Tип║▓ POINTER ce пpeoбpaз│вa в  }
  Null_proc :=  Users_procedure (P);     { paзли╖ни подп░ог░амни ▓ипoвe    }
  @Null_del :=  NIL          { Пocлeдни▓e двa oпepa▓opa имa▓ eднaк║в e┤eк▓ }
END { L_lists }.
{--------------------------------------------------------------------------}
