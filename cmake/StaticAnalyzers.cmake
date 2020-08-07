if(${PROJECT_NAME}_ENABLE_CLANG_TIDY)
  find_program(CLANGTIDY clang-tidy)

#  Enable checks by removing '-' in front of them:
#  for example enable performance checks change:
# '-performance-*' to 'performance-*'
  if(CLANGTIDY)
    set(CMAKE_CXX_CLANG_TIDY
        clang-tidy
        -p=${CMAKE_BINARY_DIR}/compile_commands.json
        -abseil-*,
        -android-*,
        -boost-*,
        -bugprone-*,
        -cert-*,
        -clang-*,
        cppcoreguidelines-*,
        -darwin-*,
        -fuchsia-*,
        -google-*,
        -hicpp-*,
        -linuxkernel-*,
        -llvm-*,
        -llvmlibc-*,
        -misc-*,
        -modernize-*,
        -mpi-*,
        -objc-*,
        -openmp-*,
        -performance-*,
        -portability-*,
        -readability-*,
        -zircon-*)
    message("Clang-Tidy finished setting up.")
  else()
    message(SEND_ERROR "Clang-Tidy requested but executable not found.")
  endif()
endif()

if(${PROJECT_NAME}_ENABLE_CPPCHECK)
  find_program(CPPCHECK cppcheck)
  if(CPPCHECK)
    set(CMAKE_CXX_CPPCHECK
        ${CPPCHECK}
        --suppress=missingInclude
        --enable=all
        --inline-suppr
        --inconclusive
        -i
        ${CMAKE_SOURCE_DIR}/imgui/lib)
    message("Cppcheck finished setting up.")
  else()
    message(SEND_ERROR "Cppcheck requested but executable not found.")
  endif()
endif()
