#
# Project settings
#

option(BUILD_EXECUTABLE "Build the project as an executable, rather than a library." OFF)
option(BUILD_HEADERS_ONLY "Build the project as a header-only library." OFF)

#
# Compiler options
#

option(WARNINGS_AS_ERRORS "Treat compiler warnings as errors." OFF)

#
# Package managers
#
# Currently supporting: Conan, Vcpkg.

option(ENABLE_CONAN "Enable the Conan package manager for this project." OFF)
option(ENABLE_VCPKG "Enable the Vcpkg package manager for this project." OFF)

#
# Unit testing
#
# Currently supporting: GoogleTest, Catch2.

option(ENABLE_UNIT_TESTING "Enable unit tests for the projects (from the `test` subfolder)." ON)

option(USE_GTEST "Use the GoogleTest project for creating unit tests." ON)
option(USE_GOOGLE_MOCK "Use the GoogleMock project for extending the unit tests." OFF)

option(USE_CATCH2 "Use the Catch2 project for creating unit tests." ON)

#
# Static analyzers
#
# Currently supporting: Clang-Tidy, Cppcheck.

option(ENABLE_CLANG_TIDY "Enable static analysis with Clang-Tidy." ON)
option(ENABLE_CPPCHECK "Enable static analysis with Cppcheck." OFF)

#
# Code coverage
#

option(ENABLE_CODE_COVERAGE "Enable code coverage through GCC." OFF)

#
# Doxygen
#

option(ENABLE_DOXYGEN "Enable Doxygen documentation builds of source." OFF)

#
# Miscelanious options
#

# Generate compile_commands.json for clang based tools
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(VERBOSE_OUTPUT "Enable verbose output, allowing for a better understanding of each step taken." ON)
option(GENERATE_EXPORT_HEADER "Create a `project_export.h` file containing all exported symbols." OFF)

# Export all symbols when building a shared library
if(BUILD_SHARED_LIBS)
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS OFF)
    set(CMAKE_CXX_VISIBILITY_PRESET hidden)
    set(CMAKE_VISIBILITY_INLINES_HIDDEN 1)
endif()

option(ENABLE_IPO "Enable Interprocedural Optimization, aka Link Time Optimization (LTO)." OFF)
if(ENABLE_IPO)
    include(CheckIPOSupported)
    check_ipo_supported(RESULT result OUTPUT output)
    if(result)
        set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
    else()
        message(SEND_ERROR "IPO is not supported: ${output}.")
    endif()
endif()
