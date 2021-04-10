{$F+ ----------------------------------------------------------------------}
{$I B_trees.inc}                { T┐лo нa мoд│л зa │пpaвлeниe нa B-д║pвe▓a }
IMPLEMENTATION                  {------------------------------------------}
  USES Util;
  CONST  B_keys_max = 6;       { Maкcимaлeн бpoй нa кл╛╖oвe▓e в║в в║зeл    }
         B_keys_min = 3;       { Mинимaлeн бpoй нa кл╛╖oвe▓e в║в в║зeл     }
  TYPE   B_index = 0..7;
    B_point = ^B_page;           { Tип нa │кaзa▓eл┐ к║м в║зeл o▓ B-д║pвo▓o }
    B_page =                     { Tип нa в║зeл o▓ B-д║pвo▓o               }
      RECORD
        B_count: WORD;           { Бpoй нa в║зли▓e в c▓paни╢a▓a            }
        B_key  : ARRAY[1..B_keys_max] OF B_key_type;   { Kл╛╖oвe           }
        B_data : ARRAY[1..B_keys_max] OF B_data_type;  { Дaнни в║в в║зeлa  }
                                  { Укaзa▓eли к║м c▓paни╢и▓e-нacлeдни╢и    }
        B_next_level : ARRAY[0..B_keys_max] OF B_point;
      END;
    B_tree_pointer = ^B_root;  { Tип нa │кaзa▓eл к║м дecкpип▓opa нa д║pвo▓o}
    B_root =                               { Tип нa дecкpип▓opa нa д║pвo▓o }
      RECORD                 { Плaниpaни мe▓oди:                           }
        B_proc  : B_users_procedure;{ зa oбpaбo▓кa нa дaнни▓e пpи oбxoждaнe}
        B_del   : B_users_del;      { зa oбpaбo▓кa нa дaнни▓e пpи из▓pивaнe}
        B_start : B_point;                      { Укaзa▓eл к║м п║pви┐ лиc▓ }
      END;
{--------------------------------------------------------------------------}
FUNCTION Search_in_page               { T║pcи кл╛╖ в c▓paни╢a▓a Page       }
         (Key        : B_key_type;    { Kл╛╖║▓ нa eлeмeн▓a, кoй▓o ce ▓║pcи }
          Page       : B_point;      { Укaзa▓eл к║м oбpaбo▓вaнa▓a c▓paни╢a }
      VAR Node_index : B_index    { Индeкc нa в║зeлa в нaмepeнa▓a c▓paни╢a }
          ) : BOOLEAN;     { Peз│л▓a▓: TRUE-нaмepeн; FALSE-нe e нaмepeн    }
BEGIN { Search_in_page }
  WITH Page^ DO
    IF Key < B_key[1] THEN
      BEGIN      { Aкo кл╛╖║▓ e пo-мaл║к o▓ нaй-мaлки┐ кл╛╖ в║в ▒▓░ани╢а▓а }
        Search_in_page := FALSE;      Node_index := 0
      END
    ELSE
      BEGIN     { T║pcи пocлeдoвa▓eлнo в oc▓aнaли▓e кл╛╖oвe▓e нa ▒▓а░ни╢а▓а}
        Node_index := B_count;
        WHILE (Key < B_key[Node_index]) AND (Node_index > 1) DO
          Node_index := Node_index - 1;
        Search_in_page := Key = B_key[Node_index]
      END
END { Search_in_page };
{--------------------------------------------------------------------------}
FUNCTION Search_in_tree           { T║pcи пoco╖eни┐ кл╛╖ в д║pвo▓o         }
         (Key_data  : B_key_type; { Kл╛╖║▓ нa eлeмeн▓a, кoй▓o ce ▓║pcи     }
          Page      : B_point;    { C▓paни╢a, o▓ кo┐▓o c▓ap▓иpa ▓║pceнe▓o  }
      VAR Found_page: B_point;    { Укaзa▓eл к║м нaмepeнa▓a c▓paни╢a       }
      VAR Index     : B_index     { Индeкc нa в║зeлa в нaмepeнa▓a c▓paни╢a }
         ): BOOLEAN;
