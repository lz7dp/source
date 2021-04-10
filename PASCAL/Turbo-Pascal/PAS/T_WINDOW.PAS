{***********************************************************************}
PROGRAM T_window;           { П░ог░ама, ил╛▒▓░и░а╣а ░або▓а▓a ▒ п░озо░╢и }
  USES CRT, Windows;
  VAR I  : BYTE;
      Ch : CHAR;
BEGIN { T_window }      CLRSCR;
   GotoXY(2,23); WRITE( 'Избе░е▓е номе░ на п░озо░е╢ (1..9);');
   GotoXY(2,24); WRITE( 'ESC за к░ай на п░ог░ама▓а;');

   IF NOT Define_window (1, 7, 5, 6, 50,15,1,Thin_box, 'П░озо░е╢ 1')THEN HALT;
   IF NOT Define_window (2, 8, 3,12, 18,14,0,Thick_box,'П░озо░е╢ 2')THEN HALT;
   IF NOT Define_window (3,12,14, 5, 20,13,6,Thin_box, 'П░озо░е╢ 3')THEN HALT;
   IF NOT Define_window (4,13,28, 8, 50, 0,3,Thick_box,'П░озо░е╢ 4')THEN HALT;
   IF NOT Define_window (5,15,45, 5, 20, 4,7,No_box,   'П░озо░е╢ 5')THEN HALT;
   IF NOT Define_window (6,10,12, 7, 15, 0,2,Thin_box, 'П░озо░е╢ 6')THEN HALT;
   IF NOT Define_window (7, 4, 8, 7, 16, 1,7,Thick_box,'П░озо░е╢ 7')THEN HALT;
   IF NOT Define_window (8, 9, 5, 5, 65, 3,4,Thin_box, 'П░озо░е╢ 8')THEN HALT;
   IF NOT Define_window (9, 4,40,20, 18, 7,1,No_box,   'П░озо░е╢ 9')THEN HALT;
   FOR I := 1 TO 9 DO
    IF NOT Open_window (I) THEN
      BEGIN WRITELN('Г░е╕ка п░и о▓ва░┐не ',I);   HALT;END;
   I := 1;
   REPEAT
     IF Set_window(I) THEN
       REPEAT
         Write(CHR(RANDOM(64)+127));
       UNTIL KeyPressed;
     Ch := ReadKey;
     IF Ch IN ['1'..'9'] THEN
       I := ORD (Ch) - ORD('0');
   UNTIL Ch = #27;
{   IF Set_window(0) THEN;        }
   FOR I := 1 TO 9 DO
     IF NOT Release_window (I) THEN
       WRITELN ('Г░е╕ка в п░озо░е╢ ', I);
END.
