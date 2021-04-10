{--------------------------------------------------------------------------}
UNIT Scanner;                       {  Oпpoc▓eн лeкcикaлeн aнaлизa▓op      }
INTERFACE                           {--------------------------------------}
CONST  Ident_len = 12;              { Maкcимaлнa д║лжинa нa идeн▓и┤икa▓op  }
TYPE                                                   { Tип нa лeкceми▓e  }
  Symbol=(Nul, Ident, Number, E_sym,
          Sin_sym, Cos_sym, Exp_sym, Ln_sym, Sqrt_sym, Tg_sym,
          Semicolon, Equal, Left_bracket, Right_bracket,
          Colon, Comma, Plus, Minus, Left_par, Right_par,Quote,
          Asterisk, Slash, Period, Less, Great, Limit, End_file,
          Left_curly, Right_curly, Question, Pwr);
  String_id = STRING [Ident_len];
  Source_type = (Memory, Text_file);
{--------------------------------------------------------------------------}
FUNCTION Get_sym                    { Извли╖a eднa лeкceмa o▓ вxoдни┐ низ  }
         (VAR Id_val :String_id     { Извле╖ена▓а по░една лeкceмa          }
          ): Symbol;                { Tип нa лeкceмa▓a                     }
{--------------------------------------------------------------------------}
FUNCTION Init_scanner    { Ha╖aлнa ини╢иaлизa╢и┐ нa лeкcикaлни┐ aнaлизa▓op }
         (Source  : Source_type;    { Tип нa вxoдни┐ пo▓oк (низ или ┤aйл)  }
          Inf_data: STRING          { Имe нa ┤aйл или вxoдeн низ           }
          ) : BOOLEAN;       { Peз│л▓a▓ o▓ изв║p╕вaнe▓o нa ини╢иaлизa╢и┐▓a }
{--------------------------------------------------------------------------}
IMPLEMENTATION
  USES Strings;
CONST End_char = #0;                         { Koд зa кpaй нa ┤aйлa        }
      Cr_char  = #13;                        { Koд зa кpaй нa peд          }
      Numb_res_wrd = 6;                      { Бpoй нa  peзepвиpaни▓e д│ми }
VAR  Inp_file   : TEXT;                              { Bxoдeн ┤aйл         }
  Curr_pos,                                          { Teк│╣a пoзи╢и┐      }
  Length_line   : BYTE;                       { Д║лжинa нa ▓eк│╣и┐ peд     }
  Ch            : CHAR;                       { Пocлeдeн в║вeдeн cимвoл    }
  Line          : STRING;                     { Bxoдeн (oбpaбo▓вaн) peд    }
  Word          : ARRAY [1..Numb_res_wrd] of STRING;    { Cл│жeбни д│ми    }
  Wsym          : ARRAY [1..Numb_res_wrd] of Symbol; { B║▓pe╕нo пpeдc▓aв┐нe}
  Ssym          : ARRAY [CHAR] of Symbol;            { Cпe╢иaлни знa╢и     }
{--------------------------------------------------------------------------}
FUNCTION Get_sym;                 { Извли╖a eднa лeкceмa o▓ вxoдни┐ низ    }
  VAR I,J,K : BYTE;
  {------------------------------------------------------------------------}
  PROCEDURE Get_char;                 { Извли╖a eдин знaк o▓ вxoдни┐ низ   }
  BEGIN  { Get_char }
    IF Curr_pos = Length_line THEN    { Aкo ▓eк│╣и┐▓ peд e из╖epпaн        }
      BEGIN
        REPEAT  Curr_pos:= 0;
          READLN(Inp_file, Line);                { Чe▓e пopeдни┐ низ       }
          Length_line := Length(Line)            { Oпpeдeл┐ д║лжинa▓a м│   }
        UNTIL (Length_line <> 0) OR EOF(Inp_file);
        Line := Line + Cr_char; {Добав┐ ░аздели▓ел на к░а┐ на в║ведени┐ низ}
        IF EOF(Inp_file) THEN
          Line := Line + End_char;
        Length_line := Length(Line)
      END;
    Curr_pos := Curr_pos + 1;
    Ch := Up_case(Line[Curr_pos])                { Извли╖a пopeдни┐ cимвoл }
  END; { Get_char }
  {------------------------------------------------------------------------}
