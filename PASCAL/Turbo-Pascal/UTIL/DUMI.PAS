program list_words;
 uses crt;
 type st15=string[15];
      node=^el;
      el=record
            w:st15;
            count:integer;
            next:node;
      end;
 var h:pointer;
     p,q:node;
 procedure ENTER_WORDS(var p:node);
  var s:st15;
      r,w,t:node;
  begin
    writeln('vavedete dumite na 1 spisak');
    writeln('za end-enter');
    write('poredna duma :');
    readln(s);
    while s<>'' do
      begin
        if t=nil then
          begin
            new(r);
            r^.w:=s;
            r^.count:=1;
            r^.next:=nil;
            t:=r;
          end
        else
          begin
            w:=t;
            while (w<>nil) and (w^.w<>s) do
                w:=w^.next;
            if w^.w=s then
                inc(w^.count)
            else
                begin
                  new(r);
                  r^.w:=s;
                  r^.count:=1;
                  r^.next:=nil;
                  w^.next:=r;
                end;
         end;
      readln(s);
  end;
  end;
  procedure PRINT(t:node);
   var w:node;
       ch:char;
   begin
     if t=nil then writeln('spisaka e prazen')
     else
      begin
        w:=t;
        while w<>nil do
          begin
            writeln(w^.w,'  ',w^.count);
            w:=w^.next;
          end;
      end;
    writeln('press any key');
    ch:=readkey;
   end;
  procedure SEARCH(t:node);
   var s:st15;
       w:node;
       ch:char;
   begin
     write('vavedete duma za tarsene: ');
     readln(s);
     w:=t;
     while (w<>nil) and (w^.w<s) do w:=w^.next;
     if w^.w=s then
       writeln('namerena: ',w^.w,'  ',w^.count)
     else
       writeln('niama takava duma v spisaka');
       writeln('press any key');
       ch:=readkey;
   end;
   procedure INSERT(var v:node;w:node);
    var r,t:node;
    begin
      if v=nil then
        begin
          v:=w;
          w^.next:=nil;
          exit;
        end;
      if w^.w<v^.w then
        begin
          w^.next:=v;
          v:=w;
          exit;
        end;
      if v^.next=nil then
        begin
          v^.next:=w;
          w^.next:=nil;
          exit;
        end;
      t:=v;
      r:=v^.next;
      while (r<>nil) and (w^.w>r^.w) do
        begin
          t:=r;
          r:=r^.next;
        end;
      if r=nil then
        begin t^.next:=w;
          w^.next:=nil;
        end
      else
        begin
          w^.next:=r;
          t^.next:=w;
        end;
  end;
  procedure SORT_LIST;
   var v:node;
   begin
     q:=nil;
     while p<>nil do
      begin
        v:=p;
        p:=p^.next;
        insert(q,v);
      end;
   end;
 BEGIN
   clrscr;
   p:=nil;
   mark(h);
   enter_words(p);
   print(p);
   sort_list;
   print(q);
   search(q);
   release(h);
END.




