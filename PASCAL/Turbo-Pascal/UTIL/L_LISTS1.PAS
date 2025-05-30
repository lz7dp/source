{--------------------------------------------------------------------------}
{$I L_lists1.inc}                     { T��o �a �o��� �a ��pa��e��e �a �EC }
                                      {------------------------------------}
IMPLEMENTATION
  TYPE
    L_point = ^L_node;                     { T�� �a ��a�a�e� ��� ���e�     }
    L_node =                               { T�� �a ������e                }
      RECORD
        L_key     : L_key_type;            { K��� �a ���e�a                }
        L_data    : POINTER;               { ��a�a�e� ��� oc�o����e �a���  }
        L_next    : L_point                { ��a�a�e� ��� c�e��a��� ���e�  }
      END;
    L_list_pointer = ^L_list_node;  { ��a�a�e� ��� ���e��o-c��p�a� c��c��  }
    L_list_node =                   { T�� �a ���e��o-c��p�a���e c��c���    }
      RECORD
        L_first : L_point;                  { ��a�a�e� ��� ��p�o�o �o�e    }
        L_last  : L_point                   { ��a�a�e� ��� �oc�e��o�o �o�e }
      END;
  VAR P : POINTER;
{--------------------------------------------------------------------------}
FUNCTION L_get_data;       { Bp��a c�o��oc��a �a �o�e�o �a �a��� �a ���e�a }
  VAR P: L_point ABSOLUTE X;
BEGIN
  L_get_data := P^.L_data
END;
{--------------------------------------------------------------------------}
FUNCTION L_get_key;                  { Bp��a c�o��oc��a �a ����a �a ���e�a }
  VAR P: L_point ABSOLUTE X;
BEGIN
  L_get_key := P^.L_key
END;
{--------------------------------------------------------------------------}
FUNCTION L_get_last;      { Bp��a ��a�a�e� ��� �oc�e���� e�e�e�� � c��c��a }
  VAR P: L_list_pointer ABSOLUTE X;
BEGIN
  L_get_last := P^.L_last
END;
{--------------------------------------------------------------------------}
PROCEDURE L_init;                     { C���a�a �o� ���e��o-c��p�a� c��c�� }
  VAR L_root : L_list_pointer ABSOLUTE Root;
BEGIN { L_init }
  NEW (L_root);                      { �ae�a ce �a�e� �a �ope�a �a c��c��a }
  L_root^.L_first := NIL;        L_root^.L_last  := NIL
END { L_init };
{--------------------------------------------------------------------------}
PROCEDURE L_insert_last;                { �o�a�� e�e�e�� � �pa� �a c��c��a }
  VAR L_root : L_list_pointer ABSOLUTE Root;
      L_node : L_point ABSOLUTE Node;
BEGIN { L_insert_last }
  NEW (L_node);
  WITH L_node^,L_root^ DO
    BEGIN
      L_key := Key_data;   L_data := Data;     L_next := NIL;
      IF L_last <> NIL THEN              { B c��c��a ��a �o�e e��� e�e�e�� }
        L_last^.L_next := Node
      ELSE                                             { C��c���� e �pa�e� }
        L_first := Node;
      L_last := Node
    END
END { L_insert_last };
{--------------------------------------------------------------------------}
PROCEDURE L_insert_first;           { �o�a�� e�e�e�� � �a�a�o�o �a c��c��a }
  VAR L_root : L_list_pointer ABSOLUTE Root;
      L_node : L_point ABSOLUTE Node;
BEGIN { L_insert_first }
  NEW (L_node);
  WITH L_node^,L_root^ DO
    BEGIN
      L_key := Key_data;   L_data := Data;
      L_next := L_first;   L_first := Node;
      IF L_next = NIL THEN
        L_last := Node                                 { C��c���� e �pa�e� }
    END
END { L_insert_first };
{--------------------------------------------------------------------------}
FUNCTION L_find_node                   { T�pc� ���e� � c��p�a� c��c��      }
         (Root      : L_list_pointer;  { Kope� �a c��c��a                  }
          Key_data  : L_key_type;      { K��� �a ���e�a                    }
          VAR Pred_node  : L_point;    { A�pec �a ���e�a �pe��ec��e���     }
          VAR Found_node : L_point     { A�pec �a ��pce��� ���e�           }
          ):BOOLEAN;              { Pe����a� TRUE  - B��e��� e �a�epe�     }
                                  {          FALSE - B��e��� �e e �a�epe�  }
  VAR Not_found : BOOLEAN;
BEGIN { L_find_node }
  Pred_node  := NIL;
  Found_node := Root^.L_first;
  Not_found  := TRUE;
  WHILE (Found_node <> NIL) AND  Not_found DO { ������� ce ��������a �o�a�o}
    BEGIN        { ce �a�ep� ��pce��� ���� ��� ce �oc����e �pa� �a c��c��a }
      IF (Found_node^.L_key =  Key_data) THEN
        Not_found := FALSE                   { T�pce���� e�e�e�� e �a�epe� }
      ELSE
        BEGIN
          Pred_node :=Found_node; Found_node := Found_node^.L_next
        END
    END;
  L_find_node := NOT (Not_Found)
END { L_find_node };
{--------------------------------------------------------------------------}
FUNCTION L_search_node;                         { T�pc� ���e� c �a�e� ���� }
  VAR Pred_node  : L_point;
      L_root : L_list_pointer ABSOLUTE Root;
      L_node : L_point ABSOLUTE Node;
