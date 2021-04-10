#INCLUDE 'inkey.hd'
     CLS
     SET BLINK ON
     SET DATE TO GERMAN
     SET MOUSE STYLE OFF
     SET CLOCK ON
declare m_save[25]
MCENA = {0,0,0,0,0}
M__ms = {0,0,0,0,0}
M__sb = {0,0,0,0,0}
use s00000

***    Цени▓е в║в ма▒ив
mcena[1] = kst
mcena[2] = ost
mcena[3] = bst
mcena[4] = kost
mcena[5] = dst
**     Базова▓а ма▒ленно▒▓ в ма▒ив
m__ms[1] = kmsb
m__ms[2] = omso
m__ms[3] = bmsb
m__ms[4] = komsb
m__ms[5] = drms
**     Базово▓о СБО в ма▒ив
m__sb[1] = ksb
m__sb[2] = osbob
m__sb[3] = bsb
m__sb[4] = kosbob
m__sb[5] = drsbo
*********************
pWoda = water

msDate  = d30_u
IF date()-30 > msDate
   do TrieStek
ENDIF

IF MCENA[1] = 0 .OR. MCENA[2] = 0 .OR. MCENA[3] = 0 .OR. MCENA[4] = 0 .OR. MCENA[5] = 0
   WAIT 'ВНИМАНИЕ: ВЪВЕДЕНА Е ЦЕНОВА СТОЙНОСТ = 0 .' WINDOW TIMEOUT 10
   RETURN
ENDIF

DO W_IND
******************************************************************
       USE MJJP_T  index ind_P,IND_Pime alias PUNKTOVE NEW
       USE MJJ_DOS index IND_dos,dos_hl alias dostav NEW
       USE MAIN00  ALIAS MAIN NEW
       USE STACK0  index ind_STA alias Stek NEW
******************************************************************

       SELECT MAIN
**
   **          1        2    3      4     5       6           7        8      9    10      11         12       13      14           15
*  pol:=     {'m1',  'm2',  'm4', 'm5',   'm6',  'm8',    'm7',    'm9',  'm10','m11',  'm12',    'm13',   'm14',  'm15',       'm16'}
*  polName :={'K/П','К/Д','Мл┐ко','Ли▓░и','M_▒','СБО',' П│нк▓ ','До▒▓ав╖ик','Ки▒eлинно▒▓','t°','Пл║▓но▒▓','Чи▒▓о▓а','Бел▓║к','Mа▒▓и▓','Забележка'}
      *******  1      2      3     4      5       6      7         8      9       10      11    12     13   14   15      16    17     18
   pol:=     {'m1', 'm2',  'm4','m9','m5','m6','m12','m11',  'm14','M10', 'M20','m18','M8','m7','m13','M15','M19', 'm16'}
   polName :={'K/П','К/Д','Мл┐ко','Л_и','M_▒','СБО','Пл║▓но▒▓','t° ', 'Бел▓║к', 'Ки▒','Цена', 'Да▓а',' П│нк▓ ','До▒▓ав╖ик','Чи▒▓о▓а','Mа▒▓и▓','А_Б','Забележка'}
 * pol2 :=   {'m10','m11',  'm12',    'm13',   'm14',  'm15','m19', 'm16'}
 * polName2:={'Ки▒.','t°','Пл║▓но▒▓','Чи▒▓о▓а','Бел▓║к','Mа▒▓и▓','А_Б','Забележка'}
   *            1     2      3      4     5       6          7         8      9    10      11         12       13      14          15
   FlageDbedit = .t.
   DubleFD     = .t.
   FlageL18    = .f.
   DEFI WIND WinDbedit FROM 3 ,1   TO 20 ,75 TITLE " Ав▓ома▓и╖но изме░ване ";
   'Ё═╤═╚╟' FLOAT SHADOW
   ACTIVATE WINDOW WinDbedit
   PoleSave = 1
   BrL18_10 = 12


   set key 28 to Oshellp

   While LastKey() != _ESC { && На╖ало на о▒новен ╢ик║л НА AUTO
             DBEDIT( 0, 0,12,72,pol,'_dbFunc_auto',NIL,polname,"─"," ","─")
   }   && К░ай на о▒новен ╢ик║л AUTO
   RELEASE WINDOWS WinDbedit
   CLOSE DATABASE
   set key 28 to
   CLS
return  && **************** end OF auto

**  Ф│нк╢и┐ БАЗОВ ░едак▓о░  ▓ип F. РАБОТИ САМО ПРИ ПОВИКВАНЕ ОТ DBEDIT()
FUNCTION _dbfunc_auto(mode,dPeek1)
  l_key := LASTKEY()  && Че▓ем по▒ледни┐▓ на▓и▒на▓ клави╕
  nROW := ROW()       && Нами░аме к║де е бил ма░ке░а
  nCOL := COL()       &&
  nreturn:=1
  DO CASE
     CASE  mode = 0
      @ (WROWS(WoUtput())-3),0 say space(74)
      @ (WROWS(WoUtput())-3),0 SAY ' Запи▒ номе░ '+STR(RECNO(),5) +'/' + LTRIM(STR(RECCOUNT()))+ ;
      " Колона "+ALLTRIM(str(ncol))+" Ред "+ALLTRIM(str(nrow))+'  [F1]Помо╣'
      @ (WROWS(WoUtput())-5),0 SAY ' П│нк▓  '+m8+' До▒▓ав╖ик  '+m7
      @ (WROWS(WoUtput())-4),0 SAY '─────────────────────────────────────────────────────────────────────────'
     CASE mode=1
        @ 1,2 SAY 'До▒▓игна▓о е на╖ало▓о на ┤айла'
        INKEY(0)
        @ 1,2 SAY '──────────────────────────────'
        nreturn:=1
     CASE mode=2
        @ 1,2 SAY   'До▒▓игна▓ е к░а┐ на ┤айла.  '
        inkey(0)
        @ 1,2 SAY   '────────────────────────────'
        nreturn:=2

     CASE l_key = _F7  && iztriwa Zapis
        **  MD1 = N data ; MD2 = K data ;
        **  MP1 = Nom punkt ; MGL = Tupe milk ; parite w New_lew
        MD1 = m18
        MD2 = MD1
        MP1 = M1
        MLG = M3
        New_lew = 0
        F__poz = recno()
        DEFI WIND W__lev FROM 10 ,10 TO 18 ,70 TITLE " П░ом┐на на ▒ойно▒▓ за п░и░авнен ли▓║░ " SHADOW
        ACTIVATE WINDOW W__lev
        @ 1   ,  2  say " На╖ална да▓а     " GET  MD1
        @ 2   ,  2  say " К░айна  да▓а     " GET  MD2
        @ 4   ,  2  say " С▓ойно▒▓ в лева  " GET  New_lew picture '@K 999'
        @ 6   ,  2  say " ESC О▓каз ..  "
        READ
        if LastKey() != 27
           SET FILTER TO (M18 >= MD1 .AND. M18 <= MD2) .AND. M1 = MP1 .AND. M3 = MLG
           go top
           do while !eof()
             replace m20 with New_lew
             skip
           enddo
           SET FILTER TO
           go F__poz
        ENDIF
        GO F__poz
        release windows W__lev
        nreturn:=2
     CASE l_key = _F5  && iztriwa Zapis
        **  MD1 = N data ; MD2 = K data ;
        **  MP1 = Nom punkt ; MGL = Tupe milk; m2 > 100 ; ╣о▓ ▓ака
        MD1 = m18
        MD2 = MD1
        MP1 = M1
        MLG = M3
        L__ZBOR = 0
        F__poz = recno()
        go top
        SET FILTER TO M18 = MD1 .AND. M1 = MP1 .AND. M3 = MLG .AND. (M2>100)
        go top
        DO while !eof()
           L__ZBOR = L__ZBOR + M9
           SKIP
        ENDDO
          SET FILTER TO
            @ (WROWS(WoUtput())-3),0 SAY space(74)
            @ (WROWS(WoUtput())-3),0 SAY ' ЗА ТАЗИ ДАТА ОТ ПУНКТА СА ПРИЕТИ '+STR(L__ZBOR)+' Ли▓║░а '
          GO F__poz
        nreturn:=1
     case l_key = _F6  && iztriwa Zapis
        do dsdat
        nreturn:=2
     case l_key = _CTRL_BS  && iztriwa Zapis
        PAZI = RECNO()
                     *****************12345678901234567890

        @ (WROWS(WoUtput())-3),0 SAY space(74)
        @ (WROWS(WoUtput())-3),0 SAY 'ИЗТРИВАНЕ на запи▒ '
        @ (WROWS(WoUtput())-3),20 prompt ' НЕ '
        @ (WROWS(WoUtput())-3),26 prompt ' ДА '
        Menu to jivko
        do case
           case jivko = 2
                delete
                pack
                nreturn:=2
                TONE(392,1)
                TONE(523,1)
                TONE(659,1)
                TONE(784,5)
                TONE(659,1)
                TONE(784,15)
           case jivko = 1
                nreturn:=2
                TONE(5000,5)
                TONE(4000,4)
                TONE(3000,3)
                TONE(2000,2)
           case jivko = 0
                nreturn:=2
        endcase
        GO PAZI
     CASE  l_key = _ESC && EXIT <<--------------------------------
        nReturn := 0
