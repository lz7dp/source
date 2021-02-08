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
  
    char arr1[MaxLen], arr2[MaxLen]; 
    do 
    { 
        // Open FIFO for write only 
        fd = open(myfifo, O_WRONLY); 
  
        // Take an input arr2ing from user. 
        //  
		printf("Enter a string to send: ");
        fgets(arr2, MaxLen, stdin); 
  
        // Write the input arr2ing on FIFO 
        // and close it 
        write(fd, strrev((void *) arr2), strlen(arr2)+1); 
        close(fd); 
    } 
	while (arr2 != "quit"); // q = quit
    return 0; 
} 

