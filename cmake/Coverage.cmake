option(
    ENABLE_COVERAGE
    "Enable code coverage instrumentation"
    OFF
)

if(ENABLE_COVERAGE)
    
    message(STATUS "Coverage enabled")

    add_library(coverage_options INTERFACE)

    target_compile_options(
        coverage_options 
        INTERFACE
            --coverage
            -O0
            -g
    )

    target_link_options(
        coverage_options 
        INTERFACE
            --coverage
    )

endif()