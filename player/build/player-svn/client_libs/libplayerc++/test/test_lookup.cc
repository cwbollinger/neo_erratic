/*
 * $Id: test_lookup.cc 3971 2007-02-02 17:12:04Z gerkey $
 *
 * a test for the player robot nameservice
 */

#include "test.h"

int
test_lookup(PlayerClient* client, int index)
{
  char robotname[] = "robot0";
  int port;

  printf("nameservice test, using robot \"%s\"\n", robotname);
  TEST("looking up port");
  port = client->LookupPort(robotname);
  if(port < 0)
  {
    printf("the request failed");
    FAIL();
    return -1;
  }
  else if(port == 0)
  {
    printf("couldn't find the indicated robot");
    FAIL();
    return -1;
  }
  printf("got port %d\n", port);
  PASS();

  return(0);
}

