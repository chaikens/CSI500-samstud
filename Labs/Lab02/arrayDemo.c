#include <unistd.h> /*For interfaces to read, write, and standard file 
		      descriptors. */
#include <stdlib.h> /* exit() */
#include <stdio.h>  /* perror() */
#include <string.h> /* strlen() (Standard C-string library) */

static void print_input_help()
{
  char *m = "Please type up to 9 chars.  My process will block, waiting for you.\n";
  write(STDERR_FILENO, m, strlen(m));
  return ;
}

#define BUFFSIZE 10
char buff[BUFFSIZE];

int main(int argc, char *argv[])
{
  int nread;
  int i;
  print_input_help();
  nread = read(STDIN_FILENO, buff, BUFFSIZE);
  if( nread == -1 )
    {
      perror("Reading failed.");
      exit(1);
    }
  write(STDOUT_FILENO, buff, nread);
  i = 0;
  while( buff[i] != '\n' )
    {
      buff[i] = buff[i] + 2;
      i = i + 1;
    }
  write(STDOUT_FILENO, buff, nread);
  exit(0);
}