*******************               ако Н┐ма запи▒и в║в ФАИЛА MMAIN1.DBF
     CASE l_key  = _CTRL_RET .or. mode=3 && PAD в║веждане
      if nCol = 0 .AND. pol[dpeek1] = 'm1'
        SET CURSOR ON
        SET ESCAPE ON
        set color to ,,,,,W+/N
        @ (WROWS(WoUtput())-3),0 SAY '  Режим В║веждане на нова п░оба.[F1]ИНСТРУКЦИИ [F2]Ф│к╢ионална Помо╣'
        @ (WROWS(WoUtput())-5),0 SAY space(60)
        go bottom
        if FlageL18    = .f.
           scroll(2,0,11,73,10)
        else
           scroll(2,0,19,73,18)
        endif
        append blank
           polpunkt  = POL[dPeek1] && За░еждаме имена▓а на поле▓а▓а о▓ ма▒ива
           poldost   = POL[dPeek1+1]
           polmljako = POL[dPeek1+2]
           pollitri  = POL[dPeek1+3]  && Запо╖ваме INPUT
           polM_s    = POL[dPeek1+4]
           polSbo    = POL[dPeek1+5]
           polPlt    = POL[dPeek1+6]
           polTeper  = POL[dPeek1+7]
           SET KEY  -1 TO HELP_PUNKTOVE
           @ 2   ,  nCOL    GET &polpunkt  WHEN(KEYKEY1())  VALID(SearchPunkt(&PolPunkt))
           @ 2   ,  nCOL+4  GET &poldost   WHEN(KEYKEY())   VALID(SearchDost(m1,m2))
           @ 2   ,  nCOL+8  GET &polmljako WHEN(KEY_milk()) VALID(SearchMilk(&polMljako))
           @ 2   ,  nCOL+17 GET &pollitri  WHEN(KEY_stop()) valid(m9 > 0)
           @ 2   ,  nCOL+24 GET &polM_s    WHEN(SKEYKEY()) VALID(ALO_C(M5))     && srMS_SBO
           @ 2   ,  nCOL+30 GET &polSbo    WHEN(KEY_stop()) valid(sscena(m1,m3))
           @ 2   ,  nCOL+37 GET &polPlt    Valid(  testMS_SB(m5,m6))
           @ 2   ,  nCOL+45 GET &polTeper  Valid(CCtestMS_SB(m5,m6,m9))
                            read
           IF lastkey() != _ESC  && За в▒еки ▒л│╖ай
              replace m18 with DATE()
              replace m1i with ((M1*1000)+M2) && for index fleid
****          replace m20 with mcena[m3]     && Цена▓а в поле М20
              p_im1 = ((&polpunkt*1000)+&poldost) && Об░аз│ваме ди░ек▓ен ад░ед▒
              pm3 = m3   && Тип на мл┐ко▓о
              Pm5 = &polM_s
              Pm6 = &polSbo
              pm9 = &pollitri

              if Pm5 = 3.40 .and. Pm6 = 8.50
              else
                 tone(200,2)
                 select stek
                     appen blank
                     replace m1i with p_im1 m10 with DATE()
                     replace m3 with pm3 m5 with pm5 m6 with pm6 m9 with pm9
                 ******* reindex
                 select main
              endif

           ENDIF
           if lastkey() = _ESC
              delete
              pack
              set key -3 to
           endif
           SET KEY  -1 TO
           SET key 28 to Oshellp
           SET ESCAPE ON
           SET CURSOR OFF
           set color to
           go bottom
       endif
           nReturn :=  2
     CASE  l_key = _ENTER  && в║веждане + ко░ек╢и┐  /РЕДОВО/
        SET CURSOR ON
        * В║веждане

        PolpTemp  = POL[dPeek1]    &&  За░еждаме имена▓а на поле▓а▓а о▓ ма▒ива
        IF nCol = 0 .AND. dPeek1 = 1 { && Запо╖ваме нов запи▒ за lab п░оба
        @ (WROWS(WoUtput())-3),0 SAY '  Режим Редак▓и░ане на п░оба.[F1]ИНСТРУКЦИИ [F2]Ф│к╢ионална Помо╣ '
           polpunkt  = POL[dPeek1] && За░еждаме имена▓а на поле▓а▓а о▓ ма▒ива
           poldost   = POL[dPeek1+1]
           polmljako = POL[dPeek1+2]
           pollitri  = POL[dPeek1+3]  && Запо╖ваме INPUT
           polM_s    = POL[dPeek1+4]
           polSbo    = POL[dPeek1+5]
           polPlt    = POL[dPeek1+6]
           polTeper  = POL[dPeek1+7]
           SET KEY  -1 TO HELP_PUNKTOVE
           @ nROW,  nCOL    GET &polpunkt  WHEN(KEY2KEY())  VALID(SearchPunkt(&PolPunkt))
           @ nROW,  nCOL+4  GET &poldost   WHEN(KEYKEY())    VALID(SearchDost(m1,m2))
           @ nROW,  nCOL+8  GET &polmljako WHEN(KEY_milk())  VALID(SearchMilk(&polMljako))
           @ nROW,  nCOL+17 GET &pollitri  WHEN(KEY_stop())
           @ nROW,  nCOL+24 GET &polM_s    WHEN(SKEYKEY()) && srMS_SBO
           @ nROW,  nCOL+30 GET &polSbo    WHEN(KEY_stop())
           @ nROW,  nCOL+37 GET &polPlt    Valid(  testMS_SB(m5,m6))
           @ nROW,  nCOL+45 GET &polTeper  Valid(CCtestMS_SB(m5,m6,m9))
                            read

           if lastkey() != 27 && _ESC
              replace m1i with ((M1*1000)+M2) && for index fleid
           ** replace m20 with mcena[m3] && Цена▓а в поле М20 за ▒ега данего п░омен┐
           endif

           SET KEY  -1 TO
           SET key 28 to Oshellp
           SET ESCAPE ON
        *** Т░┐бва да п░ове░им  НАСТРОЙКАТА ТУКА   ????????????????
  ***** skip
        ELSE  &&Ко░ек╢и┐

           PolpTemp  = POL[dPeek1]    &&  За░еждаме имена▓а на поле▓а▓а о▓ ма▒ива
             IF PolpTemp != 'm2'.and. PolpTemp != 'm4' {
                @ nROW,  nCOL GET &PolpTemp  && Сама▓а Ко░ек╢и┐
                read
                tone(300,2)
             }
        }   && К░аи на lOGIKAL в║веждане
        SET CURSOR OFF
