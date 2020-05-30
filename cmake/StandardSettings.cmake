#
# Generate compile_commands.json for clang based tools
#

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

#
# Compiler options
#

option(WARNINGS_AS_ERRORS "Treat compiler warnings as errors" OFF)

#
# Static analyzers
#
# Currently supporting: Clang-Tidy, Cppcheck.

option(ENABLE_CLANG_TIDY "Enable static analysis with Clang-Tidy." ON)
option(ENABLE_CPPCHECK "Enable static analysis with Cppcheck." OFF)

#
# Unit testing
#
# Currently supporting: GoogleTest.

option(ENABLE_UNIT_TESTING "Enable unit tests for the projects (from the `test` subfolder)." ON)
option(USE_GTEST "Use the GoogleTest project for creating unit tests." ON)
option(USE_CATCH2 "Use the Catch2 project for creating unit tests." ON)

#
# Miscelanious options
#

option(VERBOSE_OUTPUT "Enable verbose output, allowing for a better understanding of each step taken." ON)
option(ENABLE_IPO "Enable Interprocedural Optimization, aka Link Time Optimization (LTO)." OFF)

if(ENABLE_IPO)
    include(CheckIPOSupported)
    check_ipo_supported(RESULT result OUTPUT output)
    if(result)
        set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
    else()
        message(SEND_ERROR "IPO is not supported: ${output}")
    endif()
endif()
