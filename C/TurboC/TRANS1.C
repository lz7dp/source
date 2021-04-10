#include<stdio.h>
#include<conio.h>
#include<string.h>
#include<stdlib.h>
static unsigned int n,i=1,bt=1,nomer,ceh,stancia,operacia,pozicia,sclad,colam,col;
static int lnomer,lcode;
static unsigned long lznomerm,lznomer;
static float lcena;
int ch,menu,menu1,n1,x,y,key,up,a,chmaket,chka,chstadii;
static char nom[300][9],dbf[300][9],name[300][80];
static char choise[9][30],nam[13],hlp[10],lname[70];
static char maket[30],ka[30],stadii[30];mmaket[3][30],mka[4][30],mstadii[5][30];
FILE *in,*lib;
#define Norm 7
#define Src(a,b) for(;bt<=a;bt++) ch=getc(b)
#define Rec(a) y=(int)((a)/col)+1;x=(int)((a)-col*(y-1)+1)*wid;
main()
  {
	strcpy(mmaket[0],"111 - Комплек▓ов║╖на ка░▓а");
	strcpy(mmaket[1],"191 - Ма░╕░│▓на ка░▓а");
	strcpy(mmaket[2],"205 - Никаква ка░▓а");
	strcpy(mka[0],"1");
	strcpy(mka[1],"2");
	strcpy(mka[2],"3");
	strcpy(mka[3],"4");
	strcpy(mstadii[0],"2");
	strcpy(mstadii[1],"3");
	strcpy(mstadii[2],"4");
	strcpy(mstadii[3],"5");
	strcpy(mstadii[4],"6");
	if ((in=fopen("TRANS.HLP","r"))==NULL) {clrscr();puts("TRANS.HLP not found !");exit(1);}
	chmaket=getc(in);
	strcpy(maket,mmaket[chmaket]);
	chka=getc(in);
	strcpy(ka,mka[chka]);
	chstadii=getc(in);
	strcpy(stadii,mstadii[chstadii]);
	do {
		window(1,1,80,25);textattr(20);clrscr();
		gotoxy(10,12);printf("Маке▓");
		gotoxy(10,13);printf("Код на ак▓│ализа╢и┐");
		gotoxy(10,14);printf("С▓адий");
		strcpy(choise[0],maket);
		strcpy(choise[1],ka);
		strcpy(choise[2],stadii);
		strcpy(choise[3],"К░ай на п░омени▓е");
		gotoxy(20,10);cputs("П░ом┐на ▒▓ойно▒▓и▓е на:");
		menu1=Scroll(3,1,30,3,12,11,23,52,1);
		/* Scroll(max,col,wid,lim,dx,dy,cn,ci,c) */
		switch (menu1)
		  {
			case 0 :
			  {
				window(1,1,80,25);textattr(20);clrscr();
				gotoxy(20,10);cputs("М а к е ▓");
				menu=Scroll(2,1,30,2,12,11,23,52,5);
				if (menu!=-1) {chmaket=menu;strcpy(maket,mmaket[chmaket]);};break;
			  }
			case 1 :
			  {
				window(1,1,80,25);textattr(20);clrscr();
				gotoxy(20,10);cputs("Код на ак▓│ализа╢и┐");
				menu=Scroll(3,1,20,3,12,11,23,52,6);
				if (menu!=-1) {chka=menu;strcpy(ka,mka[chka]);}break;
			  }
			case 2 :
			  {
				window(1,1,80,25);textattr(20);clrscr();
				gotoxy(20,10);cputs("С ▓ а д и й");
				menu=Scroll(4,1,20,4,12,11,23,52,7);
				if (menu!=-1) {chstadii=menu;strcpy(stadii,mstadii[chstadii]);}break;
			  }
			}
	}
	while(menu1!=3);
	fclose(in);
	in=fopen("TRANS.HLP","w");
	fputc(chmaket,in);
	fputc(chka,in);
	fputc(chstadii,in);
	fclose(in);

	window(1,1,80,25);textattr(20);clrscr();
	strcpy(choise[0],"Номе░");
	strcpy(choise[1],"Име на ┤айл");
	strcpy(choise[2],"Име на изделие");
	if ((in=fopen("KATALOG.DBF","r"))==NULL) {clrscr();puts("KATALOG.DBF not found !");exit(1);}
	Src(5,in);n=ch;n+=(int)getc(in)*256;++bt;Src(127,in);
	for (i=0;i<=n;i++) {
	Read(8,&nom[i],in);Read(8,&dbf[i],in);Read(78,&name[i],in); }
	fclose(in);
	do {
	  window(1,1,80,25);textattr(23);clrscr();
	  gotoxy(20,10);cputs("Избо░ на изделие по:");
	  do menu=Scroll(2,1,15,2,12,12,23,52,1); while (menu==-1);
	  clrscr();
	  switch (menu) {
		default : {window(1,1,80,25);textattr(20);clrscr(); }
		case 0 : menu=Scroll(n-1,8,9,159,1,2,23,52,2);break;
		case 1 : menu=Scroll(n-1,7,10,159,1,2,23,52,3);break;
		case 2 : menu=Scroll(n-1,1,79,20,1,1,23,52,4);break; } }
	while (menu==-1);
	strcpy(nam,dbf[menu]);strcat(nam,".DBF");bt=1;
	if ((in=fopen(nam,"r"))==NULL) {clrscr();printf("%s not found !",nam);exit(1);}
	if ((lib=fopen("K1.DBF","r"))==NULL) {clrscr();printf("K1.DBF not found !");exit(1);}
	Src(5,in);n=ch;n+=(int)getc(in)*256;++bt;Src(290,in);
	nomer=Readi(6,in);printf("\n%u ++\n",nomer);
	ceh=Readi(3,in);printf("\n%u ++\n",ceh);
	stancia=Readi(4,in);printf("\n%u ++\n",stancia);
	operacia=Readi(3,in);printf("\n%u ++\n",operacia);
	pozicia=Readi(3,in);printf("\n%u ++\n",pozicia);
	sclad=Readi(3,in);printf("\n%u ++\n",sclad);
	colam=Readi(3,in);printf("\n%u ++\n",colam);
	col=Readi(6,in);printf("\n%u ++\n",col);
	bt=1;Src(225,lib);
	lnomer=Readi(4,lib);printf("\n%u ++\n",lnomer);
	Read(70,lname,lib);printf("\n%s ++\n",lname);
	Read(10,hlp,lib);lznomerm=atol(hlp);printf("\n%lu ++\n",lznomerm);
	Read(6,hlp,lib);lznomer=atol(hlp);printf("\n%lu++\n",lznomer);
	lcode=Readi(3,lib);printf("\n%u ++\n",lcode);
	Read(7,hlp,lib);lcena=atof(hlp);printf("\n%f ++\n",lcena);
  }
