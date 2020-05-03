#
# Setup project configuration for easy installation downstream
#

get_filename_component(PROJECT_NAME_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
include(CMakeFindDependencyMacro)

#
# Identify and link with the specific "packages" the project uses
#
#find_package(package_name package_version REQUIRED package_type [other_options])

if(NOT TARGET ${PROJECT_NAME}::${PROJECT_NAME})
    include("${PROJECT_NAME_CMAKE_DIR}/${PROJECT_NAME}Targets.cmake")
endif()

