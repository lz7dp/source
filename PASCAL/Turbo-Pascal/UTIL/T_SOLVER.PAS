{$V-  *********************************************************************}
PROGRAM T_solver;                    { °®£° ¬ , ¨§¯®«§³¢ ¹  ¬®¤³«  Solver }
USES Solver;
  VAR X : REAL;
      S : STRING;
BEGIN
  REPEAT   WRITE('> ');  READLN(S);
    IF NOT Define_expression (S,X) THEN WRITELN (Get_last_error);
    IF Compute_expression (S,X) THEN
      WRITELN (X)
  UNTIL S = '';
END.
