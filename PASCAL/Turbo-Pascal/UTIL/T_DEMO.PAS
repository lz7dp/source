{$F+,V- *******************************************************************}
PROGRAM T_demo;  { Демон▒▓░а╢ионна п░ог░ама за използ│ване на паке▓а БАДИС }
  USES  Panels, Windows, Menus, CRT, Keyboard;
  CONST Txt      : ARRAY[1..2] OF STRING = ('Ин┤ 1', 'Ин┤ 2');
  VAR  Operation: Arr_str_field;
       Operand_1, Operand_2, Result: REAL;
       Curr_oper: BYTE;
       Window_number: ARRAY [1..2] OF INTEGER;
{************************ Извежда ┤айл в║░╡│ ек░ана ***********************}
PROCEDURE Print_message_from (File_name:STRING);
  VAR   Mess_file: TEXT;     S: STRING;   Ch: CHAR;
BEGIN {Print message_file}
  ASSIGN (Mess_file,File_name);{$I-} RESET (Mess_file);{$I+}
  IF IOResult = 0 THEN
    BEGIN
      WHILE NOT EOF (Mess_file) DO
        BEGIN  READLN (Mess_file,S);
          WRITELN (S)
        END;
      CLOSE (Mess_file);
    END
  ELSE
    WRITE ('Г░е╕ка, лип▒ва ┤айл ',File_name);
  Ch := Get_key;
END {Print_message_file};
{**********************  Извежда ин┤о░ма╢и┐ за п░озо░╢и▓е *****************}
PROCEDURE Show_window (Row, Col:BYTE; File_name:STRING) ;
  VAR N: BYTE;  B:BOOLEAN;
BEGIN {Show_window}
  N := Get_free_window;               { Взима номе░ на ▒вободен п░озо░е╢   }
  IF Define_window (N {Номе░}, Row,Col {Го░ен л┐в ║г║л}, 15,50 {Разме░и},
                        Blue, White, Thin_box, '' ) THEN
    IF Open_Window(N) THEN
      BEGIN
        Print_message_from (File_name);
        B := Release_window (N)
      END
END {Show_window} ;
{******************* Извежда ▓║░гов▒ка ин┤о░ма╢и┐ *************************}
PROCEDURE Buisnes_information;
    VAR M : Menu_choices;       B : BOOLEAN;       N : BYTE;     Ch: CHAR;
BEGIN {Buisnes_information}
  N := Get_free_window;
  IF Define_window (N, 1, 1, 15,50,
                    White, Blue, Thick_box, '' ) THEN
    IF Open_Window(N) THEN
      BEGIN
        WRITELN;
        WRITELN ('  Паке▓║▓ БАДИС е ░аз░або▓ен в ТУ - Со┤и┐. ');
        WRITELN ('  Негови ва░иан▓и за алго░и▓ми╖ни▓е ези╢и ');
        WRITELN ('  ПАСКАЛ, ФОРТРАН и Си, │п░авл┐ва╣и ░азли╖ни  ');
        WRITELN ('  пе░и┤е░ни │▒▓░ой▒▓ва ▒е ░азп░о▒▓░ан┐ва▓ о▓:');
        WRITELN (' 1. Б╛░о за инжене░но п░ог░амно о▒иг│░┐ване-ТУ');
        WRITELN (' 2. НИС на ТУ-Со┤и┐, С▓│д.г░ад X░.Бо▓ев');
        WRITELN ;
        WRITELN ('      За ▒п░авка ▓ел.63-61, в.2469');
        WRITELN;
        WRITELN ('         На▓и▒не▓е клави╕ за да п░од║лжи▓е');
        Ch := Get_key;
        B  := Release_window (N);
        IF Close_window (N)THEN;
      END;
END {Buisnes_information} ;
{************ П░о╢ед│░а, извиквана п░и на▓и▒кане на клави╕ F1 *************}
PROCEDURE Menu_help (M:INTEGER);
  VAR B: BOOLEAN;     N: BYTE;     Ch: CHAR;
BEGIN { Menu_help }
  N := Get_free_window;
  IF Define_window (N, 1, 8, 15,50,
                    Black, Red, Thick_box, '' ) THEN
    IF Open_Window(N) THEN
      BEGIN
        IF M IN [1..3] THEN
          WRITELN ('    На▓и▒не▓е RETURN  за да пол│╖и▓е');
        CASE M OF
          1: WRITELN ('    помо╣на ин┤о░ма╢и┐ за п░озо░╢и.');
          2: WRITELN ('    помо╣на ин┤о░ма╢и┐ за мен╛▓а.');
          3: WRITELN (    'помо╣на ин┤о░ма╢и┐ за панели.');
          4,5,6,7: WRITELN ('      Не е в║ведена ин┤о░ма╢и┐');
        END;
        WRITELN ('      Bиж ▓║░гов▒ка▓а ин┤о░ма╢и┐ ');
        WRITELN;
        WRITELN ('         На▓и▒не▓е клави╕ за да п░од║лжи▓е');
        Ch := Get_key;
        B  := Release_window (N);
      END;
