
main()

  {
    int lower, upper, step;
    float fahr, celsius, dpp;

    lower = 0;
    upper = 100;
    step  = 1;
    dpp   = 0.0;
    fahr  = lower;

    while (fahr <= upper)
	  {
	  celsius = (5.0/9.0) * (fahr-32.0);
	  if (celsius == 0)
		dpp = 0;
	  else
		dpp = 22.0/celsius;
	  printf ("%f %f %f\n", fahr, celsius, dpp);
	  fahr = fahr + step;
	  }
  }