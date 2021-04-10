{--------------------------------------------------------------------------}
UNIT Stack;                      { Mo､ｳｫ ｧa ｳｯpa｢ｫeｭｨe ｭa c｢ｺpｧaｭｨ cｲeｪo｢e }
INTERFACE                        {-----------------------------------------}
  TYPE Stack_data = REAL;                                 { Tｨｯ ｭa ､aｭｭｨｲe }
       Stack_pointer = ^Stack_node;          { 頭aｧaｲeｫ ｪｺｬ ｢ｺｧeｫ oｲ cｲeｪa }
       Stack_node =                                { Tｨｯ ｭa ｢ｺｧeｫ oｲ cｲeｪa }
         RECORD
           Data : Stack_data;           { 出ｫe ｧa ､aｭｭｨ ｢ｺ｢ ｢ｺｧeｫ ｮｲ cｲeｪa }
           Next : Stack_pointer             { 頭aｧaｲeｫ ｪｺｬ cｫe､｢aｹｨｿ ｢ｺｧeｫ }
         END;
{--------------------------------------------------------------------------}
FUNCTION Push                                    { 出cｲa｢ｿ eｫeｬeｭｲ ｢ cｲeｪa }
         (Node_data : Stack_data;               { �aｭｭｨ, ｯocｲa｢ｿｭｨ ｢ cｲeｪa }
          VAR S     : Stack_pointer                                 { Cｲeｪ }
            ) : BOOLEAN;            { TRUE  - eｫeｬeｭｲｺｲ e ｯocｲa｢eｭ ｢ cｲeｪa }
                                    { FALSE - ｭｿｬa ｬｿcｲo ｢ ｯaｬeｲｲa         }
{--------------------------------------------------------------------------}
FUNCTION Pop                                    { 逢｢ｫｨｷa eｫeｬeｭｲ oｲ cｲeｪa }
           (VAR Node_data : Stack_data;         { 逢｢ｫeｷeｭｨ oｲ cｲeｪa ､aｭｭｨ }
            VAR S         : Stack_pointer                           { Cｲeｪ }
           ) : BOOLEAN;            { TRUE  - eｫeｬeｭｲｺｲ e ｨｧ｢ｫeｷeｭ oｲ cｲeｪa }
                                   { FALSE - ｭｿｬa eｫeｬeｭｲｨ ｢ cｲeｪa         }
{--------------------------------------------------------------------------}
PROCEDURE Init_stack                                  { 渥ｨｶｨaｫｨｧｨpa cｲeｪa }
          (VAR S : Stack_pointer);                                  { Cｲeｪ }
{--------------------------------------------------------------------------}
IMPLEMENTATION
FUNCTION Push;                                   { 出cｲa｢ｿ eｫeｬeｭｲ ｢ cｲeｪa }
  VAR P : Stack_pointer;
BEGIN { Push }
  IF MaxAvail > SizeOf (Stack_node) THEN       { 握a ｫｨ ､ocｲaｲｺｷｭo ｬｿcｲo ? }
    BEGIN
      NEW (P);                 { Peｧep｢ｨpa ce ｯaｬeｲ ｧa e､ｨｭ ｢ｺｧeｫ oｲ cｲeｪa }
      P^.Data := Node_data;            { �aｭｭｨｲe ce ｧaｯｨc｢aｲ ｢ ｭo｢ｨｿ ｢ｺｧeｫ }
      P^.Next := S;           { C｢ｺpｧ｢a ｭo｢ｨｿ ｢ｺｧeｫ ｢ cｲpｳｪｲｳpaｲa ｭa cｲeｪa }
      S := P;         Push := TRUE
    END
  ELSE             { パeｸｪa - ｭｿｬa ､ocｲaｲｺｷｭo ｬｿcｲo ｢ ｯaｬeｲｲa ｧa ｭo｢ ｢ｺｧeｫ }
    Push := FALSE
END { Push };
{--------------------------------------------------------------------------}
FUNCTION Pop;                                   { 逢｢ｫｨｷa eｫeｬeｭｲ oｲ cｲeｪa }
  VAR P: Stack_pointer;
BEGIN { Pop }
  IF S <> NIL THEN                               { 握a ｫｨ eｫeｬeｭｲ ｢ cｲeｪa? }
    BEGIN
      Node_data := S^.Data;                              { 逢｢ｫｨｷa ､aｭｭｨｲe }
      P := S;   S := S^.Next;      { Oｲ､eｫｿ ｢ｺｧeｫa oｲ cｲpｳｪｲｳpaｲa ｭa cｲeｪa }
      DISPOSE (P);                   { Oc｢o｡oｦ､a｢a ｧaeｲaｲa oｲ ｢ｺｧeｫa ｯaｬeｲ }
      Pop := TRUE
    END
  ELSE                                    { パeｸｪa:  ｢ cｲeｪa ｭｿｬa eｫeｬeｭｲｨ }
    Pop := FALSE
END { Pop };
{--------------------------------------------------------------------------}
PROCEDURE Init_stack;                                 { 渥ｨｶｨaｫｨｧｨpa cｲeｪa }
BEGIN { Init_stack }
  S := NIL
END { Init_stack };
END { Stack }.
{--------------------------------------------------------------------------}
