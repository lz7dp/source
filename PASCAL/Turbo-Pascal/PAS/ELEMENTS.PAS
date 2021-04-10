{--------------------------------------------------------------------------}
UNIT Elements;                  { Mo¤³«, cº¤ºp¦a¹ ¯p¨¬ep¨ §a ¯poc²¨ o¡eª²¨ }
INTERFACE                       {------------------------------------------}
  USES Nodes;
TYPE           {-------------------------- K«ac Int_node ------------------}
  Int_node_ptr = ^Int_node;
  Int_Node = OBJECT(Node)
    Value: INTEGER;
    CONSTRUCTOR Init(V: INTEGER);
    PROCEDURE Process; VIRTUAL;
  END;
  {--------------------------------------- K«ac Form_node -----------------}
  Form_node_ptr = ^Form_node;
  Form_node = OBJECT (Int_node)
    Format: BYTE;
    CONSTRUCTOR Init(V:INTEGER; F:BYTE);
    PROCEDURE Process; VIRTUAL;
  END;
  {--------------------------------------- K«ac Str_node ------------------}
  Str_ptr = ^STRING;
  Str_node_ptr = ^Str_node;
  Str_node = OBJECT(Node)
    St_Ptr: Str_ptr;
    CONSTRUCTOR Init(S: STRING);
    DESTRUCTOR Done; VIRTUAL;
    PROCEDURE Process; VIRTUAL;
  END;
  {------------------------------------------------------------------------}
    FUNCTION Int_read : INTEGER;
    FUNCTION Str_read : STRING;
IMPLEMENTATION  {------------------------- Me²o¤¨ ­a ª«aca Int_node -------}
  CONSTRUCTOR Int_node.Init(V: INTEGER);
  BEGIN { Init }
    Value := V;
  END { Init };
  {------------------------------------------------------------------------}
  PROCEDURE Int_node.Process;
  BEGIN { Process}
    WRITELN('Int: ', Value);
  END { Process};
   {-------------------------------------- Me²o¤¨ ­a ª«aca Form_node ------}
  CONSTRUCTOR Form_node.Init(V: INTEGER; F: BYTE);
  BEGIN { Init }
    Value := V;     Format := F
  END { Init };
  {------------------------------------------------------------------------}
  PROCEDURE Form_node.Process;
  BEGIN { Process}
    WRITELN('Int: ', Value:Format);
  END { Process};
  {----------------------------------------Me²o¤¨ ­a ª«aca  Str_node-------}
  CONSTRUCTOR Str_node.Init(S: STRING);
  BEGIN  { Init }
    GetMem(St_ptr, Length(S) + 1);        St_ptr^ := S;
  END { Init };
  {------------------------------------------------------------------------}
  DESTRUCTOR Str_Node.Done;
  BEGIN { Done }
    FreeMem(St_ptr, LENGTH(St_Ptr^) + 1);
  END { Done };
  {------------------------------------------------------------------------}
  PROCEDURE Str_Node.Process;
  BEGIN { Process}
    WRITELN('Str: ', St_ptr^);
  END { Process};
  {------------------------------------------------------------------------}
  FUNCTION Int_read : INTEGER;                          { —¥²¥ ¶¿«® ·¨±«®  }
    VAR Intg : INTEGER;
  BEGIN { Int_read }
    REPEAT   {$I-} READLN(Intg); {I+}
    UNTIL IORESULT = 0;
    Int_read := Intg
  END { Int_read };
  {------------------------------------------------------------------------}
  FUNCTION Str_read : STRING;                         { —¥²¥ ±¨¬¢®«¥­ ­¨§  }
    VAR Str_val : STRING;
  BEGIN { Str_read }
    READLN(Str_val);     Str_read := Str_val
  END { Str_read };
END.
{--------------------------------------------------------------------------}
