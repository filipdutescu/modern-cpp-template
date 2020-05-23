cmake_minimum_required(VERSION 3.15)

project(
  ${CMAKE_PROJECT_NAME}Tests
  LANGUAGES CXX
)

file(GLOB_RECURSE test_sources CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/src/**.cpp")
add_executable(${PROJECT_NAME} ${test_sources})

target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_17)

if(USE_GTEST)
  find_package(GTest REQUIRED)
  target_link_libraries(
    ${PROJECT_NAME} 
    PUBLIC
      GTest::gtest
      GTest::gtest_main
      Project
  )
endif()

add_test(
  NAME
    ${PROJECT_NAME}
  COMMAND
    ${PROJECT_NAME}
)
