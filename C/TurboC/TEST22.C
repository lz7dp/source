#include <stdio.h>

main()
        {
        int c, i, nwhite, nother;
	int ndigit[10];
	char q[3];
	int log;
	log = 0;
	nwhite = nother = 0;

	for (i=0; i<4; ++i)
	    q[i] = ' ';

	printf("Write -QUIT- to exit !\n");
	printf("%");

        for (i=0; i<10; ++i)
            ndigit[i] = 0;

	while ((c=getchar()) != EOF)
		{
		if ( c>='0' &&  c<='9' )
                   ++ndigit[c-'0'];

		   else if ( c==' '  ||  c=='\n'  ||  c=='\t' )
			   {
			   ++nwhite;
                           for (i=0; i<4; ++i)
			       q[i] = ' ';
                           if ( c=='\n')
			   printf("%");
			   }

                   else if ( c=='-' )
                        {
			++nother;
                        printf("digits =");

                        for (i=0; i<10; ++i)
                            printf(" %d", ndigit[i]);

                        printf("\nwhite space = %d, other = %d\n", nwhite, nother);
                        }
		   q[0] = q[1];
		   q[1] = q[2];
		   q[2] = q[3];
		   q[3] = c;

		   if (q[0]=='Q' && q[1]=='U' && q[2]=='I' && q[3]=='T')
		      break;
		   if (q[0]=='H' && q[1]=='O' && q[2]=='M' && q[3]=='E')
		      for ( i=0; i<26; ++i)
			  printf("\n");
		   }
        }