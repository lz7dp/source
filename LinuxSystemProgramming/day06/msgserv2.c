#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <string.h>
#include "msgtypes.h"
int main(int argc, char * argv[])
{
struct msg_1_t message1;
struct msg_2_t message2;
int msgid;
char * response = "Ok!";
msgid = msgget(KEY, 0777 | IPC_CREAT);
msgrcv(msgid, &message1, sizeof(struct msg_1_t), 1, 0);
printf("Client (pid = %i) sent: %s", message1.snd_pid, message1.body);
message2.mtype = 2;
message2.snd_pid = getpid();
message2.rcv_pid = message1.snd_pid;
strcpy(message2.body, response);
msgsnd(msgid, &message2, sizeof(struct msg_2_t), 0);
msgrcv(msgid, &message1, sizeof(struct msg_1_t), 1, 0);
msgctl(msgid, IPC_RMID, 0);
return EXIT_SUCCESS;
}