*<><><><><><><><><><><><><><><><><
        nReturn :=  2
        CASE L_key = _F10
             mp1 = m3
             mp2 = m5
             mp3 = m6
             mp4 = m1i
             OBPROBA(mp1,mp2,mp3,mp4)
             nReturn :=  1
        CASE L_key = _F9
             mp1 = m1i
             mp2 = m3
             srMS_SBO(mp1,mp2,.F.)  && go sredno ms sbo
             nReturn :=  1
        CASE mode = 5
             if MROW() > nRow .AND. MROW() != nRow  {  && Logic Mouse
             Sskip = MROW() - nRow -1
                skip Sskip
             else
             Sskip = nRow - MROW() +1
                skip -Sskip
             }
             nReturn := 1
        OTHERWISE
        nreturn:=1
       endCASE
return nReturn
*************************************
FUNCTION SearchPunkt(polPunktF)  && T║░▒и кода на п│нк▓
BAZE=ALIAS()
select punktove
SET ORDER TO 1
SEEK  polPunktF
sReturn:=.t.
   IF found()=.t. {
      tempPUNKT = M2  && За░еждаме име на п│нк▓
      select &Baze
      REPLACE m8 with tempPUNKT
      @ (WROWS(WoUtput())-5),0 SAY ' П│нк▓  '+m8
      Sreturn:=.t.
      else
      tone(300,2)
      x =  1 ; y = 25
      DEFI WIND WinSearcP FROM  x, y  TO x+3,y+27 TITLE " ГРЕШКА ";
      'Ё═╤─└╙'  FLOAT SHADOW
      ACTIVATE WINDOW WinSearcP
      ***********123456789012345678901234
      @ 0,1 say "Не ░еален код на  п│нк▓"
      @ 1,1 say "[F1]Помо╣▓ [F2]П│нк▓ове"
***** SHOW
      FOR i:=0 to 11 {
           MOVE WINDOW WinSearcP BY 1,0
           inkey(0.01,"MH")
      }
      inkey(0,"MH")
      FOR i:=0 to 11 {
           MOVE WINDOW WinSearcP BY -1,0
      }
      RELEASE WINDOWS WinSearcP
      Sreturn:= .f.
      }
      select &Baze
return Sreturn
*******************************************************
FUNCTION SearchDost(Pn,Dn)  && T║░▒и кода на п│нк▓
if Lastkey() = _UP {  && В░║╣аме READ недна пози╢и┐ нап░ед
  RETURN .t.
}
baze = ALIAS()
* polDostF = ((Pn*1000)+Dn)
     Pn_seach = alltrim(str(Pn))
     il = (3-(len(Pn_seach)))
     if il = 1
         Pn_seach = '0'+PN_seach
     endif
     if il = 2
         Pn_seach = '00'+PN_seach
     endif
     PD_seach = alltrim(str(dn))
     il = (3-(len(PD_seach)))
     if il = 1
         PD_seach = '0'+PD_seach
     endif
     if il = 2
         PD_seach = '00'+PD_seach
     endif
polDostF = Pn_seach+PD_seach
select dostav
set order to 1       /////////////////////////////////////////
sReturn:=.t.
go top
seek polDostF
   IF found() {
      tempDost = M3  && За░еждаме име на до▒▓ав╖ик
      select &baze
      REPLACE m7 with tempDost
      @ (WROWS(WoUtput())-5),0 SAY ' П│нк▓  '+m8+' До▒▓ав╖ик  '+m7
      sReturn:=.t.
    else


      tone(300,2)
      x =  1 ; y = 30
      DEFI WIND WinSearcP FROM  x, y  TO x+3,y+30 TITLE " ГРЕШКА ";
      'Ё═╤─└╙'  FLOAT SHADOW
      ACTIVATE WINDOW WinSearcP
      ***********123456789012345678901234
      @ 0,1 say "Не ░еален код на До▒▓ав╖ик"
      @ 1,1 say "[F1]Помо╣▓  [F2]До▒▓ав╖и╢и"
***** SHOW
      FOR i:=0 to 11 {
           MOVE WINDOW WinSearcP BY 1,0
           inkey(0.01,"MH")
      }

      inkey(0,"MH")
      FOR i:=0 to 11 {
           MOVE WINDOW WinSearcP BY -1,0
       *** inkey(0.01,"MH")
      }
      RELEASE WINDOWS WinSearcP
         sReturn:= .f.
      }
      select &Baze
return Sreturn
************************************
FUNCTION SearchMilk(polMljakoF)
polMljakoF = ALLTRIM(POLMLJAKOF)
mreturn = .t.
do case {
  case polMljakoF = 'К░аве' .or. ALLTRIM(POLMLJAKOF) = '1'
     replace m3 with 1  m4 with 'К░аве'
  case polMljakoF = 'Ов╖е' .or. ALLTRIM(POLMLJAKOF) = '2'
     replace m3 with 2  m4 with 'Ов╖е'
  case polMljakoF = 'Бивол▒ко'.or. ALLTRIM(POLMLJAKOF) = '3'
     replace m3 with 3  m4 with 'Бивол▒ко'
  case polMljakoF = 'Козе' .or.  ALLTRIM(POLMLJAKOF) = '4'
     replace m3 with 4  m4 with 'Козе'
  case polMljakoF = 'Д░│го' .or. ALLTRIM(POLMLJAKOF) = '5'
     replace m3 with 5 m4 with 'Д░│го'
  OTHERWISE
     mreturn = .f.
}

@ Row(), 8 say m4
return Mreturn

************************************************************************
PROCEDURE HELP_PUNKTOVE
   SET KEY  -1 TO  //f2
   SAVEGETS()
   SDBF = ALIAS()
   WORK_POLE = RECNO()
   DEFI WIND WinHelpP FROM 2 ,10   TO 22 ,66 TITLE " Помо╣ ";
   single FLOAT SHADOW
   ACTIVATE WINDOW WinHelpP