BEGIN  { Get_sym }                            { Пpoп│cкa нeн│жни▓e cимвoли }
  WHILE (Ch = ' ') OR (Ch = Cr_char) DO Get_char;
  IF Ch IN ['A'..'Z'] THEN                { Aкo лeкceмa▓a зaпo╖вa c б│квa  }
    BEGIN  Id_val := '';
      REPEAT                                 { Извли╖a ╢eли┐ идeн▓и┤икa▓op }
        Id_val :=  Id_val + Ch;         Get_char
      UNTIL NOT(Ch IN ['A'..'Z','_','0'..'9']) OR (Ch = End_char);
      I := 1; J := Numb_res_wrd;       { Диxo▓oмнo ▓║pceнe зa кл╛╖oвa д│мa }
      REPEAT  K := (I + J) DIV 2;
        IF Id_val <= Word[K] THEN
          J := K - 1;
        IF Id_val >= Word[K] THEN
          I := K + 1
      UNTIL I > J;
      IF (I - 1) > J THEN
        Get_sym := Wsym[K]                       { O▓кpи▓a e cл│жeбнa д│мa }
      ELSE
        Get_sym :=Ident;                         { Heпoзнa▓ идeн▓и┤икa▓op  }
    END
  ELSE
    IF Ch IN ['0'..'9'] THEN                        { Aнaлиз нa ╢┐лo ╖иcлo }
      BEGIN   Id_val := '';
        REPEAT                                      { Извли╖aнe нa ╖иcлo▓o }
          Id_val :=  Id_val + Ch;       Get_char
        UNTIL NOT (Ch IN ['0'..'9']);
        Get_sym := Number                             { Paзпoзнa▓o e ╖иcлo }
      END
    ELSE
      IF Ch = '.' THEN                                { Извлe╖eнa e ▓o╖кa  }
        BEGIN   Id_val := Ch;            Get_char;
          IF Ch='.' THEN
            BEGIN                        { Paзпoзнa▓и ca двe пopeдни ▓o╖ки }
              Get_sym := Limit; Id_val := Id_val + Ch; Get_char
            END
          ELSE
            Get_sym:=Period                           { Paзпoзнa▓a e ▓o╖кa }
        END
      ELSE
        IF Ch IN [';',  '=',  '(',  ')',  ':',  ',',
                  '+',  '-',  '*',  '/',  '.',  '^',
                  '<',  '>',  '[',  ']',  '?',  '"',  '{', '}' ] THEN
          BEGIN                            { Paзпoзнa▓ e cпe╢иaлeн cимвoл  }
            Get_sym := Ssym[Ch];   Id_val := Ch;   Get_char
          END
        ELSE
          IF Ch = End_char THEN       { Paзпoзнa▓ e знaк зa кpaй нa ▓eкc▓a }
            Get_sym := End_file
          ELSE
            BEGIN                                         { Heпoзнa▓ знaк  }
              Get_sym := Nul; Id_val := '\';  Get_char
            END
END { Get_sym };
{--------------------------------------------------------------------------}
FUNCTION Init_scanner;
BEGIN   { Init_scanner }
  Curr_pos:=0 ;  Length_line:=0 ;   Ch := ' ' ;   Init_scanner := TRUE;
  CASE Source OF
    Memory   :  BEGIN    Line := Inf_data + End_char;
                  Length_line := Length(Line);
                END;
    Text_file:  BEGIN    ASSIGN (Inp_file, Inf_data);
                  {$I- }  RESET (Inp_file);  {$I+}
                  IF IORESULT <> 0 THEN
                    Init_scanner := FALSE
                 END
  END { Case }
END { Init_scanner };
{--------------------------------------------------------------------------}
BEGIN { Scanner }       { Cл│жeбни cимвoли : в║н╕нo и в║▓pe╕нo пpeдc▓aв┐нe }
  Word[ 1] := 'COS'        ;          Wsym[ 1] := Cos_sym;
  Word[ 2] := 'E'          ;          Wsym[ 2] := E_sym;
  Word[ 3] := 'EXP'        ;          Wsym[ 3] := Exp_sym;
  Word[ 4] := 'LN'         ;          Wsym[ 4] := Ln_sym;
  Word[ 5] := 'SIN'        ;          Wsym[ 5] := Sin_sym;
  Word[ 6] := 'SQRT'       ;          Wsym[ 6] := Sqrt_sym;
  Ssym[';'] := Semicolon   ;          Ssym['='] := Equal;
  Ssym['('] := Left_par    ;          Ssym[')'] := Right_par;
  Ssym[':'] := Colon       ;          Ssym[','] := Comma;
  Ssym['+'] := Plus        ;          Ssym['-'] := Minus;
  Ssym['*'] := Asterisk    ;          Ssym['/'] := Slash;
  Ssym['.'] := Period      ;          Ssym['^'] := Pwr;
  Ssym['<'] := Less        ;          Ssym['>'] := Great;
  Ssym['['] := Left_bracket;          Ssym[']'] := Right_bracket;
  Ssym['?'] := Question    ;          Ssym['"'] := Quote;
  Ssym['{'] := Left_curly  ;          Ssym['}'] := Right_curly  ;
END { Scanner }.
{--------------------------------------------------------------------------}
