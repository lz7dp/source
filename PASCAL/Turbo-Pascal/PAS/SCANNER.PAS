{--------------------------------------------------------------------------}
UNIT Scanner;                       {  O�poc�e� �e�c��a�e� a�a���a�op      }
INTERFACE                           {--------------------------------------}
CONST  Ident_len = 12;              { Ma�c��a��a ������a �a ��e������a�op  }
TYPE                                                   { T�� �a �e�ce���e  }
  Symbol=(Nul, Ident, Number, E_sym,
          Sin_sym, Cos_sym, Exp_sym, Ln_sym, Sqrt_sym, Tg_sym,
          Semicolon, Equal, Left_bracket, Right_bracket,
          Colon, Comma, Plus, Minus, Left_par, Right_par,Quote,
          Asterisk, Slash, Period, Less, Great, Limit, End_file,
          Left_curly, Right_curly, Question, Pwr);
  String_id = STRING [Ident_len];
  Source_type = (Memory, Text_file);
{--------------------------------------------------------------------------}
FUNCTION Get_sym                    { ������a e��a �e�ce�a o� �xo���� ���  }
         (VAR Id_val :String_id     { ����������� ������� �e�ce�a          }
          ): Symbol;                { T�� �a �e�ce�a�a                     }
{--------------------------------------------------------------------------}
FUNCTION Init_scanner    { Ha�a��a �����a���a��� �a �e�c��a���� a�a���a�op }
         (Source  : Source_type;    { T�� �a �xo���� �o�o� (��� ��� �a��)  }
          Inf_data: STRING          { ��e �a �a�� ��� �xo�e� ���           }
          ) : BOOLEAN;       { Pe����a� o� ����p��a�e�o �a �����a���a����a }
{--------------------------------------------------------------------------}
IMPLEMENTATION
  USES Strings;
CONST End_char = #0;                         { Ko� �a �pa� �a �a��a        }
      Cr_char  = #13;                        { Ko� �a �pa� �a pe�          }
      Numb_res_wrd = 6;                      { �po� �a  pe�ep��pa���e ���� }
VAR  Inp_file   : TEXT;                              { Bxo�e� �a��         }
  Curr_pos,                                          { Te���a �o�����      }
  Length_line   : BYTE;                       { ������a �a �e����� pe�     }
  Ch            : CHAR;                       { �oc�e�e� ���e�e� c���o�    }
  Line          : STRING;                     { Bxo�e� (o�pa�o��a�) pe�    }
  Word          : ARRAY [1..Numb_res_wrd] of STRING;    { C���e��� ����    }
  Wsym          : ARRAY [1..Numb_res_wrd] of Symbol; { B��pe��o �pe�c�a���e}
  Ssym          : ARRAY [CHAR] of Symbol;            { C�e��a��� ��a��     }
{--------------------------------------------------------------------------}
FUNCTION Get_sym;                 { ������a e��a �e�ce�a o� �xo���� ���    }
  VAR I,J,K : BYTE;
  {------------------------------------------------------------------------}
  PROCEDURE Get_char;                 { ������a e��� ��a� o� �xo���� ���   }
  BEGIN  { Get_char }
    IF Curr_pos = Length_line THEN    { A�o �e������ pe� e ���ep�a�        }
      BEGIN
        REPEAT  Curr_pos:= 0;
          READLN(Inp_file, Line);                { �e�e �ope���� ���       }
          Length_line := Length(Line)            { O�pe�e�� ������a�a ��   }
        UNTIL (Length_line <> 0) OR EOF(Inp_file);
        Line := Line + Cr_char; {������ ���������� �� ���� �� ��������� ���}
        IF EOF(Inp_file) THEN
          Line := Line + End_char;
        Length_line := Length(Line)
      END;
    Curr_pos := Curr_pos + 1;
    Ch := Up_case(Line[Curr_pos])                { ������a �ope���� c���o� }
  END; { Get_char }
  {------------------------------------------------------------------------}
BEGIN  { Get_sym }                            { �po��c�a �e������e c���o�� }
  WHILE (Ch = ' ') OR (Ch = Cr_char) DO Get_char;
  IF Ch IN ['A'..'Z'] THEN                { A�o �e�ce�a�a �a�o��a c ����a  }
    BEGIN  Id_val := '';
      REPEAT                                 { ������a �e��� ��e������a�op }
        Id_val :=  Id_val + Ch;         Get_char
      UNTIL NOT(Ch IN ['A'..'Z','_','0'..'9']) OR (Ch = End_char);
      I := 1; J := Numb_res_wrd;       { ��xo�o��o ��pce�e �a ����o�a ���a }
      REPEAT  K := (I + J) DIV 2;
        IF Id_val <= Word[K] THEN
          J := K - 1;
        IF Id_val >= Word[K] THEN
          I := K + 1
      UNTIL I > J;
      IF (I - 1) > J THEN
        Get_sym := Wsym[K]                       { O��p��a e c���e��a ���a }
      ELSE
        Get_sym :=Ident;                         { He�o��a� ��e������a�op  }
    END
  ELSE
    IF Ch IN ['0'..'9'] THEN                        { A�a��� �a ���o ��c�o }
      BEGIN   Id_val := '';
        REPEAT                                      { ������a�e �a ��c�o�o }
          Id_val :=  Id_val + Ch;       Get_char
        UNTIL NOT (Ch IN ['0'..'9']);
        Get_sym := Number                             { Pa��o��a�o e ��c�o }
      END
    ELSE
      IF Ch = '.' THEN                                { ����e�e�a e �o��a  }
        BEGIN   Id_val := Ch;            Get_char;
          IF Ch='.' THEN
            BEGIN                        { Pa��o��a�� ca ��e �ope��� �o��� }
              Get_sym := Limit; Id_val := Id_val + Ch; Get_char
            END
          ELSE
            Get_sym:=Period                           { Pa��o��a�a e �o��a }
        END
      ELSE
        IF Ch IN [';',  '=',  '(',  ')',  ':',  ',',
                  '+',  '-',  '*',  '/',  '.',  '^',
                  '<',  '>',  '[',  ']',  '?',  '"',  '{', '}' ] THEN
          BEGIN                            { Pa��o��a� e c�e��a�e� c���o�  }
            Get_sym := Ssym[Ch];   Id_val := Ch;   Get_char
          END
        ELSE
          IF Ch = End_char THEN       { Pa��o��a� e ��a� �a �pa� �a �e�c�a }
            Get_sym := End_file
          ELSE
            BEGIN                                         { He�o��a� ��a�  }
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
BEGIN { Scanner }       { C���e��� c���o�� : �����o � ���pe��o �pe�c�a���e }
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