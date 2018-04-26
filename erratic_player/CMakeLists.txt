cmake_minimum_required(VERSION 2.8.3)
project(erratic_player)

find_package(catkin REQUIRED COMPONENTS roscpp tf player geometry_msgs nav_msgs std_msgs sensor_msgs message_generation)
find_package(player REQUIRED)

include_directories(${catkin_INCLUDE_DIRS})

add_message_files(
	DIRECTORY msg	
	FILES BatteryState.msg RangeArray.msg)

generate_messages(DEPENDENCIES std_msgs sensor_msgs)

catkin_package(
	CATKIN_DEPENDS roscpp tf player geometry_msgs nav_msgs std_msgs sensor_msgs message_runtime)

# Set the build type.  Options are:
#  Coverage       : w/ debug symbols, w/o optimization, w/ code-coverage
#  Debug          : w/ debug symbols, w/o optimization
#  Release        : w/o debug symbols, w/ optimization
#  RelWithDebInfo : w/ debug symbols, w/ optimization
#  MinSizeRel     : w/o debug symbols, w/ optimization, stripped binaries
set(ROS_BUILD_TYPE RelWithDebInfo)


add_executable(erratic_player src/erratic_player.cpp)
add_dependencies(erratic_player erratic_player_gencpp)
target_link_libraries(erratic_player ${catkin_LIBRARIES})
