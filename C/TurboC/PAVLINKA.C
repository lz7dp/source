/* �������� �� ��������� �� ������ */
/*         ������� ������          */
/*        ��  ������������         */

#include     <time.h>
#include <graphics.h>
#include    <stdio.h>
#include   <stdlib.h>
#include     <math.h>



float  Adim[10][10];
float  Bdim[45];
int    Cdim[2][45];
int    Xtmp, Ytmp;
int    i, j;
double Temp_Var;


main()
{
clrscr();
sound(1000);clrscr();
textbackground(BLUE);textcolor(YELLOW);gotoxy(1,1);
cputs("��������������������������������������������������������������������������������");
cputs("�                                                                              �");
cputs("�                                                                              �");
cputs("�                    � �  - ��. ����� , ������ - ��.������                     �");
cputs("�                                                                              �");
cputs("�                                                                              �");
cputs("�                                                                              �");
cputs("�                                                                              �");
cputs("�                                                                              �");
cputs("�                                                                              �");
cputs("�                             ��������� �� ������                              �");
cputs("�                        ������� ������ �� ������������                        �");
cputs("�                                                                              �");
cputs("�                                                                              �");
cputs("�                                                                              �");
cputs("�                                                                              �");
cputs("�                                                                              �");
cputs("�                                                                              �");
cputs("�                                                                              �");
cputs("�                                                                              �");
cputs("�                                                                              �");
cputs("�                         ��������� ENTER ...                                  �");
cputs("�                                                                              �");
cputs("��������������������������������������������������������������������������������");
nosound();
getch();textbackground(BLACK);textcolor(LIGHTGRAY);




clrscr();
randomize();
for (i=1;i<=10;++i)
   {
   for (j=1;j<=10;++j)
      {
      Adim[i][j] = random(100);
      }
   }



Temp_Var = Adim[1][1];
for (i=1;i<=10;++i)
   {
   for (j=1;j<=10;++j)
            {
            if (Temp_Var>Adim[i][j])
                            {
                            Temp_Var = Adim[i][j];
                            }
            }

   }
printf("���-������� ����� � ������ �(�,�) � %f",Temp_Var);



printf("\n");
printf("���������� �� ������� �(�,�):\n");
for (i=1;i<=10;++i)
   {
   for (j=1;j<=10;++j)
      {
      printf("  %f",Adim[i][j]);
      }
   printf("\n");
   }
printf("\n");
cputs("                          ��������� ENTER ...               ");
getch();




clrscr();
for (i=1;i<=45;++i)
      {
      Bdim[i] = random(100);
      }



clrscr();
printf("���������� �� ������� B(�):\n");
for (i=1;i<=45;++i)
      {
      printf("  %f",Bdim[i]);
      }
printf("\n");
printf("\n");
cputs("                          ��������� ENTER ...                 ");
getch();



for (i=1;i<=2;++i)
   {
   for (j=1;j<=45;++j)
      {
      Cdim[i][j] = 0;
      }
   }



Temp_Var = 0;
Ytmp = 1;
for (i=2;i<=10;++i)
   {
   for (j=1;j<=i-1;++j)
      {
      ++Temp_Var;
      if (Adim[i][j]<Bdim[Temp_Var])
                {
                Bdim[Temp_Var] = Adim[i][j];
                Cdim[1][Ytmp] = i;
                Cdim[2][Ytmp] = j;
                ++Ytmp;
                }
      }
   }



clrscr();
printf("���������� �� ������� C(�,�):\n");
for (i=1;i<=45;++i)
   {
   printf("  %d",Cdim[1][i]);
   printf("  %d",Cdim[2][i]);
   printf("\n");
   }
printf("\n");
cputs("                          ��������� ENTER ...                 ");
getch();




clrscr();
printf("���������� �� ������� B(�):\n");
for (i=1;i<=45;++i)
      {
      printf("  %f",Bdim[i]);
      }
printf("\n");
printf("\n");
cputs("                          ��������� ENTER ...                 ");
getch();



Temp_Var = 0;
for (i=1;i<=45;++i)
      {
      Temp_Var = Temp_Var + Bdim[i];
      }
clrscr();
printf("������ �� ���������� �� ������ B(�) � %f",Temp_Var);
printf("\n");
cputs("                          ��������� ENTER ...                 ");
getch();
clrscr();
}
