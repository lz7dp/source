{--------------------------------------------------------------------------}
UNIT Util;                    { Mo¤³« §a "a¢ap¨©­o ­a¯³cªa­e" ­a ¯po¶e¤³p¨ }
{--------------------------------------------------------------------------}
INTERFACE
FUNCTION Save_exit : WORD;     { Bpº¹a ¨­´op¬a¶¨¿, ­eo¡xo¤¨¬a §a Long_exit }
         INLINE ($8B/$C5);     {MOVE AX,BP}
                       { Ta§¨ ´³­ª¶¨¿ ¬o¦e ¤a ce ¨§¢¨ª¢a ± ¬® o² ¯po¶e¤³pa }
{--------------------------------------------------------------------------}
PROCEDURE Long_exit        { "A¢ap¨©­o ­a¯³cªa­¥" ­a ¯po¶e¤³pa ¨«¨ ´³­ª¶¨¿ }
          (Where : WORD      { M¿c²o, ªº¤e²o ¤a ¡º¤e ¯pe¤a¤e­o ³¯pa¢«e­¨e²o}
          );                 { (c²o©­oc² ­a pe£¨c²ºpa BP)                  }
{--------------------------------------------------------------------------}
IMPLEMENTATION
{$F+ }
PROCEDURE Long_exit;      { "A¢ap¨©­o ­a¯³cªa­¥" ­a ¯po¶e¤³pa ¨«¨ ´³­ª¶¨¿ }
  CONST W : WORD = 0;
BEGIN  W := Where;
  INLINE ($8B/$2E/W); { MOVE BP,W }   EXIT
END;
{$F- }
END.
{--------------------------------------------------------------------------}
