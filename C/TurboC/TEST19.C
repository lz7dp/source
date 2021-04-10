
#include <stdio.h>

main()
	{
	double nc;

	window (2, 2, 10, 10);
	for (nc = 0; getchar() != EOF; ++nc)
	      ;
	      printf ("%.0f\n", nc);
	}