BEGIN { Search_in_tree }
  IF Page = NIL THEN      { Дoc▓игнa▓ e лиc▓. B B-д║pвo▓o н┐мa ▓aк║в в║зeл }
    Search_in_tree := FALSE
  ELSE
    BEGIN                              { T║pcи в кл╛╖oвe▓e нa в║зeлa Page  }
      IF Search_in_page(Key_data, Page, Index) THEN
        BEGIN
          Found_page := Page;        { T║pceни┐▓ в║зeл e нaмepeн           }
          Search_in_tree := TRUE
        END
      ELSE         { Aкo нe, ▓║pceнe▓o пpoд║лжaвa в нacлeдникa нa eлeмeн▓a }
        Search_in_tree := Search_in_tree       { c нoмep Index             }
                 (Key_data, Page^.B_next_level[Index], Found_page, Index)
    END
END { Search_in_tree };
{--------------------------------------------------------------------------}
FUNCTION B_search_node;                         { T║pcи в║зeл c дaдeн кл╛╖ }
  VAR B_root  : B_tree_pointer ABSOLUTE Root;
      Index   : B_index;          { Индeкc нa в║зeлa в нaмepeнa▓a c▓paни╢a }
      Found_page: B_point;              { Укaзa▓eл к║м нaмepeнa▓a c▓paни╢a }
BEGIN { B_search_node }
  IF Search_in_tree (Key_data, B_root^.B_Start, Found_page, Index) THEN
    BEGIN                       { T║pceни┐▓ кл╛╖ e нaмepeн. Heгoви▓e дaнни }
      Data := Found_page^.B_data[Index];       { ce вp║╣a▓ кa▓o peз│л▓a▓   }
      B_search_node := TRUE
    END
  ELSE
    B_search_node := FALSE                  { T║pceни┐▓ в║зeл нe e нaмepeн }
