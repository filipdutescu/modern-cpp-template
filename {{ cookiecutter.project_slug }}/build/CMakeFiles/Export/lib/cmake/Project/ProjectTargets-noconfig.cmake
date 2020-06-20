#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Project::Project" for configuration ""
set_property(TARGET Project::Project APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(Project::Project PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libProject.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS Project::Project )
list(APPEND _IMPORT_CHECK_FILES_FOR_Project::Project "${_IMPORT_PREFIX}/lib/libProject.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
