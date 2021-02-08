#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "message.h"

#define MAX_BUF 256

struct Message message;

void initMessage(char *username)
{
    memset(&message, 0, sizeof(struct Message));
    strcpy(message.name, username);
}

void sendMessage(int sock_fd, char *buf, int count)
{
    memset(message.data, 0, sizeof(message.data));
    strcpy(message.data, buf);

    write(sock_fd, &message, sizeof(struct Message));
}

void receiveMessage(char *buf)
{
    struct Message *message;
    message = (struct Message *)buf;

    printf("%s: %s\n", message->name, message->data);
}

int main(int argc, char* argv[])
{
    int sock_fd, max_fd;
    struct sockaddr_in serv_name;
    int status;
    char buf[MAX_BUF];
    int nbytes;
    int ret;
    fd_set read_fds_master, read_fds;

    if (argc < 4) {
        fprintf(stderr, "Usage: %s ip_address port_number username\n", argv[0]);
        exit(1);
    }

    initMessage(argv[3]);

    // create a socket
    sock_fd = socket(AF_INET, SOCK_STREAM, 0);
    if (sock_fd == -1) {
        perror("Socket creation");
        exit(1);
    }

    // server address
    serv_name.sin_family = AF_INET;
    inet_aton(argv[1], &serv_name.sin_addr);
    serv_name.sin_port = htons(atoi(argv[2]));

    // connect to the server
    status = connect(sock_fd, (struct sockaddr *)&serv_name, sizeof(serv_name));
    if (status == -1) {
        perror("Connection error");
        exit(1);
    }

    // set up variables for select
    max_fd = sock_fd;
    FD_ZERO(&read_fds_master);
    FD_SET(STDIN_FILENO, &read_fds_master);
    FD_SET(sock_fd, &read_fds_master);

    while(1) {
        // copy fd set
        read_fds = read_fds_master;

        // check to see if we can read from STDIN or sock_fd
        ret = select(max_fd+1, &read_fds, NULL, NULL, NULL);
        if (ret == -1) {
            perror("Select");
            return -1;
        } else if (ret == 0) {
            printf("Select timeout\n");
            continue;
        }

        // get input from STDIN and send message to server
        if (FD_ISSET(STDIN_FILENO, &read_fds)) {
            nbytes = read(STDIN_FILENO, buf, sizeof(buf));
            if (nbytes > 0 && buf[0] != '\n') {
                // place a null terminator at the end of the string
                buf[nbytes-1] = '\0';
                sendMessage(sock_fd, buf, nbytes);
            }
        }

        // recevie message from server
        if (FD_ISSET(sock_fd, &read_fds)) {
            memset(buf, 0, sizeof(buf));
            nbytes = read(sock_fd, buf, sizeof(buf));
            if (nbytes == 0) {
                // connection closed
                printf("server disconnect\n");
                break;
            } else {
                receiveMessage(buf);
            }
        }
    }
    close(sock_fd);

    return 0;
}

