cmake_minimum_required(VERSION 3.17)
project(separateCompilation C)

set(CMAKE_C_STANDARD 99)

add_executable(separateCompilation main.c gray.c printBin.c printBin.h)