** USE MJJP_T index ind_P,IND_Pime alias PUNKTOVE NEW
   polhP     :={'m1','m2','ck','co','cb','cko','cdr'}
   polNamehP :={'K/П',' П│нк▓ ','ЦЕНА К░аве','Цена Ов╖е','Цена Бивол▒ко','Цена К░аве','Цена Д░│го'}
   ins=.f.
   d_key=0
   ORD = 2
   select PUNKTOVE
   SET ORDER TO 2
** GO TOP
   DBEDIT( 0, 0,18,54,polhP,'help_P',NIL,polnamehP,"▀"," ","▀")
   RELEASE WINDOWS WinHelpP
   SELECT &SDBF
   go WORK_POLE
   if lastkey() != _return
      restgets()
   endif
   SET KEY  -1 TO HELP_PUNKTOVE   //f2
return && end hellp punktowe
*****************************
function Help_P(mode,dPeek1)
  l_key := LASTKEY()
  nROWh := ROW()
  nCOLh := COL()
  namepolh = POLhP[dPeek1]
  nreturn:=1
  DO CASE
     CASE  mode = 0
      IF ins=.T.  // Добав┐не, ако е на▓и▒на▓ Ins
        CLEAR GETS
        SET escape on
        SET CURSOR ON
        vm1 = 0
        vm2 = space(18)
        vm1 = lastrec() +100
        @ nROWh,  6  GET vm1 picture '@K 999' valid(P_trace(vm1) .and. vm1 > 99)
        @ nROWh,  10 GET vm2 picture '@!' VALID(TR_NPunkt(vm2))
        READ
        SET escape OFF
        l_key = LASTKEY()
        IF l_key != _ESC   //Запи▒ваме нови▓е данни за ПУНКТ
           APPE BLANK
           replace m1 with vm1
           replace m2 with alltrim(vm2)
           SET ORDER TO 1
           reindex        /// Сигнал мол┐ по╖акай▓е   <<<<----------
           SET ORDER TO 2
           reindex
           select dostav
                 APPE BLANK
                 P_D_m1i   = (vm1*1000)+100
                 replace m2 with 100  m3 with "П│нк▓ова п░оба" m1 with vm1  m1i with P_D_m1i
                 set order to 2
                 REINDEX
                 set order to 1
                 REINDEX
                 go top
           select PUNKTOVE
        ENDIF
        SET CURSOR OFF
        set escape on
        ins:=.F.
        Return 2
      ENDIF
     CASE  l_key = _CTRL_RET

           PolpHP  = POLhP[dPeek1]      &&  За░еждаме имена▓а на поле▓а▓а о▓ ма▒ива
             IF PolpHP != 'm1' {
                set cursor on
                tone(300,2)
                @ nROWh,  nCOLh GET &PolpHP  && Сама▓а Ко░ек╢и┐
                read
                set cursor off
             }
     CASE  l_key = _ENTER
        PROM = M1
        SELECT &SDBF
        go WORK_POLE
        REPLACE M1 WITH PROM
        nReturn := 0
     CASE  l_key = _ESC  ////// <-----------------------------
        nReturn := 0
     CASE l_key = _INS .or. mode=3
        ins:=.T.
        nreturn:=3
      CASE l_key = _tab
        ord++
        if ord > 2 {
         ord = 1
        }
        SET ORDER to ord
        nreturn:=2
      OTHERWISE
           if D_key != l_key
              seek UPPER(CHR(l_key))
           else
              skip
              if  UPPER(CHR(l_key)) != left(m2,1)
                  skip -1
              endif
           endif
           D_key = l_key
        nReturn:=2
      endCASE
return nReturn
***********************************
function P_trace(P_seach)
SET ORDER TO 1
Mreturn = .t.
seek P_seach
 if found()
    Mreturn = .f.
      tone(300,2)
      x =  1 ; y = 30
      DEFI WIND WinSearcP FROM  x, y  TO x+3,y+30 TITLE " ГРЕШКА ";
      'Ё═╤─└╙'  FLOAT SHADOW
      ACTIVATE WINDOW WinSearcP
      ***********123456789012345678901234
      @ 0,1 say " Този код е ве╖е в║веден. "
      @ 1,1 say " Мол┐ в║веде▓е д░│г код.  "
***** SHOW
      FOR i:=0 to 11 {
           MOVE WINDOW WinSearcP BY 1,0
           inkey(0.01,"MH")
      }

      inkey(0,"MH")
      FOR i:=0 to 11 {
           MOVE WINDOW WinSearcP BY -1,0
       *** inkey(0.01,"MH")
      }
      RELEASE WINDOWS WinSearcP
 endif
SET ORDER TO 2
return Mreturn
***********************************
function TR_NPunkt(msl_Name)
set order to 2
nPreturn = .t.
seek msl_Name
     if found()
        nPreturn = .f.
        tone(300,3)
     endif
     if alltrim(msl_Name) == space(0)
        nPreturn = .f.
        tone(300,3)
     endif
return nPreturn
************************************
function D_trace(P_seach,mmd1)
SET ORDER TO 1
pozdos = recno()
go top
Mreturn = .t.
   P_D_m1i   = (mmd1 * 1000) + P_seach
   seek P_D_m1i
   if found()
      tone(300,1)
      tone(499,5)
      tone(700,5)
      Mreturn = .f.
   ***** Сигнализа╢и┐ за ДУБЛАЖ   НАРАвИЯ ТУК
   endif
