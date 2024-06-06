cmake_minimum_required(VERSION 3.0)
project(the_truth)

set(CMAKE_CXX_STANDARD 23)

file(GLOB_RECURSE sources src/*.c src/*.h src/*.cpp src/*.hpp src/*.c++ src/*.h++)

add_executable(the_truth ${sources})

target_compile_options(the_truth PUBLIC -std=c++23 -Wall -Wfloat-conversion)

target_include_directories(the_truth PUBLIC src)

add_custom_target(run
    COMMAND the_truth
    DEPENDS the_truth
    WORKING_DIRECTORY ${CMAKE_PROJECT_DIR}
)
