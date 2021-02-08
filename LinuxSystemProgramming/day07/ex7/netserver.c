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

// Buffer up to 256
#define BUF_SIZE 256

int main(int argc, char ** argv)
{
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
  mblock->turn = NOCLIENT;
  mblock->server_lock = FREE;
  mblock->server_port = PORT;
  mblock->client_lock = FREE;
  mblock->client_num = NOCLIENT;
  mblock->readlast = SERVER;

  // Buffer up to 256
  char buf[BUF_SIZE];
  int client_num = 0;

  // Arguments Check
  if (argc < 2)
  {
    fprintf(stderr,"For custom port: %s <port_number>\n", argv[0]);
    // return EXIT_FAILURE;
  }
  else if (argc == 2)
  {
     mblock->server_port = atoi(argv[2]);
  }

// Socket Initialization
  int sock_server = socket(AF_INET, SOCK_STREAM, 0); // SOCK_STREAM = TCP, SOCK+DGRAM = UDP
  if (sock_server < 0)
  {
    printf("Error creating socket! Err.No: %d\n", errno);
    return EXIT_FAILURE; // -1
  }

  // Socket Structure Initialization
  struct sockaddr_in serv_addr, cli_addr;
  memset((char *) &serv_addr, 0, sizeof(serv_addr));
  serv_addr.sin_family = AF_INET; // NET
  serv_addr.sin_addr.s_addr = INADDR_ANY; // IP
  serv_addr.sin_port = htons(mblock->server_port); // PORT

  // Socket Binding
  if (bind(sock_server, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0)
  {
    printf("Eror binding socket! Err.No: %d\n", errno);
    return EXIT_FAILURE; // -1
  }

  // Socket Listen
  listen(sock_server, 1); // Single Client
  int clen = sizeof(cli_addr);

  // Socket Accept Client Connection
//  client_num = client_file_read();
  int sock_client = accept(sock_server, (struct sockaddr *) &cli_addr, &clen);
  if (sock_client < 0)
  {
    printf("Error accepting the client! Err.No: %d\n", errno);
    return EXIT_FAILURE; // -1
  }
do
{
do  
{
  // Read and print the message from the Socket
  client_num = mblock->client_num;
  memset(buf, 0, BUF_SIZE);
  read(sock_client, buf, BUF_SIZE-1);
  buf[BUF_SIZE] = 0;
  printf("Received message from client ID:%d :> %s\n", client_num, buf);
  write(sock_client, "OK", 2);

  // Close Both Sockets

} while (buf != "!quit");

  mblock->client_lock = FREE;
  close(sock_client);

} while (mblock->client_num > 0);

  mblock->server_lock = FREE;
  close(sock_server);

  shmdt((void *) mblock);
  shmctl(shmid, IPC_RMID, 0);

  return EXIT_SUCCESS; // 1
}

