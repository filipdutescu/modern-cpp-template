cmake_minimum_required(VERSION 3.15)

project(
  Tests
  LANGUAGES CXX
)

file(GLOB_RECURSE sources CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")
add_executable(Tests ${sources})

find_package(GTest)
target_link_libraries(
    Tests 
    PUBLIC
        GTest::GTest
)

add_test(
  NAME
    UnitTests
  COMMAND
    ${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_BINDIR}/Tests
)
