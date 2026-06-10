add_library(status_led)

target_sources(
    status_led
    PRIVATE
        src/status_led.c
)

target_include_directories(
    status_led
    PUBLIC
        include
)

target_link_libraries(
    status_led
    PUBLIC
        project_options
        project_warnings
)

if(ENABLE_COVERAGE)

    target_link_libraries(
        status_led
        PUBLIC
            coverage_options
    )

endif()