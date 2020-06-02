cmake_minimum_required(VERSION 3.15)

#
# Project details
#

project(
  ${CMAKE_PROJECT_NAME}Tests
  LANGUAGES CXX
)

#
# Set the sources for the unit tests and add the executable(s)
#

set(test_sources 
  src/tmp_test.cpp
)
add_executable(${PROJECT_NAME} ${test_sources})

#
# Set the compiler standard
#

target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_17)

#
# Load the desired unit testing framework
#
# Currently supported: GoogleTest (and GoogleMock), Catch2.

if(USE_GTEST)
  find_package(GTest REQUIRED)

  if(USE_GOOGLE_MOCK)
    set(GOOGLE_MOCK_LIBRARIES GTest::gmock GTest::gmock_main)
  endif()

  target_link_libraries(
    ${PROJECT_NAME} 
    PUBLIC
      GTest::gtest
      GTest::gtest_main
      ${GOOGLE_MOCK_LIBRARIES}
      Project
  )
elseif(USE_CATCH2)
  find_package(Catch2 REQUIRED)
  target_link_libraries(
    ${PROJECT_NAME} 
    PUBLIC
      Catch2::Catch2
      Project
  )
else()
  message(FATAL_ERROR "Unknown testing library. Please setup your desired unit testing library by using `target_link_libraries`.")  
endif()

#
# Add the unit tests
#

add_test(
  NAME
    ${PROJECT_NAME}
  COMMAND
    ${PROJECT_NAME}
)
