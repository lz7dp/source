#ifndef SHMEM_TYPES
#define SHMEM_TYPES
#define FTOK_FILE "./netserver"
#define MAXLEN 512
#define FREE 1
#define BUSY 0
#define SERVER 1
#define NOCLIENT 0
#define CLIENT 0
#define CLIENT1 1
#define CLIENT2 2
#define PORT 20041

struct memory_block
{
   int server_port;
   int server_lock;
   int client_lock;
   int client_num;
   int turn;
   int readlast;
};
#endif
