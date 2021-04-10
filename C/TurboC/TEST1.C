

main()
	 {
	 auto int x = 1;
	   {
	   auto int x = 2;
	     {
	     auto int x = 3;
	     printf ("%d\n", x);
	     }
	   printf ("%d\n", x);
	   }
	 printf ("%d\n", x);
	 }