END { B_search_node };
{--------------------------------------------------------------------------}
FUNCTION B_insert_node;       { Bкл╛╖вa в д║pвo▓o eлeмeн▓ c oпpeдeлeн кл╛╖ }
  VAR  B_root       : B_tree_pointer ABSOLUTE Root;
       Exit_place   : WORD;         Bool         : BOOLEAN;
  {------------------------------------------------------------------------}
  PROCEDURE Push_in         { Bкл╛╖вa в Page кл╛╖a X и дecни┐ м│ нacлeдник }
            (X  : B_key_type;                  { Bкл╛╖вaн кл╛╖             }
             Xd : B_data_type;                 { Bкл╛╖вaни дaнни           }
             Xr,                               { Дeceн нacлeдник нa кл╛╖a  }
             Page  : B_point;                  { C▓paни╢a                  }
             K  : B_index                      { M┐c▓o нa кл╛╖a в мacивa   }
            );
  VAR  I : B_index;
  BEGIN { Push_in }
    WITH Page^ DO
      BEGIN                      { Измec▓вaнe нa д┐cнo нa вcи╖ки eлeмeн▓и  }
        FOR I := B_count DOWNTO K+1 DO                   { в c▓paни╢a▓a    }
          BEGIN  B_key[I+1] := B_key[I];                 { Kл╛╖oвe         }
            B_data[I+1] := B_data[I];                    { Дaнни           }
            B_next_level[I+1] := B_next_level[I]         { Hacлeдни╢и      }
          END { For I };
        B_key[K+1] := X;          B_data[K+1] := Xd; {Bкл╛╖вa нoви┐ eлeмeн▓}
        B_next_level[K+1] := Xr;  B_count := B_count + 1
      END
  END { Push_in };
  {------------------------------------------------------------------------}
  PROCEDURE Split                { Paздeл┐ c▓paни╢a нa двe c▓paни╢и        }
            (X : B_key_type;     { Bм║квaн кл╛╖                            }
             Xd: B_data_type;    { Bм║квaни дaнни                          }
            Xr,                  { Дeceн нacлeдник нa кл╛╖a в c▓paни╢a▓a   }
            Page  : B_point;     { Paздeл┐нa c▓paни╢a                                       }
            K     : B_index;     { Пoзи╢и┐ нa кл╛╖a                        }
            VAR Y : B_key_type;  { Kл╛╖ и дaнни нa cpeдни┐ eлeмeн▓, кoи▓o  }
            VAR Yd: B_data_type; { ce пoдaвa▓ зa вкл╛╖вaнe нa пo-гopнo нивo}
            VAR Yr: B_point);    { Hoвa c▓paни╢a, пoл│╖eнa o▓ paздeл┐нe▓o  }
  VAR I, Median : B_index;
  BEGIN  { Split }
    IF K <= B_keys_min THEN        { Oпpeдeл┐ к║дe ╣e ce вм║кнe кл╛╖║▓     }
      Median := B_keys_min         { cлeд paздeл┐нe▓o - в л┐вa▓a или в     }
    ELSE                           { д┐cнa▓a c▓paни╢a                      }
      Median := B_keys_min + 1;
    NEW (Yr);                      { Peзepвиpa пaмe▓ зa нoвa c▓paни╢a      }
    WITH Page^ DO
      BEGIN   { Запи▒ва д┐cнa▓a пoлoвинa o▓ ин┤opмa╢и┐▓a в нoвa▓a c▓paни╢a }
        FOR I := Median + 1 TO B_keys_max DO
          BEGIN   Yr^.B_key[I-Median] := B_key[I];
            Yr^.B_data[I-Median] := B_data[I];
            Yr^.B_next_level[I-Median] := B_next_level[I]
          END { For I };
        Yr^.B_count := B_keys_max-Median;   { Бpoй нa кл╛╖oвe▓e в c▓apa▓a, }
        B_count := Median;           { бpoй нa кл╛╖oвe▓e в нoвa▓a c▓paни╢a }
        IF K <= B_keys_min THEN  { Bм║квaнe нa eлeмeн▓a в c▓apa▓a c▓paни╢a }
          Push_in (X, Xd, Xr, Page, K)
        ELSE                     { Bм║квaнe нa eлeмeн▓a в нoвa▓a c▓paни╢a  }
          Push_in (X, Xd, Xr, Yr, K-Median);
        Y := B_key[B_count];         Yd := B_data[B_count];
        Yr^.B_next_level[0] := B_next_level[B_count];
        B_count := B_count - 1
      END
  END { Split };
  {------------------------------------------------------------------------}
  PROCEDURE Push_down  { T║pcи м┐c▓o▓o и вкл╛╖вa eлeмeн▓ в B-д║pвo▓o       }
  { Пpи Push_up = TRUE - вp║╣a кл╛╖a и дaнни▓e, кoи▓o ▓p┐бвa дa ce вкл╛╖a▓ }
  { нa пo-гopнo▓o нивo, кoгa▓o ▒е paздeл┐ c▓paни╢a▓a нa двe                }
            (New_key: B_key_type;                        { Kл╛╖  нa в║зeлa }
             Xdd    : B_data_type;                       { Дaнни нa в║зeлa }
             Page   : B_point;                           { C▓paни╢a        }
         VAR Push_up: BOOLEAN;        { Peз│л▓a▓-paздeлeнa ли e c▓paни╢a▓a }
         VAR X      : B_key_type;     { Kл╛╖ на вкл╛╖вaни┐ eлeмeн▓ в       }
                                      { по-гopнa▓a c▓paни╢а                }
         VAR Xd     : B_data_type;           { Дaнни нa eлeмeн▓a           }
         VAR Xr     : B_point );             { Hacлeдник нa ▓eзи дaнни     }
    VAR K  : B_index;
  BEGIN { Push_down }
    IF Page = NIL THEN
      BEGIN   { Дoc▓игнa▓ e лиc▓. Bp║╣a▓ ce кл╛╖║▓, дaнни▓e и │кaзa▓eл NIL }
        Push_up := TRUE;        X  := New_key;
        Xd      := Xdd;         Xr := NIL
      END
    ELSE
      BEGIN   { T║pcи кл╛╖a в c▓paни╢a▓a и aкo гo нaмepи - излизa aвapийнo }
        IF Search_in_page (New_key, Page,  K)  THEN
          BEGIN     Bool := FALSE;
            Long_exit (Exit_place)
          END;         { Пpoд║лжaвa ▓║pceнe▓o o▓ нacлeдникa нa eлeмeн▓a K  }
        Push_down(New_key, Xdd, Page^.B_next_level[K], Push_up, X, Xd, Xr);
        IF Push_up THEN
         WITH Page^ DO
          IF B_count <  B_keys_max THEN
            BEGIN    { Bкл╛╖вa eлeмeн▓a в║в в║зeлa Page - в него имa м┐c▓o }
              Push_up := FALSE;     Push_In (X, Xd, Xr, Page, K)
            END
          ELSE
            BEGIN   { B║в в║зeлa н┐мa м┐c▓o и ce нaлaгa ▓oй дa ce paздeли }
              Push_up := TRUE;      Split (X, Xd, Xr, Page, K, X, Xd, Xr)
            END
      END { Else Page <> NIL}
  END { Push_down };
  {------------------------------------------------------------------------}
  PROCEDURE Insert_node              { Bм║квa нoв кл╛╖ в B-д║pвo▓о         }
            (New_key : B_key_type;   { Kл╛╖                                }
             VAR Root: B_point);     { Kopeн нa B-д║pвo▓o                  }
  VAR Push_up : BOOLEAN;             { Hapac▓вa ли виco╖инa▓a нa д║pвo▓o?  }
      X       : B_key_type;
      Xd      : B_data_type;
      Xr      : B_point;                 { Д┐cнo пoдд╝pвo }
      Page       : B_point;
  BEGIN { Insert_node }
   Exit_place := Save_exit;         { Пoдгo▓в┐ Exit_place зa aвapиeн изxoд }
   Push_down(New_key, Data, Root, Push_up, X, Xd, Xr);
   IF Push_up THEN
     BEGIN    NEW (Page);
       WITH Page^ DO
         BEGIN     B_count := 1;          B_data[1]  := Xd; B_key[1] := X;
           B_next_level[0] := Root;  B_next_level[1] := Xr; Root := Page
         END { With }
     END  { If }
  END { Insert_node };
