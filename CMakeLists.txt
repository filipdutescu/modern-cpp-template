cmake_minimum_required(VERSION 3.15)

#
# Project details
#

project(
  "project_name"
  VERSION 0.1.0 
  LANGUAGES CXX
)

#
# Set project options and warnings
#

include(cmake/StandardSettings.cmake)

add_library(${PROJECT_NAME}_PROJECT_WARNINGS INTERFACE)
include(cmake/CompilerWarnings.cmake)
set_project_warnings(${PROJECT_NAME}_PROJECT_WARNINGS)

message("\nStarted CMake for ${PROJECT_NAME} v${PROJECT_VERSION}...")

#
# Prevent building in the source directory
#

if(PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
  message(FATAL_ERROR "In-source builds not allowed. Please make a new directory (called a build directory) and run CMake from there.")
endif()

#
# Create library, setup header and source files
#

# Find all headers and implementation files
FILE(GLOB_RECURSE headers CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/include/*.h")
FILE(GLOB_RECURSE sources CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")

# Header-only libraries should define the following CMake options, rather than the current ones
#add_library(${PROJECT_NAME} INTERFACE)

add_library(
  ${PROJECT_NAME}
  ${headers}
  ${sources}
)

# Set the project standard and warnings
target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_17)
target_link_libraries(${PROJECT_NAME} PUBLIC ${PROJECT_NAME}_PROJECT_WARNINGS)

if(VERBOSE_OUTPUT)
  message("Found the following header files:\n${headers}\n")
  message("Found the following source files:\n${sources}\n")
endif()
message("Added all header and implementation files.")

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

message("Finished setting up include directories.")

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
#    ${PROJECT_NAME}_PROJECT_OPTIONS        
#    ${PROJECT_NAME}_PROJECT_WARNINGS        
#)

#
# Provide alias to library for 
#
add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

#
# Install library for easy downstream inclusion
#

include(GNUInstallDirs)
install(
  TARGETS
    ${PROJECT_NAME}
  EXPORT
    ${PROJECT_NAME}Targets
  LIBRARY DESTINATION
    ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION
    ${CMAKE_INSTALL_BINDIR}
  ARCHIVE DESTINATION
    ${CMAKE_INSTALL_LIBDIR}
)

install(
  EXPORT 
    ${PROJECT_NAME}Targets
  FILE
    ${PROJECT_NAME}Targets.cmake
  NAMESPACE
    ${PROJECT_NAME}::
  DESTINATION
    ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
)

install(
  DIRECTORY
    include/${PROJECT_NAME}
  DESTINATION
    include
)

#
# Quick `ConfigVersion.cmake` creation
#

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    ${PROJECT_NAME}ConfigVersion.cmake
  VERSION
    ${PROJECT_VERSION}
  COMPATIBILITY
    SameMajorVersion
)

configure_package_config_file(
  ${CMAKE_CURRENT_LIST_DIR}/cmake/${PROJECT_NAME}Config.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
  INSTALL_DESTINATION 
    ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
)

install(
  FILES
    ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
  DESTINATION
    ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
)

message("Finished installing package.\n")
