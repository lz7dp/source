
{--------------------------------------------------------------------------}
        { T��o �a �o��� �a ��pa��e��e �a �a�a�c�pa�� (AVL) ��o���� ��p�e�a }
{$I AVLtrees.inc ----------------------------------------------------------}
IMPLEMENTATION
 USES Util;
 TYPE Balance =                           { Mo�e���o c�c�o���e �a ���e�a:  }
     (Left_heighten,                             { �e���� ��o� e �o-�����  }
      Equal_height,                              { ��a�a ��o�a ca pa���    }
      Right_heighten);                           { �ec���� ��o� e �o-����� }
    AVL_point = ^AVL_node;         { T�� �a ��a�a�e� ��� ���e� o� ��p�o�o  }
    AVL_node =                     { T�� �a ���e� o� ��p�o�o               }
      RECORD
        AVL_key    : POINTER;      { ��a�a�e� ��� ����a �a ���e�a          }
        AVL_data   : POINTER;      { ��a�a�e� ��� oc�o����e �a���          }
        AVL_left   : AVL_point;    { ��a�a�e� ��� �e��� ���e�              }
        AVL_right  : AVL_point;    { ��a�a�e� ��� �ec��� ���e�             }
        AVL_balance: Balance;      { C�c�o���e �a ���e�a                   }
      END;
    AVL_tree_pointer = ^AVL_root;  {T�� �a ��a�a�e� ��� �ec�p���.�a ��p�o�o}
    AVL_root =                             { T�� �a �ec�p���opa �a ��p�o�o }
      RECORD                             { ��a��pa�� �e�o��:               }
        AVL_proc  : AVL_users_procedure; {      �a o�pa�o��a �p� o�xo��a�e }
        AVL_del   : AVL_users_del;       {      �a o�pa�o��a �p� ���p��a�e }
        AVL_comp  : AVL_users_comp;      {      �a cp���e��e �a ����o�e    }
        AVL_start : AVL_point;                  { ��a�a�e� ��� ��p��� ��o� }
        AVL_key_size : BYTE;           { Pa��ep �a �o�e�o �a ���� (�a��o�e)}
        AVL_data_size: WORD            { Pa��ep �a �o�e�o �a �a���(�a��o�e)}
      END;
{--------------------------------------------------------------------------}
FUNCTION AVL_search_node;                       { T�pc� ���e� c �a�e� ���� }
  VAR AVL_root : AVL_tree_pointer ABSOLUTE Root;   { ��a�a�e� ��� ��p�o�o  }
      Node     : AVL_point;                        { �o�o��a �po�e����a    }
BEGIN { AVL_search_node }
  AVL_search_node := FALSE;       Node := AVL_root^.AVL_start;
  WHILE Node <> NIL DO        { C��c�a�e �o ��p�o�o, c�ap��pa��� o� �ope�a }
    WITH Node^, AVL_root^ DO
      CASE AVL_comp (Key_data, AVL_key^) OF
        EQ: BEGIN                          { A�o ��pce���� ���e� e �a�epe� }
              AVL_search_node := TRUE;
              MOVE (Node^.AVL_data^, Data, AVL_root^.AVL_data_size);
              EXIT        { ��������a �a��p��a �op�a��o. B��e��� e �a�epe� }
            END;
                  { A�o ��pce���� ���e� �e e �a�epe�, ��pce�e�o �po����a�a }
        LT:  Node := Node^.AVL_left;          { C��c�a�e �o ��p�o�o �a���o }
        GT:  Node := Node^.AVL_right          { C��c�a�e �o ��p�o�o �a��c�o}
      END
                       { �������a �a��p��a �e� �a e �a�epe� ��pce��� ���e� }