BEGIN  { B_insert_node }
   Bool := TRUE;        Insert_node (Key_data, B_root^.B_Start);
   B_insert_node := Bool
END { B_insert_node };
{--------------------------------------------------------------------------}
FUNCTION B_delete_node;                 {   Из▓pивa в║зeл c oпpeдeлeн кл╛╖ }
  VAR B_root : B_tree_pointer ABSOLUTE Root;      { Kopeн нa д║pвo▓o       }
      Bool   : BOOLEAN;                           { Peз│л▓a▓ o▓ oпepa╢и┐▓a }
      Exit_place : WORD;                          { M┐c▓o нa вкл╛╖вaнe     }
  {------------------------------------------------------------------------}
  PROCEDURE Combine {C║биpa в║зли▓e o▓ двe c║ceдни c▓paни╢и в eднa c▓paни╢a}
            (Page : B_point;                            { C▓paни╢a         }
             K : B_index );                             { Индeкc нa в║зeлa }
    VAR  C: B_index;
         Q: B_point;
  BEGIN { Combine }
    Q := Page^.B_next_level[K];
    WITH Page^.B_next_level[K-1]^ DO
      BEGIN     B_count := B_count + 1;
        B_key[B_count]  := Page^.B_key[K];
        B_data[B_count] := Page^.B_data[K];
        B_next_level[B_count] := Q^.B_next_level[0];
        FOR C := 1 TO Q^.B_count DO
          BEGIN                  { Пpeмec▓вa вcи╖ки в║зли o▓ eднa▓a в кpa┐ }
            B_count := B_count + 1;                { нa дp│гa▓a c▓pани╢а   }
            B_key[B_count]  := Q^.B_key[C];
            B_data[B_count] := Q^.B_data[C];
            B_next_level[B_count] :=Q^.B_next_level[C]
          END
      END;
      WITH Page^ DO
        BEGIN
          FOR C := K TO B_count -1 DO
            BEGIN          { Пpeмec▓вa вcи╖ки в║зли на eднa пoзи╢и┐ вл┐вo  }
              B_key[C] := B_key[C+1];        B_data[C] := B_data[C+1];
              B_next_level[C] := B_next_level[C+1]
            END;
          B_count := B_count -1
        END;
    DISPOSE (Q)
  END { Combine };
  {------------------------------------------------------------------------}
  PROCEDURE Move_left    { Пpexв║pл┐ в║зeл o▓ c▓paни╢a▓a-дeceн на▒ледник в }
                     { c▓paни╢a▓a-л┐в нacлeдник нa в║зeл K o▓ c▓paни╢a Page}
            (Page : B_point;                           { C▓paни╢a          }
             K : B_index);                             { Индeкc нa в║зeлa  }
    VAR  C: B_index;
  BEGIN { Move_left }
    WITH Page^.B_next_level[K-1]^ DO
      BEGIN     B_count := B_count + 1;
        B_key[B_count]  := Page^.B_key[K];
        B_data[B_count] := Page^.B_data[K];
        B_next_level[B_count] := Page^.B_next_level[K]^.B_next_level[0]
      END;
    WITH Page^.B_next_level[K]^ DO
      BEGIN
        Page^.B_key[K]  := B_key[1];    Page^.B_data[K] := B_data[1];
        B_next_level[0] := B_next_level[1];     B_count := B_count - 1;
        FOR C := 1 TO B_count DO
          BEGIN           { Пpeмec▓вa вcи╖ки в║зли на eднa пoзи╢и┐ вл┐вo   }
            B_key[C] := B_key[C+1];    B_data[C] := B_data[C+1];
            B_next_level[C] := B_next_level[C+1]
          END
      END
  END { Move_left };
  {------------------------------------------------------------------------}
  PROCEDURE Move_right   { Пpexв║pл┐ в║зeл o▓ c▓paни╢a▓a-дeceн нacлeдник в }
                     { c▓paни╢a▓a-л┐в нacлeдник нa в║зeл K o▓ c▓paни╢a Page}
            (Page : B_point;                            { C▓paни╢a         }
             K    : B_index);                           { Индeкc нa в║зeлa }
    VAR  C: B_index;
  BEGIN { Move_right }
    WITH Page^.B_next_level[K]^ DO
      BEGIN                { Пpeмec▓вa вcи╖ки в║зли на eднa пoзи╢и┐ вд┐cнo }
        FOR C := B_count DOWNTO 1 DO
          BEGIN    B_key[C+1] := B_key[C];        B_data[C+1] := B_data[C];
            B_next_level[C+1] := B_next_level[C]
          END;
        B_next_level[1] := B_next_level[0];  B_count   := B_count + 1;
        B_key[1]  := Page^.B_key[K];         B_data[1] := Page^.B_data[K]
      END;
    WITH Page^.B_next_level[K-1]^ DO  { Пpexв║pл┐ eдин в║зeл o▓ c▓paни╢a▓a-}
      BEGIN                   { л┐в нacлeдник в c▓paни╢a▓a-дeceн нacлeдник }
        Page^.B_key[K] := B_key[B_count];
        Page^.B_data[K] := B_data[B_count];
        Page^.B_next_level[K]^.B_next_level[0] := B_next_level[B_count];
        B_count := B_count - 1
      END
  END { Move_right };
  {------------------------------------------------------------------------}
  PROCEDURE Restore_node        { В║зc▓aнoв┐вa минимaлни┐ бpoй нa в║зeли▓e }
            (Page : B_point;          { в ▒▓paни╢a▓а                       }
             K    : B_index);         { Индeкc нa eлeмeн▓a                 }
  BEGIN { Restore_node }
    IF K = 0 THEN
      IF Page^.B_next_level[1]^. B_count > B_keys_min THEN
        Move_Left (Page, 1)
      ELSE
        Combine (Page, 1)
    ELSE
      IF K = Page^.B_count THEN
        IF Page^.B_next_level[K-1]^.B_count > B_keys_min THEN
          Move_Right(Page,K)
        ELSE
          Combine (Page, K)
      ELSE
        IF Page^.B_next_level[K-1]^.B_count > B_keys_min THEN
          Move_right (Page, K)
        ELSE
          IF Page^.B_next_level[K+1]^.B_count > B_keys_min THEN
            Move_left(Page, K+1)
          ELSE
            Combine (Page, K)
  END { Restore_node };
  {------------------------------------------------------------------------}
  PROCEDURE Successor { Haмиpa нacлeдникa нa из▓pивaни┐ в║зeл и гo зaмeн┐  }
            (Page : B_point;          { C▓paни╢a нa из▓pивaни┐ в║зeл       }
             K : B_index);            { Индeкc нa из▓pивaни┐ в║зeл         }
    VAR Q : B_point;
  BEGIN { Successor }   Q := Page^.B_next_level[K];
    WHILE Q^.B_next_level[0] <> NIL DO    { Cп│cкa ce пo нaй-лeви▓e клoни  }
      Q := Q^.B_next_level[0];
      Page^.B_key[K]  := Q^.B_key[1];     { Зaмeн┐ из▓pивaни┐ в║зeл        }
      Page^.B_data[K] := Q^.B_data[1]
  END { Successor };
  {------------------------------------------------------------------------}
  PROCEDURE Remove_node            {  O▓c▓paн┐вa в║зeл o▓ c▓paни╢a         }
            (Page : B_point;       {  C▓paни╢a                             }
             K : B_index);         {  Индeкc нa в║зeлa                     }
    VAR I : B_index;
  BEGIN { Remove_node }
    WITH Page^ DO
      BEGIN
        FOR I := K + 1 TO B_count DO
          BEGIN                    { Пpeмec▓вa нaл┐вo oc▓aнaли▓e в║зли     }
            B_key[I-1] := B_key[I];     B_data[I-1] := B_data[I];
            B_next_level[I-1] := B_next_level[I]
          END;
        B_count := B_count - 1     { Бpo┐▓ нa в║зли▓e нaмaл┐вa c eдини╢a   }
      END
  END { Remove_node };
  {------------------------------------------------------------------------}
  PROCEDURE Rec_delete {T║pcи в║зел в дoc▓игнa▓a▓a c▓paни╢a и го o▓c▓paн┐вa}
            (Target : B_key_type;                 { T║pceн кл╛╖            }
             Page      : B_point;                 { Дoc▓игнa▓a c▓paни╢a    }
        VAR  Found  : BOOLEAN);                   { Peз│л▓a▓ o▓ oпepa╢и┐▓a }
    VAR K : B_index;
  BEGIN { Rec_delete }
    IF Page = NIL THEN                      { T║pceни┐▓ в║зeл нe e нaмepeн }
      BEGIN
        Bool := FALSE;        Long_exit (Exit_place)
      END
    ELSE
      WITH Page^ DO
        BEGIN                      { T║pcи кл╛╖a в дoc▓игнa▓a▓a c▓paни╢a   }
          IF Search_in_page (Target, Page, K) THEN
            BEGIN  Found := TRUE; { T║pceни┐▓ в║зeл e нaмepeн и ▒е из▓pивa }
              IF B_next_level[K-1] = NIL THEN { В║зел║▓ н┐мa л┐в нacлeдник }
                Remove_node (Page,K)                   { Из▓pивa в║зeлa    }
              ELSE {Aкo имa, cп│cкa ce пo д║pвo▓o и нaмиpa дecни┐ нacлeдник}
                BEGIN                 {Зaмeн┐ из▓pивaни┐ в║зeл c нacлeдникa}
                  Successor (Page, K);  { Пpoд║лжaвa cп│cкaнe▓o пo д║pвo▓o }
                                        { c ╢eл дa из▓pиe нacлeдникa       }
                  Rec_delete (B_key[K], B_next_level[K], Found);
                  IF NOT Found THEN
                    BEGIN                   { He e нaмepeн ▓║pceни┐▓ в║зeл }
                      Bool := FALSE ;    Long_exit(Exit_place)
                    END
                END
            END         { Aкo в║зeл║▓ нe e нaмepeн в ▓eк│╣a▓a c▓paни╢a,    }
          ELSE          { ▓║pceнe▓o пpoд║лжaвa в c▓paни╢a▓a - нacлeдник    }
            Rec_delete ( Target, B_next_level[K], Found);
          IF B_next_level[K] <> NIL THEN
            IF B_next_level[K]^.B_count < B_keys_min THEN
              Restore_node (Page,K)
        END
  END {Rec_delete };
  {------------------------------------------------------------------------}
  PROCEDURE Delete_node            { O▓c▓paн┐вa в║зeл o▓ д║pвo▓o           }
            (Key : B_key_type;     { Kл╛╖                                  }
         VAR Root: B_point);       { Kopeн                                 }
    VAR  Page  : B_point;        Found : BOOLEAN;
  BEGIN { Delete_node }
    Exit_place := Save_exit;
    Rec_delete (Key, Root, Found);            { T║pcи и o▓c▓paн┐вa в║зeл   }
    IF Found THEN
      BEGIN                        { Aкo кopeнoвa▓a c▓paни╢a oc▓aнe пpaзнa }
        IF Root^. B_count = 0 THEN   { ┐ o▓c▓paн┐вa                        }
          BEGIN  Page := Root;
            Root := Root^.B_next_level[0];  DISPOSE(Page)
          END
      END
    ELSE
      BEGIN                     { Aкo нe e нaмepeн ▓║pceни┐▓ в║зeл - FALSE }
        Bool := FALSE;         Long_exit (Exit_place)
      END
  END { Delete_node };
  {------------------------------------------------------------------------}
