
#include <stdio.h>
#define  EOF  0

main()
	{
	int c;

	c = getchar();
	while (c != EOF)
	      {
	      putchar (c);
	      c = getchar();
	      }
	}

