
main()
        {

        int i = 1;
        int n = 2;

        while ( ++n < 20 )
           {
           i = 1;
           while ( ++i < n )
              if (n % i == 0)

                 break;
              if (i == n)
             printf("%d\n", n);
           }

        }
