 program arrays;
 const max_el=100;
 var a:array[1..max_el] of integer;
     n:integer;
 procedure ENTER(var m:integer);
  var i:integer;
  begin
    repeat

       write('¡°®© ­  ¥«¥¬¥­²¨²¥ ­  ¬ ±¨¢ =');
       readln(m);
     until(m>0) and (m<=max_el);
    for i:=1 to n do
    begin
      write('a[i',i,']=');
      readln(a[i]);


    end;
  end;
  procedure SORT1;{ ‘’ˆ€… —…‡ ŸŠ€ ‘…‹…Š–ˆŸ}
   var i,j,x,k:integer;
   begin
     for i:=1 to n-1 do
       begin
        k:=i+1;
        for j:=i+2 to n do
         if a[k]>a[j] then k:=j;
           if a[i]>a[k] then
              begin
                x:=a[i];
                a[i]:=a[k];
                a[k]:=x;
              end;
       end;
   end;
 procedure PRINT;{ˆ‡‚…†„€ ‘’ˆ€ ‚…—… Œ€‘ˆ‚}
  var i:integer;
  begin
    for i:=1 to n do
    writeln('a[i',i,']=',a[i]);
  end;
BEGIN
  enter(n);
  readln;
  writeln('…‹…Œ…’ˆ’… € Œ€‘ˆ‚€ ‘€ :');
  print;
  readln;
  writeln('‘’ˆ€ˆ :');
  sort1;
  print;
  readln;
END.

