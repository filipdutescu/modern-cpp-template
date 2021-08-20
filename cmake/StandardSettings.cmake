#
# Project settings
#

option(${PROJECT_NAME}_BUILD_EXECUTABLE "Build the project as an executable, rather than a library." OFF)
option(${PROJECT_NAME}_BUILD_HEADERS_ONLY "Build the project as a header-only library." OFF)
option(${PROJECT_NAME}_USE_ALT_NAMES "Use alternative names for the project, such as naming the include directory all lowercase." ON)

#
# Compiler options
#

option(${PROJECT_NAME}_WARNINGS_AS_ERRORS "Treat compiler warnings as errors." OFF)

#
# Package managers
#
# Currently supporting: Conan, Vcpkg.

option(${PROJECT_NAME}_ENABLE_CONAN "Enable the Conan package manager for this project." OFF)
option(${PROJECT_NAME}_ENABLE_VCPKG "Enable the Vcpkg package manager for this project." OFF)

#
# Unit testing
#
# Currently supporting: GoogleTest, Catch2.

option(${PROJECT_NAME}_ENABLE_UNIT_TESTING "Enable unit tests for the projects (from the `test` subfolder)." ON)

option(${PROJECT_NAME}_USE_GTEST "Use the GoogleTest project for creating unit tests." ON)
option(${PROJECT_NAME}_USE_GOOGLE_MOCK "Use the GoogleMock project for extending the unit tests." OFF)

option(${PROJECT_NAME}_USE_CATCH2 "Use the Catch2 project for creating unit tests." OFF)

#
# Static analyzers
#
# Currently supporting: Clang-Tidy, Cppcheck.

option(${PROJECT_NAME}_ENABLE_CLANG_TIDY "Enable static analysis with Clang-Tidy." OFF)
option(${PROJECT_NAME}_ENABLE_CPPCHECK "Enable static analysis with Cppcheck." OFF)

#
# Code coverage
#

option(${PROJECT_NAME}_ENABLE_CODE_COVERAGE "Enable code coverage through GCC." OFF)

#
# Doxygen
#

option(${PROJECT_NAME}_ENABLE_DOXYGEN "Enable Doxygen documentation builds of source." OFF)

#
# Miscelanious options
#

# Generate compile_commands.json for clang based tools
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(${PROJECT_NAME}_VERBOSE_OUTPUT "Enable verbose output, allowing for a better understanding of each step taken." ON)
option(${PROJECT_NAME}_GENERATE_EXPORT_HEADER "Create a `project_export.h` file containing all exported symbols." OFF)

# Export all symbols when building a shared library
if(BUILD_SHARED_LIBS)
  set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS OFF)
  set(CMAKE_CXX_VISIBILITY_PRESET hidden)
  set(CMAKE_VISIBILITY_INLINES_HIDDEN 1)
endif()

option(${PROJECT_NAME}_ENABLE_LTO "Enable Interprocedural Optimization, aka Link Time Optimization (LTO)." OFF)
if(${PROJECT_NAME}_ENABLE_LTO)
  include(CheckIPOSupported)
  check_ipo_supported(RESULT result OUTPUT output)
  if(result)
    set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
  else()
    message(SEND_ERROR "IPO is not supported: ${output}.")
  endif()
endif()


option(${PROJECT_NAME}_ENABLE_CCACHE "Enable the usage of Ccache, in order to speed up rebuild times." ON)
find_program(CCACHE_FOUND ccache)
if(CCACHE_FOUND)
  set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
  set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
endif()
