/*
 *  Player - One Hell of a Robot Server
 *  Copyright (C) 2000  Brian Gerkey   &  Kasper Stoy
 *                      gerkey@usc.edu    kaspers@robotics.usc.edu
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 */
///////////////////////////////////////////////////////////////////////////
//
// Desc: Driver for faking localization data from simulation ground truth
// Author: Brian Gerkey
// Date: 4 April 2005
// CVS: $Id: fakelocalize.cc 7065 2008-10-06 01:31:46Z gbiggs $
//
// Requires - Localize device.
//
///////////////////////////////////////////////////////////////////////////

/** @ingroup drivers */
/** @{ */
/** @defgroup driver_fakelocalize fakelocalize
 * @brief Fake localization

The fakelocalize driver polls a simulation device for 2D ground truth pose
data, then reports this data as if it were generated by a localization
system.  This driver is useful for running software (e.g., @ref
util_playernav, @ref driver_wavefront) that needs a @ref
interface_localize device without incurring the computational
cost of actually running a localization algorithm.

@par Compile-time dependencies

- none

@par Provides

- @ref interface_localize
- @ref interface_position2d (optionally)

@par Requires

- @ref interface_simulation : the device from which to get ground truth

@par Configuration requests

- PLAYER_LOCALIZE_REQ_SET_POSE : acknowledged, but ignored

@par Configuration file options

- model (string)
  - Default: NULL
  - Name of simulation model for which we're faking localization.

@par Example

@verbatim
driver
(
  name "stage"
  provides ["6665:simulation:0"]
  plugin "libstage"
  worldfile "foo.world"
)
driver
(
  name "fakelocalize"
  provides ["6665:localize:0"]
  requires ["6665:simulation:0"]
  # a model (probably position) declared in "foo.world"
  model "robot0"
)
@endverbatim

@author Brian Gerkey

*/
/** @} */

#include <unistd.h>
#include <stddef.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include <string.h>

#include <libplayercore/playercore.h>

#define SLEEPTIME_NS 100000000

#define min(x,y) ((x) < (y) ? (x) : (y))

using namespace std;

// Driver for computing the free c-space from a laser scan.
class FakeLocalize : public Driver
{
  // Constructor
  public: FakeLocalize( ConfigFile* cf, int section);
  public: virtual ~FakeLocalize();

  // Setup/shutdown/run routines.
  public: virtual int Setup();
  public: virtual int Shutdown();
  public: virtual void Main();
  public: virtual int ProcessMessage(QueuePointer &resp_queue,
                                     player_msghdr * hdr,
                                     void * data);

  // Simulation stuff.
  private: int UpdateData();
  private: Device *sim;
  private: player_devaddr_t sim_id;
  private: player_devaddr_t localize_addr;
  private: player_devaddr_t position2d_addr;
  private: char* model;
};

// Initialization function
Driver* FakeLocalize_Init( ConfigFile* cf, int section)
{
  return ((Driver*) (new FakeLocalize( cf, section)));
}

// a driver registration function
void fakelocalize_Register(DriverTable* table)
{
  table->AddDriver("fakelocalize", FakeLocalize_Init);
}

////////////////////////////////////////////////////////////////////////////////
// Constructor
FakeLocalize::FakeLocalize( ConfigFile* cf, int section)
  : Driver(cf, section, true, PLAYER_MSGQUEUE_DEFAULT_MAXLEN),
  model (NULL)
{
  // Must have an input sim
  if (cf->ReadDeviceAddr(&this->sim_id, section, "requires",
                       PLAYER_SIMULATION_CODE, -1, NULL) != 0)
  {
    this->SetError(-1);
    return;
  }
  this->sim = NULL;
  memset(&(this->localize_addr), 0, sizeof(player_devaddr_t));
  memset(&(this->position2d_addr), 0, sizeof(player_devaddr_t));
  // Do we create a localize interface?
  if(cf->ReadDeviceAddr(&(this->localize_addr), section, "provides",
                        PLAYER_LOCALIZE_CODE, -1, NULL) == 0)
  {
    if(this->AddInterface(this->localize_addr))
    {
      this->SetError(-1);
      return;
    }
  }
  // Do we create a position2d interface?
  if(cf->ReadDeviceAddr(&(this->position2d_addr), section, "provides",
                        PLAYER_POSITION2D_CODE, -1, NULL) == 0)
  {
    if(this->AddInterface(this->position2d_addr))
    {
      this->SetError(-1);
      return;
    }
  }

  if (!((this->localize_addr.interf) || (this->position2d_addr.interf)))
  {
    this->SetError(-1);
    return;
  }

  const char * str = cf->ReadString(section, "model", NULL);
  if(str == NULL)
  {
    PLAYER_ERROR("must specify non-NULL model name");
    this->SetError(-1);
    return;
  }
  this->model = strdup(str);
  if (this->model == NULL)
  {
    PLAYER_ERROR("failed to duplicate model string");
    this->SetError(-1);
    return;
  }

  return;
}

