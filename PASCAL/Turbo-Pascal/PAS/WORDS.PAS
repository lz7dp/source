program words;
   const word_len=15;
   type stwl=string[word_len];
   var sen:string;
   function GETWORD(var st:string):stwl;
     var p:integer;
     begin
       getword:='';
       if st='' then exit;
       while (st<>'') and(st[1]=' ') do
       delete(st,1,1);
       if st='' then exit;
       p:=pos(' ',st);
       if p>0 then
         begin
           getword:=copy(st,1,p-1);
           delete(st,1,p);
         end
       else
        begin
          getword:=st;
          st:='';
        end;
     end;{GETWORD}
 BEGIN
   writeln('������ ���������: ');
   readln(sen);
   writeln('������ � ����������� ��: ');
   while sen<>'' do writeln(getword(sen));
 END.

    

