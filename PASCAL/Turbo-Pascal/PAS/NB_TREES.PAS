{--------------------------------------------------------------------------}
        { T��o �a �o��� �a ��pa��e��e �a �e�a�a�c�pa�� ��o���� ��p�e�a     }
{--------------------------------------------------------------------------}
{$I NB_trees.inc}
IMPLEMENTATION
 TYPE  NB_point = ^NB_node;        { T�� �a ��a�a�e�� ��� ���e� o� ��p�o�o }
    NB_node =                      { T�� �a ���e� o� ��p�o�o               }
      RECORD
        NB_key  : POINTER;         { ��a�a�e� ��� ����a �a ���e�a          }
        NB_data : POINTER;         { ��a�a�e� ��� oc�o����e �a���          }
        NB_left : NB_point;        { ��a�a�e� ��� �e��� ���e�-�ac�e����    }
        NB_right: NB_point         { ��a�a�e� ��� �ec��� ���e�-�ac�e����   }
      END;
    NB_tree_pointer = ^NB_root;
    NB_root =                                   { T�� �a �ope�a �a ��p�o�o }
      RECORD                                    { ��a��pa�� �o��po�pa��:   }
        NB_proc : NB_users_procedure;{�a o�pa�o��a �a ������e �p� o�xo��a�e}
        NB_del  : NB_users_del;      {�a o�pa�o��a �a ������e �p� ���p��a�e}
        NB_comp : NB_users_comp;      { �a cpa����a�e �a ����o�e           }
        NB_start: NB_point;           { ��a�a�e� ��� ��p��� ��o� � ��p�o�o }
        NB_key_size : BYTE; { Pa��ep �a �a�e��a, o��e�e�a �a ���� (�a��o�e)}
        NB_data_size: WORD  { Pa��ep �a �a�e��a, o��e�e�a �a �a���(�a��o��)}
      END;
{--------------------------------------------------------------------------}
FUNCTION NB_search_node;                        { T�pc� ���e� c �a�e� ���� }
  VAR NB_root : NB_tree_pointer ABSOLUTE Root;
      Node    : NB_point;                             { �o�o��a �po�e����a }
BEGIN { NB_search_node }
  NB_search_node := FALSE;        Node := NB_root^.NB_Start;
  WHILE Node <> NIL DO   { C��c�a ce �o ��p�o�o, ��pce��� �eo�xo����� ���� }
    WITH Node^,NB_Root^ DO {Cpa����a �a�e��� ���� c ����a �a �ope���� ���e�}
    CASE NB_comp(Key_data, NB_key^) OF
      0: BEGIN         { T�pce���� ���e� e �a�epe�, �pex��p���e �a �a����e }
           NB_search_node := TRUE;
           MOVE (NB_data^, Data, NB_data_size);
           EXIT                             { �c�e��o �a��p��a�e �a �e�o�a }
         END;
     -1: Node := NB_left ;                   { C��c�a�e �o ��p�o�o �a���o  }
      1: Node := NB_right                    { C��c�a�e �o ��p�o�o �a��c�o }
    END              { ��������a ��������, �e� �a e �a�epe� ��pce���� ���� }
END { NB_search_node };
{--------------------------------------------------------------------------}
FUNCTION NB_where_node;               { T�pc� a�peca �a ���e� c �a�e� ���� }
  VAR NB_root : NB_tree_pointer ABSOLUTE Root;
      Node    : NB_point;                             { �o�o��a �po�e����a }
BEGIN { NB_where_node }
  NB_where_node := FALSE;         Node := NB_root^.NB_Start;
  WHILE Node <> NIL DO   { C��c�a ce �o ��p�o�o, ��pce��� �eo�xo����� ���� }
    WITH Node^,NB_Root^ DO {Cpa����a �a�e��� ���� c ����a �a �ope���� ���e�}
    CASE NB_comp(Key_data, NB_key^) OF
      0: BEGIN         { T�pce���� ���e� e �a�epe�, �pex��p���e �a �a����e }
           NB_where_node := TRUE;   Data_point := NB_data;
           EXIT                             { �c�e��o �a��p��a�e �a �e�o�a }
         END;
     -1: Node := NB_left ;                   { C��c�a�e �o ��p�o�o �a���o  }
      1: Node := NB_right                    { C��c�a�e �o ��p�o�o �a��c�o }
    END              { ��������� �a��p��a, �e� �a e �a�epe� ��pce���� ���� }
