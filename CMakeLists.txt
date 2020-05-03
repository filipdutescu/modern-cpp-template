cmake_minimum_required(VERSION 3.15 FATAL_ERROR)

#
# Project details
#
project(
  "project_name" 
  VERSION 0.1.0 
  LANGUAGES CXX
)
set(LOWERCASE_PROJECT_NAME "project_name")
include(cmake/StandardSettings.cmake)

#
# Prevent building in the source directory
#

if(PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
  message(FATAL_ERROR "In-source builds not allowed. Please make a new directory (called a build directory) and run CMake from there.")
endif()

#
# Create library, setup header and source files
#

# Header-only libraries should define the following CMake options, rather than the current ones
#add_library(${PROJECT_NAME} INTERFACE)
#set_target_properties(${PROJECT_NAME} PROPERTIES INTERFACE_COMPILE_FEATURES cxx_std_17)

add_library(
  ${PROJECT_NAME}
  src/*.cpp
)
set_target_properties(${PROJECT_NAME} PROPERTIES cxx_std_17)

#
# Set the build/user include directories
#

# Allow usage of header files in the `src` directory, but only for utilities
target_include_directories(
  ${PROJECT_NAME}
  PUBLIC 
    $<INSTALL_INTERFACE:include>    
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src
)

#
# Set compiler warning as defined in the `compiler_warnings.cmake` file
#

add_library(project_warnings INTERFACE)
include(cmake/CompilerWarnings.cmake)
set_project_warnings(project_warnings)

#
# Model project dependencies 
#

# Identify and link with the specific "packages" the project uses
#find_package(package_name package_version REQUIRED package_type [other_options])
#target_link_libraries(
#  ${PROJECT_NAME}
#  PUBLIC
#    dependency1 ...
#  PRIVATE
#    dependency2 ...
#)

#
# Install library for easy downstream inclusion
#

include(GNUInstallDirs)
install(
  TARGETS
    ${PROJECT_NAME}
  EXPORT
    ${LOWERCASE_PROJECT_NAME}-export
  LIBRARY DESTINATION
    ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION
    ${CMAKE_INSTALL_LIBDIR}
)

install(
  EXPORT 
    ${LOWERCASE_PROJECT_NAME}-targets
  FILE
    ${PROJECT_NAME}Targets.cmake
  NAMESPACE
    ${PROJECT_NAME}::
  DESTINATION
    ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
)

#
# Quick `ConfigVersion.cmake` creation
#

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
  ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
  VERSION ${PROJECT_VERSION}
  COMPATIBILITY AnyNewerVersion
)

export(PACKAGE ${PROJECT_NAME})
