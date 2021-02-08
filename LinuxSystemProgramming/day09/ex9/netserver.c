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

void *connection_handler(void *);

int main(int argc , char *argv[])
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
   mblock->turn = CLIENT;
   mblock->server_lock = FREE;
   mblock->server_port = PORT;
   mblock->client_lock = FREE;
   mblock->client_num = 0;
   mblock->readlast = SERVER;
   mblock->server_polite = NOPOLITE;
   // Buffer up to 256
   char buf[MAXLEN];
   int client_num = 0;

    // Arguments Check - custom port. -p POLITE MODE
    if (argc < 2)
    {
       fprintf(stderr,"For custom port: %s <port_number>\n", argv[0]);
       fprintf(stderr,"For polite mode use option: %s <port number> -p\n", argv[0]);
    }
    else if (argc == 2)
    {
       mblock->server_port = atoi(argv[2]);
    }
    else if (strcmp(argv[3], "-p") == 0 || strcmp(argv[2], "-p") == 0)
    {
	    //polite mode on
	    mblock->server_polite = POLITE;
    }


    // socket structure
    int socket_desc , client_sock , c;
    struct sockaddr_in server , client;
     
    //Create socket
    socket_desc = socket(AF_INET , SOCK_STREAM , 0);
    if (socket_desc == -1)
    {
        printf("Could not create socket");
    }
    puts("Socket created");
     
    //Prepare the sockaddr_in structure
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;
    server.sin_port = htons( PORT );
     
    //Bind
    if( bind(socket_desc,(struct sockaddr *)&server , sizeof(server)) < 0)
    {
        //print the error message
        perror("bind failed. Error");
        return 1;
    }
    puts("bind done");
     
    //Listen
    listen(socket_desc , 3);
     
    //Accept and incoming connection
    puts("Waiting for incoming connections...");
    c = sizeof(struct sockaddr_in);
     
     
    //Accept and incoming connection
    puts("Waiting for incoming connections...");
    c = sizeof(struct sockaddr_in);
    pthread_t thread_id;
	
    while( (client_sock = accept(socket_desc, (struct sockaddr *)&client, (socklen_t*)&c)) )
    {
        puts("Connection accepted");
         
        if( pthread_create( &thread_id , NULL ,  connection_handler , (void*) &client_sock) < 0)
        {
            perror("could not create thread");
            return 1;
        }
         
        puts("Handler assigned");
    }
     
    if (client_sock < 0)
    {
        perror("accept failed");
        return 1;
    }
     
    return 0;
}
 
void *connection_handler(void *socket_desc)
{
   int fd = open("./chat.log", O_WRONLY | O_CREAT | O_TRUNC, 0600);
   // Error in open
   if (fd == -1)
   {
      printf("Error opening chat.log file!\n");
      exit(0);
   }

    //Get the socket descriptor
    int sock = *(int*)socket_desc;
    int read_size;
    char *message , client_message[MAXLEN];

    //Send some messages to the client
    message = "connection handler\n";
    write(sock , message , strlen(message));
    message = "type something\n";
    write(sock , message , strlen(message));
     
    //Receive a message from client
    while( (read_size = recv(sock , client_message , MAXLEN , 0)) > 0)
    {
        	//end of string marker
		client_message[read_size] = '\0';
		
		//Send the message back to client
        	write(sock , client_message , strlen(client_message));
                ssize_t nr = write(fd, client_message, strlen(client_message));
                nr = write(fd, "\n", 1);
		puts(client_message);	

		// Error in write
		if (nr == -1)
      		{	
         		printf("Error writing to chat.log file!\n");
         		exit(0);
      		}

		//clear the message buffer
		memset(client_message, 0, MAXLEN);
    }
     
    if(read_size == 0)
    {
        puts("Client disconnected");
        fflush(stdout);
    }
    else if(read_size == -1)
    {
        perror("recv failed");
    }
         
    return 0;
} 