FakeLocalize::~FakeLocalize()
{
  if(this->model != NULL)
    free(this->model);
}

////////////////////////////////////////////////////////////////////////////////
// Set up the device (called by server thread).
int FakeLocalize::Setup()
{
  // Subscribe to the sim.
  if(!(this->sim = deviceTable->GetDevice(this->sim_id)))
  {
    PLAYER_ERROR("unable to locate suitable simulation device");
    return -1;
  }
  if(this->sim->Subscribe(this->InQueue) != 0)
  {
    PLAYER_ERROR("unable to subscribe to simulation device");
    return -1;
  }

  this->StartThread();
  return 0;
}

////////////////////////////////////////////////////////////////////////////////
// Shutdown the device (called by server thread).
int FakeLocalize::Shutdown()
{
  this->StopThread();
  // Unsubscribe from devices.
  this->sim->Unsubscribe(this->InQueue);
  sim = NULL;

  return 0;
}

int
FakeLocalize::UpdateData()
{
  player_localize_data_t loc_data;
  player_position2d_data_t pos_data;
  player_simulation_pose2d_req_t cfg;

  // Request pose
  memset(&cfg, 0, sizeof cfg);
  cfg.name = this->model;
  cfg.name_count = strlen(cfg.name) + 1;

  Message * Reply = sim->Request(InQueue, PLAYER_MSGTYPE_REQ, PLAYER_SIMULATION_REQ_GET_POSE2D,
  		reinterpret_cast<void *>(&cfg), sizeof cfg, NULL);

  if (!Reply) return -1;
  if (Reply->GetHeader()->type == PLAYER_MSGTYPE_RESP_ACK)
  {
    // we got a good reply so update our data
    assert(Reply->GetDataSize() > 0);
    player_simulation_pose2d_req_t * resp = reinterpret_cast<player_simulation_pose2d_req_t *>(Reply->GetPayload());
    assert(resp);
    if (this->localize_addr.interf)
    {
      // Fill in loc_data
      memset(&loc_data, 0, sizeof loc_data);
      loc_data.pending_count = 0;
      loc_data.pending_time = Reply->GetHeader()->timestamp;
      loc_data.hypoths_count = 1;
      loc_data.hypoths = new player_localize_hypoth_t[1];

      loc_data.hypoths[0].mean = resp->pose;

      // zero covariance and max weight
      memset(loc_data.hypoths[0].cov, 0, sizeof loc_data.hypoths[0].cov);
      loc_data.hypoths[0].alpha = 1e6;

      Publish(this->localize_addr, PLAYER_MSGTYPE_DATA, PLAYER_LOCALIZE_DATA_HYPOTHS, reinterpret_cast<void *>(&loc_data));
      delete []loc_data.hypoths;
    }
    if (this->position2d_addr.interf)
    {
      // Fill in pos_data
      memset(&pos_data, 0, sizeof pos_data);
      pos_data.pos.px = resp->pose.px;
      pos_data.pos.py = resp->pose.py;
      pos_data.pos.pa = resp->pose.pa;
      this->Publish(this->position2d_addr, PLAYER_MSGTYPE_DATA, PLAYER_POSITION2D_DATA_STATE,
                                          reinterpret_cast<void *>(&pos_data), sizeof pos_data, NULL);
    }
    delete Reply;
    Reply = NULL;
  }
  else
  {
  	// we got an error, that's bad
  	delete Reply;
  	return -1;
  }

  return 0;
}