END { AVL_search_node };
{--------------------------------------------------------------------------}
FUNCTION AVL_insert_node;     { B�����a � AVL-��p�o ���e� c o�pe�e�e� ���� }
  VAR  Node_pointer : AVL_point;
      AVL_root : AVL_tree_pointer ABSOLUTE Root;
      Node : AVL_point;
      Bool : BOOLEAN;
  {------------------------------------------------------------------------}
  FUNCTION New_node : AVL_point;          { C���a�a ���e� c o�pe�e�e� ���� }
    VAR P_node : AVL_point;
  BEGIN { New_node }
    NEW (P_node); New_node := P_node;          { Pe�ep��pa �a�e� �a ���e�a }
    WITH P_node^, AVL_root^ DO
      BEGIN
        AVL_balance := Equal_height;  AVL_left  := NIL;  AVL_right := NIL;
        GetMem (AVL_data, AVL_data_size);     { Pe�ep��pa �a�e� �a �a����e }
        Move (Data, AVL_data^,AVL_data_size); {C�xpa���a �a����e ��� ���e�a}
        GetMem (AVL_key, AVL_key_size);       { Pe�ep��pa �a�e� �a ����a   }
        Move (Key_data, AVL_key^,AVL_key_size) { C�xpa���a ����a ��� ���e�a}
      END { With };
    AVL_insert_node := TRUE
  END { New_node };
  {------------------------------------------------------------------------}
  FUNCTION Insert_node                      { B�����a ���e� � AVL-��p�o    }
           (VAR Temp: AVL_point
           ): BOOLEAN;                    { TRUE - �po�e�e�a e ��co���a�a  }
    VAR Left_node,Right_node: AVL_point;
    {----------------------------------------------------------------------}
    PROCEDURE Left_balance; { �pe�� ������a�e�o �e���� ��o� e ��� �o-����� }
    BEGIN                                       { A�a��� �a �e��� ��o�     }
      Left_node := Temp^.AVL_left;
      IF  Left_node^.AVL_balance = Left_heighten THEN
        BEGIN
          Temp^.AVL_left := Left_node^.AVL_right;
          Left_node^.AVL_right := Temp;
          Temp^.AVL_balance := Equal_height;
          Temp := Left_node
        END
          ELSE
        BEGIN
          Right_node := Left_node^.AVL_right;
          Left_node^.AVL_right := Right_node^.AVL_left;
          Right_node^.AVL_left := Left_node;
          Temp^.AVL_left := Right_node^.AVL_right;
          Right_node^.AVL_right := Temp;
          CASE Right_node^.AVL_balance OF
            Left_heighten : Temp^.AVL_balance := Right_heighten;
            Equal_height,
            Right_heighten: Temp^.AVL_balance := Equal_height
          END;
          CASE Right_node^.AVL_balance OF
            Left_heighten,
            Equal_height  : Left_node^.AVL_balance := Equal_height;
            Right_heighten: Left_node^.AVL_balance := Left_heighten
          END { Case Right_node^.AVL_balance };
          Temp := Right_node
        END;
      Insert_node := FALSE;
      Temp^.AVL_balance := Equal_height
    END { Left_balance };
    {----------------------------------------------------------------------}
    PROCEDURE Right_balance; {�pe�� �����a�e�o �ec���� ��o� e ��� �o-����� }
    BEGIN                                          { A�a��� �a �ec��� ��o� }
      Right_node := Temp^.AVL_right;
      IF  Right_node^.AVL_balance = Right_heighten THEN
        BEGIN { �pe�� �����a�e�o �ec���� ��o� �a �ec��� ��o� e ��� �o �����}
          Temp^.AVL_right      := Right_node^.AVL_left;
          Right_node^.AVL_left := Temp;
          Temp^.AVL_balance    := Equal_height;
          Temp := Right_node
        END
      ELSE
        BEGIN
          Left_node := Right_node^.AVL_left;
          Right_node^.AVL_left := Left_node^.AVL_right;
          Left_node^.AVL_right := Right_node;
          Temp^.AVL_right := Left_node^.AVL_left;
          Left_node^.AVL_left := Temp;
          CASE Left_node^.AVL_balance OF
            Left_heighten,
            Equal_height  : Temp^.AVL_balance := Equal_height;
            Right_heighten: Temp^.AVL_balance := Left_heighten
          END;
          CASE Left_node^.AVL_balance OF
            Left_heighten : Right_node^.AVL_balance := Right_heighten;
            Equal_height,
            Right_heighten: Right_node^.AVL_balance := Equal_height
          END;
          Temp := Left_node
        END;
      Insert_node := FALSE;
      Temp^.AVL_balance := Equal_height
    END { Right_balance };
    {----------------------------------------------------------------------}
  BEGIN { Insert_node }
   IF Temp = NIL THEN
     BEGIN
       Temp := New_node;          Insert_node := TRUE;
     END
   ELSE
     CASE AVL_root^.AVL_comp(Key_data, Temp^.AVL_key^) OF
   LT:
       BEGIN
         IF Insert_node (Temp^.AVL_left) THEN     { �e���� ��o� e �apac�a� }
           CASE  Temp^.AVL_balance OF
            Left_heighten: Left_balance;
            Equal_height:   { �pe�� ������a�e�o ��a�a ��o�a ca ���� pa���  }
             BEGIN          { C�e� ������a�e�o �e���� ���� c�a�a �o-�����  }
               Temp^.AVL_balance := Left_heighten;    Insert_node := TRUE
             END { Equal_height };
            Right_heighten: { �pe�� ������a�e�o �ec���� ��o� e ��� �o-�����}
             BEGIN          { C�e� ������a�e�o ��a�a ��o�a c�a�a� pa���    }
               Temp^.AVL_balance := Equal_height;     Insert_node := FALSE
             END
            END { Case }
          ELSE
            Insert_node := FALSE
       END { Lt };
   GT: BEGIN
         IF Insert_node (Temp^.AVL_right) THEN  { ��c���� ��o� e �apac�a�  }
           CASE  Temp^.AVL_balance OF
             Left_heighten:  { �pe�� ������a�e�o �e���� ��o� e ��� �o-�����}
               BEGIN         { C�e� ������a�e�o ��a�a ��o�a c�a�a� pa���   }
                 Temp^.AVL_balance := Equal_height;   Insert_node := FALSE
               END;
             Equal_height:    { �pe�� ������a�e�o ��a�a ��o�a ca ���� pa���}
               BEGIN          { C�e� �����a�e�o �ec���� ��o� c�a�a �o-�����}
                 Temp^.AVL_balance := Right_heighten; Insert_node := TRUE
               END;
             Right_heighten: Right_balance;
           END   { Case }
         ELSE
           Insert_node := FALSE
       END { Gt };
   EQ:  Insert_node := FALSE;
     END { Case }
  END { Insert_node };