go pozdos
SET ORDER TO 2
return Mreturn
************************************
PROCEDURE HELP_DOST
   SET KEY  -1 TO
   DEFI WIND fDbedit FROM  5 ,45   TO 17 ,77 TITLE " До▒▓ав╖и╢и ";
   FLOAT SHADOW
   ACTIVATE WINDOW fDbedit
   SAVEGETS()
   SDBF = ALIAS()
   mm1 = M1
   Punkt = alltrim(str(mm1))
   il = (3-(len(Punkt)))
   Punkt = space(il)+Punkt
   SELECT DOSTAV
   set order to 2
   D_key = 13
   SEEK Punkt
       if !found() {  && K║м QUIT TEXT
          ? 'Рела╢ионна г░е╕ка:Не ░еален код'
          ? '       За╣и▓а III ниво.'
          ? 'Тел:0457/23263 DMD computer.com'
          inkey(0)
          RELEASE WINDOWS fDbedit
          SELECT &SDBF
          return
       ELSE
          adr = recno()
       }
  go adr
     x = 0 ; y = 1
     while mm1=m1 .and. x < 11 {
         @ x , y say str(m1)+' '+str(m2)+' '+m3
         skip
         x++
     }
  go adr
     x = 0

  SET CURSOR  OFF
  while lastkey() != _ESC .and. lastkey() != _RETURN {
     set color to GR+/n
     @ x , y say str(m1)+' '+str(m2)+' '+m3
     inkey(0)
     set color to
     @ x , y say str(m1)+' '+str(m2)+' '+m3
     do case
        case lastkey() = _RETURN
             PROM = M2
             RESTGETS()
             SELECT &SDBF
             REPLACE M2 WITH PROM
        case lastkey() = _down
             X++
             skip
             if mm1 != m1
                x--
                skip-1
             endif
             if x > 10
                x = 10
                if !eof()
                   scroll(0,0,maxrow(),maxcol(),1)
                endif
             endif
        case lastkey() = _up
             x--
             skip -1
             if mm1 != m1
                x++
                skip
             endif
             if x < 0
                x = 0
                if !bof()
                    scroll(0,0,maxrow(),maxcol(),-1)
                endif
             endif
         case lastkey() = _PgDn
              keyboard chr(_down)+chr(_down)+chr(_down)+chr(_down)+chr(_down)+chr(_down)+chr(_down)+chr(_down)+chr(_down)+chr(_down)
         case lastkey() = _PgUp
              keyboard  chr(_up)+chr(_up)+chr(_up)+chr(_up)+chr(_up)+chr(_up)+chr(_up)+chr(_up)+chr(_up)+chr(_up)



         case lastkey() = _CTRL_RET  && Rename Dost
              set cursor on
              set confirm on
              md3 = space(20)
              @ x , y+8  get md3 picture '@!'
              read
              if lastkey() != _ESC
                 Md_m1 = m1
                 replace m3 with alltrim(md3)
                 RESTGETS()
                 SELECT &SDBF
              endif
              set cursor off
              set confirm off
         case lastkey() = _INS
              set cursor on
              set escape on
              if x < 6
                 scroll(x,y,maxrow(),maxcol(),-1)
              else
                 scroll(1,y,x,32,1)
              endif
           go adr
              md2 = 100
              while mm1=m1 {  && Б░оим До▒▓ав╖и╢и▓е
                  skip
                  Md2++
              }
           go adr
              md3 = space(18)
              @ x , y say str(m1) get md2 picture '@K 999' VALID(D_TRACE(MD2,M1) .and. md2 > 100)
              @ x , y+8  get md3 picture '@!' valid(PROBA_IME(md3,m1))
              read
              if lastkey() != _ESC .and. md2 != 0
                 Md_m1 = m1
                 appe blank
                 P_D_m1i   = (Md_m1*1000)+md2
                 replace m2 with md2 m3 with alltrim(md3) m1 with Md_m1 m1i with P_D_m1i
                 CLS
                 set cursor off
                 @ 4 ,1 say "       Не ▒е ┐до▒вай      "
                 @ 5 ,1 say "             но           "
                 @ 6 ,1 say "  ▒ега Т░┐бва да по╖ака╕! "
                 set order to 2
                 REINDEX
                 set order to 1
                 REINDEX
                 go top
                 seek P_D_m1i
                 If FOUND()
                    PROM = M2
                    RESTGETS()
                    SELECT &SDBF
                    REPLACE M2 WITH PROM
                 else
                    cls
                    set color *r/w+
                    @ 2 ,1 say "       ВНИМАНИЕ..        "
                    @ 3 ,1 say "     Си▒▓емен С░ив .     "
                    @ 4 ,1 say "   П░ек░а▓е▓е ░або▓а и   "
                    @ 5 ,1 say "  повикай▓е компе▓ен▓но  "
                    @ 6 ,1 say "  ли╢е ................  "
                    @ 7 ,1 say "  Dos ERROR: 223 ......  "
                    @ 8 ,1 say "  tel 0457/23263 DMD ..  "
                    set color to
                    inkey(0)
                  endif
              endif
              set escape on
              exit
         OTHERWISE
               if D_key != lastkey()
                  seek (Punkt+UPPER(CHR(lastkey())))
                  if !found()
                     go adr
                     tone(300,2)
                  endif
               else
                  skip
                  if  UPPER(CHR(lastkey())) != left(m3,1)
                      skip -1
                      tone(300,2)
                  endif
               endif
            D_key = lastkey()
            x = 0
IF D_KEY != _ESC
   IF D_KEY != _RETURN
       keyboard chr(_down)+chr(_down)+chr(_down)+chr(_down)+chr(_down)+chr(_down)+chr(_down)+chr(_down)+chr(_down)+chr(_down)+;
       chr(_up)+chr(_up)+chr(_up)+chr(_up)+chr(_up)+chr(_up)+chr(_up)+chr(_up)+chr(_up)+chr(_up)
   ENDIF
ENDIF
             cls
         endcase
  }

  RELEASE WINDOWS fDbedit
  SELECT &SDBF
  SET KEY  -1 TO HELP_DOST
  SET CURSOR  on
  RETURN
****************************************
function PROBA_IME(pr_name,_P_kode)
SET ORDER TO 1
  pozdos = recno()
  gerr = 0
  go top
  ndReturn = .t.
    P_D_m1i   = (_P_Kode * 1000) + 100
    seek P_D_m1i
       if found()  && Наме░ен е п║░ви┐▓ запи▒
          while _P_Kode = m1 {
            If ALLTRIM(pr_name) == ALLTRIM(m3)
               gerr++
            endif
           skip
          }
       endif

   if gerr = 0
      ndReturn = .t.
    else
       ndReturn = .f.
      tone(300,2)
   endif

  go pozdos
SET ORDER TO 2
RETURN ndReturn
**************************** NO MODIFED
FUNCTION KEYKEY1()
  set key  28 to OSH_Punkt
  SET KEY  -1 TO HELP_PUNKTOVE   //f2
  SET KEY  -3 TO _Vx__S
RETURN .T.  //  ФУНКЦИЯ ЗА ПРЕВКЛЮЧВАНЕ НА ГОРЕЩИТЕ КЛАВИШИ
***************************
FUNCTION KEY2KEY()
  set key  28 to OSH_Punkt
  SET KEY  -1 TO HELP_PUNKTOVE   //f2
RETURN .T.  //  ФУНКЦИЯ ЗА ПРЕВКЛЮЧВАНЕ НА ГОРЕЩИТЕ КЛАВИШИ
********************
********************
FUNCTION KEYKEY()
  SET KEY  28 to OSH_Dost
  SET KEY  -1 TO HELP_DOST
  SET KEY  -3 TO
RETURN .T.  //  ┤УНКЦИЯ ЗА ПРЕВКЛЮЧВАНЕ НА ГОРЕЩИТЕ КЛАВИШИ dos
****************************
FUNCTION KEY_milk()
  SET KEY  28 to OSH_milk
  SET KEY  -1 TO
RETURN .T.  //  ┤УНКЦИЯ ЗА ПРЕВКЛЮЧВАНЕ НА ГОРЕЩИТЕ КЛАВИШИ milk
********************
FUNCTION SKEYKEY()
  SET KEY  28 to OSH_stek
  SET KEY  -3 TO MS_Vx__S
  SET KEY  -1 TO  Wika
RETURN .T.
********************
FUNCTION KEY_STOP()
  set key 28 to
  SET KEY  -1 TO
  SET KEY  -3 TO
RETURN .T.  //  ФУНКЦИЯ ЗА ПРЕВКЛЮЧВАНЕ НА ГОРЕЩИТЕ КЛАВИШИ
************************************************************
PROCEDURE WIKA
  SET KEY -1 TO
  mp1 = (M1*1000)+M2
  mp2 = m3
  srMS_SBO(mp1,mp2,.T.)  && go sredno ms sbo
  SET CURSOR ON
  SET KEY -1 TO WIKA
