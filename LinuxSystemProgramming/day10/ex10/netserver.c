#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "message.h"

#define MAX_BUF 256

void receiveMessage(char *buf)
{
    struct Message *message;
    message = (struct Message *)buf;

    printf("%s: %s\n", message->name, message->data);
}

void sendMessage(int sock_fd, char *buf, int count)
{
    write(sock_fd, buf, count);
}

int main(int argc, char* argv[])
{
    int sock_fd, new_fd, max_fd;
    socklen_t addrlen;
    struct sockaddr_in my_name, peer_name;
    int status;
    char recv_buf[MAX_BUF];
    int nbytes;
    int i, j, ret;
    fd_set read_fds_master, read_fds;
    int on = 1;
    int port;

    if (argc < 2) {
        fprintf(stderr, "Usage: %s port_number\n", argv[0]);
        exit(1);
    }

    // create a socket
    sock_fd = socket(AF_INET, SOCK_STREAM, 0);
    if (sock_fd == -1) {
        perror("Socket creation error");
        exit(1);
    }

    // for "Address already in use" error message
    if (setsockopt(sock_fd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(int)) == -1) {
        perror("Setsockopt error");
        exit(1);
    }

    // server address
    my_name.sin_family = AF_INET;
    my_name.sin_addr.s_addr = INADDR_ANY;
    port = atoi(argv[1]);
    my_name.sin_port = htons(port);

    status = bind(sock_fd, (struct sockaddr *)&my_name, sizeof(my_name));
    if (status == -1) {
        perror("Binding error");
        exit(1);
    }
    printf("server ip=%s:%d\n", inet_ntoa(my_name.sin_addr), port);

    status = listen(sock_fd, 5);
    if (status == -1) {
        perror("Listening error");
        exit(1);
    }

    addrlen = sizeof(peer_name);
    // set up variables for select
    max_fd = sock_fd;
    FD_ZERO(&read_fds_master);
    FD_SET(sock_fd, &read_fds_master);

    while(1)
    {
        // copy fd set
        read_fds = read_fds_master;
        ret = select(max_fd+1, &read_fds, NULL, NULL, NULL);
        if (ret == -1) {
            perror("Select");
            return -1;
        } else if (ret == 0) {
            printf("Select timeout\n");
            continue;
        }

        for (i = 0; i < max_fd+1; i++) {
            if (FD_ISSET(i, &read_fds)) {
                if (i == sock_fd) {
                    // wait for a connection
                    new_fd = accept(sock_fd, (struct sockaddr *)&peer_name, &addrlen);
                    printf("accecpt fd%d ip=%s:%d\n", new_fd,
                            inet_ntoa(peer_name.sin_addr), ntohs(peer_name.sin_port));

                    if (new_fd == -1) {
                        perror("Wrong connection");
                        exit(1);
                    }

                    // add to fd set
                    FD_SET(new_fd, &read_fds_master);
                    if (new_fd > max_fd) {
                        max_fd = new_fd;
                    }

                    // send "new user login" message to other connected clients
                    for (j = 0; j < max_fd+1; j++) {
                        if (FD_ISSET(j, &read_fds_master)) {
                            if (j != sock_fd && j != new_fd) {
                                struct Message message;
                                memset(&message, 0, sizeof(struct Message));
                                strcpy(message.name, "server");
                                strcpy(message.data, "new user login");
                                write(j, &message, sizeof(struct Message));
                            }
                        }
                    }
                } else {
                    // already connected socket
                    memset(recv_buf, 0, sizeof(recv_buf));
                    nbytes = read(i, recv_buf, sizeof(recv_buf));
                    if (nbytes == 0) {
                        // connection closed
                        close(i);
                        printf("client fd%d disconnect\n", i);

                        // remove from fd set
                        FD_CLR(i, &read_fds_master);
                        break;
                    } else {
                        receiveMessage(recv_buf);
                    }

                    // send message to connected clients
                    for (j = 0; j < max_fd+1; j++) {
                        if (FD_ISSET(j, &read_fds_master)) {
                            if (j != sock_fd && j != i) {
                                sendMessage(j, recv_buf, sizeof(struct Message));
                            }
                        }
                    }
                }
            }
        }
    }

    return 0;
}