END { Menu_help };
{**************************************************************************}
PROCEDURE Panel_help (N:INTEGER);
BEGIN { Panel_help }
  CASE N OF
   1: Show_window (6,1, 'Text5');
   2: Show_window (6,30,'Text5');
   3: Show_window (6,15,'Text6');
  END;
END { Panel_help };
{**************************************************************************}
PROCEDURE Init_field(N:INTEGER);
BEGIN { Init_field }
  CASE Curr_oper OF
    1: Result := Operand_1 + Operand_2;
    2: Result := Operand_1 - Operand_2;
    3: Result := Operand_1 * Operand_2;
    4: IF ABS(Operand_2)>1E-15 THEN
         Result := Operand_1 / Operand_2
  END;
  Update_panel(1);
END { Init_field };
{**************************************************************************}
FUNCTION Test_oper(VAR R):BOOLEAN;
BEGIN { Test_oper }
  IF ABS(REAL(R))>1E-15 THEN
    Test_oper := TRUE
  ELSE
    Test_oper := FALSE ;
END { Test_oper };
{********  П░о╢ед│░а, демон▒▓░и░а╣а ин▓е░ак▓ивно в║веждане на данни  ******}
PROCEDURE Show_panel;
  VAR    Ch : BYTE;     B: BOOLEAN;
BEGIN { Show_panel }
  IF Define_panel (1, Blue,Yellow, 2,22,6,40, Thin_box,
                  ' Демон▒▓░а╢и┐ на панел ', Panel_help, Init_field) THEN
    BEGIN  Operand_1:= 1.0; Operand_2:=1.0; Curr_oper:=1;    Result := 1.0;
       Set_field_color (Brown,Blue);
       Output_text( 2,2, 'П░име░ за п░о▒▓ калк│ла▓о░',25);
       In_out_fixed (4,2, Operand_1, 7,2, -100.0,100.0, 1,1, No_test);
       In_out_enum  (4,11,Operation,4,1,Curr_oper, 3,3, No_test);
       In_out_fixed (4,13, Operand_2, 7,2,-100.0,100.0, 2,2, Test_oper);
       Output_text (4,22,'=',1);
       Set_field_color (Blue,Brown);
       Output_fixed (4,24, Result,6,2);
       Output_text(15,5,'Ha▓иcнe▓e ESC зa дa пpoд║лжи▓e',30);
       Ch:=Open_panel(1);
       Release_panel(1);
    END;
END {Show_panel} ;
{************************* В║вежда╣и п░озо░╢и *****************************}
PROCEDURE Five_windows;
VAR  I : INTEGER;         Ch: CHAR;
BEGIN { Five_windows }
  FOR I := 1 TO 5 DO
    BEGIN
      IF Define_window  (I,2+2*i,2+5*I,10,40,10-i,1+i, thin_Box,'')THEN
        IF Open_window(I) THEN
          BEGIN
             WRITELN;
             WRITELN ('       Б А Д И С - 0        ' );
             WRITELN ('    Базова диалогова ▒и▒▓ема' );
             WRITELN ('        / │╖ебен ва░иан▓ /'   );
             WRITELN ;
             WRITELN ('  На▓и▒не▓е клави╕ за да п░од║лжи▓е');
             DELAY (400);
           END;
    END;
  REPEAT                                { Цик║л за извеждане на п░озо░╢и▓е }
    FOR I := 1 TO 5 DO
      BEGIN
        IF NOT Set_window(I) THEN
          WRITELN ('Г░е╕ка в Set_window:', Window_error)
      END;
  UNTIL KeyPressed;
  Ch := Get_key;
  FOR I := 1 TO 5 DO                         { О▓▒▓а░┐н┐ване на п░озо░╢и▓е }
    IF NOT Release_window(I) THEN
      WRITELN ('Г░е╕ка в Release_window', Window_error)
END { Five_windows };
{**************************************************************************}
PROCEDURE No_message;
  VAR Ch : CHAR;  B : BOOLEAN;  N:INTEGER;
BEGIN {No_message}
  N := Get_free_window;
  IF Define_window (N, 3, 10, 8,50, White, Green, Thick_box, '' ) THEN
    IF Open_Window(N) THEN
      BEGIN
        WRITELN;
        WRITELN ('Taзи ╖а▒▓ о▓ паке▓а не е вкл╛╖ена в ди▒ке▓а▓а');
        WRITELN;
        WRITELN;
        WRITELN ('  На▓и▒не▓е клави╕ за да п░од║лжи▓е');
        Ch := Get_key;
        B  := Release_window(N);
      END;
