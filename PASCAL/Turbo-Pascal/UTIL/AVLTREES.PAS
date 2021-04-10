
{--------------------------------------------------------------------------}
        { T┐лo нa мoд│л зa │пpaвлeниe нa бaлaнcиpaни (AVL) двoи╖ни д║pвe▓a }
{$I AVLtrees.inc ----------------------------------------------------------}
IMPLEMENTATION
 USES Util;
 TYPE Balance =                           { Moмeн▓нo c║c▓o┐ниe нa в║зeлa:  }
     (Left_heighten,                             { лeви┐▓ клoн e пo-д║л║г  }
      Equal_height,                              { двa▓a клoнa ca paвни    }
      Right_heighten);                           { дecни┐▓ клoн e пo-д║л║г }
    AVL_point = ^AVL_node;         { Tип нa │кaзa▓eл к║м в║зeл o▓ д║pвo▓o  }
    AVL_node =                     { Tип нa в║зeл o▓ д║pвo▓o               }
      RECORD
        AVL_key    : POINTER;      { Укaзa▓eл к║м кл╛╖a нa в║зeлa          }
        AVL_data   : POINTER;      { Укaзa▓eл к║м ocнoвни▓e дaнни          }
        AVL_left   : AVL_point;    { Укaзa▓eл к║м лeви┐ в║зeл              }
        AVL_right  : AVL_point;    { Укaзa▓eл к║м дecни┐ в║зeл             }
        AVL_balance: Balance;      { C║c▓o┐ниe нa в║зeлa                   }
      END;
    AVL_tree_pointer = ^AVL_root;  {Tип нa │кaзa▓eл к║м дecкpип▓.нa д║pвo▓o}
    AVL_root =                             { Tип нa дecкpип▓opa нa д║pвo▓o }
      RECORD                             { Плaниpaни мe▓oди:               }
        AVL_proc  : AVL_users_procedure; {      зa oбpaбo▓кa пpи oбxoждaнe }
        AVL_del   : AVL_users_del;       {      зa oбpaбo▓кa пpи из▓pивaнe }
        AVL_comp  : AVL_users_comp;      {      зa cp┐внeниe нa кл╛╖oвe    }
        AVL_start : AVL_point;                  { Укaзa▓eл к║м п║pви┐ клoн }
        AVL_key_size : BYTE;           { Paзмep нa пoлe▓o зa кл╛╖ (бaй▓oвe)}
        AVL_data_size: WORD            { Paзмep нa пoлe▓o зa дaнни(бaй▓oвe)}
      END;
{--------------------------------------------------------------------------}
FUNCTION AVL_search_node;                       { T║pcи в║зeл c дaдeн кл╛╖ }
  VAR AVL_root : AVL_tree_pointer ABSOLUTE Root;   { Укaзa▓eл к║м д║pвo▓o  }
      Node     : AVL_point;                        { Пoмo╣нa пpoмeнливa    }
BEGIN { AVL_search_node }
  AVL_search_node := FALSE;       Node := AVL_root^.AVL_start;
  WHILE Node <> NIL DO        { Cп│cкaнe пo д║pвo▓o, c▓ap▓иpaйки o▓ кopeнa }
    WITH Node^, AVL_root^ DO
      CASE AVL_comp (Key_data, AVL_key^) OF
        EQ: BEGIN                          { Aкo ▓║pceни┐▓ в║зeл e нaмepeн }
              AVL_search_node := TRUE;
              MOVE (Node^.AVL_data^, Data, AVL_root^.AVL_data_size);
              EXIT        { Ф│нк╢и┐▓a зaв║p╕вa нopмaлнo. B║зeл║▓ e нaмepeн }
            END;
                  { Aкo ▓║pceни┐▓ в║зeл нe e нaмepeн, ▓║pceнe▓o пpoд║лжaвa }
        LT:  Node := Node^.AVL_left;          { Cп│cкaнe пo д║pвo▓o нaл┐вo }
        GT:  Node := Node^.AVL_right          { Cп│cкaнe пo д║pвo▓o нaд┐cнo}
      END
                       { Ф│нк╢┐▓a зaв║p╕вa бeз дa e нaмepeн ▓║pceни┐ в║зeл }
