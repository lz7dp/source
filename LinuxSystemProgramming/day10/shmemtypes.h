#ifndef SHMEM_TYPES
#define SHMEM_TYPES
#define FTOK_FILE "./netserver"
#define MAXLEN 2000
#define FREE 1
#define BUSY 0
#define SERVER 1
#define CLIENT 0
#define CLIENT1 1
#define CLIENT2 2
#define CLIENT3 3
#define CLIENT4 4
#define PORT 20041
#define POLITE 1
#define NOPOLITE 0

struct memory_block
{
   int server_port;
   int server_lock;
   int client_lock;
   int client_num;
   int turn;
   int readlast;
   int server_polite;
};
#endif