RETURN
*****************************************************
FUNCTION OBPROBA(mkod,pms,psbo,kodi)
 select dostav
 set order to 1
 DEFI WIND WINOB FROM 10 ,10 TO 18 ,70 TITLE " ОБОРНА ПРОБА " SHADOW
 ACTIVATE WINDOW WinOB
 @ 1 , 2   SAY    " Желае▓ели да запази▓е ░ез│л▓а▓и▓е ка▓о ОБОРНА П░оба"
 @ 3 , 10  prompt " НЕ "
 @ 3 , 16  prompt " ДА "
 MENU to Mbase
 IF mbase = 2
   go top
   SEEK kodi
     IF FOUND()
        do case
           case mkod = 1
             replace kmsob  with pms  ksboob with psbo
           case mkod = 2
             replace Omsob  with pms  Osboob with psbo
           case mkod = 3
             replace Bmsob  with pms  Bsboob with psbo
           case mkod = 4
             Replace KOmob  with pms  Kosob  with psbo
           OTHERWISE
             cls
             @ 2,2 say " Обо░на п░оба за ▓ози ▓ип мл┐ко не е валидна "
             inkey(0)
        ENDCASE
     else
             cls
             @ 2,2 say " Г░е╕ка в данни▓е п░оба▓а не е запи▒ана . "
             inkey(0)
    endif
  ENDIF
RELEASE WINDOWS WINOB
SELECT main
RETURN .t.
**************************************************
PROCEDURE srMS_SBO(sm1i,stip,fLOG)
SmBr   = 0
ZpMas  = 0
ZpsBo  = 0
Lob    = 0
sMas   = 0
sSbo   = 0
mPrOBR = 0  && Oborna proba
sPrOBR = 0
ssPole = RECNO()

select dostav
set order to 1
set key -1 to
DEFI WIND SmsfD FROM  4 ,35   TO 21 ,75 TITLE " С░една Ка╖е▒▓вена о╢енка ";
FLOAT SHADOW
ACTIVATE WINDOW SmsfD
   go top
   SEEK sm1i
     IF FOUND()
        do case
           case stip = 1
                mPrOBR = kmsob
                sPrOBR = ksboob
           case stip = 2
                mPrOBR = Omsob
                sPrOBR = Osboob
           case stip = 3
                mPrOBR = Bmsob
                sPrOBR = Bsboob
           case stip = 4
                mPrOBR = KOmob
                sPrOBR = Kosob
        ENDCASE
     else
             cls
             @ 2,2 say " Г░е╕ка в данни▓е !! "
             inkey(0)
    endif

SELECT stek
SET order to 1
go top
*** seek sm1i
set filter to sm1i = m1i .and. Stip = m3
   go top
   do while !eof()
      sMas = sMas+(m9 * m5) && ли▓░и * ма▒ленно▒▓
      Lob  = Lob + m9       && zbor litri
      sSbo = sSbo+(m9 * m6) && SBO * litri
      SmBr++                && broim poletata
      skip
   enddo
   if lob > 0 .and. Smas > 0 .and. sSbo > 0
       ZpMas = sMas/Lob    && create % maslennost
       ZpsBo = sSbo/Lob    && create % SBO
       go top
       polSP     :={'m9' , 'm5','m6','m10'}
       polNSP :={'Ли▓░и','М_c','СБО','ДАТА'}
       DBEDIT( 1, 0,10,38,polSP,'MS_SBO_Hellp',NIL,polNSP,"─"," ","─")
   else
       cls
       @ 9 ,2 SAY "      НЯМА ДАННИ .........  "
       inkey(0)
   endif

set filter to
set order to
select main
release windows SmsfD
RETURN
***********************
function MS_SBO_Hellp(ssmode,ssPeek1)
  ssl_key := LASTKEY()  && Че▓ем по▒ледни┐▓ на▓и▒на▓ клави╕
  ssnROW := ROW()       && Нами░аме к║де е бил ма░ке░а
  ssnCOL := COL()       &&
  ssreturn:=1
  DO CASE
     CASE  ssmode = 0
      @ (WROWS(WoUtput())-3),0 say space(60)
      @ (WROWS(WoUtput())-3),0 SAY ' Запи▒ номе░ '+STR(RECNO(),5) +'/' + LTRIM(STR(RECCOUNT()))+ ;
      " Колона "+ALLTRIM(str(ssncol))+" Ред "+ALLTRIM(str(ssnrow))
      @ (WROWS(WoUtput())-7), 1 SAY 'С░едно за 30 дни М_▒% '+ ltrim(STR(ZpMas))+' СБО% '+  ltrim(STR(ZpsBo))
      @ (WROWS(WoUtput())-5), 1 SAY 'Обо░на П░оба     М_▒% '+ ltrim(STR(mPrOBR))+' СБО% '+  ltrim(STR(sPrOBR))

     CASE ssmode=1
        @ 2,2 SAY   'НАЧАЛОТО на Данни▓е'
        INKEY(0)
        @ 2,2 SAY   '──────────────────────────────'
        ssreturn:=1
     CASE ssmode=2
        @ 2,2 SAY   'K░ай на Данни▓е '
        INKEY(0)
        @ 2,2 SAY   '────────────────────────────'
        ssreturn:=2
     case ssL_key = _ESC
        ssreturn:=0
     case ssL_key = _ENTER  .AND. FLOG = .T.
          ZpMas   = m5
          ZpsBo   = m6
          SELECT MAIN
          REPLACE M5 WITH ZpMas  M6 WITH  ZpsBo
          Select stek
        ssreturn:=0
     CASE ssL_key = _TAB   .AND. FLOG = .T.
      @ (WROWS(WoUtput())-7), 1 PROMPT 'С░едно за 30 дни М_▒% '+ ltrim(STR(ZpMas))+' СБО% '+  ltrim(STR(ZpsBo))
      @ (WROWS(WoUtput())-5), 1 PROMPT 'Обо░на П░оба     М_▒% '+ ltrim(STR(mPrOBR))+' СБО% '+  ltrim(STR(sPrOBR))
      MENU TO mBASE
        DO CASE
           CASE MBASE = 1
                SELECT MAIN
                REPLACE M5 WITH ZpMas  M6 WITH  ZpsBo
                Select stek
                ssreturn:=0
           CASE MBASE = 2
                SELECT MAIN
                REPLACE M5 WITH mPrOBR M6 WITH sPrOBR
                Select stek
                ssreturn:=0
           CASE MBASE = 0
                @ (WROWS(WoUtput())-7), 1 SAY 'С░едно за 30 дни М_▒% '+ ltrim(STR(ZpMas))+' СБО% '+  ltrim(STR(ZpsBo))
                @ (WROWS(WoUtput())-5), 1 SAY 'Обо░на П░оба     М_▒% '+ ltrim(STR(mPrOBR))+' СБО% '+  ltrim(STR(sPrOBR))
                SET CURSOR OFF
                ssreturn:=1
      ENDCASE
  ENDCASE