END { NB_where_node };
{--------------------------------------------------------------------------}
FUNCTION NB_insert_node;      { B�����a � ��p�o�o e�e�e�� c o�pe�e�e� ���� }
  VAR  Node_pointer : NB_point;
       NB_root : NB_tree_pointer ABSOLUTE Root;
       Node : NB_point;
  {------------------------------------------------------------------------}
  FUNCTION New_node : NB_point;                { C���a�a ��c� � �o �a����a }
    VAR P_node : NB_point;
  BEGIN { New_node }                      { Pe�ep��pa �a�e� �a �o��� ���e� }
    NEW (P_node);   P_node^.NB_left  := NIL;      P_node^.NB_right := NIL;
    WITH P_node^, NB_root^ DO
      BEGIN         { Pe�ep��pa �a�e� � c�xpa���a � �e� �a����e �a ���e�a }
        GetMem (NB_data, NB_data_size);
        Move (Data, NB_data^, NB_data_size);
        GetMem (NB_key, NB_key_Size);        { Pe�ep��pa �a�e� � c�xpa���a }
        Move (Key_data, NB_key^, NB_key_size)    { � �e� ����a �a ���e�a   }
      END;
    New_node := P_node
  END { New_node };
  {------------------------------------------------------------------------}
BEGIN { NB_insert_node }      { B�����a � ��p�o�o e�e�e�� c o�pe�e�e� ���� }
  NB_insert_node := TRUE;
  Node_pointer := NB_root^.NB_Start;
  IF Node_pointer = NIL THEN                  { A�o ��p�o�o ���a �����,    }
    BEGIN Node := New_node;                   { c���a�a �o� ���e�  �       }
      NB_root^.NB_Start := Node               { �o c��p��a � ��p�o�o       }
    END
  ELSE                        { �o�a�o �e e �oc����a�o ��c�o�o �a �����a�e }
    WHILE Node_pointer <> NIL DO
      WITH Node_pointer^ DO
        CASE NB_root^.NB_comp(Key_data, NB_key^) OF
        -1: BEGIN                   { T�pce�o�o ��c�o e � ���o�o  �o���p�o }
              IF NB_left = NIL THEN
                BEGIN                      { T�pce�o�o ��c�o e �oc����a�o  }
                  Node := New_node;  NB_left := Node;  EXIT
                END
              ELSE                { T�pce�e�o �po����a�a � ���o�o �o���p�o }
                Node_pointer := NB_left
            END;
         1: BEGIN                    { T�pce���� ���� e � ��c�o�o �o���p�o }
              IF NB_right = NIL THEN
                BEGIN                       { T�pce�o�o ��c�o e �oc����a�o }
                  Node := New_node;  NB_right  := Node;  EXIT
                END
              ELSE               { T�pce�e�o �po����a�a � ��c�o�o �o���p�o }
                Node_pointer := NB_right
            END;
         0: BEGIN                          { O��p�� e e�e�e�� c �o�� ���� }
              Node := Node_pointer;   NB_insert_node := FALSE;   EXIT
            END
        END
