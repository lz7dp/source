////////////////////////////////////////////////////////////////////////////////
/*
 *      haiku-master-daemon.c
 *      Dimitar Pavlov - user41 , phone: 0887 506 780 , email: lz1dpn@yahoo.com
 *
 */
///////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////
//       LIBRARRY

#include <sys/wait.h>
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <syslog.h>
#include <string.h>
#include <netdb.h>
#include <sys/socket.h>
#include <arpa/inet.h> 
#include <pthread.h> 
#include <strings.h>
#include <netinet/in.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/time.h>
#include "shmemtypes.h"

#define BUF_SIZE MAXLEN 
#define MAX_BUF MAXLEN

/////////////////////////////////////////////////////

void *connection_handler(void *socket_desc)
{
    //Get the socket descriptor
    int sock = *(int*)socket_desc;
    char message[MAXLEN];

///////////////////////////////
   	struct memory_block * mblock2;
   	key_t key2 = ftok(FTOK_FILE, 1);

	int shmid2 = shmget(key2, sizeof(struct memory_block), 0666 | IPC_CREAT);
        mblock2 = (struct memory_block *) shmat(shmid2, 0, 0);
	char wordfile[30];
	sprintf(wordfile, "%s", mblock2->word_file);

	FILE *fpwf;
	fpwf = fopen(wordfile, "r");

	while(1)
	{
		rewind(fpwf);
		bzero(message, MAXLEN);
		while(fgets(message, strlen(message), fpwf))
		{
    			write(sock , message , MAXLEN);
			bzero(message, MAXLEN);
			sleep(mblock2->sleep_time);
		}
	}
        fflush(stdout);
	fclose(fpwf);
///////////////////////////////

    return 0;
}

/////////////////////////////////////////////////
//   STRUCT TO PID READ

struct tm1   /// use in pidfile read
{
    char buf[80];
    int val;
};

//////////////////////////////////////////////////
//   CREATE PID FILE

void create_pid_file(char filename[20], int child_pid)
{
   FILE *fptr = fopen(filename, "w");
   if (fptr == NULL)
   {
        printf("Could not open file");
        exit(EXIT_FAILURE);
   }
   fprintf(fptr,"%d", child_pid);
   fclose(fptr);
   chmod(filename, 0644);
   return;
}

//////////////////////////////////////////////////////
// READ PID FILE

int read_pid_file(char filename[20])
{
   struct tm1 p1;
   int child_pid;
   char buffer[MAXLEN];

   FILE *fptr = fopen(filename, "r");
   if (fptr == NULL)
   {
        printf("Could not open file");
        exit(EXIT_FAILURE);
   }

    while (fgets(buffer, sizeof buffer, fptr)) {
        int tail = 0;
        if (sscanf(buffer, "%*[^0123456789] %*d %*s %*d%n", &tail) == 0) {
            if ((unsigned) tail < sizeof p1.buf
                && sscanf(buffer + tail, "%d", &p1.val) == 1) {
                buffer[tail] = '\0';
                strcpy(p1.buf, buffer);
                printf("%s, %d\n", p1.buf, p1.val);
            }
        }
    }

   return p1.val;
}


/////////////////////////////////////////////////////////////////
// haiku master daemon

