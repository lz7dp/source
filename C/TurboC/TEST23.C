
main()
	{
	int i;

	for ( i=0; i<=10; ++i )
	    printf ("%d %d\n", i, power(2,i));
	}

power(x,n)
	int x, n;

	{
	int i, p;
	p = 1;

	for ( i=1; i<=n; ++i)
	    p = p * x;

	return(p);
	}
