cmake_minimum_required(VERSION 3.10)

project(eckert CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS
     "${CMAKE_SOURCE_DIR}/src/*.cpp")

add_executable(eckert ${SOURCES})

target_compile_options(eckert PRIVATE -Wall -Werror -O3)
