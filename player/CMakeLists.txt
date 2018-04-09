cmake_minimum_required(VERSION 2.8.3)
project(player)

find_package(catkin REQUIRED)

include_directories(${catkin_INCLUDE_DIRS})

execute_process(
	COMMAND make
	WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})

set(player_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/player/include/player-2.2)
set(player_LIBRARIES ${PROJECT_SOURCE_DIR}/player/lib)

catkin_package(
	INCLUDE_DIRS ${player_INCLUDE_DIRS}
	LIBRARIES ${player_LIBRARIES}/libplayercore.so ${player_LIBRARIES}/libplayerxdr.so ${player_LIBRARIES}/libplayerutils.so ${player_LIBRARIES}/libplayerdrivers.so)


