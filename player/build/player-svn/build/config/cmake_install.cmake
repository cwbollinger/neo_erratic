# Install script for directory: /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/player")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "RELEASE")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/player/config" TYPE FILE FILES
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/amigobot.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/amigobot_tcp.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/amtecM5.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/b21r_rflex_lms200.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/cvcam.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/dummy.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/erratic.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/hokuyo_aist.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/iwspy.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/joystick.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/lms400.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/magellan.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/mapfile.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/mbicp.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/nomad.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/obot.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/passthrough.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/phidgetIFK.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/phidgetRFID.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/pioneer.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/pioneer_rs4euze.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/pointcloud3d.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/readlog.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/rfid.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/roomba.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/segwayrmp.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/service_adv.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/simple.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/sphere.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/umass_ATRVJr.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/umass_ATRVMini.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/umass_reb.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/urglaser.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/vfh.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/wavefront.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/wbr914.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/writelog.cfg"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/config/wsn.cfg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

