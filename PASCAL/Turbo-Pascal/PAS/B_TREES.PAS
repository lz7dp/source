{$F+ ----------------------------------------------------------------------}
{$I B_trees.inc}                { T��o �a �o��� �a ��pa��e��e �a B-��p�e�a }
IMPLEMENTATION                  {------------------------------------------}
  USES Util;
  CONST  B_keys_max = 6;       { Ma�c��a�e� �po� �a ����o�e�e ��� ���e�    }
         B_keys_min = 3;       { M����a�e� �po� �a ����o�e�e ��� ���e�     }
  TYPE   B_index = 0..7;
    B_point = ^B_page;           { T�� �a ��a�a�e�� ��� ���e� o� B-��p�o�o }
    B_page =                     { T�� �a ���e� o� B-��p�o�o               }
      RECORD
        B_count: WORD;           { �po� �a ������e � c�pa���a�a            }
        B_key  : ARRAY[1..B_keys_max] OF B_key_type;   { K���o�e           }
        B_data : ARRAY[1..B_keys_max] OF B_data_type;  { �a��� ��� ���e�a  }
                                  { ��a�a�e�� ��� c�pa�����e-�ac�e�����    }
        B_next_level : ARRAY[0..B_keys_max] OF B_point;
      END;
    B_tree_pointer = ^B_root;  { T�� �a ��a�a�e� ��� �ec�p���opa �a ��p�o�o}
    B_root =                               { T�� �a �ec�p���opa �a ��p�o�o }
      RECORD                 { ��a��pa�� �e�o��:                           }
        B_proc  : B_users_procedure;{ �a o�pa�o��a �a �a����e �p� o�xo��a�e}
        B_del   : B_users_del;      { �a o�pa�o��a �a �a����e �p� ���p��a�e}
        B_start : B_point;                      { ��a�a�e� ��� ��p��� ��c� }
      END;
{--------------------------------------------------------------------------}
FUNCTION Search_in_page               { T�pc� ���� � c�pa���a�a Page       }
         (Key        : B_key_type;    { K����� �a e�e�e��a, �o��o ce ��pc� }
          Page       : B_point;      { ��a�a�e� ��� o�pa�o��a�a�a c�pa���a }
      VAR Node_index : B_index    { ���e�c �a ���e�a � �a�epe�a�a c�pa���a }
          ) : BOOLEAN;     { Pe����a�: TRUE-�a�epe�; FALSE-�e e �a�epe�    }
BEGIN { Search_in_page }
  WITH Page^ DO
    IF Key < B_key[1] THEN
      BEGIN      { A�o ������ e �o-�a��� o� �a�-�a���� ���� ��� ���������� }
        Search_in_page := FALSE;      Node_index := 0
      END
    ELSE
      BEGIN     { T�pc� �oc�e�o�a�e��o � oc�a�a���e ����o�e�e �a ����������}
        Node_index := B_count;
        WHILE (Key < B_key[Node_index]) AND (Node_index > 1) DO
          Node_index := Node_index - 1;
        Search_in_page := Key = B_key[Node_index]
      END
END { Search_in_page };
{--------------------------------------------------------------------------}
FUNCTION Search_in_tree           { T�pc� �oco�e��� ���� � ��p�o�o         }
         (Key_data  : B_key_type; { K����� �a e�e�e��a, �o��o ce ��pc�     }
          Page      : B_point;    { C�pa���a, o� �o��o c�ap��pa ��pce�e�o  }
      VAR Found_page: B_point;    { ��a�a�e� ��� �a�epe�a�a c�pa���a       }
      VAR Index     : B_index     { ���e�c �a ���e�a � �a�epe�a�a c�pa���a }
         ): BOOLEAN;
BEGIN { Search_in_tree }
  IF Page = NIL THEN      { �oc����a� e ��c�. B B-��p�o�o ���a �a��� ���e� }
    Search_in_tree := FALSE
  ELSE
    BEGIN                              { T�pc� � ����o�e�e �a ���e�a Page  }
      IF Search_in_page(Key_data, Page, Index) THEN
        BEGIN
          Found_page := Page;        { T�pce���� ���e� e �a�epe�           }
          Search_in_tree := TRUE
        END
      ELSE         { A�o �e, ��pce�e�o �po����a�a � �ac�e����a �a e�e�e��a }
        Search_in_tree := Search_in_tree       { c �o�ep Index             }
                 (Key_data, Page^.B_next_level[Index], Found_page, Index)
    END
