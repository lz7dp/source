PROGRAM GET_T;
uses
  Graph,Rea_unit,CRT;
CONST Length = 120;
var
  Gd, Gm : Integer;
  P      : pointer;
  Size   : Word;
  I1,I   : INTEGER;
  isource : INTEGER;
  rfakt : REAL;
  rzt1  : REAL;
  Ch : CHAR;
begin
    reset_amd_karte;
    set_mastermode_chip1;
    set_mastermode_chip2;
    set_mastermode_chip3;
    set_mastermode_chip4;
    IF (teste_rea_karte AND $01)=1 THEN WRITELN('Timer chip No1  O. K.');
    IF (teste_rea_karte AND $02)=2 THEN WRITELN('Timer chip No2  O. K.');
    IF (teste_rea_karte AND $03)=3 THEN WRITELN('Timer chip No3  O. K.');
    IF (teste_rea_karte AND $04)=4 THEN WRITELN('Timer chip No4  O. K.');

  Gd := Detect; InitGraph(Gd, Gm, '');
  if GraphResult <> grOk then Halt(1);
  Bar(0, 0, GetMaxX, GetMaxY);
  Size := ImageSize(1,1,160,160);
  GetMem(P, Size); { Get memory from heap }
  GetImage(1,1,160,160,P^);
  REPEAT
    SetGraphMode(Gm);
    ClearDevice;

    reset_amd_karte;

    set_mastermode_chip3;
    set_mastermode_chip4;

    isource:=1;
    rfakt  :=0.5;

    start_counter_countup(3,2,isource);
   FOR I1 := 1 TO 640 DO
     BEGIN
     FOR I := 1 TO Length DO
       Mem[$A000:$0000 + $50*I + I1 DIV 8] := 1 SHL (7 - (I1 MOD 8));
     {FOR I := 1 TO Length DO
       Mem[$A000:$0000 + $50*I + I1 DIV 8] := 0;}
     END;
   (*ini_start_counter(4,1,isource,100*round(rfakt));
   REPEAT UNTIL nbit1_chip4;*)
   FOR I1 := 1 TO 640 DO
     BEGIN
     {FOR I := 1 TO Length DO
       Mem[$A000:$0000 + $50*I + I1 DIV 8] := 1 SHL (7 - (I1 MOD 8));}
     FOR I := 1 TO Length DO
       Mem[$A000:$0000 + $50*I + I1 DIV 8] := 0;
     END;
   (*ini_start_counter(4,1,isource,100*round(rfakt));
   REPEAT UNTIL nbit1_chip4;*)
   FOR I1 := 1 TO 640 DO
     BEGIN
     FOR I := 1 TO Length DO
       Mem[$A000:$0000 + $50*I + I1 DIV 8] := 1 SHL (7 - (I1 MOD 8));
     {FOR I := 1 TO Length DO
       Mem[$A000:$0000 + $50*I + I1 DIV 8] := 0;}
     END;
   (*ini_start_counter(4,1,isource,100*round(rfakt));
   REPEAT UNTIL nbit1_chip4;*)
   FOR I1 := 1 TO 640 DO
     BEGIN
     {FOR I := 1 TO Length DO
       Mem[$A000:$0000 + $50*I + I1 DIV 8] := 1 SHL (7 - (I1 MOD 8));}
     FOR I := 1 TO Length DO
       Mem[$A000:$0000 + $50*I + I1 DIV 8] := 0;
     END;
   (*ini_start_counter(4,1,isource,100*round(rfakt));
    REPEAT UNTIL nbit1_chip4;*)

    rzt1:=holdtime2_chip3 / rfakt;

    RestoreCRTMode;
    WRITELN('TIME = ',RZT1:12:6);
    READLN(Ch);
  UNTIL Ch = 'Y';
  CloseGraph;
end.


