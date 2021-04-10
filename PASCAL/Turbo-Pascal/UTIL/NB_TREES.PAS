{--------------------------------------------------------------------------}
        { Tｿｫo ｭa ｬo､ｳｫ ｧa ｳｯpa｢ｫeｭｨe ｭa ｭe｡aｫaｭcｨpaｭｨ ､｢oｨｷｭｨ ､ｺp｢eｲa     }
{--------------------------------------------------------------------------}
{$I NB_trees.inc}
IMPLEMENTATION
 TYPE  NB_point = ^NB_node;        { Tｨｯ ｭa ｳｪaｧaｲeｫｿ ｪｺｬ ｢ｺｧeｫ oｲ ､ｺp｢oｲo }
    NB_node =                      { Tｨｯ ｭa ｢ｺｧeｫ oｲ ､ｺp｢oｲo               }
      RECORD
        NB_key  : POINTER;         { 頭aｧaｲeｫ ｪｺｬ ｪｫｾｷa ｭa ｢ｺｧeｫa          }
        NB_data : POINTER;         { 頭aｧaｲeｫ ｪｺｬ ocｭo｢ｭｨｲe ､aｭｭｨ          }
        NB_left : NB_point;        { 頭aｧaｲeｫ ｪｺｬ ｫe｢ｨｿ ｢ｺｧeｫ-ｭacｫe､ｭｨｪ    }
        NB_right: NB_point         { 頭aｧaｲeｫ ｪｺｬ ､ecｭｨｿ ｢ｺｧeｫ-ｭacｫe､ｭｨｪ   }
      END;
    NB_tree_pointer = ^NB_root;
    NB_root =                                   { Tｨｯ ｭa ｪopeｭa ｭa ､ｺp｢oｲo }
      RECORD                                    { 将aｭｨpaｭｨ ｯo､ｯpo｣paｬｨ:   }
        NB_proc : NB_users_procedure;{㌢ o｡pa｡oｲｪa ｭa ｢ｺｧｫｨｲe ｯpｨ o｡xoｦ､aｭe}
        NB_del  : NB_users_del;      {㌢ o｡pa｡oｲｪa ｭa ｢ｺｧｫｨｲe ｯpｨ ｨｧｲpｨ｢aｭe}
        NB_comp : NB_users_comp;      { ㌢ cpa｢ｭｿ｢aｭe ｭa ｪｫｾｷo｢e           }
        NB_start: NB_point;           { 頭aｧaｲeｫ ｪｺｬ ｯｺp｢ｨｿ ｪｫoｭ ｢ ､ｺp｢oｲo }
        NB_key_size : BYTE; { Paｧｬep ｭa ｯaｬeｲｲa, oｲ､eｫeｭa ｧa ｪｫｾｷ (｡aｩｲo｢e)}
        NB_data_size: WORD  { Paｧｬep ｭa ｯaｬeｲｲa, oｲ､eｫeｭa ｧa ､aｭｭｨ(｡aｩｲo｢･)}
      END;
{--------------------------------------------------------------------------}
FUNCTION NB_search_node;                        { Tｺpcｨ ｢ｺｧeｫ c ､a､eｭ ｪｫｾｷ }
  VAR NB_root : NB_tree_pointer ABSOLUTE Root;
      Node    : NB_point;                             { 出ｬoｹｭa ｯpoｬeｭｫｨ｢a }
BEGIN { NB_search_node }
  NB_search_node := FALSE;        Node := NB_root^.NB_Start;
  WHILE Node <> NIL DO   { Cｯｳcｪa ce ｯo ､ｺp｢oｲo, ｲｺpceｩｪｨ ｭeo｡xo､ｨｬｨｿ ｪｫｾｷ }
    WITH Node^,NB_Root^ DO {Cpa｢ｭｿ｢a ､a､eｭｨｿ ｪｫｾｷ c ｪｫｾｷa ｭa ｯope､ｭｨｿ ｢ｺｧeｫ}
    CASE NB_comp(Key_data, NB_key^) OF
      0: BEGIN         { Tｺpceｭｨｿｲ ｢ｺｧeｫ e ｭaｬepeｭ, ｯpex｢ｺpｫｿｭe ｭa ､aｭｭｨｲe }
           NB_search_node := TRUE;
           MOVE (NB_data^, Data, NB_data_size);
           EXIT                             { 田ｯeｸｭo ｧa｢ｺpｸ｢aｭe ｭa ｬeｲo､a }
         END;
     -1: Node := NB_left ;                   { Cｯｳcｪaｭe ｯo ､ｺp｢oｲo ｭaｫｿ｢o  }
      1: Node := NB_right                    { Cｯｳcｪaｭe ｯo ､ｺp｢oｲo ｭa､ｿcｭo }
    END              { 筏ｭｪｶｨｿｲa ｧ｢ｺｰｸ｢, ｡eｧ ､a e ｭaｬepeｭ ｲｺpceｭｨｿｲ ｪｫｾｷ }
