{--------------------------------------------------------------------------}
PROGRAM Test_2;   { П░ог░ама▓а демон▒▓░и░а използ│ване▓о на обек▓ни ▓ипове }
  USES Nodes, O_stacks, Elements, C_lists, O_queues;
  VAR P_n : Node_ptr;                          { Указа▓ел к║м ▓ипа Node    }
      I   : INTEGER;
      C   : O_stack_ptr;                       { Указа▓ел к║м ▓ипа O_stack }
      Q   : O_queue_ptr;                       { Указа▓ел к║м ▓ипа O_stack }
{--------------------------------------------------------------------------}
BEGIN { Test_2 }
  C := NEW(O_stack_ptr,Init);             { C║здaвa c▓eк и го ини╢иализи░а }
  FOR I := 1 TO 3 DO     { Цик║л, пpи кoй▓o в c▓eкa ce вкл╛╖вa▓ 9 eлeмeн▓a }
    BEGIN
      C^.Push(NEW(Int_node_ptr, Init(I)));            { Bкл╛╖вa ╢┐лo ╖иcлo }
      WRITE ('Cимв.низ:');
      C^.Push(NEW(Str_node_ptr, Init(Str_read)));
      WRITE ('Ц┐лo ╖иcлo:');             { Bкл╛╖вa ┤opмa▓иpaнo ╢┐лo ╖иcлo  }
      C^.Push(NEW(Form_node_ptr, Init(Int_read,I)))
    END;
  WRITELN ('Oбpaбo▓кa нa c▓eкa кa▓o ╢икли╖ен линeeн едно▒в║░зан cпиc║к ');
  C^.Process;
  Q := NEW (O_queue_ptr,Init);                            { C║здaвa oпa╕кa }
  Q^.Put(NEW(Int_node_ptr,Init(10)));  { Вкл╛╖ва eлeмeн▓ (╢┐ло) в oпa╕кa▓a }
  Q^.Put(C);                           { Вкл╛╖ва eлeмeн▓ (c▓eк) в oпa╕кa▓a }
  WRITELN ('Oбpaбo▓кa нa oпa╕кa▓a кa▓o ╢икл. eднocв║pзaн линeeн cпиc║к:');
  Q^.Process;
  WRITELN ('Извли╖aне на eлeмeн▓и o▓ c▓eкa: ');
  WHILE  C^.Pop (P_n) DO      { Цик║л, п░и кой▓о ▒е извли╖а▓ елемен▓и▓е о▓ }
    P_n^.Process        { ▒▓ека и ▒е об░або▓ва▓ по ▒║о▓ве▓ни┐ за ▓┐╡ ме▓од }
END { Test_2 }.
{--------------------------------------------------------------------------}
