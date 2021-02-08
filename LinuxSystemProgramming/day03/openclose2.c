#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
int main(int argc, char * argv[])
{
   // file descriptor
   int fd = open("omg.txt", O_RDONLY);
   // int fd = open("/proc/self/environ", O_RDONLY);

   // error
   if (fd == -1)
   {
      printf("Error opening file 'environ'!\n");
   }
   else
   {
      printf("File Descriptor of file 'environ' = %d\n", fd);
   }

   // write/read commands to be added here
   if (close(fd) == -1)
   {
      printf("Error closing the file!\n");
   }

   return 0;
}
