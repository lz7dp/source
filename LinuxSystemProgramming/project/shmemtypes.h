#ifndef SHMEM_TYPES
#define SHMEM_TYPES
#define FTOK_FILE "./haiku-master-daemon"
#define MAXLEN 256
#define FREE 1
#define BUSY 0
#define SERVER 1
#define CLIENT 0
#define PORT 10041
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
   int haiku_ready;
   int sleep_time;
   char * word_file;
};
#endif

