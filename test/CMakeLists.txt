cmake_minimum_required(VERSION 3.15)

project(
  Tests
  LANGUAGES CXX
)

file(GLOB_RECURSE test_sources CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/src/**.cpp")
add_executable(Tests ${test_sources})

target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_17)

find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})
target_link_libraries(
  Tests 
  PUBLIC
    ${GTEST_BOTH_LIBRARIES}
    Project
)

add_test(
  NAME
    Tests
  COMMAND
    Tests
)
