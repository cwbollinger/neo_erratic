# Install script for directory: /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/server/drivers/camera

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
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/camera/v4l/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/camera/1394/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/camera/compress/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/camera/cvcam/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/camera/imageseq/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/camera/sphere/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/camera/uvc/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/camera/yarp/cmake_install.cmake")
  INCLUDE("/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/server/drivers/camera/unicap/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

