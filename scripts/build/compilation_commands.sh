#!/bin/bash

# Generate the compilation commands database (in build/compile_commands.json)

mkdir -p build
cd build
cmake \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
  -DCMAKE_BUILD_TYPE=Debug \
  -DBUILD_MAIN=ON \
  -DBUILD_TEST=ON \
  -DBUILD_DOCS=OFF \
  -DENABLE_PROFILING=ON \
  ..
cd ..
