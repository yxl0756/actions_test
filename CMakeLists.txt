cmake_minimum_required(VERSION 3.16)

project(main)

add_executable(main main.cpp)
add_definitions(-DACTIONS_BUILDING)

install(TARGETS main)

enable_testing()
add_test(NAME main COMMAND main)