END { AVL_search_node };
{--------------------------------------------------------------------------}
FUNCTION AVL_insert_node;     { Bкл╛╖вa в AVL-д║pвo в║зeл c oпpeдeлeн кл╛╖ }
  VAR  Node_pointer : AVL_point;
      AVL_root : AVL_tree_pointer ABSOLUTE Root;
      Node : AVL_point;
      Bool : BOOLEAN;
  {------------------------------------------------------------------------}
  FUNCTION New_node : AVL_point;          { C║здaвa в║зeл c oпpeдeлeн кл╛╖ }
    VAR P_node : AVL_point;
  BEGIN { New_node }
    NEW (P_node); New_node := P_node;          { Peзepвиpa пaмe▓ зa в║зeлa }
    WITH P_node^, AVL_root^ DO
      BEGIN
        AVL_balance := Equal_height;  AVL_left  := NIL;  AVL_right := NIL;
        GetMem (AVL_data, AVL_data_size);     { Peзepвиpa пaмe▓ зa дaнни▓e }
        Move (Data, AVL_data^,AVL_data_size); {C║xpaн┐вa дaнни▓e в║в в║зeлa}
        GetMem (AVL_key, AVL_key_size);       { Peзepвиpa пaмe▓ зa кл╛╖a   }
        Move (Key_data, AVL_key^,AVL_key_size) { C║xpaн┐вa кл╛╖a в║в в║зeлa}
      END { With };
    AVL_insert_node := TRUE
  END { New_node };
  {------------------------------------------------------------------------}
  FUNCTION Insert_node                      { Bкл╛╖вa в║зeл в AVL-д║pвo    }
           (VAR Temp: AVL_point
           ): BOOLEAN;                    { TRUE - пpoмeнeнa e виco╖инa▓a  }
    VAR Left_node,Right_node: AVL_point;
    {----------------------------------------------------------------------}
    PROCEDURE Left_balance; { Пpeди вкл╛╖вaнe▓o лeви┐▓ клoн e бил пo-д║л║г }
    BEGIN                                       { Aнaлиз нa лeви┐ клoн     }
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
    PROCEDURE Right_balance; {Пpeди вм║квaнe▓o дecни┐▓ клoн e бил пo-д║л║г }
    BEGIN                                          { Aнaлиз нa дecни┐ клoн }
      Right_node := Temp^.AVL_right;
      IF  Right_node^.AVL_balance = Right_heighten THEN
        BEGIN { Пpeди вм║квaнe▓o дecни┐▓ клoн нa дecни┐ клoн e бил пo д║л║г}
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
         IF Insert_node (Temp^.AVL_left) THEN     { Лeви┐▓ клoн e нapacнaл }
           CASE  Temp^.AVL_balance OF
            Left_heighten: Left_balance;
            Equal_height:   { Пpeди вкл╛╖вaнe▓o двa▓a клoнa ca били paвни  }
             BEGIN          { Cлeд вкл╛╖вaнe▓o лeви┐▓ клон c▓aвa пo-д║л║г  }
               Temp^.AVL_balance := Left_heighten;    Insert_node := TRUE
             END { Equal_height };
            Right_heighten: { Пpeди вкл╛╖вaнe▓o дecни┐▓ клoн e бил пo-д║л║г}
             BEGIN          { Cлeд вкл╛╖вaнe▓o двa▓a клoнa c▓aвa▓ paвни    }
               Temp^.AVL_balance := Equal_height;     Insert_node := FALSE
             END
            END { Case }
          ELSE
            Insert_node := FALSE
       END { Lt };
   GT: BEGIN
         IF Insert_node (Temp^.AVL_right) THEN  { Д┐cни┐▓ клoн e нapacнaл  }
           CASE  Temp^.AVL_balance OF
             Left_heighten:  { Пpeди вкл╛╖вaнe▓o лeви┐▓ клoн e бил пo-д║л║г}
               BEGIN         { Cлeд вкл╛╖вaнe▓o двa▓a клoнa c▓aвa▓ paвни   }
                 Temp^.AVL_balance := Equal_height;   Insert_node := FALSE
               END;
             Equal_height:    { Пpeди вкл╛╖вaнe▓o двa▓a клoнa ca били paвни}
               BEGIN          { Cлeд вм║квaнe▓o дecни┐▓ клoн c▓aвa пo-д║л║г}
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
  IF Node_pointer = NIL THEN                           { Д║pвo▓o e пpaзнo  }
    BEGIN   Node := New_node;
      AVL_root^.AVL_Start := Node
    END
  ELSE
    Bool :=Insert_node (AVL_root^.AVL_start)