BEGIN { AVL_insert_node }
  AVL_insert_node := FALSE;        Node_pointer := AVL_root^.AVL_Start;
  IF Node_pointer = NIL THEN                           { ��p�o�o e �pa��o  }
    BEGIN   Node := New_node;
      AVL_root^.AVL_Start := Node
    END
  ELSE
    Bool :=Insert_node (AVL_root^.AVL_start)
END { AVL_insert_node };
{--------------------------------------------------------------------------}
FUNCTION AVL_delete_node;                 { ���p��a ���e� c o�pe�e�e� ���� }
  VAR Node     : AVL_point;
      AVL_root : AVL_tree_pointer ABSOLUTE Root;
      Bool     : BOOLEAN;
      Not_exist: WORD;
  {------------------------------------------------------------------------}
  PROCEDURE Dispose_node { Oc�o�o��a�a �a�e��a, o��e�e�a �a ����a � �a����e}
            (Temp : AVL_point);
  BEGIN { Dispose_node }
    IF (@AVL_root^.AVL_Del <> NIL) AND (Temp^.AVL_data <> NIL) THEN
      AVL_root^.AVL_Del (Temp^.AVL_data);
    FreeMem (Temp^.AVL_data, AVL_root^.AVL_data_size);
    FreeMem (Temp^.AVL_key,  AVL_root^.AVL_key_size)
  END { Dispose_node };
  {------------------------------------------------------------------------}
  FUNCTION Delete_node (VAR Node : AVL_point): BOOLEAN;
    VAR Temp : AVL_point;
    {----------------------------------------------------------------------}
    FUNCTION BalanceL { �a�a�c �a ���e�a,�o�a�o �e���� ��o� e c�a�a� �o-��c}
             (VAR Node: AVL_point
             ):BOOLEAN;
      VAR P1,P2: AVL_point;
          Baln: Balance;
    BEGIN
      CASE Node^.AVL_balance OF       { C�c�o���e �a ���e�a �pe�� �a�a�ca  }
       Left_heighten:
         BEGIN
           Node^.AVL_balance := Equal_height;     BalanceL := TRUE;
         END;
       Equal_height:
         BEGIN
           Node^.AVL_balance := Right_heighten;   BalanceL := FALSE;
         END;
       Right_heighten:
         BEGIN
             P1 := Node^.AVL_right;
             CASE P1^.AVL_balance OF
              Equal_height:
               BEGIN
                 Node^.AVL_right   := P1^.AVL_left;   P1^.AVL_left := Node;
                 Node^.AVL_balance := Right_heighten;
                 P1^.AVL_balance   := Left_heighten;
                 BalanceL          := FALSE;          Node := P1
               END;
             Right_heighten:
               BEGIN
                 Node^.AVL_right   := P1^.AVL_left;   P1^.AVL_left := Node;
                 Node^.AVL_balance := Equal_height;
                 P1^.AVL_balance   := Equal_height;
                 BalanceL := TRUE;                    Node := P1
               END;
             Left_heighten:
               BEGIN
                 P2 := P1^.AVL_left;        Baln := P2^.AVL_balance;
                 P1^.AVL_left    := P2^.AVL_right;
                 P2^.AVL_right   := P1;
                 Node^.AVL_right := P2^.AVL_left;
                 P2^.AVL_left := Node;
                 IF Baln = Right_heighten THEN
                   Node^.AVL_balance := Left_heighten
                 ELSE
                   Node^.AVL_balance := Equal_height;
                 IF Baln = Left_heighten THEN
                   P1^.AVL_balance := Right_heighten
                 ELSE
                   P1^.AVL_balance := Equal_height;
                 BalanceL := TRUE;
                 Node := P2;            P2^.AVL_balance := Equal_height
               END
             END
         END
      END
    END { BalanceL };
    {----------------------------------------------------------------------}
    FUNCTION BalanceR {�a�a�c �a ���e�a,�o�a�o �ec���� ��o� e c�a�a� �o-��c}
             (VAR Node: AVL_point
             ):BOOLEAN;
      VAR P1,P2: AVL_point;
          Baln: Balance;
    BEGIN
      CASE Node^.AVL_balance OF
       Right_heighten:
         BEGIN
           Node^.AVL_balance := Equal_height;
           BalanceR := TRUE;
         END;
       Equal_height:
         BEGIN
           Node^.AVL_balance := Left_heighten;
           BalanceR := FALSE;
         END;
       Left_heighten:
         BEGIN
             P1 := Node^.AVL_left;
             CASE P1^.AVL_balance OF
              Equal_height:
               BEGIN
                 Node^.AVL_left := P1^.AVL_right;
                 P1^.AVL_right := Node;
                 Node^.AVL_balance := Left_heighten;
                 P1^.AVL_balance := Right_heighten;
                 BalanceR := FALSE;
                 Node := P1;
               END;
             Left_heighten:
               BEGIN
                 Node^.AVL_left := P1^.AVL_right;
                 P1^.AVL_right := Node;
                 Node^.AVL_balance := Equal_height;
                 P1^.AVL_balance := Equal_height;
                 BalanceR := TRUE;
                 Node := P1
               END;
             Right_heighten:
               BEGIN
                 P2 := P1^.AVL_right;
                 Baln := P2^.AVL_balance;
                 P1^.AVL_right := P2^.AVL_left;
                 P2^.AVL_left := P1;
                 Node^.AVL_left :=P2^.AVL_right;
                 P2^.AVL_right := Node;
                 IF Baln = Left_heighten THEN
                   Node^.AVL_balance := Right_heighten
                 ELSE
                   Node^.AVL_balance := Equal_height;
                 IF Baln = Right_heighten THEN
                   P1^.AVL_balance := Left_heighten
                 ELSE
                   P1^.AVL_balance := Equal_height;
                 BalanceR := TRUE;
                 Node := P2;
                 P2^.AVL_balance := Equal_height
               END
             END
         END
      END
    END { BalanceR };
  {------------------------------------------------------------------------}
  FUNCTION Del         { ��������a ��pc� ��o�, �o��o ���a �ece� �ac�e����  }
           (VAR R: AVL_point                    { Ha�a�e� ���e� �a ��pce�e }
           ): BOOLEAN;
    VAR X : AVL_point;
  BEGIN { Del }     Del := FALSE;
    IF R^.AVL_right <> NIL THEN { Pe��pc���o c��c�a�e �o �ec���e �ac�e�����}
      BEGIN
        IF Del(R^.AVL_right) THEN
          Del := BalanceR(R)
        ELSE                                           { He����o�e� c���a� }
          Del := FALSE
      END
    ELSE
      BEGIN                          { �oc����a� e ���e� c �ece� �ac�e���� }
        Dispose_node (Temp);         { Oc�o�o��a�a� ce ������ � �a����e    }
                                     { �a ���p��a��� ���e�                 }
        Temp^.AVL_key := R^.AVL_key; { �pex��p��� ce �o�e�a�a �a ���e�a    }
        Temp^.AVL_data := R^.AVL_data;
        Temp := R;                   { To�� ���e� �e ���e o�c�pa�e�, c�e�  }
        R := R^.AVL_left;            { �a�o ���e ������e� o� ��p�o�o       }
        DISPOSE (Temp);          Del := TRUE
      END
  END { Del };
  {------------------------------------------------------------------------}
  BEGIN  { Delete_node }
    IF Node = NIL THEN
      BEGIN   Bool := FALSE;           { B ��p�o�o ���a ���e� c �a��� ���� }
        Long_exit (Not_exist)
      END
    ELSE
      BEGIN
        Delete_node := FALSE;
        CASE AVL_root^.AVL_comp(Key_data , Node^.AVL_key^) OF
        LT: BEGIN                             { C��c�a�e �a���o �o ��p�o�o }
              IF Delete_node (Node^.AVL_left) THEN
                Delete_node := BalanceL(Node)     { B�co���a�a e �po�e�e�a }
            END;
        GT: BEGIN                             { C��c�a�e �a��c�o �o ��p�o�o}
              IF Delete_node (Node^.AVL_right) THEN
                Delete_node := BalanceR (Node)    { B�co���a�a e �po�e�e�a }
            END;
        EQ: BEGIN {T�pce���� ���e� e �a�epe�. �po�ep�a �a��� �ac�e����� ��a}
              Temp := Node;
              IF Temp^.AVL_right = NIL THEN         { H��a �ece� �ac�e���� }
                BEGIN  Node := Temp^.AVL_left;
                  Dispose_node(Temp);         Dispose(Temp);
                  Delete_node := TRUE
                END
              ELSE
                IF Temp^.AVL_left = NIL THEN          { H��a ��� �ac�e���� }
                  BEGIN  Node := Temp^.AVL_right;
                    Dispose_node(Temp);       Dispose(Temp);
                    Delete_node := TRUE
                  END
                ELSE
                  BEGIN              { Ha�epe���� ���e� ��a ��a �ac�e����a }
                    IF Del (Temp^.AVL_left) THEN
                      Delete_node := BalanceL (Node)
                    ELSE
                      Delete_node := FALSE
                  END
          END
       END { Case }
    END  { While }
  END { Delete_node };
  {------------------------------------------------------------------------}
  PROCEDURE Del_node;             { �po�e��pa, �o��o���a�a a�ap����� ��xo� }
    VAR B : BOOLEAN;
  BEGIN  { Del_node }
    Not_exist := Save_exit;
    B := Delete_node (AVL_root^.AVL_Start)
  END { Del_node };
  {------------------------------------------------------------------------}
