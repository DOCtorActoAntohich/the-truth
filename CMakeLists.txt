cmake_minimum_required(VERSION 3.20)
project(the-truth)

set(CMAKE_CXX_STANDARD 23)

file(GLOB_RECURSE sources src/*.c src/*.h src/*.cpp src/*.hpp src/*.c++ src/*.h++)

add_executable(the-truth ${sources})

target_compile_options(
    the-truth
    PUBLIC
    -std=c++23
    -Wall
    -Wno-narrowing
)

target_include_directories(the-truth PUBLIC src)

add_custom_target(run
    COMMAND the-truth
    DEPENDS the-truth
    WORKING_DIRECTORY ${CMAKE_PROJECT_DIR}
)

install(TARGETS the-truth)