END { NB_insert_node };
{--------------------------------------------------------------------------}
FUNCTION NB_delete_node;                  { ���p��a ���e� c o�pe�e�e� ���� }
  VAR NB_root : NB_tree_pointer ABSOLUTE Root;
      Succ_node     : NB_point;                    { �o�o��a �po�e����a    }
      Node          : ^NB_point;                   { �o�o��a �po�e����a    }
  {------------------------------------------------------------------------}
  PROCEDURE Dispose_node  {Oc�o�o��a�a �a�e��a, �p��a��e�a�a �a ���e�a Temp}
            (Temp : NB_point);
  BEGIN  { Dispose_node }
    WITH NB_root^, Temp^ DO
      BEGIN
        IF (@NB_Del <> NIL) AND (NB_data <> NIL) THEN  { ������a �e�o�a �a }
          NB_Del (NB_data);           { o�pa�o��a �a �a����e �p� ���p��a�e }
        FreeMem (NB_data, NB_data_size);  { Oc�o�o��a�a �a�e��a �a �a����e }
        FreeMem (NB_key,  NB_key_size)  { Oc�o�o��a�a �a�e��a �a ����o�e�e }
      END;
    DISPOSE(Temp)                   { Oc�o�o��a�a �a�e��a, �ae�a o� ���e�a }
  END { Dispose_node };
  {------------------------------------------------------------------------}
  PROCEDURE Delete_node            { O�c�pa���a �oco�e��� ���e� o� ��p�o�o }
            (VAR Node : NB_point);
    VAR Temp : NB_point;
  BEGIN  { Delete_node }
    IF Node^.NB_right = NIL THEN           { ��a �� ���e��� ��c�o �o���p�o?}
      BEGIN                { A�o ���a - ���e��� ce o�c�pa���a, a �a �e�o�o }
                           { ��c�o ce c��p��a ���o�o �o���p�o              }
        Temp := Node;   Node :=  Node^.NB_left;   Dispose_node (Temp)
      END
    ELSE
      IF Node^.NB_left = NIL THEN          { ��a �� ���e��� ���o �o���p�o? }
        BEGIN              { A�o ���a - ���e��� ce o�c�pa���a, a �a �e�o�o }
                           { ��c�o ce c��p��a ��c�o�o �o���p�o             }
          Temp := Node;  Node :=  Node^.NB_right;  Dispose_node (Temp)
        END
      ELSE
        BEGIN                        { ������ ���e��� ��a ��a �ac�e����a,  }
          Temp := Node^.NB_right;         { ��pc� ce �a�-������ ���� ��    }
          WHILE Temp^.NB_left <> NIL DO   { ������ ��������� (c��c�a ce �o }
            Temp := Temp^.NB_left;        { �e���e ��o�� �o ��p��� ��c�)   }
          Temp^.NB_left := Node^.NB_left; { K�� �o�� ���e� ce c��p��a      }
          Temp := Node;               { �e���� �ac�e���� �a ���p��a��� ��o�}
          Node := Node^.NB_right;     { B��e��� ce o�c�pa���a � �a �e�o�o  }
          Dispose_node (Temp)         { ��c�o ce c��p��a �ec���� �� ��o�   }
        END
  END { Delete_node };
  {------------------------------------------------------------------------}
BEGIN { NB_delete_node }                  { ���p��a ���e� c o�pe�e�e� ���� }
  NB_delete_node := FALSE;
  Succ_node := NB_root^.NB_Start;
  Node := @NB_root^.NB_start;
  WHILE Succ_node <> NIL DO            { T�pce�e �a ���e� c o�pe�e�e� ���� }
    BEGIN                                            { C��c�a�e �o ��p�o�o }
      CASE NB_root^.NB_comp(Key_data , Succ_node^.NB_key^) OF
       0: BEGIN                                        { B��e��� e �a�epe� }
           Delete_node (Node^);            { ������� �� ���p��a o� ��p�o�o }
           NB_delete_node := TRUE; EXIT       { ��������a �a��p��a �c����o }
          END;
      -1: BEGIN                                { T�pce�e � ���o�o �o���p�o }
            Node      := @Succ_node^.NB_left;
            Succ_node := Succ_node^.NB_left
          END;
       1: BEGIN                               { T�pce�e � ��c�o�o �o���p�o }
            Node      := @Succ_node^.NB_right;
            Succ_node := Succ_node^.NB_right
          END
      END  { Case }
    END { While}               { ��������a �a��p��a, �e� �a e ���p�� ���e� }
END { NB_delete_node };
{--------------------------------------------------------------------------}
PROCEDURE NB_delete_tree;                           { ���p��a ���o�o ��p�o }
  VAR NB_root : NB_tree_pointer ABSOLUTE Root;
  PROCEDURE Post_visit                    { O�xo��a ��p�o�o o��o��-�a�ope  }
            (P: NB_point);                { Ha�a�o �a o�xo��a�e�o          }
  BEGIN { Post_visit }
    IF P <> NIL THEN
      WITH P^, NB_root^ DO
        BEGIN  Post_visit (NB_left);       { O�xo��a ���o�o �o���p�o       }
          Post_visit (NB_right);           { O�xo��a ��c�o�o �o���p�o      }
          IF (@NB_Del <> NIL) AND (NB_data <> NIL) THEN
            NB_Del (NB_data);              { ������a �p��o��a�a �������    }
          FreeMem (NB_data, NB_data_size); { Oc�o�o��a�a �a�e��a �a �a����e}
          FreeMem (NB_key,  NB_key_size);  { Oc�o�o��a�a �a�e��a �a ����a  }
          DISPOSE(P)                       { Oc�o�o��a�a �a�e��a �a ���e�a }
        END
  END { Post_visit };
  {------------------------------------------------------------------------}