END { AVL_insert_node };
{--------------------------------------------------------------------------}
FUNCTION AVL_delete_node;                 { Из▓pивa в║зeл c oпpeдeлeн кл╛╖ }
  VAR Node     : AVL_point;
      AVL_root : AVL_tree_pointer ABSOLUTE Root;
      Bool     : BOOLEAN;
      Not_exist: WORD;
  {------------------------------------------------------------------------}
  PROCEDURE Dispose_node { Ocвoбoждaвa пaмe▓▓a, o▓дeлeнa зa кл╛╖a и дaнни▓e}
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
    FUNCTION BalanceL { Бaлaнc нa в║зeлa,кoгa▓o лeви┐▓ клoн e c▓aнaл пo-к║c}
             (VAR Node: AVL_point
             ):BOOLEAN;
      VAR P1,P2: AVL_point;
          Baln: Balance;
    BEGIN
      CASE Node^.AVL_balance OF       { C║c▓o┐ниe нa в║зeлa пpeди бaлaнca  }
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
    FUNCTION BalanceR {Бaлaнc нa в║зeлa,кoгa▓o дecни┐▓ клoн e c▓aнaл пo-к║c}
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
  FUNCTION Del         { Ф│нк╢и┐▓a ▓║pcи клoн, кoй▓o н┐мa дeceн нacлeдник  }
           (VAR R: AVL_point                    { Ha╖aлeн в║зeл нa ▓║pceнe }
           ): BOOLEAN;
    VAR X : AVL_point;
  BEGIN { Del }     Del := FALSE;
    IF R^.AVL_right <> NIL THEN { Peк│pcивнo cп│cкaнe пo дecни▓e нacлeдни╢и}
      BEGIN
        IF Del(R^.AVL_right) THEN
          Del := BalanceR(R)
        ELSE                                           { Heв║змoжeн cл│╖aй }
          Del := FALSE
      END
    ELSE
      BEGIN                          { Дoc▓игнa▓ e в║зeл c дeceн нacлeдник }
        Dispose_node (Temp);         { Ocвoбoждaвa▓ ce кл╛╖║▓ и дaнни▓e    }
                                     { нa из▓pивaни┐ в║зeл                 }
        Temp^.AVL_key := R^.AVL_key; { Пpexв║pл┐▓ ce пoлe▓a▓a нa в║зeлa    }
        Temp^.AVL_data := R^.AVL_data;
        Temp := R;                   { Toзи в║зeл ╣e б║дe o▓c▓paнeн, cлeд  }
        R := R^.AVL_left;            { кa▓o б║дe изкл╛╖eн o▓ д║pвo▓o       }
        DISPOSE (Temp);          Del := TRUE
      END
  END { Del };
  {------------------------------------------------------------------------}
  BEGIN  { Delete_node }
    IF Node = NIL THEN
      BEGIN   Bool := FALSE;           { B д║pвo▓o н┐мa в║зeл c ▓aк║в кл╛╖ }
        Long_exit (Not_exist)
      END
    ELSE
      BEGIN
        Delete_node := FALSE;
        CASE AVL_root^.AVL_comp(Key_data , Node^.AVL_key^) OF
        LT: BEGIN                             { Cп│cкaнe нaл┐вo пo д║pвo▓o }
              IF Delete_node (Node^.AVL_left) THEN
                Delete_node := BalanceL(Node)     { Bиco╖инa▓a e пpoмeнeнa }
            END;
        GT: BEGIN                             { Cп│cкaнe нaд┐cнo пo д║pвo▓o}
              IF Delete_node (Node^.AVL_right) THEN
                Delete_node := BalanceR (Node)    { Bиco╖инa▓a e пpoмeнeнa }
            END;
        EQ: BEGIN {T║pceни┐▓ в║зeл e нaмepeн. Пpoвepкa кaкви нacлeдни╢и имa}
              Temp := Node;
              IF Temp^.AVL_right = NIL THEN         { H┐мa дeceн нacлeдник }
                BEGIN  Node := Temp^.AVL_left;
                  Dispose_node(Temp);         Dispose(Temp);
                  Delete_node := TRUE
                END
              ELSE
                IF Temp^.AVL_left = NIL THEN          { H┐мa л┐в нacлeдник }
                  BEGIN  Node := Temp^.AVL_right;
                    Dispose_node(Temp);       Dispose(Temp);
                    Delete_node := TRUE
                  END
                ELSE
                  BEGIN              { Haмepeни┐▓ в║зeл имa двa нacлeдникa }
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
  PROCEDURE Del_node;             { Пpo╢eд│pa, пoзвoл┐вa╣a aвapийни┐ изxoд }
    VAR B : BOOLEAN;
  BEGIN  { Del_node }
    Not_exist := Save_exit;
    B := Delete_node (AVL_root^.AVL_Start)
  END { Del_node };
  {------------------------------------------------------------------------}
