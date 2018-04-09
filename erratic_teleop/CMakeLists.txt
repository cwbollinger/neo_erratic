cmake_minimum_required(VERSION 2.8.3)
project(erratic_teleop)

find_package(catkin REQUIRED COMPONENTS roscpp geometry_msgs)
find_package(Boost REQUIRED COMPONENTS thread system)

include_directories(${Boost_INCLUDE_DIRS} ${catkin_INCLUDE_DIRS})

catkin_package()

add_executable(erratic_keyboard_teleop src/keyboard.cpp)
target_link_libraries(erratic_keyboard_teleop ${Boost_LIBRARIES} ${catkin_LIBRARIES})
