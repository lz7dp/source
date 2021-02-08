#include <fcntl.h>
#include <errno.h>
#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <wait.h>

#define MaxLen 1024

char *strrev(char *str)
{
  int size = strlen(str);
  char temp = '\0';
  size_t i = 0;
  size_t j = size - 1; /* Point to the last char in the string. */

  while(i < j)
  {
  	temp = str[i];
  	str[i] = str[j];
  	str[j] = temp;
  	i++;
  	j--;
  }
  return str;
}

int main (int argc, char * argv[]){
    int ret;
	int len;
    int size;
    int size2;
    int size3;
    char tmp;
    char temp;
    char buff2[MaxLen+1];
    char buff3[MaxLen+1];

	printf("Enter a string to send: ");
	scanf("%s", buff2);

    int pipedes[2];
	pipe(pipedes);
	pid_t cpid = fork();
	 
    if ( cpid == 0 )
    {
	    close(pipedes[0]);
		write(pipedes[1], strrev((void *) buff2), strlen(buff2) + 1);
	    close(pipedes[1]);      
    } 
	else
    {		
        close(pipedes[1]);
        read(pipedes[0], buff3, MaxLen);
		close(pipedes[0]);
		printf("Received string is: ");
		printf("%s\n", buff3);
		printf("\n");

        int fd = open("./messages.log", O_WRONLY | O_CREAT, 0600);

		size2 = size2 + size;
        ssize_t nr = write(fd, strrev((void *) buff3), strlen(buff3) + 1);
		close(fd);
    }  
	
printf("END of PROGRAMM!\n ");
return 0;
}