BEGIN { AVL_delete_node }         { T��o �a oc�o���� �e�o� AVL_delete_node }
  Bool := TRUE;     Del_node;
  AVL_delete_node := Bool;
END { AVL_delete_node };
{--------------------------------------------------------------------------}
PROCEDURE AVL_delete_tree;                          { ���p��a ���o�o ��p�o }
  VAR AVL_root : AVL_tree_pointer ABSOLUTE Root;
  PROCEDURE Post_visit (P: AVL_point);
  BEGIN { Post_visit }
    IF P <> NIL THEN
      WITH P^, AVL_root^ DO
        BEGIN   Post_visit (AVL_left);
          Post_visit (AVL_right);
          IF (@AVL_del <> NIL) AND (AVL_data <> NIL) THEN
            AVL_del (AVL_data);
          FreeMem (AVL_data, AVL_data_size);
          FreeMem (AVL_key,  AVL_key_size);
          DISPOSE(P)
        END
  END { Post_visit };
  {------------------------------------------------------------------------}
BEGIN { AVL_delete_tree }                             { ���p��a ���o ��p�o }
  Post_visit (AVL_root^.AVL_start);
  DISPOSE (AVL_root);         AVL_root := NIL
END { AVL_delete_tree };
{--------------------------------------------------------------------------}
PROCEDURE AVL_process;                   { O�xo��a �c���� ����� �a ��p�o�o }
  VAR AVL_root : AVL_tree_pointer ABSOLUTE Root;
  PROCEDURE Pre_visit (P: AVL_point);              { O�xo��a�e � ����o���a }
  BEGIN { Pre_visit }
    IF P <> NIL THEN
      WITH P^, AVL_root^ DO
        BEGIN
          IF @AVL_proc <> NIL THEN
            AVL_proc (AVL_key^, AVL_data^);
          Pre_visit (AVL_left);
          Pre_visit (AVL_right)
        END
  END { Pre_visit };
  {------------------------------------------------------------------------}
  PROCEDURE Post_visit (P: AVL_point);           { O�xo��a�e o��o��-�a�ope }
  BEGIN { Post_visit }
    IF P <> NIL THEN
      WITH P^, AVL_root^ DO
        BEGIN  Post_visit (AVL_left);
          Post_visit (AVL_right);
          IF @AVL_proc <> NIL THEN
            AVL_proc (AVL_key^, AVL_data^)
        END
  END { Post_visit };
  {------------------------------------------------------------------------}
  PROCEDURE In_visit (P: AVL_point);                { C��e�p���o o�xo��a�e }
  BEGIN { In_visit }
    IF P <> NIL THEN
      WITH P^, AVL_root^ DO
        BEGIN  In_visit (AVL_left);
          IF @AVL_proc <> NIL THEN
            AVL_proc (AVL_key^, AVL_data^);
          In_visit (AVL_right)
        END
  END { In_visit };
  {------------------------------------------------------------------------}
BEGIN { AVL_process }          { O�xo��a ��p�o �o e��a o� �p��e c�pa�e���  }
  IF AVL_root <> NIL THEN
  WITH AVL_root^ DO
    CASE Kind_visit OF
      Preorder : Pre_visit (AVL_start);
      Inorder  : In_visit  (AVL_start);
      Postorder: Post_visit(AVL_start)
    END
END { AVL_process };
{--------------------------------------------------------------------------}
PROCEDURE AVL_init;                            { C���a�a �a�a�c�pa�o ��p�o }
  VAR AVL_root : AVL_tree_pointer ABSOLUTE Root;
BEGIN { AVL_init }     NEW (AVL_root);
  WITH AVL_root^ DO
    BEGIN  AVL_start := NIL;     AVL_proc := Proc;
      AVL_del := Del;            AVL_comp :=  Compare;
      AVL_key_size := Key_size;  AVL_data_size := Data_size
    END
END { AVL_init };
{--------------------------------------------------------------------------}
BEGIN { AVLtrees }
  @AVL_null_proc := NIL;     @AVL_null_del  := NIL;
END.  { AVLtrees }
{--------------------------------------------------------------------------}
