{--------------------------------------------------------------------------}
{$I S_lists.inc }                         { T��o �a �o��� �a ��pa��e��e �a }
IMPLEMENTATION { S_lists }                { e��oc��p�a�� cop��pa�� c��c��� }
  TYPE Point_to_S_pointer= ^S_pointer;
{--------------------------------------------------------------------------}
FUNCTION S_find_node          { T�pc� ���e� c�c c�o��oc� �a ����a Key_data }
          (Root      : S_list;                           { O�e��-�ECC      }
           Key_data  : S_key_type;               { K��� �a ��pce��� ���e�  }
           VAR Pred_node : Point_to_S_pointer; { ��a�a�e� ��� �o�e�o D_next}
                                               { o� ���e�a-�pe��ec��e���   }
           VAR Succ_node : S_pointer   { ��a�a�e� ��� ���e�a �ac�e����     }
           ): BOOLEAN;  { Pe����a� :  TRUE  - ��pce���� ���e� � �������    }
                        {             FALSE - ���e� c �o�� ���� �e e o��p��}
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
FUNCTION S_insert_node;                   { B�����a ���e� c o�pe�e�e� ���� }
  VAR Pred_node : Point_to_S_pointer;       Succ_node : S_pointer;
BEGIN { S_insert_node }
  IF S_find_node (Root, Key_data, Pred_node,Succ_node) THEN
    BEGIN  Node := Succ_node;          { B��e� c �o�� ���� �e�e c��ec����a }
      S_insert_node := FALSE
    END
  ELSE
    BEGIN   NEW (Node);              { C���a�a ce �o� ���e� c �e�a��� ���� }
      S_insert_node:= TRUE;
      Node^.S_key  := Key_data;   Node^.S_data := NIL;
      Node^.S_next := Succ_node;  Pred_node^   := Node
    END
END { S_insert_node };
{--------------------------------------------------------------------------}
FUNCTION S_search_node;                     { T�pc� ���e� c o�pe�e�e� ���� }
  VAR Pred_node : Point_to_S_pointer;       Succ_node : S_pointer;
BEGIN { S_search_node }
  IF S_find_node (Root, Key_data, Pred_node, Succ_node) THEN
    BEGIN  Node := Succ_node;                { T�pce���� ���e� e �a�epe�   }
      S_search_node := TRUE
    END
  ELSE                                      { T�pce���� ���e� �e e �a�epe� }
    BEGIN
      Node := NIL;           S_search_node := FALSE
    END
END { S_search_node };
{--------------------------------------------------------------------------}
FUNCTION S_delete_node;                   { ���p��a ���e� c o�pe�e�e� ���� }
  VAR Pred_node : Point_to_S_pointer;       Succ_node : S_pointer;
BEGIN { S_delete_node }
  IF S_find_node (Root, Key_data, Pred_node, Succ_node) THEN
    BEGIN                                    { B��e��� e �a�epe� � c��c��a }
      Pred_node^ := Succ_node^.S_next;       { �������a�e o� c��c��a       }
      IF (Succ_node^.S_data <> NIL) AND (@Root^.S_del <> NIL) THEN
        Root^.S_del (Succ_node^.S_data);
      DISPOSE (Succ_node);  S_delete_node := TRUE
    END
  ELSE
    S_delete_node := FALSE
END { S_delete_node };
{--------------------------------------------------------------------------}
PROCEDURE S_delete_list;                            { ���p��a �e��� c��c�� }
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
FUNCTION S_process_until;  { O�xo��a �c���� ����� �o ������e��e �a �c�o��e }
  VAR Next    : S_pointer;     Not_end : BOOLEAN;
BEGIN { S_process_until }
  Next := Root^.S_next;           Not_end := TRUE;
  WHILE (Next <> NIL) AND Not_end DO
    WITH Root^ DO
      BEGIN
        IF @S_proc <> NIL THEN
          S_proc (Next);                { ������a�e  �a �p��o��a �po�e��pa }
        IF @S_func <> NIL THEN
          Not_end := NOT S_func (Next);          { �po�ep�a �a �a��p��a�e  }
        Next := Next^.S_next                     { �a o�pa�o��a�a          }
      END;
  S_process_until := Next <> NIL
END { S_process_until };
{--------------------------------------------------------------------------}
PROCEDURE S_init;             { C���a�a ���ee� e��oc��p�a� cop��pa� c��c�� }
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