END { NB_search_node };
{--------------------------------------------------------------------------}
FUNCTION NB_where_node;               { Tｺpcｨ a､peca ｭa ｢ｺｧeｫ c ､a､eｭ ｪｫｾｷ }
  VAR NB_root : NB_tree_pointer ABSOLUTE Root;
      Node    : NB_point;                             { 出ｬoｹｭa ｯpoｬeｭｫｨ｢a }
BEGIN { NB_where_node }
  NB_where_node := FALSE;         Node := NB_root^.NB_Start;
  WHILE Node <> NIL DO   { Cｯｳcｪa ce ｯo ､ｺp｢oｲo, ｲｺpceｩｪｨ ｭeo｡xo､ｨｬｨｿ ｪｫｾｷ }
    WITH Node^,NB_Root^ DO {Cpa｢ｭｿ｢a ､a､eｭｨｿ ｪｫｾｷ c ｪｫｾｷa ｭa ｯope､ｭｨｿ ｢ｺｧeｫ}
    CASE NB_comp(Key_data, NB_key^) OF
      0: BEGIN         { Tｺpceｭｨｿｲ ｢ｺｧeｫ e ｭaｬepeｭ, ｯpex｢ｺpｫｿｭe ｭa ､aｭｭｨｲe }
           NB_where_node := TRUE;   Data_point := NB_data;
           EXIT                             { 田ｯeｸｭo ｧa｢ｺpｸ｢aｭe ｭa ｬeｲo､a }
         END;
     -1: Node := NB_left ;                   { Cｯｳcｪaｭe ｯo ､ｺp｢oｲo ｭaｫｿ｢o  }
      1: Node := NB_right                    { Cｯｳcｪaｭe ｯo ､ｺp｢oｲo ｭa､ｿcｭo }
    END              { 筏ｭｪｶｨｿｲ ｧa｢ｺpｸ｢a, ｡eｧ ､a e ｭaｬepeｭ ｲｺpceｭｨｿｲ ｪｫｾｷ }
END { NB_where_node };
{--------------------------------------------------------------------------}
FUNCTION NB_insert_node;      { Bｪｫｾｷ｢a ｢ ､ｺp｢oｲo eｫeｬeｭｲ c oｯpe､eｫeｭ ｪｫｾｷ }
  VAR  Node_pointer : NB_point;
       NB_root : NB_tree_pointer ABSOLUTE Root;
       Node : NB_point;
  {------------------------------------------------------------------------}
  FUNCTION New_node : NB_point;                { Cｺｧ､a｢a ｫｨcｲ ｨ ｣o ｧaｯｺｫ｢a }
    VAR P_node : NB_point;
  BEGIN { New_node }                      { Peｧep｢ｨpa ｯaｬeｲ ｧa ｭo｢ｨｿ ｢ｺｧeｫ }
    NEW (P_node);   P_node^.NB_left  := NIL;      P_node^.NB_right := NIL;
    WITH P_node^, NB_root^ DO
      BEGIN         { Peｧep｢ｨpa ｯaｬeｲ ｨ cｺxpaｭｿ｢a ｢ ｭeｿ ､aｭｭｨｲe ｭa ｢ｺｧeｫa }
        GetMem (NB_data, NB_data_size);
        Move (Data, NB_data^, NB_data_size);
        GetMem (NB_key, NB_key_Size);        { Peｧep｢ｨpa ｯaｬeｲ ｨ cｺxpaｭｿ｢a }
        Move (Key_data, NB_key^, NB_key_size)    { ｢ ｭeｿ ｪｫｾｷa ｭa ｢ｺｧeｫa   }
      END;
    New_node := P_node
  END { New_node };
  {------------------------------------------------------------------------}
