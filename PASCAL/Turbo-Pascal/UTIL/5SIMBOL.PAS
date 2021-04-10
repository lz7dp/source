program SORTWORD;
 uses crt;
 type st15=string[15];
      node=^el;
      el=record
           w:st15;
           count:integer;
           next:node;
         end;
 var h:pointer;
     p1,p2,q1:node;
 procedure PRINT(t:node);
  var w:node;
      ch:char;
  begin
    if t=nil then writeln('spisaka e prazen!')
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
      while (r<>nil) and (r^.w<s) do r:=r^.next;
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
   procedure ENTER_WORDS(var v,w:node);
    var st:st15;
    begin
      v:=nil;
      w:=nil;
      write('poredna duma: ');
      readln(st);
      while st<>'' do
       begin
         if length(st)<5 then
           insert(v,st)
         else
           insert(w,st);
           write('poredna duma: ');
           readln(st);
       end;
    end;
    procedure APEND_EL(var t,q:node;x:node);
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
     end;
    procedure MERGE(var v,w,r:node);
     var v1,w1,rq:node;
     begin
       r:=nil;
       v1:=v;
       w1:=w;
       v:=v^.next;
       w:=w^.next;
       rq:=nil;
       while (v1<>nil) and (w1<>nil) do
       begin
        if v1^.w<w1^.w then
         begin
           apend_el(r,rq,v1);
           v1:=v;
           if v<>nil then v:=v^.next;
         end
        else
         begin
          apend_el(r,rq,w1);
          w1:=w;
          if w<>nil then w:=w^.next;
         end;
       end;
      if v1=nil then
         begin
           v1:=w1;
           rq^.next:=v1;
           v:=nil;
           w:=nil;
         end;
      end;
  BEGIN
    clrscr;
    p1:=nil;
    p2:=nil;
    q1:=nil;
    mark(h);
    enter_words(p1,p2);
    writeln('otpechatvane na 1_i spisak: ');
    print(p1);
    writeln('otpechatvane na 2_i spisak: ');
    print(p2);
    merge(p1,p2,q1);
    writeln('otpechatvane na sletia spisak: ');
    print(q1);
    release(h);
  END.