return ssReturn
**********************  Т░ие ▒▓а░и▓е запи▒и в база▓а ▒▓ек  **********
PROCEDURE TrieStek
SET DATE TO GERMAN
replace d30_u with date()
dp = date() - 30
brdel = 0
USE stack0
GO top
ST = 60 / LASTREC()
POZ = 0.0000
DEFINE WINDOW WARNING FROM 6,10 TO 15,76 TITLE ' !!! СИСТЕМНА ПРОВЕРКА !!! ' SHADOW COLOR SCHEME 5
ACTIVATE WINDOW WARNING
set cursor off
@ 1,0 SAY '                           ВНИМАНИЕ                            '
@ 3,0 SAY ' НЕНУЖНИТЕ ДАННИТЕ ОТ РАБОТНАТА ОБЛАСТ СЕ БЪДАТ ПРЕМАХНАТИ !!! '
@ 4,0 SAY '                МОЛЯ НЕ ПРЕКЪСВАЙТЕ ПРОЦЕДУРАТА.               '
@ 5,0 SAY '   0%          25%           50%           75%            100% '
@ 6,0 SAY ' ╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨ '
**         1234567890123456789012345678901234567890123456789012345678901234567890
**                  1         2         3         4         5         6
DO while !EOF()
   IF dp > m10
      delete
      brdel++
   ENDIF
   SKIP
@ 6,POZ+1 SAY '█'
POZ = POZ + ST
ENDDO
  if brdel > 0
     pack
  endif
CLOSE DATABASE
RELEASE WINDOWS WARNING
RETURN
************************************************************************
PROCEDURE W_IND

DEFINE WINDOW WARNING FROM 6,10 TO 15,76 TITLE ' !!! СИСТЕМНА ПРОВЕРКА !!! ' SHADOW
ACTIVATE WINDOW WARNING
set cursor off
@ 1,0 SAY '                           ВНИМАНИЕ                            '
@ 3,0 SAY '             TЕСТ НА ДАННИТЕ ЗА СИСТЕМНИ ГРЕШКИ ..             '
@ 4,0 SAY '                МОЛЯ НЕ ПРЕКЪСВАЙТЕ ПРОЦЕДУРАТА.               '
@ 5,0 SAY '   0%          25%           50%           75%            100% '
@ 6,0 SAY ' ╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨ '
nsec = seconds()
@ 7,1 SAY time()
     USE MJJP_T  NEW
     if file('ind_p.jtx')
         ferase ('ind_p.jtx')
     endif
     index on m1 to IND_P
@ 6,0 SAY ' ███████████╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨ '
vsec = seconds()-nsec
@ 7,1 SAY time() + '  Изминали ▒ек│нди ' + ltrim(str(vsec))
    ********************************
     if file('ind_pime.jtx')
         ferase ('ind_pime.jtx')
     endif
    index on m2 to IND_Pime
    ********************************
@ 6,0 SAY ' █████████████████████╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨ '
vsec = seconds()-nsec
@ 7,1 SAY time() + '  Изминали ▒ек│нди ' + ltrim(str(vsec))
    USE MJJ_DOS NEW
    if file('IND_dos.jtx')
        ferase ('IND_dos.jtx')
    endif
     index on m1i to IND_dos
@ 6,0 SAY ' ███████████████████████████████╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨ '
vsec = seconds()-nsec
@ 7,1 SAY time() + '  Изминали ▒ек│нди ' + ltrim(str(vsec))
     if file('IND_HL.jtx')
         ferase ('dos_hl.jtx')
     endif
     index on str(m1)+m3 to dos_hl
@ 6,0 SAY ' ██████████████████████████████████████╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨ '
vsec = seconds()-nsec
@ 7,1 SAY time() + '  Изминали ▒ек│нди ' + ltrim(str(vsec))
     close all
     use MAIN00
     if file('i_MAIN.jtx')
         ferase ('I_MAIN.jtx')
     endif
   index on m1i to i_main
@ 6,0 SAY ' █████████████████████████████████████████████╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨ '
vsec = seconds()-nsec
@ 7,1 SAY time() + '  Изминали ▒ек│нди ' + ltrim(str(vsec))
     close all
     use stack0
     if file('ind_STA.jtx')
         ferase ('ind_STA.jtx')
     endif
@ 6,0 SAY ' ███████████████████████████████████████████████████████╨╨╨╨╨╨ '
vsec = seconds()-nsec
@ 7,1 SAY time() + '  Изминали ▒ек│нди ' + ltrim(str(vsec))
     index on m1i to ind_STA
     close DATABASE
@ 6,0 SAY ' █████████████████████████████████████████████████████████████ '
vsec = seconds()-nsec
@ 7,1 SAY time() + '  Изминали ▒ек│нди ' + ltrim(str(vsec))
release windows WARNING
RETURN
***********************************************
PROCEDURE OSHELLP
    set key 28 to
    IF !FILE ("DOC.001")
        wait "Лип▒ва ┤айл DOC.001 за док│мен▓ална помо╣ !" window timeout 10
    else
      DEFI WIND Winhhh FROM 1 ,1   TO 22 ,55 TITLE " ПОМОЩ ";
      NONE  FLOAT SHADOW
      ACTIVATE WINDOW Winhhh
      set cursor off
        MEMOEDIT (MEMOREAD ("DOC.001"),,,,, .F., "",,,,,,)
      release windows Winhhh
    ENDIF
    set key 28 to OSHELLP
return
***********************************************
PROCEDURE OSH_Punkt
    set key 28 to
    IF !FILE ("DOC.002")
        wait "Лип▒ва ┤айл DOC.002 за док│мен▓ална помо╣ !" window timeout 10
    else
      DEFI WIND Winhhh FROM 1 ,1   TO 22 ,65 TITLE " ПОМОЩ ";
      NONE  FLOAT SHADOW
      ACTIVATE WINDOW Winhhh
      set cursor off
        MEMOEDIT (MEMOREAD ("DOC.002"),,,,, .F., "",,,,,,)
      release windows Winhhh
    ENDIF
    set key 28 to OSH_Punkt
    set cursor on
return
***********************************************
PROCEDURE OSH_Dost
    set key 28 to
    IF !FILE ("DOC.003")
        wait "Лип▒ва ┤айл DOC.003 за док│мен▓ална помо╣ !" window timeout 10
    else
      DEFI WIND Winhhh FROM 1 ,1   TO 22 ,65 TITLE " ПОМОЩ ";
      NONE  FLOAT SHADOW
      ACTIVATE WINDOW Winhhh
      set cursor off
        MEMOEDIT (MEMOREAD ("DOC.003"),,,,, .F., "",,,,,,)
      release windows Winhhh
    ENDIF
    set key 28 to OSH_Dost
    set cursor on
return
************************************************
***********************************************
PROCEDURE osh_milk
    set key 28 to
    IF !FILE ("DOC.004")
        wait "Лип▒ва ┤айл DOC.004 за док│мен▓ална помо╣ !" window timeout 10
    else
      DEFI WIND Winhhh FROM 1 ,1   TO 22 ,65 TITLE " ПОМОЩ ";
      NONE  FLOAT SHADOW
      ACTIVATE WINDOW Winhhh
      set cursor off
        MEMOEDIT (MEMOREAD ("DOC.004"),,,,, .F., "",,,,,,)
      release windows Winhhh
    ENDIF
    set key 28 to OSH_milk
    set cursor on
