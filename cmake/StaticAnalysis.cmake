option(
    ENABLE_CPPCHECK
    "Enable cppcheck static analysis"
    OFF
)

option(
    ENABLE_CLANG_TIDY
    "Enable clang-tidy static analysis"
    OFF
)

if(ENABLE_CPPCHECK)

    find_program(CPPCHECK_EXECUTABLE cppcheck)

    if(CPPCHECK_EXECUTABLE)

        message(STATUS "Cppcheck enabled")

        set(CMAKE_C_CPPCHECK
            ${CPPCHECK_EXECUTABLE}
            --enable=warning,style,performance,portability
            --inline-suppr
            --quiet
        )

        set(CMAKE_CXX_CPPCHECK
            ${CPPCHECK_EXECUTABLE}
            --enable=warning,style,performance,portability
            --inline-suppr
            --quiet
        )

    else()

        message(FATAL_ERROR "cppcheck requested but not found")
    
    endif()

endif()

if(ENABLE_CLANG_TIDY)

    find_program(CLANG_TIDY_EXECUTABLE clang-tidy)

    if(CLANG_TIDY_EXECUTABLE)

        message(STATUS "clang-tidy enabled")

        set(CMAKE_C_CLANG_TIDY
            ${CLANG_TIDY_EXECUTABLE}
            -p=${CMAKE_BINARY_DIR}
        )

        set(CMAKE_CXX_CLANG_TIDY
            ${CLANG_TIDY_EXECUTABLE}
            -p=${CMAKE_BINARY_DIR}
        )

    else()

        message(FATAL_ERROR "clang-tidy requested but not found")
    
    endif()

endif()