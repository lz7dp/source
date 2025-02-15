{--------------------------------------------------------------------------}
PROGRAM Test_1;   { �po�pa�a, �e�o�c�p�pa�a ���o����a�e �a o�e���� ���o�e  }
  USES Nodes, Elements;
VAR Int_p : Int_node_ptr;     {�������� ��� ����� - ���� ����� (Init_node) }
    Str_p : Str_node_ptr;   { �������� ��� ����� - �������� ��� (Str_node) }
    N     : Node_ptr;         { �������� ��� ����� (����� �����)           }
BEGIN { Test_1 }
  NEW (Int_p);                   { Pe�ep��pa �a�e� �a o�e�� o� ��� IntPnt  }
  Int_p^.Init(10);   { O�e���� ce �����a����pa � �� ce �a�a�a c�o��oc� 10  }
  {------------------------------------------------------------------------}
  WRITE ('C���.���:');                            { C���a�a o�e�� o� ���   }
  Str_p := NEW(Str_node_ptr, Init(Str_read));     { Str_node, ���e��a      }
                     { ���o ��c�o o� ��a�a��pa�a � o������ �� �����a����pa }
  Str_p^.Process;             { �e ce ������� �e�o��� StrNode.Process      }
  {------------------------------------------------------------------------}
  N := Int_p;                                     { �poe���� �a ��a�a�e��  }
  N^.Process;                    { �e ce ������� �e�o��� Int_Node.Process  }
  {------------------------------------------------------------------------}
  N := Str_p;                                     { �poe���� �a ��a�a�e��  }
  N^.Process;                    { �e ce ������� �e�o��� Str_Node.Process  }
  IF TypeOf(N^) = TypeOf(Str_node) THEN
    WRITELN ('C���o�e� ���');
  DISPOSE (N,Done)               { Oc�o�o��a�a ce o�e�� o� ��� Str_node    }
END { Test_1 }.
{--------------------------------------------------------------------------}
