#!/bin/bash

# Build the main executable, tests as well as documentation in debug mode.
# If any argument at all is passed to this script, it will skip the cmake step and just execute the build step only

./scripts/build/compilation_commands.sh

mkdir -p build
cd build

# Run the cmake / static analysis checks
cmake \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
  -DCMAKE_BUILD_TYPE=Debug \
  -DBUILD_MAIN=OFF \
  -DBUILD_TEST=OFF \
  -DBUILD_DOCS=OFF \
  -DENABLE_PROFILING=OFF \
  -DENABLE_MARCH_NATIVE=OFF \
  ..
cd ..


# ./scripts/build/debug.sh
./scripts/build/release.sh
./scripts/build/docs.sh
./scripts/build/tests.sh
