
main()
	{

	int i = 1;
	int n = 1234;

	while ( ++i < n )
	   if ( n % i == 0 )
	   {
	   printf("Not prime!\n");
	   break;
	   }
	if ( i == n )
	   printf("Prime!");

	}
