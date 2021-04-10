
main()

	{

	increment();
	increment();
	increment();

	}


increment()
	{
	static int x = 0;

	x = x + 1;
	printf("%d\n", x);
	}