BEGIN { B_delete_node }                      { O▓c▓paн┐вa в║зeл o▓ д║pвo▓o }
  Bool := TRUE;    Delete_node(Key_data, B_root^.B_start);
  B_delete_node := Bool;
END { B_delete_node };
{$F-    ------------------------------------------------------------------}
PROCEDURE B_delete_tree;                           { Из▓pивa ╢┐лo▓o д║pвo }
  VAR B_root : B_tree_pointer ABSOLUTE Root;
  {------------------------------------------------------------------------}
  PROCEDURE Del_page (Page: B_point);   { Из▓pивa eднa c▓paни╢a o▓ д║pвo▓o }
    VAR I : B_index;                    { зaeднo c нeйни▓e нacлeдни╢и      }
  BEGIN { Del_page }
    IF Page <> NIL THEN
      WITH Page^ DO
        BEGIN  Del_page (B_next_level[0]); {Из▓pивa c▓paни╢и▓e - нacлeдни╢и}
          FOR I := 1 TO B_count DO
            BEGIN
              IF @B_root^.B_del <> NIL THEN     { Извиквa нacлeдeни┐ мe▓oд }
                B_root^.B_del (B_key[I], B_data[I]);
              Del_page (B_next_level[I])
            END;
          DISPOSE (Page)                            { Из▓pивa c▓paни╢a▓a   }
        END
  END { Del_page };
  {------------------------------------------------------------------------}
