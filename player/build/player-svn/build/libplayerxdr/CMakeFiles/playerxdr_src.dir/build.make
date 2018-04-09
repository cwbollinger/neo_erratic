# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build

# Utility rule file for playerxdr_src.

# Include the progress variables for this target.
include libplayerxdr/CMakeFiles/playerxdr_src.dir/progress.make

libplayerxdr/CMakeFiles/playerxdr_src: libplayerxdr/playerxdr.h
libplayerxdr/CMakeFiles/playerxdr_src: libplayerxdr/playerxdr.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating playerxdr.?"

libplayerxdr/playerxdr.h: ../libplayercore/interfaces/062_ranger.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/052_position1d.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/009_audio.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/006_laser.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/057_wsn.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/040_camera.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/063_vectormap.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/044_planner.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/058_graphics3d.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/012_speech.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/020_dio.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/022_ir.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/061_pointcloud3d.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/003_gripper.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/026_mcom.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/025_localize.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/064_blackboard.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/013_gps.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/053_actarray.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/060_imu.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/056_rfid.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/033_blinkenlight.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/008_ptz.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/050_speech_recognition.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/007_blobfinder.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/042_map.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/055_graphics2d.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/054_limb.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/051_opaque.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/030_position3d.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/021_aio.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/005_sonar.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/031_simulation.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/059_health.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/065_stereo.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/004_position2d.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/001_player.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/045_log.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/002_power.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/049_joystick.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/014_bumper.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/023_wifi.def
libplayerxdr/playerxdr.h: ../libplayercore/interfaces/010_fiducial.def
libplayerxdr/playerxdr.h: libplayerxdr/player_interfaces.h
	$(CMAKE_COMMAND) -E cmake_progress_report /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating playerxdr.h, playerxdr.c"
	cd /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayerxdr && /usr/bin/python /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayerxdr/playerxdrgen.py -distro /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/player.h /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayerxdr/playerxdr.c /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayerxdr/playerxdr.h /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayerxdr/player_interfaces.h

libplayerxdr/playerxdr.c: libplayerxdr/playerxdr.h

libplayerxdr/player_interfaces.h:
	$(CMAKE_COMMAND) -E cmake_progress_report /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating player_interfaces.h"
	cd /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayerxdr && /usr/bin/python /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/playerinterfacegen.py /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayercore/interfaces > /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayerxdr/player_interfaces.h

playerxdr_src: libplayerxdr/CMakeFiles/playerxdr_src
playerxdr_src: libplayerxdr/playerxdr.h
playerxdr_src: libplayerxdr/playerxdr.c
playerxdr_src: libplayerxdr/player_interfaces.h
playerxdr_src: libplayerxdr/CMakeFiles/playerxdr_src.dir/build.make
.PHONY : playerxdr_src

# Rule to build all files generated by this target.
libplayerxdr/CMakeFiles/playerxdr_src.dir/build: playerxdr_src
.PHONY : libplayerxdr/CMakeFiles/playerxdr_src.dir/build

libplayerxdr/CMakeFiles/playerxdr_src.dir/clean:
	cd /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayerxdr && $(CMAKE_COMMAND) -P CMakeFiles/playerxdr_src.dir/cmake_clean.cmake
.PHONY : libplayerxdr/CMakeFiles/playerxdr_src.dir/clean

libplayerxdr/CMakeFiles/playerxdr_src.dir/depend:
	cd /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/libplayerxdr /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayerxdr /home/bollingc/catkin_ws/src/erratic_robot/player/build/player-svn/build/libplayerxdr/CMakeFiles/playerxdr_src.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libplayerxdr/CMakeFiles/playerxdr_src.dir/depend
