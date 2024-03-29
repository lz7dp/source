{--------------------------------------------------------------------------}
PROGRAM Test_2;   { ���������� ����������� ������������� �� ������� ������ }
  USES Nodes, O_stacks, Elements, C_lists, O_queues;
  VAR P_n : Node_ptr;                          { �������� ��� ���� Node    }
      I   : INTEGER;
      C   : O_stack_ptr;                       { �������� ��� ���� O_stack }
      Q   : O_queue_ptr;                       { �������� ��� ���� O_stack }
{--------------------------------------------------------------------------}
BEGIN { Test_2 }
  C := NEW(O_stack_ptr,Init);             { C���a�a c�e� � �� ������������ }
  FOR I := 1 TO 3 DO     { �����, �p� �o��o � c�e�a ce ������a� 9 e�e�e��a }
    BEGIN
      C^.Push(NEW(Int_node_ptr, Init(I)));            { B�����a ���o ��c�o }
      WRITE ('C���.���:');
      C^.Push(NEW(Str_node_ptr, Init(Str_read)));
      WRITE ('���o ��c�o:');             { B�����a �op�a��pa�o ���o ��c�o  }
      C^.Push(NEW(Form_node_ptr, Init(Int_read,I)))
    END;
  WRITELN ('O�pa�o��a �a c�e�a �a�o �������� ���ee� ����������� c��c�� ');
  C^.Process;
  Q := NEW (O_queue_ptr,Init);                            { C���a�a o�a��a }
  Q^.Put(NEW(Int_node_ptr,Init(10)));  { ������� e�e�e�� (����) � o�a��a�a }
  Q^.Put(C);                           { ������� e�e�e�� (c�e�) � o�a��a�a }
  WRITELN ('O�pa�o��a �a o�a��a�a �a�o ����. e��oc��p�a� ���ee� c��c��:');
  Q^.Process;
  WRITELN ('������a�� �� e�e�e��� o� c�e�a: ');
  WHILE  C^.Pop (P_n) DO      { �����, ��� ����� �� �������� ���������� �� }
    P_n^.Process        { ����� � �� ���������� �� ���������� �� ��� ����� }
END { Test_2 }.
{--------------------------------------------------------------------------}
