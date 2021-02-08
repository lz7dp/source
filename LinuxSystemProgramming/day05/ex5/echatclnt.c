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

int main() 
{ 
    int fd; 
  
    // FIFO file path 
    char * myfifo = "./myfifo"; 
  
    // Creating the named file(FIFO) 
    // mkfifo(<pathname>, <permission>) 
    mkfifo(myfifo, 0600); 
  
    char arr1[MaxLen]; 
    do 
    { 
        // Open FIFO for Read only 
        fd = open(myfifo, O_RDONLY); 
  
        // Read from FIFO 
        read(fd, arr1, sizeof(arr1)); 
  
        // Print the read message 
        printf("User2: %s\n", strrev(arr1)); 
        close(fd); 
    } 
	while (arr1 != "quit"); // q = quit
    return 0; 
} 

