#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <strings.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <fcntl.h>
#include <sys/time.h>
#include <string.h>
#include <sys/stat.h>
#include <wait.h>
#include "shmemtypes.h"
#include <netdb.h>

// Buffer up to 256
#define BUF_SIZE 256

// Main Program
int main(int argc, char ** argv)
{
  // Buffer up to 256
  char buf[BUF_SIZE];
  int nr = 0;
  int my_nr = 1;
  int port = 0;

  struct memory_block * mblock;
  key_t key = ftok(FTOK_FILE, 1);
  if (key == -1)
  {
    printf("Failed to generate unique key. Server compiler with a wrong name?\n"
);
    return EXIT_FAILURE; // 01
  }

  // Shared Memory Identificator
  int shmid = shmget(key, sizeof(struct memory_block), 0666 | IPC_CREAT);

    // Memory Block
  mblock = (struct memory_block *) shmat(shmid, 0, 0);
  mblock->turn = SERVER;
//  mblock->server_lock = FREE;
  mblock->server_port = PORT;
  mblock->client_lock = BUSY;

  if (mblock->client_num == 0)
  {
     mblock->client_num = CLIENT1;
  } 
  else if (mblock->client_num == 1)
  {
     mblock->client_num = CLIENT2;
  }
  else if (mblock->client_num == 2)
  {
     mblock->client_num = CLIENT1;
  }
  mblock->readlast = CLIENT;

  // Arguments check
  if (argc < 2)
  {
    fprintf(stderr,"Use this with command> %s <hostname or IP address>\n", argv[0]);
    return EXIT_FAILURE; // -1
  }
  port = mblock->server_port;

  int sock_client = socket(AF_INET, SOCK_STREAM, 0); // Network Socket using TCP protocol
  if (sock_client < 0)
  {
    printf("Error Socket Initialization! Err.No: %d", errno);
    return EXIT_FAILURE; // -1
  }

  // Server Address
  struct hostent *server;
  server = gethostbyname(argv[1]);
  if (server == NULL)
  {
    printf("Error Host Not Found!\n");
    return EXIT_FAILURE; // -1
  }

  // Initialize Socket Structure
  struct sockaddr_in serv_addr;
  memset((char *) &serv_addr, 0, sizeof(serv_addr));
  serv_addr.sin_family = AF_INET;
  strncpy((char *)&serv_addr.sin_addr.s_addr, (char *)server->h_addr, server->h_length);
  serv_addr.sin_port = htons(port);

  // Socket Connect
  if (connect(sock_client, (const struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0)
  {
    printf("Error Socket Connet! Err.No: %d", errno);
    return EXIT_FAILURE; // -1
  }
do
{
  // Read text from the standart input in the buffer and send in the socket
  printf("Write the message and press [Enter] to send:\n");
  memset(buf, 0, BUF_SIZE);
  fgets(buf, BUF_SIZE-1, stdin);
  write(sock_client, buf, strlen(buf));
  memset(buf, 0, BUF_SIZE);
  read(sock_client, buf, BUF_SIZE-1);
  printf("Received: %s\n",buf);
  
} while (buf == "!quit");
  close(sock_client);
  mblock->client_lock = FREE;

  shmdt((void *) mblock);
  shmctl(shmid, IPC_RMID, 0);

  return EXIT_SUCCESS; // 0
}





