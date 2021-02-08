#include <fcntl.h>
#include <signal.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#define BUF_SIZE 1000000

int create_file(char filename[20], int child_pid)
{
   // File Descriptor
   int fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0644);

   // Error in open
   if (fd == -1)
   {
      printf("Error opening the file!\n");
      return -1;
   }

   // Write in file
   char buf[BUF_SIZE];
   for (int i=0; i < 1000; i++)
   {	
      sprintf(buf, " %d", child_pid);
      int buf_len = strlen(buf);
      ssize_t nr = write(fd, buf, buf_len);
      // Error in write
      if (nr == -1)
      {
         printf("Error writing to the file!\n");
         return -2;
      }
   }

   // Error in close
   if (close(fd) == -1)
   {
      printf("Error closing the file!\n");
      return -3;
   }

   // OK
   printf("Success writing in file!\n");
   return 0;
}

int create_child(int files_count)
{
   int status;
   int ret;
   int pid = fork();
   char buf2[3];
   char filename_1[20];
   sprintf(buf2, "%d", files_count);
   if (pid == 0) {
      ret = execl ("/home/user41/exercises/day04/ex4/tempgen", "tempgen", buf2, NULL);
      perror("execvp");
      return EXIT_FAILURE; // Never get there normally
   }
   else {
      if (wait(&status) == -1) {
         perror("wait");
         return EXIT_FAILURE;
      }
      if (WIFEXITED(status)) printf("Child terminated normally with exit code %i\n", WEXITSTATUS(status));
      if (WIFSIGNALED(status)) printf("Child was terminated by a signal #%i\n", WTERMSIG(status));
      if (WCOREDUMP(status)) printf("Child dumped core\n");
      if (WIFSTOPPED(status)) printf("Child was stopped by a signal #%i\n", WSTOPSIG(status));
   }

   if ((files_count > 0) && (files_count < 10))
   {
      sprintf(filename_1, "temp00%d.tmp", files_count);
   }
   else if ((files_count > 9) && (files_count < 100))
   {
      sprintf(filename_1, "temp0%d.tmp", files_count);
   }
   create_file(filename_1, pid);
   return EXIT_SUCCESS;
}


int main(int argc, char * argv[])
{
   if (argc != 2) 
   {
      printf("Usage: tempgen <files_count>\n");
      return EXIT_FAILURE;
   }

   if (argc < 2)
      {
         printf("Usage: tempgen <files_count>\n");
         return EXIT_FAILURE;
      }

   if (argc > 2)
      {
         printf("Usage: tempgen <files_count>\n");
         return EXIT_FAILURE;
      }
  
   int files_count = atoi(argv[1]);

   if ((files_count < 0) || (files_count > 100))
   {
	   printf("Please choice for <files_count> digit between 1 and 100 !\n");
	   return 0;
   }


   while(files_count > 0)
   {
      if ((files_count > 0) && (files_count < 10))
      {
	 create_child(files_count);
      }
      else if ((files_count > 9) && (files_count < 100))
      {
	 create_child(files_count);
      }
	 
   files_count = files_count - 1;  
   }

printf("END of Programm!\n");
return 0;   
}
