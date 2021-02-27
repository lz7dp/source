
#include<stdlib.h>
#include<sys/types.h>
#include<sys/socket.h>
#include <errno.h>
#include<string.h>
#include <netinet/in.h>
#include <arpa/inet.h>

class client1{

static void Main(string[] args)
{
    int byte_count;
    struct sockaddr_in serveraddr;
    char *servername;
    char buf[256];
    socklen_t addr_size;
    int sockfd;

    sockfd=socket(AF_INET,SOCK_STREAM,0);
    bzero(&serveraddr,sizeof(serveraddr));
    serveraddr.sin_family=AF_INET;
    serveraddr.sin_port=htons(11378);
    servername=gethostbyname("localhost");
    inet_pton(AF_INET,servername,&serveraddr.sin_addr);

    addr_size=sizeof(serveraddr);
    if(connect(sockfd,(struct sockaddr *)&serveraddr,addr_size)==-1)
    {
        perror("connect");
        exit(1);
    }

    byte_count = recv(sockfd, buf, sizeof buf, 0);
    printf("recived %d bytes of data in buf\n", byte_count);

    close(sockfd);
}
}