BEGIN { B_delete_tree }
  IF Root <> NIL THEN
    BEGIN
      Del_page (B_root^.B_start);           Dispose (B_root)
    END
END { B_delete_tree };
{--------------------------------------------------------------------------}
PROCEDURE B_process;                    { Oбxoждa вcи╖ки в║зли нa д║pвo▓o  }
  VAR B_root : B_tree_pointer ABSOLUTE Root;
  {------------------------------------------------------------------------}
  PROCEDURE In_visit (Page: B_point);
    VAR I : B_index;
  BEGIN { In_visit }
    IF Page <> NIL THEN
      WITH Page^ DO
        BEGIN  In_visit (B_next_level[0]);        { Oбxoждa нaй-лeви┐ клoн }
          FOR I := 1 TO B_count DO
            BEGIN                     { Oбxoждa вcи╖ки в║зли o▓ c▓paни╢a▓a }
              IF @B_root^.B_proc <> NIL THEN
                B_root^.B_proc (B_key[I], B_data[I]);
              In_visit (B_next_level[I])
            END
        END
  END { In_visit };
  {------------------------------------------------------------------------}
BEGIN { B_process }
  In_visit(B_root^.B_start)
END { B_process };
{--------------------------------------------------------------------------}
PROCEDURE B_init;                                        { C║здaвa B-д║pвo }
  VAR B_root : B_tree_pointer ABSOLUTE Root;
BEGIN { B_init }
  NEW (B_root);                   { Peзepвиpa пaмe▓ зa кopeнa нa B_д║pвo▓o }
  WITH B_root^ DO
    BEGIN
      B_start := NIL;  B_proc := Proc;   B_del := Del
    END
END { B_init };
{--------------------------------------------------------------------------}
BEGIN { B_trees }
  @B_null_proc := NIL;     @B_null_del  := NIL
END.  { B_trees }
{--------------------------------------------------------------------------}
