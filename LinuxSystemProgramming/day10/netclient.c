#include <netdb.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <pthread.h>
#include <errno.h>
#include <strings.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <fcntl.h>
#include <sys/time.h>
#include <sys/stat.h>
#include <wait.h>
#include "shmemtypes.h"


int main()
{
   struct memory_block * mblock;
   key_t key = ftok(FTOK_FILE, 1);
   if (key == -1)
   {
      printf("Failed to generate unique key. Server compiler with a wrong name?\n");
   return EXIT_FAILURE;
   }

   // Shared Memory Identificator
   int shmid = shmget(key, sizeof(struct memory_block), 0666 | IPC_CREAT);

   // Memory Block
   mblock = (struct memory_block *) shmat(shmid, 0, 0);
//   mblock->turn = CLIENT;
//   mblock->server_lock = FREE;
//   mblock->server_port = PORT;
//   mblock->client_lock = FREE;
//   mblock->client_num = 0;
//   mblock->readlast = SERVER;
//   mblock->server_polite = NOPOLITE;

int socket_desc, val;
struct sockaddr_in client_addr;
char buffer[MAXLEN];
char buffer2[MAXLEN];
socket_desc = socket(AF_INET, SOCK_STREAM, 0);

// printf("Enter the port number\n");
int port = mblock->server_port;
// scanf("%d", &port);
client_addr.sin_family = AF_INET;
client_addr.sin_addr.s_addr = INADDR_ANY; 
client_addr.sin_port = htons(port);

if(connect(socket_desc, (struct sockaddr*)&client_addr, sizeof(client_addr)) == 0)
	printf("CONNECT STATE: Connected to Server on port %d\n", port);
else
	printf("Connection to server failed !\n");

do
{
	printf("Message to server: ");
	bzero(buffer, MAXLEN);
	scanf("%s", buffer);
	strcpy(buffer2, buffer);
	
	write(socket_desc,buffer,strlen(buffer));
//      bzero(buffer, MAXLEN);
	
	read(socket_desc, buffer, MAXLEN);
	printf("Message from other: %s\n", buffer);
} while (strcmp(buffer2, "!quit") != 0);

	close(socket_desc);
	return 0;	

}


