#
# Generate compile_commands.json for clang based tools
#
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(VERBOSE_OUTPUT "Enable verbose output, allowing for a better understanding of each step taken." ON)
option(ENABLE_IPO "Enable Interprocedural Optimization, aka Link Time Optimization (LTO)." OFF)
option(ENABLE_UNIT_TESTING "Enable unit tests for the projects (from the `test` subfolder)." OFF)
option(USE_GTEST "Use the GoogleTest project for creating unit tests." ON)

if(ENABLE_IPO)
    include(CheckIPOSupported)
    check_ipo_supported(RESULT result OUTPUT output)
    if(result)
        set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
    else()
        message(SEND_ERROR "IPO is not supported: ${output}")
    endif()
endif()