BEGIN { L_search_node }
  L_search_node := L_find_node (L_root, Key_data, Pred_node, L_node)
END { L_search_node };
{--------------------------------------------------------------------------}
FUNCTION L_delete_node;                       { ���p��a ���e� c �a�e� ���� }
  VAR Pred_node, Found_node : L_point;
      L_root : L_list_pointer ABSOLUTE Root;
BEGIN { L_delete_node }
  IF L_find_node (L_root, Key_data, Pred_node, Found_node) THEN
    WITH L_root^ DO
      BEGIN                                     { Ha�epe� e ��pce��� ���e� }
        Pred_node^.L_next := Found_node^.L_next;    { �������a�e �a ���e�a }
        IF L_last = Found_node THEN
          IF L_First = L_last THEN
            BEGIN               { B��e���, �o��o ce ���p��a, e e���c��e�   }
              L_First := NIL;    L_Last  := NIL
            END
          ELSE  { B��e���, �o��o ce ���p��a e �oc�e�e�, �o �e e e���c��e�  }
            L_last := Pred_node;
        IF (Found_node^.L_data <> NIL) AND (@Del_proc <> NIL) THEN
          Del_proc (Found_node);        { ������a�e �a �o�pe�. �po�e��pa   }
        DISPOSE (Found_node);  { Oc�o�o��a�a�e �a �ae�a�a o� ���e�a  �a�e� }
        L_delete_node := TRUE
      END
  ELSE
    L_delete_node := FALSE
END { L_delete_node };
{--------------------------------------------------------------------------}
PROCEDURE L_delete_list;                            { ���p��a �e��� c��c�� }
  VAR Next : L_point;
      R    : L_point;
      L_root : L_list_pointer ABSOLUTE Root;
BEGIN { L_delete_list }
  R := L_root^.L_first;
  WHILE R <> NIL DO
    BEGIN
      Next := R^.L_next;
      IF (R^.L_data <> NIL) AND (@Del_proc <> NIL) THEN
        Del_proc (R);       { O�pa�o��a c��p�a���e c ���e�a �a���  }
      DISPOSE (R);                                       { ���p��a ���e�a  }
      R := Next
    END;
  DISPOSE (L_root);                          { ���p��a �ope�a �a c��c��a   }
  L_root := NIL
END { L_delete_list };
{--------------------------------------------------------------------------}
FUNCTION L_move_node;  { �pe�ec��a ���e� o� c��c��a Source � c��c��a Dest  }
  VAR Pred_node, Found_node : L_point;
      L_source : L_list_pointer ABSOLUTE Source;
      L_dest   : L_list_pointer ABSOLUTE Dest  ;
BEGIN { L_move_node }                       { ��a �� ���e� c ���� Key_data }
  IF L_find_node (L_source, Numb, Pred_node, Found_node) THEN
    BEGIN                          { �������a�e �a ���e� o� c��c��a Source }
      IF Pred_node = NIL THEN
                           { O� c��c��a Source ce o�c�pa���a ��p��� ���e�  }
          L_source^.L_first := Found_node^.L_next
      ELSE
        Pred_node^.L_next := Found_node^.L_next;
      IF L_source^.L_last = Found_node THEN
        L_source^.L_last := Pred_node; { A�o �������a���� ���e� e �oc�e�e� }
                           { B�����a�e �a c���� ���e� �a�o �oc�e�e� � Dest }
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
FUNCTION L_process_until;  { O�xo��a �c���� ����� �o ������e��e �a �c�o��e }
  VAR Next    : L_point;
      Not_end : BOOLEAN;
      L_root : L_list_pointer ABSOLUTE Root;
BEGIN { L_process_until }
  Next := L_root^.L_first;
  Not_end := TRUE;
  WHILE (Next <> NIL) AND Not_end DO
    BEGIN             { �o��o�o��a �a ������a�e �a �ac�e�e�a�a �po�e��pa   }
      IF @Proc <> NIL THEN
        Proc (Next);
      IF @Until_cond <> NIL THEN     { ������a�e �a �ac�e�e�a�a  �������   }
        Not_end := NOT Until_cond (Next);
      Next := Next^.L_next
    END;
  L_process_until := Next <> NIL
END { L_process_until };
{--------------------------------------------------------------------------}
FUNCTION L_remove_first;            { O�c�pa���a ��p���  ���e� �a c��c��a  }
  VAR L_root : L_list_pointer ABSOLUTE Root;
      L_node : L_point ABSOLUTE Node;
BEGIN { L_remove_first }
  WITH L_node^, L_Root^ DO
    BEGIN
      L_node := L_first;
      IF L_node = NIL THEN
          L_remove_first := FALSE                     { C��c���� e �pa�e�  }
      ELSE
        BEGIN
          L_first:= L_node^.L_next;     { C��c���� c���p�a ca�o e��� ���e� }
          IF L_first^.L_next = NIL THEN
            L_last := L_first;
          L_remove_first := TRUE
        END
    END
END { L_remove_first };
{--------------------------------------------------------------------------}
BEGIN { L_lists }
  P := NIL;                                   { �op��pa �������a �po�e��pa }
  Null_func :=  Users_function  (P);     { T���� POINTER ce �peo�pa���a �  }
  Null_proc :=  Users_procedure (P);     { pa������ �po�e��p�� ���o�e      }
  @Null_del :=  NIL          { �oc�e����e ��a o�epa�opa ��a� e��a��� e�e�� }
END { L_lists }.
{--------------------------------------------------------------------------}
