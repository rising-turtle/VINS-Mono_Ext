cmake_minimum_required(VERSION 2.8.3)
project(feature_tracker_ext)

set(CMAKE_BUILD_TYPE "Release")
set(CMAKE_CXX_FLAGS "-std=c++11 -O3 -w -mssse3")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -w -g -mssse3")

find_package(catkin REQUIRED COMPONENTS
    roscpp
    std_msgs
    sensor_msgs
    cv_bridge
    camera_model
    rosbag
    )

find_package(OpenCV REQUIRED)

catkin_package()

include_directories(
    ${catkin_INCLUDE_DIRS}
    )

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
# find_package(Eigen3  REQUIRED)
include_directories("/usr/include/eigen3")
include_directories(
  ${catkin_INCLUDE_DIRS}
  ${EIGEN3_INCLUDE_DIR}
)

add_executable(feature_tracker_ext
    src/feature_tracker_node.cpp
    src/parameters.cpp
    src/feature_tracker.cpp
    )

target_link_libraries(feature_tracker_ext ${catkin_LIBRARIES} ${OpenCV_LIBS})

add_executable(feature_tracker_ext_bag
    src/feature_tracker_node_bag.cpp
    src/parameters.cpp
    src/feature_tracker.cpp)

target_link_libraries(feature_tracker_ext_bag ${catkin_LIBRARIES} ${OpenCV_LIBS})

# New freak node 
add_subdirectory(freak)

add_executable(freak_tracker 
    src/freak_node.cpp
    src/parameters.cpp
    src/feature_tracker.cpp
    src/freak_tracker.cpp
    src/frontend.cpp
    src/keyframe.cpp
    )
target_link_libraries(freak_tracker freak ${catkin_LIBRARIES} ${OpenCV_LIBS})

add_executable(test_cam_model src/test_cam_model.cpp)
target_link_libraries(test_cam_model ${catkin_LIBRARIES})

