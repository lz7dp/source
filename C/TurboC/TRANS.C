#include<stdio.h>
#include<conio.h>
#include<string.h>
#include<stdlib.h>
static unsigned int n,ln,i,ni=1,bt=1,btl,brl,nomer,stancia;
static int lnomer,br,ii,brr,jj;
static char lznomerm[11],lznomer[7],operacia[4],pozicia[4],sclad[4],col[8],colam[10],ceh[4],hh;
int ch,menu,menu1,n1,x,y,key,up,a,chmaket,chka,chstadii;
static char nom[300][9],dbf[300][9],name[300][80],plnam[80],wrk[80];
static char choise[9][30],nam1[13],nam[13],namh[80],hlp[10],lname[71],lcode[4],lcena[8];
static char maket[30],hmaket[30],ka[30],hka[30],stadii[30],mmaket[3][30],mka[4][30],mstadii[5][30];
FILE *in,*lib,*out;
#define Norm 7
#define Src(a,b) for(;bt<=a;bt++) ch=getc(b);
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
	strcpy(nam,dbf[menu]);
	strcpy(nam1,nam);
	strcat(nam1,".TNF");
	if ((out=fopen(nam1,"w"))==NULL) {clrscr();printf("%s не ▒е о▓ва░┐ !",nam1);exit(1);}
	strcat(nam,".DBF");strcpy(plnam,strrev(name[menu]));
	ii=0;brr=0;
	do ii++;
	while(plnam[ii]==' ');
	do {
		wrk[brr]=plnam[ii];
		ii++;brr++;
	   }
	while(brr<10);
	wrk[brr]='\0';
	strcpy(namh,plnam);
	strcpy(plnam,strrev(wrk));
	clrscr();
	if ((in=fopen(nam,"r"))==NULL) {clrscr();printf("%s not found !",nam);exit(1);}
	bt=1;Src(5,in);n=ch;n+=(int)getc(in)*256;++bt;Src(289,in);br=0;
	printf("%s",strrev(namh));
	gotoxy(15,5);
	printf("ОТ  %u",n);
	do {
		br++;
		gotoxy(1,5);
		printf("%u",br);
		nomer=Readi(6,in);
		Read(3,ceh,in);
		stancia=Readi(4,in);
		Read(3,operacia,in);
		if (operacia[0]==32) operacia[0]=48;
		if (operacia[1]==32) operacia[1]=48;
		Read(3,pozicia,in);
		if (pozicia[0]==32) pozicia[0]=48;
		if (pozicia[1]==32) pozicia[1]=48;
		Read(3,sclad,in);
		Read(3,colam,in);
		Read(7,col,in);
		jj=7;
		do {
			col[jj+1]=col[jj];
			jj--;
		   }
		while(jj!=0);
		col[0]=32;
		col[1]=32;
		if ((lib=fopen("K1.DBF","r"))==NULL) {clrscr();printf("K1.DBF not found !");exit(1);}
		btl=bt;bt=1;Src(5,lib);ln=ch;ln+=(int)getc(lib)*256;++bt;Src(224,lib);bt=btl;
			brl=0;
		do {
			brl++;
			lnomer=Readi(4,lib);
			Read(70,lname,lib);
			Read(10,lznomerm,lib);
			Read(6,lznomer,lib);
			Read(3,lcode,lib);
			Read(7,lcena,lib);
			ch=getc(lib); }
		while(nomer!=lnomer&&brl<ln);
		fclose(lib);
		fprintf(out,"%.3s",maket);
		strncpy(hka,ka,1);
		fputs(hka,out);
		fputs(plnam,out);
		fputs(stadii,out);
		fputs(ceh,out);
		fputs(operacia,out);
		fputs(pozicia,out);
		fputs(lznomerm,out);
		fputs(lznomer,out);
		fputs(sclad,out);
		fputs(lcode,out);
		fputs(col,out);
		fputs("                           \n",out);
		 }
	while(br!=n);
	fclose(out);
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
	for(i=0;i<nm;	i++) s[i]=getc(nme);s[i]='\0';
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