BEGIN { NB_insert_node }      { Bｪｫｾｷ｢a ｢ ､ｺp｢oｲo eｫeｬeｭｲ c oｯpe､eｫeｭ ｪｫｾｷ }
  NB_insert_node := TRUE;
  Node_pointer := NB_root^.NB_Start;
  IF Node_pointer = NIL THEN                  { Aｪo ､ｺp｢oｲo ｭｿｬa ｢ｺｧｫｨ,    }
    BEGIN Node := New_node;                   { cｺｧ､a｢a ｭo｢ ｢ｺｧeｫ  ｨ       }
      NB_root^.NB_Start := Node               { ｣o c｢ｺpｧ｢a ｱ ､ｺp｢oｲo       }
    END
  ELSE                        { �oｪaｲo ｭe e ､ocｲｨ｣ｭaｲo ｬｿcｲoｲo ｭa ｢ｬｺｪ｢aｭe }
    WHILE Node_pointer <> NIL DO
      WITH Node_pointer^ DO
        CASE NB_root^.NB_comp(Key_data, NB_key^) OF
        -1: BEGIN                   { Tｺpceｭoｲo ｬｿcｲo e ｢ ｫｿ｢oｲo  ｯo､､ｺp｢o }
              IF NB_left = NIL THEN
                BEGIN                      { Tｺpceｭoｲo ｬｿcｲo e ､ocｲｨ｣ｭaｲo  }
                  Node := New_node;  NB_left := Node;  EXIT
                END
              ELSE                { Tｺpceｭeｲo ｯpo､ｺｫｦa｢a ｢ ｫｿ｢oｲo ｯo､､ｺp｢o }
                Node_pointer := NB_left
            END;
         1: BEGIN                    { Tｺpceｭｨｿｲ ｪｫｾｷ e ｢ ､ｿcｭoｲo ｯo､､ｺp｢o }
              IF NB_right = NIL THEN
                BEGIN                       { Tｺpceｭoｲo ｬｿcｲo e ､ocｲｨ｣ｭaｲo }
                  Node := New_node;  NB_right  := Node;  EXIT
                END
              ELSE               { Tｺpceｭeｲo ｯpo､ｺｫｦa｢a ｢ ､ｿcｭoｲo ｯo､､ｺp｢o }
                Node_pointer := NB_right
            END;
         0: BEGIN                          { Oｲｪpｨｲ e eｫeｬeｭｲ c ｲoｧｨ ｪｫｾｷ }
              Node := Node_pointer;   NB_insert_node := FALSE;   EXIT
            END
        END
