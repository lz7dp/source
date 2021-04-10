
main()
	{
	 int i = 0;

	 while ( ++i < 8 )
	   printf("%d! is %d\n", i, factorial(i));
	}

factorial(n)
	int n;
	{
	 if (n==1)
	   return(1);
	 else
	   return(n*factorial(n-1));
	}