Readi(nm,nme)
int nm;
FILE *nme;
  {
	int i;
	for(i=0;i<nm;i++) hlp[i]=getc(nme);hlp[i]='\0';
	return(atoi(hlp));
  }
Read(nm,s,nme)
int nm;
char *s;
FILE *nme;
  {
	int i;
	for(i=0;i<nm;i++) s[i]=getc(nme);s[i]='\0';
  }
Scroll(max,col,wid,lim,dx,dy,cn,ci,c)
int max,col,wid,lim,dx,dy,cn,ci,c;
  {
	n1=0;x=1;y=1;key=75;up=0;
	textattr(cn);
	for (;((n1<=max)&&(n1<=lim));++n1)
	  {
		Rec(n1);gotoxy(x+dx,y+dy);Drw(dx,dy,n1,cn,c);
	  }
	n1=0;Rec(n1);
	do
	  {
		if ((key==75)||(key==77)||(key==80)||(key==72))
		  {
			Drw(dx,dy,n1,cn,c);
			n1+=((key!=72)? 0:((n1-col)>=0)? -col:0)+((key!=80)? 0:((n1+col)<=max)? col:0)
			   +((key!=75)? 0:((n1-1)>=0)? -1:0)+((key!=77)? 0:((n1+1)<=max)? 1:0);
			if ((n1>lim)||(n1<up))
			  {	if (n1>lim) { lim+=col;up+=col; }
			  if (n1<up) {lim-=col;up-=col; }
			  for (a=up;((a<=lim)&&(a<=max));)
				{ Rec(a-up);Drw(dx,dy,a,cn,c);++a; }
			  clreol(); }
			Rec((n1-up));
			Drw(dx,dy,n1,ci,c);
		  }
		if (kbhit) key=getch(); else key=1;
	  }
	while (key!=13&&key!=27);textattr(Norm);
	if (key==27) return(-1);else return(n1);
  }
Drw(dx,dy,a,b,c)
int dx,dy,a,b,c;
  {
	textattr(b);gotoxy(x+dx,y+dy);
	switch (c) {
	  case 1 : cprintf("%s",choise[a]);break;
	  case 2 : cprintf("%s",nom[a]);break;
	  case 3 : cprintf("%s",dbf[a]);break;
	  case 4 : gotoxy(1,y+1);cprintf("%s",name[a]);break;
	  case 5 : cprintf("%s",mmaket[a]);break;
	  case 6 : cprintf("%s",mka[a]);break;
	  case 7 : cprintf("%s",mstadii[a]);break; }
  }
