#!/bin/bash

# Build the main executable.
# If any argument at all is passed to this script, it will skip the cmake step and just execute the build step only.

mkdir -p build
cd build
if [[ $# == 0 ]];
then
  cmake \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_MAIN=ON \
    -DBUILD_TEST=OFF \
    -DBUILD_DOCS=OFF \
    -DENABLE_PROFILING=OFF \
    -DENABLE_MARCH_NATIVE=ON \
    ..
fi
cmake --build . -j8
cd ..
