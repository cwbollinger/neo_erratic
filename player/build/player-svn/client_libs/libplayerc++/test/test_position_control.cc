/*
 * $Id: test_position_control.cc 3971 2007-02-02 17:12:04Z gerkey $
 *
 * a test for the C++ PositionProxy
 */

#include "test.h"
#include <unistd.h>
#include <math.h>

int
test_position_control(PlayerClient* client, int index)
{
  unsigned char access;
  PositionProxy pp(client,index,'c');

  printf("device [position] index [%d]\n", index);

  TEST("subscribing (read/write)");
  if((pp.ChangeAccess(PLAYER_ALL_MODE,&access) < 0) ||
     (access != PLAYER_ALL_MODE))
  {
    FAIL();
    printf("DRIVER: %s\n", pp.driver_name);
    return -1;
  }
  PASS();

  printf("DRIVER: %s\n", pp.driver_name);

  // wait for P2OS to start up
  for(int i=0;i<20;i++)
    client->Read();

  TEST("resetting odometry");
  if(pp.ResetOdometry() < 0)
  {
    FAIL();
    return(-1);
  }
  sleep(1);
  PASS();
  
  TEST("changing to position control");
  if(pp.SelectPositionMode(1) < 0)
    {
      FAIL();
      return(-1);
    }
  sleep(1);
  PASS();
  
  TEST("enabling motors");
  if(pp.SetMotorState(1) < 0)
  {
    FAIL();
    return(-1);
  }
  PASS();

  double poses[][3] = { {0.4,0.4,DTOR(45)}, 
    {0.4,-0.4,DTOR(315)}, 
    {-0.4,0.4,DTOR(225)}, 
    {-0.4,-0.4,DTOR(135)}, 
    {0,0,0}
  };

  int num_poses = 5;
  int cycles_allowed = 60;

  // test is passed if robot moves to correct position within these
  // tolerances
  int xtolerance = 50; //mm
  int ytolerance = 50; //mm
  int atolerance = 5; //degrees

  double xerror, yerror, aerror;
  
  for( int p=0; p<num_poses; p++ )
    {
      TEST( "Position control\n" );
      
      pp.GoTo( poses[p][0], poses[p][1], poses[p][2] );
      
      for( int c=0; c<cycles_allowed; c++ )
	{
	  client->Read();
	  
	  xerror = fabs(poses[p][0]-pp.xpos);
	  yerror = fabs(poses[p][1]-pp.ypos);
	  aerror = fabs(poses[p][2]-pp.theta);

	  printf( "\r Goal: [%.3f %.3f %.3f]"
		  " Actual: [%.3f %.3f %.3f]"
		  " Error: [%.3f %.3f %.3f]"
		  " Step %d/%d                 ", 
		  poses[p][0],  poses[p][1], poses[p][2], 
		  pp.xpos, pp.ypos, pp.theta,
		  xerror, yerror, aerror,
		  c, cycles_allowed );
	  
	  fflush(stdout);
	}

      if( xerror < xtolerance && 
	  yerror < ytolerance && 
	  aerror < atolerance ) 
	PASS();
      else
	FAIL();
    }
  
  TEST("stopping");
  if(pp.SetSpeed(0,0) < 0)
    {
      FAIL();
      return(-1);
    }
  sleep(3);
  PASS();

  TEST("disabling motors");
  if(pp.SetMotorState(0) < 0)
  {
    FAIL();
    return(-1);
  }
  sleep(1);
  PASS();

  TEST("resetting odometry");
  if(pp.ResetOdometry() < 0)
  {
    FAIL();
    return(-1);
  }
  sleep(1);
  PASS();

  TEST("unsubscribing");
  if((pp.ChangeAccess(PLAYER_CLOSE_MODE,&access) < 0) ||
     (access != PLAYER_CLOSE_MODE))
  {
    FAIL();
    return -1;
  }

  PASS();

  return(0);
}