END { Search_in_tree };
{--------------------------------------------------------------------------}
FUNCTION B_search_node;                         { T�pc� ���e� c �a�e� ���� }
  VAR B_root  : B_tree_pointer ABSOLUTE Root;
      Index   : B_index;          { ���e�c �a ���e�a � �a�epe�a�a c�pa���a }
      Found_page: B_point;              { ��a�a�e� ��� �a�epe�a�a c�pa���a }
BEGIN { B_search_node }
  IF Search_in_tree (Key_data, B_root^.B_Start, Found_page, Index) THEN
    BEGIN                       { T�pce���� ���� e �a�epe�. He�o���e �a��� }
      Data := Found_page^.B_data[Index];       { ce �p��a� �a�o pe����a�   }
      B_search_node := TRUE
    END
  ELSE
    B_search_node := FALSE                  { T�pce���� ���e� �e e �a�epe� }
END { B_search_node };
{--------------------------------------------------------------------------}
FUNCTION B_insert_node;       { B�����a � ��p�o�o e�e�e�� c o�pe�e�e� ���� }
  VAR  B_root       : B_tree_pointer ABSOLUTE Root;
       Exit_place   : WORD;         Bool         : BOOLEAN;
  {------------------------------------------------------------------------}
  PROCEDURE Push_in         { B�����a � Page ����a X � �ec��� �� �ac�e���� }
            (X  : B_key_type;                  { B�����a� ����             }
             Xd : B_data_type;                 { B�����a�� �a���           }
             Xr,                               { �ece� �ac�e���� �a ����a  }
             Page  : B_point;                  { C�pa���a                  }
             K  : B_index                      { M�c�o �a ����a � �ac��a   }
            );
  VAR  I : B_index;
  BEGIN { Push_in }
    WITH Page^ DO
      BEGIN                      { ���ec��a�e �a ��c�o �a �c���� e�e�e���  }
        FOR I := B_count DOWNTO K+1 DO                   { � c�pa���a�a    }
          BEGIN  B_key[I+1] := B_key[I];                 { K���o�e         }
            B_data[I+1] := B_data[I];                    { �a���           }
            B_next_level[I+1] := B_next_level[I]         { Hac�e�����      }
          END { For I };
        B_key[K+1] := X;          B_data[K+1] := Xd; {B�����a �o��� e�e�e��}
        B_next_level[K+1] := Xr;  B_count := B_count + 1
      END
  END { Push_in };
  {------------------------------------------------------------------------}
  PROCEDURE Split                { Pa��e�� c�pa���a �a ��e c�pa����        }
            (X : B_key_type;     { B����a� ����                            }
             Xd: B_data_type;    { B����a�� �a���                          }
            Xr,                  { �ece� �ac�e���� �a ����a � c�pa���a�a   }
            Page  : B_point;     { Pa��e���a c�pa���a                                       }
            K     : B_index;     { �o����� �a ����a                        }
            VAR Y : B_key_type;  { K��� � �a��� �a cpe���� e�e�e��, �o��o  }
            VAR Yd: B_data_type; { ce �o�a�a� �a ������a�e �a �o-�op�o ���o}
            VAR Yr: B_point);    { Ho�a c�pa���a, �o���e�a o� pa��e���e�o  }
  VAR I, Median : B_index;
  BEGIN  { Split }
    IF K <= B_keys_min THEN        { O�pe�e�� ���e �e ce �����e ������     }
      Median := B_keys_min         { c�e� pa��e���e�o - � ���a�a ��� �     }
    ELSE                           { ��c�a�a c�pa���a                      }
      Median := B_keys_min + 1;
    NEW (Yr);                      { Pe�ep��pa �a�e� �a �o�a c�pa���a      }
    WITH Page^ DO
      BEGIN   { ������� ��c�a�a �o�o���a o� ���op�a����a � �o�a�a c�pa���a }
        FOR I := Median + 1 TO B_keys_max DO
          BEGIN   Yr^.B_key[I-Median] := B_key[I];
            Yr^.B_data[I-Median] := B_data[I];
            Yr^.B_next_level[I-Median] := B_next_level[I]
          END { For I };
        Yr^.B_count := B_keys_max-Median;   { �po� �a ����o�e�e � c�apa�a, }
        B_count := Median;           { �po� �a ����o�e�e � �o�a�a c�pa���a }
        IF K <= B_keys_min THEN  { B����a�e �a e�e�e��a � c�apa�a c�pa���a }
          Push_in (X, Xd, Xr, Page, K)
        ELSE                     { B����a�e �a e�e�e��a � �o�a�a c�pa���a  }
          Push_in (X, Xd, Xr, Yr, K-Median);
        Y := B_key[B_count];         Yd := B_data[B_count];
        Yr^.B_next_level[0] := B_next_level[B_count];
        B_count := B_count - 1
      END
  END { Split };
  {------------------------------------------------------------------------}
  PROCEDURE Push_down  { T�pc� ��c�o�o � ������a e�e�e�� � B-��p�o�o       }
  { �p� Push_up = TRUE - �p��a ����a � �a����e, �o��o �p���a �a ce �����a� }
  { �a �o-�op�o�o ���o, �o�a�o �� pa��e�� c�pa���a�a �a ��e                }
            (New_key: B_key_type;                        { K���  �a ���e�a }
             Xdd    : B_data_type;                       { �a��� �a ���e�a }
             Page   : B_point;                           { C�pa���a        }
         VAR Push_up: BOOLEAN;        { Pe����a�-pa��e�e�a �� e c�pa���a�a }
         VAR X      : B_key_type;     { K��� �� ������a��� e�e�e�� �       }
                                      { ��-�op�a�a c�pa����                }
         VAR Xd     : B_data_type;           { �a��� �a e�e�e��a           }
         VAR Xr     : B_point );             { Hac�e���� �a �e�� �a���     }
    VAR K  : B_index;
  BEGIN { Push_down }
    IF Page = NIL THEN
      BEGIN   { �oc����a� e ��c�. Bp��a� ce ������, �a����e � ��a�a�e� NIL }
        Push_up := TRUE;        X  := New_key;
        Xd      := Xdd;         Xr := NIL
      END
    ELSE
      BEGIN   { T�pc� ����a � c�pa���a�a � a�o �o �a�ep� - �����a a�ap���o }
        IF Search_in_page (New_key, Page,  K)  THEN
          BEGIN     Bool := FALSE;
            Long_exit (Exit_place)
          END;         { �po����a�a ��pce�e�o o� �ac�e����a �a e�e�e��a K  }
        Push_down(New_key, Xdd, Page^.B_next_level[K], Push_up, X, Xd, Xr);
        IF Push_up THEN
         WITH Page^ DO
          IF B_count <  B_keys_max THEN
            BEGIN    { B�����a e�e�e��a ��� ���e�a Page - � ���� ��a ��c�o }
              Push_up := FALSE;     Push_In (X, Xd, Xr, Page, K)
            END
          ELSE
            BEGIN   { B�� ���e�a ���a ��c�o � ce �a�a�a �o� �a ce pa��e�� }
              Push_up := TRUE;      Split (X, Xd, Xr, Page, K, X, Xd, Xr)
            END
      END { Else Page <> NIL}
  END { Push_down };
  {------------------------------------------------------------------------}
  PROCEDURE Insert_node              { B����a �o� ���� � B-��p�o��         }
            (New_key : B_key_type;   { K���                                }
             VAR Root: B_point);     { Kope� �a B-��p�o�o                  }
  VAR Push_up : BOOLEAN;             { Hapac��a �� ��co���a�a �a ��p�o�o?  }
      X       : B_key_type;
      Xd      : B_data_type;
      Xr      : B_point;                 { ��c�o �o���p�o }
      Page       : B_point;
  BEGIN { Insert_node }
   Exit_place := Save_exit;         { �o��o��� Exit_place �a a�ap�e� ��xo� }
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
FUNCTION B_delete_node;                 {   ���p��a ���e� c o�pe�e�e� ���� }
  VAR B_root : B_tree_pointer ABSOLUTE Root;      { Kope� �a ��p�o�o       }
      Bool   : BOOLEAN;                           { Pe����a� o� o�epa����a }
      Exit_place : WORD;                          { M�c�o �a ������a�e     }
  {------------------------------------------------------------------------}
  PROCEDURE Combine {C���pa ������e o� ��e c�ce��� c�pa���� � e��a c�pa���a}
            (Page : B_point;                            { C�pa���a         }
             K : B_index );                             { ���e�c �a ���e�a }
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
          BEGIN                  { �pe�ec��a �c���� ����� o� e��a�a � �pa� }
            B_count := B_count + 1;                { �a �p��a�a c�p�����   }
            B_key[B_count]  := Q^.B_key[C];
            B_data[B_count] := Q^.B_data[C];
            B_next_level[B_count] :=Q^.B_next_level[C]
          END
      END;
      WITH Page^ DO
        BEGIN
          FOR C := K TO B_count -1 DO
            BEGIN          { �pe�ec��a �c���� ����� �� e��a �o����� ����o  }
              B_key[C] := B_key[C+1];        B_data[C] := B_data[C+1];
              B_next_level[C] := B_next_level[C+1]
            END;
          B_count := B_count -1
        END;
    DISPOSE (Q)
  END { Combine };
  {------------------------------------------------------------------------}
  PROCEDURE Move_left    { �pex��p�� ���e� o� c�pa���a�a-�ece� ��������� � }
                     { c�pa���a�a-��� �ac�e���� �a ���e� K o� c�pa���a Page}
            (Page : B_point;                           { C�pa���a          }
             K : B_index);                             { ���e�c �a ���e�a  }
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
          BEGIN           { �pe�ec��a �c���� ����� �� e��a �o����� ����o   }
            B_key[C] := B_key[C+1];    B_data[C] := B_data[C+1];
            B_next_level[C] := B_next_level[C+1]
          END
      END
  END { Move_left };
  {------------------------------------------------------------------------}
  PROCEDURE Move_right   { �pex��p�� ���e� o� c�pa���a�a-�ece� �ac�e���� � }
                     { c�pa���a�a-��� �ac�e���� �a ���e� K o� c�pa���a Page}
            (Page : B_point;                            { C�pa���a         }
             K    : B_index);                           { ���e�c �a ���e�a }
    VAR  C: B_index;
  BEGIN { Move_right }
    WITH Page^.B_next_level[K]^ DO
      BEGIN                { �pe�ec��a �c���� ����� �� e��a �o����� ���c�o }
        FOR C := B_count DOWNTO 1 DO
          BEGIN    B_key[C+1] := B_key[C];        B_data[C+1] := B_data[C];
            B_next_level[C+1] := B_next_level[C]
          END;
        B_next_level[1] := B_next_level[0];  B_count   := B_count + 1;
        B_key[1]  := Page^.B_key[K];         B_data[1] := Page^.B_data[K]
      END;
    WITH Page^.B_next_level[K-1]^ DO  { �pex��p�� e��� ���e� o� c�pa���a�a-}
      BEGIN                   { ��� �ac�e���� � c�pa���a�a-�ece� �ac�e���� }
        Page^.B_key[K] := B_key[B_count];
        Page^.B_data[K] := B_data[B_count];
        Page^.B_next_level[K]^.B_next_level[0] := B_next_level[B_count];
        B_count := B_count - 1
      END
  END { Move_right };
  {------------------------------------------------------------------------}
  PROCEDURE Restore_node        { ���c�a�o���a �����a���� �po� �a ���e���e }
            (Page : B_point;          { � ��pa���a��                       }
             K    : B_index);         { ���e�c �a e�e�e��a                 }
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
  PROCEDURE Successor { Ha��pa �ac�e����a �a ���p��a��� ���e� � �o �a�e��  }
            (Page : B_point;          { C�pa���a �a ���p��a��� ���e�       }
             K : B_index);            { ���e�c �a ���p��a��� ���e�         }
    VAR Q : B_point;
  BEGIN { Successor }   Q := Page^.B_next_level[K];
    WHILE Q^.B_next_level[0] <> NIL DO    { C��c�a ce �o �a�-�e���e ��o��  }
      Q := Q^.B_next_level[0];
      Page^.B_key[K]  := Q^.B_key[1];     { �a�e�� ���p��a��� ���e�        }
      Page^.B_data[K] := Q^.B_data[1]
  END { Successor };
  {------------------------------------------------------------------------}
  PROCEDURE Remove_node            {  O�c�pa���a ���e� o� c�pa���a         }
            (Page : B_point;       {  C�pa���a                             }
             K : B_index);         {  ���e�c �a ���e�a                     }
    VAR I : B_index;
  BEGIN { Remove_node }
    WITH Page^ DO
      BEGIN
        FOR I := K + 1 TO B_count DO
          BEGIN                    { �pe�ec��a �a���o oc�a�a���e �����     }
            B_key[I-1] := B_key[I];     B_data[I-1] := B_data[I];
            B_next_level[I-1] := B_next_level[I]
          END;
        B_count := B_count - 1     { �po�� �a ������e �a�a���a c e�����a   }
      END
  END { Remove_node };
  {------------------------------------------------------------------------}
  PROCEDURE Rec_delete {T�pc� ����� � �oc����a�a�a c�pa���a � �� o�c�pa���a}
            (Target : B_key_type;                 { T�pce� ����            }
             Page      : B_point;                 { �oc����a�a c�pa���a    }
        VAR  Found  : BOOLEAN);                   { Pe����a� o� o�epa����a }
    VAR K : B_index;
  BEGIN { Rec_delete }
    IF Page = NIL THEN                      { T�pce���� ���e� �e e �a�epe� }
      BEGIN
        Bool := FALSE;        Long_exit (Exit_place)
      END
    ELSE
      WITH Page^ DO
        BEGIN                      { T�pc� ����a � �oc����a�a�a c�pa���a   }
          IF Search_in_page (Target, Page, K) THEN
            BEGIN  Found := TRUE; { T�pce���� ���e� e �a�epe� � �� ���p��a }
              IF B_next_level[K-1] = NIL THEN { ������� ���a ��� �ac�e���� }
                Remove_node (Page,K)                   { ���p��a ���e�a    }
              ELSE {A�o ��a, c��c�a ce �o ��p�o�o � �a��pa �ec��� �ac�e����}
                BEGIN                 {�a�e�� ���p��a��� ���e� c �ac�e����a}
                  Successor (Page, K);  { �po����a�a c��c�a�e�o �o ��p�o�o }
                                        { c �e� �a ���p�e �ac�e����a       }
                  Rec_delete (B_key[K], B_next_level[K], Found);
                  IF NOT Found THEN
                    BEGIN                   { He e �a�epe� ��pce���� ���e� }
                      Bool := FALSE ;    Long_exit(Exit_place)
                    END
                END
            END         { A�o ���e��� �e e �a�epe� � �e���a�a c�pa���a,    }
          ELSE          { ��pce�e�o �po����a�a � c�pa���a�a - �ac�e����    }
            Rec_delete ( Target, B_next_level[K], Found);
          IF B_next_level[K] <> NIL THEN
            IF B_next_level[K]^.B_count < B_keys_min THEN
              Restore_node (Page,K)
        END
  END {Rec_delete };
  {------------------------------------------------------------------------}
  PROCEDURE Delete_node            { O�c�pa���a ���e� o� ��p�o�o           }
            (Key : B_key_type;     { K���                                  }
         VAR Root: B_point);       { Kope�                                 }
    VAR  Page  : B_point;        Found : BOOLEAN;
  BEGIN { Delete_node }
    Exit_place := Save_exit;
    Rec_delete (Key, Root, Found);            { T�pc� � o�c�pa���a ���e�   }
    IF Found THEN
      BEGIN                        { A�o �ope�o�a�a c�pa���a oc�a�e �pa��a }
        IF Root^. B_count = 0 THEN   { � o�c�pa���a                        }
          BEGIN  Page := Root;
            Root := Root^.B_next_level[0];  DISPOSE(Page)
          END
      END
    ELSE
      BEGIN                     { A�o �e e �a�epe� ��pce���� ���e� - FALSE }
        Bool := FALSE;         Long_exit (Exit_place)
      END
  END { Delete_node };
  {------------------------------------------------------------------------}
