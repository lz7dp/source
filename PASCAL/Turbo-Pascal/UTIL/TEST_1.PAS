{--------------------------------------------------------------------------}
PROGRAM Test_1;   { Пpoгpaмa, дeмoнc▓pиpa╣a изпoлз│вaнe нa oбeк▓ни ▓ипoвe  }
  USES Nodes, Elements;
VAR Int_p : Int_node_ptr;     {Указа▓ел к║м обек▓ - ╢┐ло ╖и▒ло (Init_node) }
    Str_p : Str_node_ptr;   { Указа▓ел к║м обек▓ - ▒имволен низ (Str_node) }
    N     : Node_ptr;         { Указа▓ел к║м в║зел (базов обек▓)           }
BEGIN { Test_1 }
  NEW (Int_p);                   { Peзepвиpa пaмe▓ зa oбeк▓ o▓ ▓ип IntPnt  }
  Int_p^.Init(10);   { Oбeк▓║▓ ce ини╢иaлизиpa и м│ ce зaдaвa c▓oйнoc▓ 10  }
  {------------------------------------------------------------------------}
  WRITE ('Cимв.низ:');                            { C║здaвa oбeк▓ o▓ ▓ип   }
  Str_p := NEW(Str_node_ptr, Init(Str_read));     { Str_node, в║вeждa      }
                     { ╢┐лo ╖иcлo o▓ клaвa▓│pa▓a и oбек▓║▓ ▒е ини╢иaлизиpa }
  Str_p^.Process;             { Щe ce изп║лни мe▓oд║▓ StrNode.Process      }
  {------------------------------------------------------------------------}
  N := Int_p;                                     { Пpoeк╢и┐ нa │кaзa▓eли  }
  N^.Process;                    { Щe ce изп║лни мe▓oд║▓ Int_Node.Process  }
  {------------------------------------------------------------------------}
  N := Str_p;                                     { Пpoeк╢и┐ нa │кaзa▓eли  }
  N^.Process;                    { Щe ce изп║лни мe▓oд║▓ Str_Node.Process  }
  IF TypeOf(N^) = TypeOf(Str_node) THEN
    WRITELN ('Cимвoлeн низ');
  DISPOSE (N,Done)               { Ocвoбoждaвa ce oбeк▓ o▓ ▓ип Str_node    }
END { Test_1 }.
{--------------------------------------------------------------------------}
