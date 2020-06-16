if(${PROJECT_NAME}_ENABLE_DOXYGEN)
    set(DOXYGEN_CALLER_GRAPH YES)
    set(DOXYGEN_CALL_GRAPH YES)
    set(DOXYGEN_EXTRACT_ALL YES)
    find_package(Doxygen REQUIRED dot)
    doxygen_add_docs(doxygen-docs ${PROJECT_SOURCE_DIR})

    add_custom_target(
        generate-docs
	COMMAND
            ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile.doxygen-docs
        WORKING_DIRECTORY
            ${CMAKE_CURRENT_SOURCE_DIR}/docs
	VERBATIM
    )

    verbose_message("Doxygen has been setup and documentation is now available.")
endif()