void
FakeLocalize::Main()
{
  struct timespec ts;

  for(;;)
  {
    if(this->UpdateData() < 0)
    {
      PLAYER_ERROR("failed to get pose from simulation device");
      pthread_exit(NULL);
    }
    this->ProcessMessages();
    ts.tv_sec = 0;
    ts.tv_nsec = SLEEPTIME_NS;
    nanosleep(&ts, NULL);
  }
}

int FakeLocalize::ProcessMessage(QueuePointer &resp_queue,
				 player_msghdr * hdr,
				 void * data)
{
  // Is it a request to set the filter's pose?
  if(Message::MatchMessage(hdr, PLAYER_MSGTYPE_REQ,
                           PLAYER_LOCALIZE_REQ_SET_POSE,
                           this->localize_addr))
    {
      player_simulation_pose2d_req_t req;
      player_localize_set_pose_t * setposereq = (player_localize_set_pose_t*)data;
      assert(setposereq);
      req.pose.px = setposereq->mean.px;
      req.pose.py = setposereq->mean.py;
      req.pose.pa = setposereq->mean.pa;

      req.name = this->model;
      req.name_count = strlen(req.name) + 1;

      // look up the named model
      Message * Reply = sim->Request(InQueue, PLAYER_MSGTYPE_REQ,
				     PLAYER_SIMULATION_REQ_SET_POSE2D,
				     reinterpret_cast<void *>(&req), sizeof req, NULL);
      if (!Reply) return -1;
      if (Reply->GetHeader()->type == PLAYER_MSGTYPE_RESP_ACK)
	{
	  // Send an ACK
	  this->Publish(this->localize_addr, resp_queue,
			PLAYER_MSGTYPE_RESP_ACK,
			PLAYER_LOCALIZE_REQ_SET_POSE);
	  return 0;
	}
      else
	{
	  delete Reply;
	  return -1;
	}
    }
  // Is it a request for the current particle set?
  else if(Message::MatchMessage(hdr, PLAYER_MSGTYPE_REQ,
                                PLAYER_LOCALIZE_REQ_GET_PARTICLES,
                                this->localize_addr))
    {
      player_simulation_pose2d_req_t cfg;

      // Request pose
      cfg.name = this->model;
      cfg.name_count = strlen(cfg.name) + 1;

      Message * Reply = sim->Request(InQueue, PLAYER_MSGTYPE_REQ, PLAYER_SIMULATION_REQ_GET_POSE2D,
				     reinterpret_cast<void *>(&cfg), sizeof cfg, NULL);
      if (!Reply) return -1;
      if (Reply->GetHeader()->type == PLAYER_MSGTYPE_RESP_ACK)
	{
	  assert(Reply->GetDataSize() == sizeof cfg);
	  player_simulation_pose2d_req_t * ans = reinterpret_cast<player_simulation_pose2d_req_t *> (Reply->GetPayload());
	  assert(ans);
	  player_localize_get_particles_t resp;
	  resp.mean.px = ans->pose.px;
	  resp.mean.py = ans->pose.py;
	  resp.mean.pa = ans->pose.pa;
	  resp.variance = 0;

	  resp.particles_count = 1;
	  for(uint32_t i=0;i<resp.particles_count;i++)
	    {
	      resp.particles[i].pose.px = ans->pose.px;
	      resp.particles[i].pose.py = ans->pose.py;
	      resp.particles[i].pose.pa = ans->pose.pa;
	      resp.particles[i].alpha = 1;
	    }

	  this->Publish(this->localize_addr, resp_queue,
			PLAYER_MSGTYPE_RESP_ACK,
			PLAYER_LOCALIZE_REQ_GET_PARTICLES,
			(void*)&resp, sizeof(resp), NULL);
	  delete Reply;
	  Reply = NULL;

	  return 0;
	}
      else
	{
	  delete Reply;
	  return -1;
	}
    }
  return -1;
}
