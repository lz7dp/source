#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/socket.h>
#include <errno.h>
#include<string.h>
#include <netinet/in.h>
#include <arpa/inet.h>

int main(void)
{
    int sockid,newsockid;
    socklen_t addr_size;
    char *msg="What a beautiful morning!";
    int len, bytes_sent;
    sockid=socket(AF_INET,SOCK_STREAM,0);
    if(sockid==-1)
    {
        perror("socket");
        exit(1);
    }
    else
        printf("created");
    struct sockaddr_in serveraddr,clientaddr;
    bzero((char *)&serveraddr,sizeof(serveraddr));
    serveraddr.sin_family=AF_INET;
    serveraddr.sin_port=htons(7400);
    serveraddr.sin_addr.s_addr=INADDR_ANY;

    if(bind(sockid,(struct sockaddr *)&serveraddr,sizeof(serveraddr))<0)
    {
        perror("bind");
        return -1;
    }

    listen(sockid,5);
    addr_size=sizeof(clientaddr);
    newsockid=accept(sockid,(struct sockaddr *)&clientaddr,&addr_size);
    len = strlen(msg);
    bytes_sent = send(sockid, msg, len, 0);
    close(sockid);
}