
main()

    {

	int x = 1;

	middle();
	printf("%d\n", x);

	}

inner()
	{
	int x = 3;

	printf("%d\n", x);
	}

middle()
	{
	int x = 2;

	inner();
	printf("%d\n", x);
	}


