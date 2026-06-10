cmake_minimum_required(VERSION 3.20)

project(
    EmbeddedProjectTemplate
    VERSION 1.0.0
    LANGUAGES C CXX
)

include(cmake/ProjectOptions.cmake)
include(cmake/ProjectWarnings.cmake)
include(cmake/Coverage.cmake)
include(CTest)

enable_testing()

add_subdirectory(modules/status_led)
add_subdirectory(tests)