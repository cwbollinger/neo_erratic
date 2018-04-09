# Install script for directory: /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/server/drivers

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

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/actarray/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/audio/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/base/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/blackboard/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/blobfinder/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/camera/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/fiducial/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/gps/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/health/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/imu/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/joystick/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/laser/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/limb/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/localization/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/map/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/mcom/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/mixed/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/opaque/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/planner/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/pointcloud3d/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/position/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/ptz/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/ranger/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/rfid/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/service_adv/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/shell/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/sonar/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/speech/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/stereo/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/vectormap/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/wifi/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/wsn/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

