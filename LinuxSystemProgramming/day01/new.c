/*
 * haiku_master.c 
 *
 */

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

#define BUF_SIZE 512

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
   ssize_t nr = write(fd, &child_pid, sizeof(child_pid));
   // Error in write
   if (nr == -1)
   {
       printf("Error writing to the file!\n");
       return -2;
   }

   // Error in close
   if (close(fd) == -1)
   {
      printf("Error closing the file!\n");
      return -3;
   }
   // OK
    return 0;
}


void haiku_daemon(char * pid_file)
{
    pid_t pid;
    char filename_1[20];
	
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
    //TODO: Implement a working signal handler */
    signal(SIGCHLD, SIG_IGN);
    signal(SIGHUP, SIG_IGN);

    sprintf(filename_1, "%s.pid", pid_file);
    create_file(filename_1, pid);
	
    /* Set new file permissions */
    umask(0);

    /* Close all open file descriptors */
    int x;
    for (x = sysconf(_SC_OPEN_MAX); x>=0; x--)
    {
        close (x);
    }

    /* Open the log file */
    openlog("haiku_daemon.user41", LOG_PID, LOG_DAEMON);
    return;
}

int main(int argc, char* argv[])
{
    char filename_2[20];
//    int num_char;
    int time_period = 0;
    int enable = -1;
    int port = 0;
    pid_t kill_pid;

    // Arguments Check <word_list> <time_period> <port> <start/stop>
    if (argc != 5)
    {
	fprintf(stderr,"Daemon options: %s <word_list> <time_period> <port> <start/stop>\n", argv[0]);
	exit(0);
    }

    time_period = atoi(argv[2]);
  
    haiku_daemon(argv[3]);

    if (strcmp(argv[4], "start") == 0)
    {
	//TODO: Insert daemon code here.
	enable = 1;
// haiku_daemon(argv[3]);
        syslog (LOG_NOTICE, "daemon started.");
		
        sleep(time_period);		
    } 

//    if (strcmp(argv[4], "stop") == 0)
//    {	
	enable = 0;
	syslog (LOG_NOTICE, "daemon terminated.");
	closelog();
	printf(filename_2, "%s.pid", argv[3]);
	int fd = open(filename_2, O_RDONLY);
        read(fd, &kill_pid, sizeof(kill_pid));
	close(fd);
	kill(kill_pid, SIGKILL);
//    }		

return EXIT_SUCCESS;
}

