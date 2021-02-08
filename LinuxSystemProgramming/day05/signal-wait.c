#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>

// Signal Handlert
void signal_handler(int i)
{
   printf ("Terminating!\n");
   exit(EXIT_SUCCESS); // 1
}

// Main program
int main(int argc, char ** argv) 
{
   // Initialization
   int sig;
   struct sigaction sa;
   sigset_t newset;

   // Signal
   sigemptyset(&newset);
   sa.sa_flags = 0;
   sa.sa_handler = signal_handler;
   sigaction(SIGINT, &sa, NULL);

   // Print Info
   printf("My pid is %i\n", getpid());
   printf("Waiting...\n");

   // TODO
   while(!sigwait(&newset, &sig)) printf("SIGINT recieved\n");

   return EXIT_FAILURE; // -1
}