END {No_message} ;
{**************************************************************************}
PROCEDURE Initial_part;
  VAR I, Option : BYTE;      B: BOOLEAN;       Ch: CHAR;
        T: Menu_choices;
BEGIN { Initial_part }
  Five_windows;
  IF Define_window (2, 2,5 , 18,69, White, Red,  Thick_box, '' )THEN
    IF Open_window (2) THEN
      BEGIN        WRITELN;
        WRITELN ('    БAДИC e паке▓ o▓ подп░ог░ами, пpeднaзнa╖eн зa opгaнизиpaнe');
        WRITELN (' нa дp│жeл╛бeн диaлoг o▓ пpилoжни пpoгpaми нa ░азли╖ни');
        WRITELN (' алгopи▓ми╖ни ези╢и ка▓о МС-ФОРТРАН, МС-С, ТУРБО-С, ');
        WRITELN (' ТУРБО-ПАСКАЛ 5.0/5.5,/6.0.  Н┐кoи пo-вaжни ocoбeнoc▓и нa паке▓а');
        WRITELN (' ▒а:  opгaнизa╢и┐ нa paзли╖ни видoвe пpoзop╢и, мен╛▓а, ек-');
        WRITELN (' paннo в║вeждaнe нa paзнooбpaзни ▓ипoвe дaнни, peaлизa╢и┐');
        WRITELN (' нa ▓eкc▓oви peдaк▓opи, ин▒▓░│мен▓ални ▒░ед▒▓ва за aнaлиз  ');
        WRITELN (' нa пpoблeмнo-opиeн▓иpaни eзи╢и, ин▒▓│мен▓ални ▒░ед▒▓ва за ');
        WRITELN (' комп╛▓║░на г░а┤ика, комп╛▓║░на геоме▓░и┐ и д░. ');
        WRITELN ('    Тази ди▒ке▓а ▒║д║░жа ▒амо онaзи ╖а▒▓ о▓ паке▓а БАДИС, ко┐▓о' );
        WRITELN (' е опи▒ана в "П░иложно п░ог░ами░ане ▒ ТУРБО-ПАСКАЛ" о▓ М.Аладжем,');
        WRITELN (' изда▓ел▒▓во "Те╡ника", Со┤и┐, 1991  ');
        WRITELN ;
        WRITELN ('                               Ha▓иcнe▓e клaви╕ зa дa пpoд║лжи▓e. ');
        Ch := Get_key;
        B := Close_window(2)
      END
    ELSE
      WRITELN ('Г░е╕ка');
END {Initial_part};
{**************************************************************************}
PROCEDURE Main_menu;                           { Уп░авл┐ва главно▓о мен╛   }
  VAR I, Option : BYTE;      B: BOOLEAN;     Ch: CHAR;   T: Menu_choices;
BEGIN { Main_menu }
    T[1]:= 'Изпoлз│вaнe нa пpoзop╢и';
    T[2]:= 'Упо▓░еба нa мeн╛▓a';
    T[3]:= 'Екpaннo в║вeждaнe нa дaнни ';
    T[4]:= 'Тeкc▓oв peдaк▓op';
    T[5]:= 'Ма╕инна г░а┤ика';
    T[6]:= 'Комп╛▓║░на геоме▓░и┐ ';
    T[7]:= 'Важна ▓║░гов▒ка ин┤о░ма╢и┐ ';
    T[8]:= 'Нап│▒кане на мен╛▓о';
    B := Define_menu (1, ' B║змoжнoc▓и нa Бaдиc ',Green,White, Green,White,
                      Blue,Red, 8, T, 40,1,8 , Menu_help );
    IF B THEN
      BEGIN
        REPEAT
          IF Open_menu (1,10,20, Option) THEN
            CASE Option OF
              1: Show_window (1,25,'Text2');
              2: Show_window (1, 1,'Text1');
              3: BEGIN
                   Show_window(1,10,'Text3');
                   Show_panel;
                 END;
          4,5,6: No_message;
              7: Buisnes_information;
            END
          ELSE
            BEGIN
              Option := 0;
              WRITE('Г░е╕ка');
            END;
        UNTIL (Option = 8) OR (Option = 0);
        Close_menu (1);
        Release_menu(1);
      END;
END {Start_menu};
{**************************************************************************}
BEGIN { T_demo }
  Operation [1] :=  '+';
  Operation [2] :=  '-';
  Operation [3] :=  '*';
  Operation [4] :=  '/';
  TextBackground(0);
  CLRSCR;
  Initial_part;
  Main_menu;
END { T_demo }.