int haiku_daemon(char * pid_file, char * word_file, int time2)
{
    pid_t pid;
    char filename_1[30];
    int client_number = 0;

    /* Fork off the parent process */
    pid = fork();
	
    /* An error occurred */
    if (pid < 0)
        exit(EXIT_FAILURE);

    /* Success: Let the parent terminate */
    if (pid > 0)
        exit(EXIT_SUCCESS);

    /* On success: The child process becomes session leader */
    if (setsid() < 0)
        exit(EXIT_FAILURE);

    /* Catch, ignore and handle signals */
    signal(SIGCHLD, SIG_IGN);
    signal(SIGHUP, SIG_IGN);

    sprintf(filename_1, "%s.pid", pid_file);
    int pid2 = getpid();
    create_pid_file(filename_1, pid2);

    /* Set new file permissions */
    umask(0);

    /* Close all open file descriptors */
    for (int x = sysconf(_SC_OPEN_MAX); x>=0; x--)
    {
        close (x);
    }

    /* Open the log file */
    openlog("haiku_master_daemon.user41", LOG_PID, LOG_DAEMON);

    ///////////////////// DAEMON TASKS

   struct memory_block * mblock;
   key_t key = ftok(FTOK_FILE, 1);
   if (key == -1)
   {
      printf("Failed to generate unique key. Server compiler with a wrong name?\n");
      exit(0);
   }

   // Shared Memory Identificator
   int shmid = shmget(key, sizeof(struct memory_block), 0666 | IPC_CREAT);
   if (shmid == -1)
   {
       printf("Server is not running!\n");
   }

   // Memory Block
   mblock = (struct memory_block *) shmat(shmid, 0, 0);
   mblock->word_file = word_file;
   int port = atoi(pid_file);
   mblock->server_port = port;
   mblock->sleep_time = time2;

   ////////////////////////////////////////////////////
  
   mblock->server_lock = FREE;
   mblock->client_lock = FREE;
   mblock->client_num = 0;
   char buf[MAXLEN];
   int client_num = 0;
   int client_num2 = 1;

    // socket structure
    int socket_desc , client_sock , c;
    struct sockaddr_in server , client;

    //Create socket
    socket_desc = socket(AF_INET , SOCK_STREAM , 0);
    if (socket_desc == -1)
    {
        printf("Could not create socket");
    }

    //Prepare the sockaddr_in structure
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;
    server.sin_port = htons( port );

    //Bind
  if( bind(socket_desc,(struct sockaddr *)&server , sizeof(server)) < 0)
  {
        //print the error message
        perror("bind failed. Error");
        exit(0);
  }

    //Listen
    listen(socket_desc , 3);

    //Accept and incoming connection
    c = sizeof(struct sockaddr_in);


    //Accept and incoming connection
    c = sizeof(struct sockaddr_in);
    pthread_t thread_id;

    while(client_sock = accept(socket_desc, (struct sockaddr *)&client, (socklen_t*)&c))
    {
        mblock->client_num = mblock->client_num + 1;

        if( pthread_create( &thread_id , NULL ,  connection_handler , (void*) &client_sock) < 0) 
        {
            perror("could not create thread");
            exit(0);
        }
    }

    if (client_sock < 0)
    {
        perror("accept failed");
        exit(0);
    }

    mblock->client_num = mblock->client_num - 1;
    close(socket_desc);

return 0;
}

////////////////////////////////////////////////////////////////////////////
//     MAIN

void main(int argc, char* argv[])
{
    char filename_2[30];
    int time_period = atoi(argv[2]);
    int port = atoi(argv[3]);
    int enable = -1;
    pid_t kill_pid = 0;
    pid_t pid0 = 0;
    pid_t pid10 = 0;

    // Arguments Check <word_list> <time_period> <port> <start/stop>
    if (argc != 5)
    {
        fprintf(stderr,"Daemon options: %s <word_list> <time_period> <port> <start/stop>\n", argv[0]);
        exit(0);
    }

////////////////////////////////////////////////////////////////////////////
//                DAEMON START

    if (strcmp(argv[4], "start") == 0)
    {
	enable = 1;
        syslog (LOG_NOTICE, "user41: haiku master daemon started.");

    	pid0 = fork();

    	/* An error occurred */
    	if (pid0 < 0)
        	exit(EXIT_FAILURE);

    	/* Success: Let the parent terminate */
    	if (pid0 > 0)
        	exit(EXIT_SUCCESS);

    	/* On success: The child process becomes session leader */
    	if (setsid() < 0)
        	exit(EXIT_FAILURE);

    	/* Catch, ignore and handle signals */
    	signal(SIGCHLD, SIG_IGN);
    	signal(SIGHUP, SIG_IGN);

    	/* Set new file permissions */
    	umask(0);

    	/* Close all open file descriptors */
    	for (int x = sysconf(_SC_OPEN_MAX); x>=0; x--)
    	{
        	close (x);
    	}

    	/* Open the log file */
    	openlog("haiku_master_daemon.user41", LOG_PID, LOG_DAEMON);

	haiku_daemon(argv[3], argv[2], time_period);	

    } 

///////////////////////////////////////////////////////////////////////////
//               DAEMON STOP
//

    if (strcmp(argv[4], "stop") == 0)
    {
        enable = 0;
        syslog (LOG_NOTICE, "user41: haiku master daemon terminated.");
        sprintf(filename_2, "%s.pid", argv[3]);
        kill_pid = read_pid_file(filename_2);
        kill(kill_pid, SIGKILL);

    }


////////////////////////////////////////////////////////////////////////////
//                 PARAMETER HANDLER

    if (enable == -1)
    {
	printf("Wrong parameter <start/stop>: %s\n", argv[4]);
	exit(0);
    }

/////////////////////////////////////////////////////////////////////////////
//                END

    closelog();
    return;
}