BEGIN { NB_delete_tree }                            { ���p��a ���o�o ��p�o }
  Post_visit (NB_root^.NB_start); { O�xo��a ��p�o�o, c�ap��pa��� o� �ope�a }
  DISPOSE (NB_root);              { Oc�o�o��a�a �a�e��a, �ae�a o� �ope�a   }
  NB_root := NIL
END { NB_delete_tree };
{--------------------------------------------------------------------------}
PROCEDURE NB_process;                    { O�xo��a �c���� ����� �a ��p�o�o }
  VAR NB_root : NB_tree_pointer ABSOLUTE Root;
  {------------------------------------------------------------------------}
  PROCEDURE Pre_visit                      { O�xo��a ��p�o�o � ����o���a   }
            (P: NB_point);                 { �oce�e� ���e�                 }
  BEGIN { Pre_visit }
    IF P <> NIL THEN
      WITH P^, NB_root^ DO
        BEGIN
          IF @NB_Proc <> NIL THEN           { O�pa�o��a c��p�a���e �a���   }
            NB_Proc (NB_key^, NB_data^);
          Pre_visit (NB_left);       { O�xo��a ���o�o �o���p�o � ����o���a }
          Pre_visit (NB_right)       { O�xo��a ��c�o�o �o���p�o � ����o���a}
        END
  END { Pre_visit };
  {------------------------------------------------------------------------}
  PROCEDURE Post_visit                     { O�xo��a ��p�o�o o��o��-�a�ope }
            (P: NB_point);                 { �oce�e� ���e�                 }
  BEGIN { Post_visit }
    IF P <> NIL THEN
      WITH P^, NB_root^ DO
        BEGIN  Post_visit (NB_left); {O�xo��a ���o�o �o���p�o o��o��-�a�ope}
          Post_visit (NB_right);    {O�xo��a ��c�o�o �o���p�o o��o��-�a�ope}
          IF @NB_Proc <> NIL THEN
            NB_Proc (NB_key^, NB_data^)    { O�pa�o��a c��p�a���e �a���    }
        END
  END { Post_visit };
  {------------------------------------------------------------------------}
  PROCEDURE In_visit                          { O�xo��a ��p�o�o c��e�p���o }
            (P: NB_point);                    { �oce�e� ���e�              }
  BEGIN { In_visit }
    IF P <> NIL THEN
      WITH P^, NB_root^ DO
        BEGIN In_visit (NB_left);     { O�xo��a ���o�o �o���p�o c��e�p���o }
          IF @NB_Proc <> NIL THEN
            NB_Proc (NB_key^, NB_data^);   { O�pa�o��a c��p�a���e �a���    }
          In_visit (NB_right);       { O�xo��a ��c�o�o �o���p�o c��e�p���o }
        END
  END { In_visit };
  {------------------------------------------------------------------------}
BEGIN { NB_process }                     { O�xo��a �c���� ����� �a ��p�o�o }
  IF NB_root <> NIL THEN
    CASE Kind_visit OF            { O�xo��a ��p�o�o, c�ap��pa��� o� �ope�a }
      Preorder : Pre_visit(NB_root^.NB_start);    { B ����o���a            }
      Inorder  : In_visit(NB_root^.NB_start);     { C��e�p���o             }
      Postorder: Post_visit(NB_root^.NB_start)    { O��o��-�a�ope          }
  END;
END { NB_process };
{--------------------------------------------------------------------------}
PROCEDURE NB_init;                   { C���a�a �e�a�a�c�pa�o ��o���o ��p�o }
  VAR NB_root : NB_tree_pointer ABSOLUTE Root;
BEGIN { NB_init }     { �a ce �o�a�� �po�ep�a �a �ope���oc� �a �apa�e�p��e }
  NEW (NB_root);                               { Pe�ep��pa �a�e� �a �ope�a }
  WITH NB_root^ DO
    BEGIN    NB_start := NIL;                 { �o����a �o�e�a�a �a �ope�a }
      NB_proc := Proc;   NB_del := Del;   NB_comp :=  Compare;
      NB_key_size := Key_size;  NB_data_size := Data_size
    END
END { NB_init };
{--------------------------------------------------------------------------}
BEGIN { NB_trees }
  @NB_null_proc := NIL;     @NB_null_del  := NIL;
END.  { NB_trees }
{--------------------------------------------------------------------------}
