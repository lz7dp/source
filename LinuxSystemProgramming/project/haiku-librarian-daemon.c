////////////////////////////////////////////////////////////////////////////////
/*
 *      haiku-librarian-daemon.c 
 *	Dimitar Pavlov - user41 , phone: 0887 506 780 , email: lz1dpn@yahoo.com
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

/////////////////////////////////////////////////
//   STRUCT TO PID READ

struct tm1   /// use in pidfile read
{
    char buf[80];
    int val;
};

//////////////////////////////////////////////////
//   CREATE PID FILE

void create_pid_file(int child_pid)
{
   FILE *fptr = fopen("librarian.pid", "w");
   if (fptr == NULL) 
   { 
   	printf("Could not open file"); 
   	exit(EXIT_FAILURE);	
   } 
   fprintf(fptr,"%d", child_pid);
   fclose(fptr);
   chmod("librarian.pid", 0644);
   return;
}

//////////////////////////////////////////////////////
// READ PID FILE

int read_pid_file()
{
   struct tm1 p1;
   int child_pid;
   char buffer[MAXLEN];

   FILE *fptr = fopen("librarian.pid", "r");
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
// librarian daemon

void librarian_daemon()
{
    pid_t pid;
    char buffer4[30];
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

    int pid2 = getpid();
    create_pid_file(pid2);
	
    /* Set new file permissions */
    umask(0);

    /* Close all open file descriptors */
    for (int x = sysconf(_SC_OPEN_MAX); x>=0; x--)
    {
        close (x);
    }

    /* Open the log file */
    openlog("librarian_daemon.user41", LOG_PID, LOG_DAEMON);

    ///////////////////// DAEMON TASKS

   struct memory_block * mblock;
   key_t key = ftok(FTOK_FILE, 1);
   if (key == -1)
   {
      printf("Failed to generate unique key. Server compiler with a wrong name?\n");
   }

   // Shared Memory Identificator
   int shmid = shmget(key, sizeof(struct memory_block), 0666 | IPC_CREAT);
   if (shmid == -1)
   {
       printf("Server is not running!\n");
   }

   // Memory Block
   mblock = (struct memory_block *) shmat(shmid, 0, 0);

   while (1)
   {
 	client_number = mblock->haiku_ready;
	if (client_number != 0){
		FILE *pFile;
		FILE *pFile2;
		char buffer5[MAXLEN];
		bzero(buffer4, 30);
		bzero(buffer5, MAXLEN);
		sprintf(buffer4, "haiku.st%d", client_number);
		pFile=fopen(buffer4, "r");
		pFile2=fopen("haiku.txt", "a");
		if(pFile==NULL) {
    			perror("Error opening file.");
		} else {
		        while(fgets(buffer5, MAXLEN, pFile)) {
        			fprintf(pFile2, "%s", buffer5);
    			}
		}
		fclose(pFile);
        	fprintf(pFile2, "\n");
		fclose(pFile2);

		bzero(buffer5, MAXLEN);
		sprintf(buffer5, "rm %s", buffer4);
		system(buffer5);
	}
	sleep(300);

   }

return;
}

////////////////////////////////////////////////////////////////////////////
//     MAIN

void main(int argc, char* argv[])
{
    char filename_2[30];
    int enable = -1;
    pid_t kill_pid = 0;
    pid_t pid0 = 0;
    pid_t pid10 = 0;

    // Arguments Check <start/stop>
    if (argc != 2)
    {
	fprintf(stderr,"Daemon options: %s <start/stop>\n", argv[0]);
	exit(0);
    }

////////////////////////////////////////////////////////////////////////////
//                DAEMON START

    if (strcmp(argv[1], "start") == 0)
    {
	enable = 1;
        syslog (LOG_NOTICE, "librarian daemon started.");

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
    	int x;
    	for (x = sysconf(_SC_OPEN_MAX); x>=0; x--)
    	{
        	close (x);
    	}

    	/* Open the log file */
    	openlog("librarian_daemon.user41", LOG_PID, LOG_DAEMON);

	while (1)
	{
		librarian_daemon();
	}

    } 

///////////////////////////////////////////////////////////////////////////
//               DAEMON STOP
//

    if (strcmp(argv[1], "stop") == 0)
    {
        enable = 0;
        syslog (LOG_NOTICE, "librarian daemon terminated.");
	kill_pid = read_pid_file();
       	kill(kill_pid, SIGKILL);

    }

////////////////////////////////////////////////////////////////////////////
//                 PARAMETER HANDLER

    if (enable == -1)
    {
    	printf("Wrong parameter <start/stop>: %s\n", argv[1]);
        exit(0);
    }

/////////////////////////////////////////////////////////////////////////////
//                END

    closelog();
    return;
}

