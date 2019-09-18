#!/bin/bash

if [ "$TRAVIS_OS_NAME" = "osx" ]; then
    mkdir build
    cd build
    cmake ..
    cmake --build .
    test/unit_tests
else
    # TODO: mingw windows build
    mkdir build
    cd build
    cmake ..
    cmake --build .
    test/unit_tests
    cd ..

    mkdir build_win
    cd build_win
    cmake -DCMAKE_TOOLCHAIN_FILE=../cmake/windows.cmake ..
    cmake --build .
    wine64 test/unit_tests.exe
fi