END { NB_insert_node };
{--------------------------------------------------------------------------}
FUNCTION NB_delete_node;                  { 逢ｲpｨ｢a ｢ｺｧeｫ c oｯpe､eｫeｭ ｪｫｾｷ }
  VAR NB_root : NB_tree_pointer ABSOLUTE Root;
      Succ_node     : NB_point;                    { 出ｬoｹｭa ｯpoｬeｭｫｨ｢a    }
      Node          : ^NB_point;                   { 出ｬoｹｭa ｯpoｬeｭｫｨ｢a    }
  {------------------------------------------------------------------------}
  PROCEDURE Dispose_node  {Oc｢o｡oｦ､a｢a ｯaｬeｲｲa, ｯpｨｭa､ｫeｦaｹa ｭa ｢ｺｧeｫa Temp}
            (Temp : NB_point);
  BEGIN  { Dispose_node }
    WITH NB_root^, Temp^ DO
      BEGIN
        IF (@NB_Del <> NIL) AND (NB_data <> NIL) THEN  { 逢｢ｨｪ｢a ｬeｲo､a ｧa }
          NB_Del (NB_data);           { o｡pa｡oｲｪa ｭa ､aｭｭｨｲe ｯpｨ ｨｧｲpｨ｢aｭe }
        FreeMem (NB_data, NB_data_size);  { Oc｢o｡oｦ､a｢a ｯaｬeｲｲa ｧa ､aｭｭｨｲe }
        FreeMem (NB_key,  NB_key_size)  { Oc｢o｡oｦ､a｢a ｯaｬeｲｲa ｧa ｪｫｾｷo｢eｲe }
      END;
    DISPOSE(Temp)                   { Oc｢o｡oｦ､a｢a ｯaｬeｲｲa, ｧaeｲa oｲ ｢ｺｧeｫa }
  END { Dispose_node };
  {------------------------------------------------------------------------}
  PROCEDURE Delete_node            { Oｲcｲpaｭｿ｢a ｯocoｷeｭｨｿ ｢ｺｧeｫ oｲ ､ｺp｢oｲo }
            (VAR Node : NB_point);
    VAR Temp : NB_point;
  BEGIN  { Delete_node }
    IF Node^.NB_right = NIL THEN           { 握a ｫｨ ｢ｺｧeｫｺｲ ､ｿcｭo ｯo､､ｺp｢o?}
      BEGIN                { Aｪo ｭｿｬa - ｢ｺｧeｫｺｲ ce oｲcｲpaｭｿ｢a, a ｭa ｭe｣o｢o }
                           { ｬｿcｲo ce c｢ｺpｧ｢a ｫｿ｢oｲo ｯo､､ｺp｢o              }
        Temp := Node;   Node :=  Node^.NB_left;   Dispose_node (Temp)
      END
    ELSE
      IF Node^.NB_left = NIL THEN          { 握a ｫｨ ｢ｺｧeｫｺｲ ｫｿ｢o ｯo､､ｺp｢o? }
        BEGIN              { Aｪo ｭｿｬa - ｢ｺｧeｫｺｲ ce oｲcｲpaｭｿ｢a, a ｭa ｭe｣o｢o }
                           { ｬｿcｲo ce c｢ｺpｧ｢a ､ｿcｭoｲo ｯo､､ｺp｢o             }
          Temp := Node;  Node :=  Node^.NB_right;  Dispose_node (Temp)
        END
      ELSE
        BEGIN                        { 完｣ｲｮ ｢ｺｧeｫｺｲ ｨｬa ､｢a ｭacｫe､ｭｨｪa,  }
          Temp := Node^.NB_right;         { ｲｺpcｨ ce ｭaｩ-ｫ･｢ｨｿｲ ｫｨｱｲ ｭ    }
          WHILE Temp^.NB_left <> NIL DO   { ､･ｱｭｨｿ ｭｱｫ･､ｭｨｪ (cｯｳcｪa ce ｯo }
            Temp := Temp^.NB_left;        { ｫe｢ｨｲe ｪｫoｭｨ ､o ｯｺp｢ｨｿ ｫｨcｲ)   }
          Temp^.NB_left := Node^.NB_left; { Kｺｬ ｲoｧｨ ｢ｺｧeｫ ce c｢ｺpｧ｢a      }
          Temp := Node;               { ｫe｢ｨｿｲ ｭacｫe､ｭｨｪ ｭa ｨｧｲpｨ｢aｭｨｿ ｪｫoｭ}
          Node := Node^.NB_right;     { Bｺｧeｫｺｲ ce oｲcｲpaｭｿ｢a ｨ ｭa ｭe｣o｢o  }
          Dispose_node (Temp)         { ｬｿcｲo ce c｢ｺpｧ｢a ､ecｭｨｿｲ ｬｳ ｪｫoｭ   }
        END
  END { Delete_node };
  {------------------------------------------------------------------------}