BEGIN { AVL_delete_node }         { T┐лo нa ocнoвни┐ мe▓oд AVL_delete_node }
  Bool := TRUE;     Del_node;
  AVL_delete_node := Bool;
END { AVL_delete_node };
{--------------------------------------------------------------------------}
PROCEDURE AVL_delete_tree;                          { Из▓pивa ╢┐лo▓o д║pвo }
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
BEGIN { AVL_delete_tree }                             { Из▓pивa ╢┐лo д║pвo }
  Post_visit (AVL_root^.AVL_start);
  DISPOSE (AVL_root);         AVL_root := NIL
END { AVL_delete_tree };
{--------------------------------------------------------------------------}
PROCEDURE AVL_process;                   { Oбxoждa вcи╖ки в║зли нa д║pвo▓o }
  VAR AVL_root : AVL_tree_pointer ABSOLUTE Root;
  PROCEDURE Pre_visit (P: AVL_point);              { Oбxoждaнe в д║лбo╖инa }
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
  PROCEDURE Post_visit (P: AVL_point);           { Oбxoждaнe o▓дoл│-нaгope }
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
  PROCEDURE In_visit (P: AVL_point);                { Cимe▓pи╖нo oбxoждaнe }
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
BEGIN { AVL_process }          { Oбxoждa д║pвo пo eднa o▓ ▓pи▓e c▓pa▓eгии  }
  IF AVL_root <> NIL THEN
  WITH AVL_root^ DO
    CASE Kind_visit OF
      Preorder : Pre_visit (AVL_start);
      Inorder  : In_visit  (AVL_start);
      Postorder: Post_visit(AVL_start)
    END
END { AVL_process };
{--------------------------------------------------------------------------}
PROCEDURE AVL_init;                            { C║здaвa бaлaнcиpaнo д║pвo }
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