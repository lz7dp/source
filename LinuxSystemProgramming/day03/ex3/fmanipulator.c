#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>

#define BUF_SIZE 1000000
#define ASCII_START 32
#define ASCII_END 126

char* rndword(int min_l, int max_l)
{
    int size = (int) (rand()%(max_l-min_l))+min_l;;		

    int i;
    char *res = malloc(size + 1);
    for(i = 0; i < size; i++) {
        res[i] = (char) (rand()%(ASCII_END-ASCII_START))+ASCII_START;
    }
    res[i] = '\n';
    return res;
}

int main(int argc, char *argv[])
{
   char str[100];
   memset(str, 50, 100);
   struct flock fi;
   sprintf(str, "Stored by process %i", getpid());
   int fd = open("./words.txt", O_RDWR|O_CREAT, 0644);
   fi.l_type = F_WRLCK;
   fi.l_whence = SEEK_SET;
   fi.l_start = 0;
   fi.l_len = 100;
   int off = 0;
   while (fcntl(fd, F_SETLK, &fi) == -1)
   {
      fcntl(fd, F_GETLK, &fi);
      printf("bytes %i - %i blocked by process %i\n", off, off+100, fi.l_pid);
      off += 100;
      fi.l_start = off;
   }     

   // error in open
   if (fd == -1)
   {
      printf("Error opening the file words.txt!\n");
      return -1;
   }

   if(argc!=4)
   {
       printf("please use \"fmanipulator <words_count> <min_length> <max_length> \"\n");
       return -1;
   }

   int words_count = atoi(argv[1]);
   int min_length = atoi(argv[2]);
   int max_length = atoi(argv[3]);

   for (int i=0; i < words_count; i++)
   {
      char * buf = rndword(min_length, max_length);
      int text_len = strlen(buf);
      printf("%s", buf);

      lseek(fd, off, SEEK_SET);
      ssize_t nr = write(fd, buf, strlen(buf));
      fi.l_type = F_UNLCK;
      if (fcntl(fd, F_SETLK, &fi) == -1) printf("ERROR while blocking!\n");
//      close(fd);

      //ssize_t nr = write(fd, buf, text_len);
      if (nr == -1)
      { 
         printf("ERROR writing to the file!\n");
         break;
      }
   }
   if (close(fd) == -1)
   {
      printf("ERROR closing the file!\n");
      return -2;
   }
   printf("\n");
   printf("SUCCESS!\n");
   printf("\n");
   printf("Please press ENTER!");
   getchar();	      
   return 0;
}

