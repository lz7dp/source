#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
int main(int argc, char * argv[])
{
   // v1
   char *args[] = {"./execFirst",NULL};
   execvp(args[0], args);
   // v2
   // execvp(argv[1], argv);
   return 0;
}
