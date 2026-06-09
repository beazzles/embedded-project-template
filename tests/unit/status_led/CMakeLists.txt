find_package(PkgConfig REQUIRED)

pkg_check_modules(CPPUTEST REQUIRED cpputest)

add_executable(
    test_status_led
    test_status_led.cpp
    test_runner.cpp
)

target_link_libraries(
    test_status_led
    PRIVATE
        status_led
        ${CPPUTEST_LIBRARIES}
)

target_include_directories(
    test_status_led
    PRIVATE
        ${CPPUTEST_INCLUDE_DIRS}
)

add_test(
    NAME status_led_unit_tests
    COMMAND test_status_led
)