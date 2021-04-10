program Knight_Tour;
const n = 5;
      sqrn = n*n;
var board:array[1..n,1..n] of integer;
    difx,dify:array[1..8] of shortint;
    m,i,j,x,y:integer;
procedure init;
begin
     difx[1] := 2;dify[1] := 1;
     difx[2] := 1;dify[2] := 2;
     difx[3] :=-1;dify[3] := 2;
     difx[4] :=-2;dify[4] := 1;
     difx[5] :=-2;dify[5] :=-1;
     difx[6] :=-1;dify[6] :=-2;
     difx[7] := 1;dify[7] :=-2;
     difx[8] := 2;dify[8] :=-1;
end;
procedure int;
var i,j:integer;
begin
     for i:= 1 to n do
     for j:= 1 to n do board[i,j]:=0;
end;
function try(i,x,y:integer):boolean;
var k,testx,testy:integer;
    res:boolean;
begin
     k:=0;
     res := false;
     repeat
           inc(k);
           testx:=x+difx[k];testy:=y+dify[k];
           if (testx>=1) and (testx<=n) and (testy >= 1) and (testy<=n) and (board[testx,testy]=0) then
              begin
                   board[testx,testy] := i;
                   if i < sqrn then
                      begin
                           res := try(i+1,testx,testy);
                           if (not res) then
                              board[testx,testy] := 0;
                      end
                   else res := true;
              end;
     until res or (k=8);
     try:= res;
end;
begin
     repeat
           write('Enter X:');
           readln(x);
           write('Enter Y:');
           readln(y);
     until (x>1)and(y>1)and(x<=n)and(y<=n);
     init;
     int;
     board[x,y] := 1;
     if try(2,x,y) then
        begin
             for m := 1 to n do
                 begin
                      for j := 1 to n do write(board[m,j]:5);
                 end;
        end;
end.
