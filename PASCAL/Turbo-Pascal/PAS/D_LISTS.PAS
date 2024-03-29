         {-----------------------------------------------------------------}
         { T��o �a �o��� �a ��pa��e��e �a ���c��p�a�� cop��pa�� c��c���    }
         {-----------------------------------------------------------------}
{$I D_lists.inc}
IMPLEMENTATION
  TYPE   Point_to_D_pointer = ^D_point;
    D_point = ^D_node;             { T�� �a ��a�a�e�� ��� ���e� o� c��c��a }
    D_node = RECORD                { T�� �a ���e� o� c��c��a               }
               D_key  : D_key_type;{ K��� �a ���e�a                        }
               D_data : POINTER;   { ��a�a�e� ��� oc�o����e �a���          }
               D_next : D_point;   { ��a�a�e� ��� c�e��a��� ���e�          }
               D_back : D_point    { ��a�a�e� ��� �pe������ ���e�          }
             END;
    D_list_pointer = ^D_root;
    D_root = RECORD                        { T�� �a �ec�p���opa �a c��c��a }
               D_Proc: D_users_procedure;  { �p��o��� �po�e��p� � �������  }
               D_Func: D_users_function;
               D_Del : D_users_del;
               D_next: D_point;           { ��a�a�e� ��� ��p��� e�e�e��    }
               D_back: D_point            { ��a�a�e� ��� �oc�e���� e�e�e�� }
             END;
{--------------------------------------------------------------------------}
FUNCTION D_get_data;       { Bp��a c�o��oc��a �a �o�e�o �a �a��� �a ���e�a }
BEGIN  { D_get_data }
  D_get_data := D_point(X)^.D_data
END { D_get_data };
{--------------------------------------------------------------------------}
FUNCTION D_get_key;                  { Bp��a c�o��oc��a �a ����a �a ���e�a }
BEGIN { D_get_key }
  D_get_key := D_point(X)^.D_key
END { D_get_key };
{--------------------------------------------------------------------------}
FUNCTION D_find_node          { T�pc� ���e� c�c c�o��oc� �a ����a Key_data }
          (Root      : D_list_pointer;                   { Kope� �a ���e�a }
           Key_data  : D_key_type;               { K��� �a ��pce��� ���e�  }
           VAR Pred_node : Point_to_D_pointer; { ��a�a�e� ��� �o�e�o D_next}
                                               { o� ���e�a-�pe��ec��e���   }
           VAR Succ_node : D_point       { ��a�a�e� ��� ���e�a-�ac�e����   }
           ): BOOLEAN;   { Pe����a� : TRUE  - ��pce���� ���e� e �a�epe�    }
                         {            FALSE - ���e� c �o�� ���� �e e ������}
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
FUNCTION D_search_node;                        { T�pc� ���e� c �a�e� ����  }
  VAR Pred_node : Point_to_D_pointer;
      D_root    : D_list_pointer ABSOLUTE Root;
      Node      : D_point ABSOLUTE Succ_node;
BEGIN { D_search_node }
  D_search_node := D_find_node (D_root, Key_data, Pred_node, Node)
END { D_search_node };
{--------------------------------------------------------------------------}
FUNCTION D_insert_node;        { B�����a � c��c��a e�e�e�� c ���� Key_data }
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
            BEGIN                           { �oc����a� e �pa�� �a c��c��a }
              D_back := D_root^. D_back;  D_root^.D_back := New_node
            END;
          Node := New_node;               D_insert_node := TRUE
        END
    END
END { D_insert_node };
{--------------------------------------------------------------------------}
PROCEDURE D_position_after;         { T�pc� ��p��� ���e�, �a��pa� ce ����  }
                                    { ���e� c ���� Key_data                }
  VAR D_root    : D_list_pointer ABSOLUTE Root;
      Node      : D_point ABSOLUTE Succ_node;
BEGIN { D_position_after }
  IF D_Search_node (D_root, Key_data, Succ_node) THEN
    Node := Node^.D_next
END { D_position_after };
{--------------------------------------------------------------------------}
PROCEDURE D_position_before;      { T�pc� ��p���  ���e�, �a��pa� ce ����   }
                                  { ���e� c ���� Key_data                  }
  VAR D_root    : D_list_pointer ABSOLUTE Root;
      Node      : D_point ABSOLUTE Succ_node;
BEGIN { D_position_before }
  IF D_Search_node (D_root, Key_data, Succ_node) THEN
    Node := Node^.D_back
END { D_position_before };
{--------------------------------------------------------------------------}
PROCEDURE D_delete_list;                            { ���p��a �e��� c��c�� }
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
FUNCTION D_delete_node;        { ���p��a o� c��c��a ���e� c o�pe�e�e� ���� }
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
FUNCTION D_find_next_node    { T�pc� � c��c��a e�e�e��a, c�e��a� Curr_node }
          (Curr_node : D_pointer;
       VAR Succ_node : D_pointer          { ��a�a�e� ��� �a�epe��� e�e�e�� }
           ): BOOLEAN;     {  Pe����a� :  TRUE  - �a�epe� e c�e��a� ���e�  }
                           {              FALSE - ���a �a��� ���e�         }
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
FUNCTION D_find_back_node                      { T�pc� � c��c��a e�e�e��a, }
          (Curr_node : D_pointer;              { �pe��ec����a�  Curr_node  }
       VAR Pred_node : D_pointer          { ��a�a�e� ��� �a�epe��� e�e�e�� }
           ) : BOOLEAN;    {  Pe����a� :  TRUE  - �a�epe� e �pe���e� ���e� }
                           {              FALSE - ���a �a��� ���e�         }
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
FUNCTION D_process_until;  { O�xo��a �c���� ����� �o ������e��e �a �c�o��e }
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
PROCEDURE D_init;                          { C���a�a �o� ���c��p�a� c��c�� }
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