BEGIN { B_delete_node }                      { O�c�pa���a ���e� o� ��p�o�o }
  Bool := TRUE;    Delete_node(Key_data, B_root^.B_start);
  B_delete_node := Bool;
END { B_delete_node };
{$F-    ------------------------------------------------------------------}
PROCEDURE B_delete_tree;                           { ���p��a ���o�o ��p�o }
  VAR B_root : B_tree_pointer ABSOLUTE Root;
  {------------------------------------------------------------------------}
  PROCEDURE Del_page (Page: B_point);   { ���p��a e��a c�pa���a o� ��p�o�o }
    VAR I : B_index;                    { �ae��o c �e����e �ac�e�����      }
  BEGIN { Del_page }
    IF Page <> NIL THEN
      WITH Page^ DO
        BEGIN  Del_page (B_next_level[0]); {���p��a c�pa�����e - �ac�e�����}
          FOR I := 1 TO B_count DO
            BEGIN
              IF @B_root^.B_del <> NIL THEN     { ������a �ac�e�e��� �e�o� }
                B_root^.B_del (B_key[I], B_data[I]);
              Del_page (B_next_level[I])
            END;
          DISPOSE (Page)                            { ���p��a c�pa���a�a   }
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
PROCEDURE B_process;                    { O�xo��a �c���� ����� �a ��p�o�o  }
  VAR B_root : B_tree_pointer ABSOLUTE Root;
  {------------------------------------------------------------------------}
  PROCEDURE In_visit (Page: B_point);
    VAR I : B_index;
  BEGIN { In_visit }
    IF Page <> NIL THEN
      WITH Page^ DO
        BEGIN  In_visit (B_next_level[0]);        { O�xo��a �a�-�e��� ��o� }
          FOR I := 1 TO B_count DO
            BEGIN                     { O�xo��a �c���� ����� o� c�pa���a�a }
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
PROCEDURE B_init;                                        { C���a�a B-��p�o }
  VAR B_root : B_tree_pointer ABSOLUTE Root;
BEGIN { B_init }
  NEW (B_root);                   { Pe�ep��pa �a�e� �a �ope�a �a B_��p�o�o }
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