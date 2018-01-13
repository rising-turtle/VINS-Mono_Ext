cmake_minimum_required(VERSION 2.8.3)
project(sync_time)

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
find_package(Eigen3  REQUIRED)
include_directories(
  ${catkin_INCLUDE_DIRS}
  ${EIGEN3_INCLUDE_DIR}
  ../vins_estimator/src
)

## vision only SFM 
add_executable(vision_sfm
    src/vision_sfm.cpp
    src/read_file.cpp
    src/track_feature.cpp
    src/feature_manager.cpp
    src/bundle_adjust.cpp
    )

target_link_libraries(vision_sfm initializer ${catkin_LIBRARIES} ${OpenCV_LIBS})

## align IMU's integration to SFM's result 
add_executable(sync_time
    src/main_sync_time.cpp
    src/read_file.cpp
    src/shift_imu.cpp
    src/rotation_error.cpp
    src/imu_structure.cpp
)
target_link_libraries(sync_time ${catkin_LIBRARIES})



