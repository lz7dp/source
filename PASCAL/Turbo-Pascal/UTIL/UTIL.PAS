{--------------------------------------------------------------------------}
UNIT Util;                    { Mo��� �a "a�ap���o �a��c�a�e" �a �po�e��p� }
{--------------------------------------------------------------------------}
INTERFACE
FUNCTION Save_exit : WORD;     { Bp��a ���op�a���, �eo�xo���a �a Long_exit }
         INLINE ($8B/$C5);     {MOVE AX,BP}
                       { Ta�� ������� �o�e �a ce ������a ���� o� �po�e��pa }
{--------------------------------------------------------------------------}
PROCEDURE Long_exit        { "A�ap���o �a��c�a��" �a �po�e��pa ��� ������� }
          (Where : WORD      { M�c�o, ���e�o �a ���e �pe�a�e�o ��pa��e��e�o}
          );                 { (c�o��oc� �a pe��c��pa BP)                  }
{--------------------------------------------------------------------------}
IMPLEMENTATION
{$F+ }
PROCEDURE Long_exit;      { "A�ap���o �a��c�a��" �a �po�e��pa ��� ������� }
  CONST W : WORD = 0;
BEGIN  W := Where;
  INLINE ($8B/$2E/W); { MOVE BP,W }   EXIT
END;
{$F- }
END.
{--------------------------------------------------------------------------}