return
***********************************************
***********************************************
PROCEDURE OSH_stek
    set key 28 to
    IF !FILE ("DOC.005")
        wait "Лип▒ва ┤айл DOC.005 за док│мен▓ална помо╣ !" window timeout 10
    else
      DEFI WIND Winhhh FROM 1 ,1   TO 22 ,65 TITLE " ПОМОЩ ";
      NONE  FLOAT SHADOW
      ACTIVATE WINDOW Winhhh
      set cursor off
        MEMOEDIT (MEMOREAD ("DOC.005"),,,,, .F., "",,,,,,)
      release windows Winhhh
    ENDIF
    set key 28 to OSH_stek
    set cursor on
return
************************************************
FUNCTION ALO_C(SP_MASL)
IF SP_MASL = 0  .and. Lastkey() != _up

   DEFI WIND WinClov FROM 5 ,15   TO 10 ,55 TITLE " О╖аквам Данни о▓ У░ед ";
   NONE  FLOAT SHADOW
   ACTIVATE WINDOW WinClov
   set cursor off
   @ 1,2 say " Мол┐ по▒▓аве▓е П░оба▓а в │░еда."
   @ 3,2 say " Еnter - п░оба▓а е по▒▓авена.   "
   @ 4,2 say " Д░│г клави╕ -     О▓каз.       "
   INKEY(0)
   if Lastkey() = _return
      cls
      @ 1,2 say " Из╖акваме У░еда да п░екл╛╖и"
      @ 2,2 say " ▒ изме░ване▓о.             "
      @ 4,2 say " Bs   - П░ек║▒ване.        "

     if !file('read_ok2.exe')
        TONE(392,1)
        TONE(523,1)
        TONE(659,1)
        TONE(784,5)
        TONE(659,1)
        TONE(784,25)
        WAIT 'ВНИМАНИЕ: Си▒▓емен ПРОБЛЕМ. В║зможно е ▒амо Р║╖но в║веждане.' WINDOW TIMEOUT 10
        WAIT ' Тел: 0457/2-32-63 DMD computer.com/ 0457/2-93-47 Манол/ ' WINDOW TIMEOUT 10
        release windows winClov
        set cursor on
        return .f.
     endif

      ! READ_OK2

          ClDanni  := MEMOREAD("00000000.000")
          _tcl := MEMOLINE(ClDanni,10,1)
          _cMs := MEMOLINE(ClDanni,10,2)
          _cSb := MEMOLINE(ClDanni,10,3)
          _cPL := MEMOLINE(ClDanni,10,4)

          c_tcl = val(_tcl)
          c_cMs = val(_cMs)
          c_cSb = val(_cSb)
          c_cPL = val(_cPL)

          if c_tcl > 0 .and. c_cMs > 0 .and. c_cSb > 0 .and. c_cPL > 0
             TONE(5000,5)
             TONE(4000,4)
             TONE(3000,3)
             TONE(2000,2)
             replace m5 with c_cMs m6 with c_csb m5a with c_cMs m6a with c_csb
             replace m12 with c_cPl m11 with c_Tcl
             keyboard  chr(_up)+chr(_up)+chr(_down)+chr(_down)+chr(_down)+chr(_down)
          ELSE
             WAIT ' ЗАПИС ОТКАЗАН - н│леви данни.' WINDOW TIMEOUT 3
          endif

   endif
   release windows winClov
   set cursor on
ENDIF
RETURN .T.
****************************************************************************
FUNCTION   testMS_SB(msm5,sbm6)
   if lastKey() !=  _UP
       do case
          case msm5 > 15 .and. sbm6 > 15
          WAIT ' Това мл┐ко ╣е да е ЗМЕЙСКО или о▓ ЛАМЯ !!!! ' WINDOW TIMEOUT 3
          case msm5 < 1 .or. sbm6 < 4
          WAIT ' Тази п░оба на мине░алнавода ли е ???? ' WINDOW TIMEOUT 3
          case msm5 > 10
          WAIT ' Това да не е п░оба на МАШИННО МАСЛО ???? ' WINDOW TIMEOUT 3
          case msm5 > 12
          WAIT ' Такова СБО има ХОРОСАНА !!!! ' WINDOW TIMEOUT 3
       endcase
    endif
RETURN .t.
****************************************************************************
FUNCTION CCtestMS_SB(msm5,sbm6,litri)
  tsReturn := .t.
   if lastKey() !=  _UP
       do case
          case msm5 < 0.6
          WAIT '  Ма▒ленно▒▓а е п░екалено ни▒ка , мол┐ КОРИГИРАЙТЕ ' WINDOW TIMEOUT 3
          tsReturn := .f.
          case msm5 > 11
          WAIT '  Ма▒ленно▒▓а е п░екалено ви▒ока, мол┐ КОРИГИРАЙТЕ ' WINDOW TIMEOUT 3
          tsReturn := .f.
          case sbm6 > 12
          WAIT '  П░екалено гол┐мо СБО,мол┐ КОРИГИРАЙТЕ  ' WINDOW TIMEOUT 3
          tsReturn := .f.
          case sbm6 < 2
          WAIT '  П░екалено ни▒ко СБО,мол┐ КОРИГИРАЙТЕ ' WINDOW TIMEOUT 3
          tsReturn := .f.
          case litri = 0
          WAIT '  Заб░ави╡▓е ЛИТРИТЕ,мол┐ КОРИГИРАЙТЕ ' WINDOW TIMEOUT 3
          tsReturn := .f.
       endcase
    endif
RETURN tsReturn
****************************************************************************
function sscena(t__PU,TIP__ML)
leva = 0
select punktove
set order to 1
go top
seek t__PU
  if found()
     do case
        case TIP__ML = 1
        leva = ck
        case TIP__ML = 2
        leva = co
        case TIP__ML = 3
        leva = cb
        case TIP__ML = 4
        leva = cko
        case TIP__ML = 5
        leva = cdr
        otherwise
        ? "SYSTEM ERROR GO AUT"
        tone(300,3)
        inkey(0)
    endcase
  endif
select main
if leva > 0  .or. lastkey() = _UP
   replace m20 with leva
   cnReturn :=.t.
else
   tone(300,3)
   WAIT 'Н┐ма в║ведена ╢ена за ▓ози ▓ип Мл┐ко ' WINDOW TIMEOUT 3
   cnReturn :=.f.
endif
return cnReturn
****************************
procedure _Vx__S

spm1 = 0
spm2 = 0
spm3 = 0
mo_X = recno()
spm4 = ''

if recno() = 1
   return
endif

skip -1
spm1 = m1
spm2 = m2+1
spm3 = m3
spm4 = alltrim(str(spm3))
skip
go mo_x
replace m1 with spm1 m2 with spm2
replace m4 with spm4

keyboard chr(_down)+chr(_down)+chr(_down)+chr(_down)

RETURN
***************************************

PROCEDURE MS_Vx__S

REPLACE M5 with 3.4 m6 with 8.5
keyboard chr(_down)+chr(_down)+chr(_down)
RETURN
