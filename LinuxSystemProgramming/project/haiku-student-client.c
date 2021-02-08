////////////////////////////////////////////////////////////////////////////////
/*
 *      haiku-student-client.c
 *      Dimitar Pavlov - user41 , phone: 0887 506 780 , email: lz1dpn@yahoo.com
 *
 */
///////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////
//       LIBRARRY

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


//////////////////////////////////////////////////////////////////////
//   HAIKU WRITE TO FILE

void write_to_file(char haiku_row[MAXLEN], int number)
{
   char buffer3[30];
   buffer3[0] = '\0';
   sprintf(buffer3, "haiku.st%d", number);

   FILE *fptr = fopen(buffer3, "w+");
   if (fptr == NULL)
   {
        printf("Could not open file");
        exit(EXIT_FAILURE);
   }
   fprintf(fptr,"%s\n", haiku_row);
   fclose(fptr);
   return;
}


////////////////////////////////////////////////////////////////////////////////////////
//   MAIN

int main(int argc, char* argv[])
{
/////////////////////////////////////////////////////////////////////////
//          VAR STRUCT SOCKET


    // Arguments Check <word_list> <time_period> <port> <start/stop>
    if (argc != 2)
    {
        fprintf(stderr,"Program options: %s <port>\n", argv[0]);
        exit(0);
    }

   int port = atoi(argv[1]);
   struct memory_block * mblock;
   key_t key = ftok(FTOK_FILE, 1);
   if (key == -1)
   {
      printf("Failed to generate unique key. Server compiler with a wrong name?\n");
   exit(0);
   }

   // Shared Memory Identificator
   int shmid = shmget(key, sizeof(struct memory_block), 0666 | IPC_CREAT);

   // Memory Block
   mblock = (struct memory_block *) shmat(shmid, 0, 0);
     int student_num = mblock->client_num + 1;
     mblock->turn = mblock->client_num + 1;
     mblock->client_num = mblock->client_num + 1;

int socket_desc;
int val;
int haiku_number5 = 5;
int haiku_number7 = 7;

struct sockaddr_in client_addr;
char buffer[MAXLEN];
char buffer2[MAXLEN];
char yesno[3];
char file_name[30];
socket_desc = socket(AF_INET, SOCK_STREAM, 0);

client_addr.sin_family = AF_INET;
client_addr.sin_addr.s_addr = INADDR_ANY; 
client_addr.sin_port = htons(port);

if(connect(socket_desc, (struct sockaddr*)&client_addr, sizeof(client_addr)) == 0)
{
	printf("CONNECT STATE: Connected to Server on port %d\n", port);
} else {
	printf("Connection to server failed !\n");
	exit(0);
}

////////////////////////////////////////////////////////
//     COLLECT HAIKU

do
{
	bzero(buffer2, MAXLEN);
	sprintf(buffer2, "st");
        sprintf(buffer2, "%d: ", student_num);
	for (int i = haiku_number5; i > 0; i--)
	{
		bzero(buffer, MAXLEN);
		read(socket_desc, buffer, MAXLEN);
                sprintf(buffer2, "%s", buffer);
        	sprintf(buffer2, " ");
	}
//	sprintf(buffer2, "\n");
	write_to_file(buffer2, student_num);
	printf("%s", buffer2);

	bzero(buffer2, MAXLEN);
        sprintf(buffer2, "st");
        sprintf(buffer2, "%d: ", student_num);
        for (int i = haiku_number7; i > 0; i--)
        {
                bzero(buffer, MAXLEN);
                read(socket_desc, buffer, MAXLEN);
                sprintf(buffer2, "%s", buffer);
                sprintf(buffer2, " ");
        }
//        sprintf(buffer2, "\n");
        write_to_file(buffer2, student_num);
        printf("%s", buffer2);

	bzero(buffer2, MAXLEN);
	sprintf(buffer2, "st");
        sprintf(buffer2, "%d: ", student_num);
        for (int i = haiku_number5; i > 0; i--)
        {
                bzero(buffer, MAXLEN);
                read(socket_desc, buffer, MAXLEN);
                sprintf(buffer2, "%s", buffer);
                sprintf(buffer2, " ");
        }
//        sprintf(buffer2, "\n");
        write_to_file(buffer2, student_num);
        printf("%s", buffer2);

	bzero(buffer2, MAXLEN);
	strcat(buffer2, "\n");
        write_to_file(buffer2, student_num);

///////////////////////////

	mblock->client_num = student_num;
	mblock->haiku_ready = student_num;
	printf("Do you want another one haiku? (Y/N)\n");
	scanf("%s", yesno);
} while ( (strcmp(yesno, "Y") == 0) || (strcmp(yesno, "y") == 0) );

	close(socket_desc);

//////////////////////////////////////////////////////////////////////////////////
//    END

return 0;	
}

