program LIST_WORDS;
   uses crt;
   type st15=string[15];
        node=^el;
        el=record
             w:st15;
             count:integer;
             next:node;
           end;
   var p,t1,t2:node;
       h:pointer;
   procedure ENTER_WORDS(t:node);
      var s:st15;
          r,w:node;
      begin
        writeln('‚š‚…„…’… „“Œˆ’… € 1-¿ ‘ˆ‘šŠ');
        writeln('‡€ Š€‰-ENTER');
        write('…„€’€ „“Œ€ : ');
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
                 begin
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
     { procedure search(t:node);
      var s:st15;
          w:node;
          ch:char;
     begin
       write('‚š‚…„…’… „“Œ€ ‡€ ’š‘…… ');
       readln(s);
       w:=t;
       while (w<>nil) and (w^.w<s) do
         w:=w^.next:
       if w^.w=s then
            writeln('€Œ……€: ',w^.w,'  ',w^.count)
       else
         writeln('’š‘…€’€ „“Œ€ ‹ˆ‘‚€ ‚ ‘ˆ‘šŠ€');
         writeln('€’ˆ‘…’… Š‹€‚ˆ˜ ‡€ „š‹†…ˆ… ');
         ch:=readkey;
     end;
     procedure sort_list;
     var v:node;
     begin
        q:=nil;
        while p<>nil do
         begin
           v:=p;
           p:=p^.next;
           insert(q,v);
         end;
     end;}
   procedure INSERT(var v:node;s:st15);
      var r,t,w:node;
      begin
        if v=nil then
          begin
            new(w);
            w^.w:=s;
            w^.count:=1;
            w^.next:=nil;
            v:=w;
            exit;
          end;
        if s<v^.w then
          begin
            new(w);
            w^.w:=s;
            w^.count:=1;
            w^.next:=v;
            v:=w;
            exit;
          end;
        if (v^.next=nil) and (v^.w<s) then
          begin
            new(w);
            w^.w:=s;
            w^.count:=1;
            w^.next:=nil;
            v^.next:=w;
            exit;
          end;
          r:=v;
          while (r<>nil) and (r^.w<s) do
             r:=r^.next;
          if r^.w=s then
            begin
              inc(r^.count);
              exit;
            end;
          t:=v;
          r:=v^.next;
          while (r<>nil) and (r^.w<s) do
            begin
              t:=r;
              r:=r^.next;
            end;
          new(w);
          w^.w:=s;
          w^.count:=1;
          if r=nil then
            begin
              w^.next:=nil;
              t^.next:=w;
            end
          else
            begin
              w^.next:=t^.next;
              t^.next:=w;
            end;
   end;
   procedure PRINT(t:node);
      var w:node;
          ch:char;
      begin
        if t=nil then
            writeln('‘ˆ‘šŠš’ … €‡…')
        else
           begin
             w:=t;
             while w<>nil do
               begin
                 writeln(w^.w,'  ',w^.count);
                 w:=w^.next;
               end;
           end;
        writeln('€’ˆ‘…’… Š‹€‚ˆ˜ ‡€ „š‹†…ˆ…');
        ch:=readkey;
      end;
   procedure APPEND_EL(var t,q:node;x:node);
      begin
        if t=nil then
          begin
            t:=x;
            q:=x;
          end
        else
          begin
            q^.next:=x;
            q:=x;
          end;
        x^.next:=nil;
      end;
  procedure DEVIDE_LIST;
     var v,q1,q2:node;
     begin
       q1:=nil;
       q2:=nil;
       while p<>nil do
         begin
           v:=p;
           p:=p^.next;
           if length(v^.w)<5 then
                append_el(t1,q1,v)
           else
                append_el(t2,q2,v);
         end;
     end;
  BEGIN
    clrscr;
    p:=nil;
    t1:=nil;
    t2:=nil;
    mark(h);
    enter_words(p);
    print(p);
    print(p);
    devide_list;
    print(t1);
    print(t2);
    release(h);
  END.