BEGIN { NB_delete_node }                  { 逢ｲpｨ｢a ｢ｺｧeｫ c oｯpe､eｫeｭ ｪｫｾｷ }
  NB_delete_node := FALSE;
  Succ_node := NB_root^.NB_Start;
  Node := @NB_root^.NB_start;
  WHILE Succ_node <> NIL DO            { Tｺpceｭe ｭa ｢ｺｧeｫ c oｯpe､eｫeｭ ｪｫｾｷ }
    BEGIN                                            { Cｯｳcｪaｭe ｯo ､ｺp｢oｲo }
      CASE NB_root^.NB_comp(Key_data , Succ_node^.NB_key^) OF
       0: BEGIN                                        { Bｺｧeｫｺｲ e ｭaｬepeｭ }
           Delete_node (Node^);            { ぜｧ･ｫｺｲ ｱ･ ｨｧｲpｨ｢a oｲ ､ｺp｢oｲo }
           NB_delete_node := TRUE; EXIT       { 筏ｭｪｶｨｿｲa ｧa｢ｺpｸ｢a ｳcｯ･ｸｭo }
          END;
      -1: BEGIN                                { Tｺpceｭe ｢ ｫｿ｢oｲo ｯo､､ｺp｢o }
            Node      := @Succ_node^.NB_left;
            Succ_node := Succ_node^.NB_left
          END;
       1: BEGIN                               { Tｺpceｭe ｢ ､ｿcｭoｲo ｯo､､ｺp｢o }
            Node      := @Succ_node^.NB_right;
            Succ_node := Succ_node^.NB_right
          END
      END  { Case }
    END { While}               { 筏ｭｪｶｨｿｲa ｧa｢ｺpｸ｢a, ｡eｧ ､a e ｨｧｲpｨｲ ｢ｺｧeｫ }
END { NB_delete_node };
{--------------------------------------------------------------------------}
PROCEDURE NB_delete_tree;                           { 逢ｲpｨ｢a ｶｿｫoｲo ､ｺp｢o }
  VAR NB_root : NB_tree_pointer ABSOLUTE Root;
  PROCEDURE Post_visit                    { O｡xoｦ､a ､ｺp｢oｲo oｲ､oｫｳ-ｭa｣ope  }
            (P: NB_point);                { Haｷaｫo ｭa o｡xoｦ､aｭeｲo          }
  BEGIN { Post_visit }
    IF P <> NIL THEN
      WITH P^, NB_root^ DO
        BEGIN  Post_visit (NB_left);       { O｡xoｦ､a ｫｿ｢oｲo ｯo､､ｺp｢o       }
          Post_visit (NB_right);           { O｡xoｦ､a ､ｿcｭoｲo ｯo､､ｺp｢o      }
          IF (@NB_Del <> NIL) AND (NB_data <> NIL) THEN
            NB_Del (NB_data);              { 逢｢ｨｪ｢a ｯpｨｫoｦｭaｲa ｴｳｭｪｶｨｿ    }
          FreeMem (NB_data, NB_data_size); { Oc｢o｡oｦ､a｢a ｯaｬeｲｲa ｧa ､aｭｭｨｲe}
          FreeMem (NB_key,  NB_key_size);  { Oc｢o｡oｦ､a｢a ｯaｬeｲｲa ｧa ｪｫｾｷa  }
          DISPOSE(P)                       { Oc｢o｡oｦ､a｢a ｯaｬeｲｲa ｧa ｢ｺｧeｫa }
        END
  END { Post_visit };
  {------------------------------------------------------------------------}
BEGIN { NB_delete_tree }                            { 逢ｲpｨ｢a ｶｿｫoｲo ､ｺp｢o }
  Post_visit (NB_root^.NB_start); { O｡xoｦ､a ､ｺp｢oｲo, cｲapｲｨpaｩｪｨ oｲ ｪopeｭa }
  DISPOSE (NB_root);              { Oc｢o｡oｦ､a｢a ｯaｬeｲｲa, ｧaeｲa oｲ ｪopeｭa   }
  NB_root := NIL
