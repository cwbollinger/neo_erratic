# Install script for directory: /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayercore/libplayercore.so.2.2.0"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayercore/libplayercore.so.2.2"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayercore/libplayercore.so"
    )
  FOREACH(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplayercore.so.2.2.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplayercore.so.2.2"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplayercore.so"
      )
    IF(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      IF(CMAKE_INSTALL_DO_STRIP)
        EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "${file}")
      ENDIF(CMAKE_INSTALL_DO_STRIP)
    ENDIF()
  ENDFOREACH()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayercore/playercore.pc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayercore/libplayererror.so.2.2.0"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayercore/libplayererror.so.2.2"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayercore/libplayererror.so"
    )
  FOREACH(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplayererror.so.2.2.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplayererror.so.2.2"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplayererror.so"
      )
    IF(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      IF(CMAKE_INSTALL_DO_STRIP)
        EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "${file}")
      ENDIF(CMAKE_INSTALL_DO_STRIP)
    ENDIF()
  ENDFOREACH()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayercore/playererror.pc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayercore/libplayerutils.so.2.2.0"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayercore/libplayerutils.so.2.2"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayercore/libplayerutils.so"
    )
  FOREACH(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplayerutils.so.2.2.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplayerutils.so.2.2"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplayerutils.so"
      )
    IF(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      IF(CMAKE_INSTALL_DO_STRIP)
        EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "${file}")
      ENDIF(CMAKE_INSTALL_DO_STRIP)
    ENDIF()
  ENDFOREACH()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayercore/playerutils.pc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/player-2.2/libplayercore" TYPE FILE FILES
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/addr_util.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/configfile.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/device.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/devicetable.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/driver.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/drivertable.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/error.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/filewatcher.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/globals.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/interface_util.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/message.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/playercommon.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/playerconfig.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/playercore.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/player.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayercore/player_interfaces.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/playertime.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/plugins.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/property.h"
    "/home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/wallclocktime.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

