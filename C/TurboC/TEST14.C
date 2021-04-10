
#define  LOWER  0
#define  UPPER  300
#define  STEP   20


main()
	{
	int fahr;

	for (fahr = LOWER; fahr <= UPPER; fahr = fahr + STEP)
	    printf ("%d      %f\n", fahr, (5.0/9.0)*(fahr-32));
	}