END { NB_delete_tree };
{--------------------------------------------------------------------------}
PROCEDURE NB_process;                    { O｡xoｦ､a ｢cｨｷｪｨ ｢ｺｧｫｨ ｭa ､ｺp｢oｲo }
  VAR NB_root : NB_tree_pointer ABSOLUTE Root;
  {------------------------------------------------------------------------}
  PROCEDURE Pre_visit                      { O｡xoｦ､a ､ｺp｢oｲo ｢ ､ｺｫ｡oｷｨｭa   }
            (P: NB_point);                 { 出ceｲeｭ ｢ｺｧeｫ                 }
  BEGIN { Pre_visit }
    IF P <> NIL THEN
      WITH P^, NB_root^ DO
        BEGIN
          IF @NB_Proc <> NIL THEN           { O｡pa｡oｲ｢a c｢ｺpｧaｭｨｲe ､aｭｭｨ   }
            NB_Proc (NB_key^, NB_data^);
          Pre_visit (NB_left);       { O｡xoｦ､a ｫｿ｢oｲo ｯo､､ｺp｢o ｢ ､ｺｫ｡oｷｨｭa }
          Pre_visit (NB_right)       { O｡xoｦ､a ､ｿcｭoｲo ｯo､､ｺp｢o ｢ ､ｺｫ｡oｷｨｭa}
        END
  END { Pre_visit };
  {------------------------------------------------------------------------}
  PROCEDURE Post_visit                     { O｡xoｦ､a ､ｺp｢oｲo oｲ､oｫｳ-ｭa｣ope }
            (P: NB_point);                 { 出ceｲeｭ ｢ｺｧeｫ                 }
  BEGIN { Post_visit }
    IF P <> NIL THEN
      WITH P^, NB_root^ DO
        BEGIN  Post_visit (NB_left); {O｡xoｦ､a ｫｿ｢oｲo ｯo､､ｺp｢o oｲ､oｫｳ-ｭa｣ope}
          Post_visit (NB_right);    {O｡xoｦ､a ､ｿcｭoｲo ｯo､､ｺp｢o oｲ､oｫｳ-ｭa｣ope}
          IF @NB_Proc <> NIL THEN
            NB_Proc (NB_key^, NB_data^)    { O｡pa｡oｲ｢a c｢ｺpｧaｭｨｲe ､aｭｭｨ    }
        END
  END { Post_visit };
  {------------------------------------------------------------------------}
  PROCEDURE In_visit                          { O｡xoｦ､a ､ｺp｢oｲo cｨｬeｲpｨｷｭo }
            (P: NB_point);                    { 出ceｲeｭ ｢ｺｧeｫ              }
  BEGIN { In_visit }
    IF P <> NIL THEN
      WITH P^, NB_root^ DO
        BEGIN In_visit (NB_left);     { O｡xoｦ､a ｫｿ｢oｲo ｯo､､ｺp｢o cｨｬeｲpｨｷｭo }
          IF @NB_Proc <> NIL THEN
            NB_Proc (NB_key^, NB_data^);   { O｡pa｡oｲ｢a c｢ｺpｧaｭｨｲe ､aｭｭｨ    }
          In_visit (NB_right);       { O｡xoｦ､a ､ｿcｭoｲo ｯo､､ｺp｢o cｨｬeｲpｨｷｭo }
        END
  END { In_visit };
  {------------------------------------------------------------------------}
BEGIN { NB_process }                     { O｡xoｦ､a ｢cｨｷｪｨ ｢ｺｧｫｨ ｭa ､ｺp｢oｲo }
  IF NB_root <> NIL THEN
    CASE Kind_visit OF            { O｡xoｦ､a ､ｺp｢oｲo, cｲapｲｨpaｩｪｨ oｲ ｪopeｭa }
      Preorder : Pre_visit(NB_root^.NB_start);    { B ､ｺｫ｡oｷｨｭa            }
      Inorder  : In_visit(NB_root^.NB_start);     { Cｨｬeｲpｨｷｭo             }
      Postorder: Post_visit(NB_root^.NB_start)    { Oｲ､oｫｳ-ｭa｣ope          }
  END;
END { NB_process };
{--------------------------------------------------------------------------}
PROCEDURE NB_init;                   { Cｺｧ､a｢a ｭe｡aｫaｭcｨpaｭo ､｢oｨｷｭo ､ｺp｢o }
  VAR NB_root : NB_tree_pointer ABSOLUTE Root;
BEGIN { NB_init }     { �a ce ､o｡a｢ｨ ｯpo｢epｪa ｧa ｪopeｪｲｭocｲ ｭa ｯapaｬeｲpｨｲe }
  NEW (NB_root);                               { Peｧep｢ｨpa ｯaｬeｲ ｧa ｪopeｭa }
  WITH NB_root^ DO
    BEGIN    NB_start := NIL;                 { 出ｯｺｫ｢a ｯoｫeｲaｲa ｭa ｪopeｭa }
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