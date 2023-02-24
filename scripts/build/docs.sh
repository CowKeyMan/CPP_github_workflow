#!/bin/bash

# Build the main executable in debug mode.
# If any argument at all is passed to this script, it will skip the cmake step and just execute the build step only

cp documentation/Documents/FileDocumentation.rst.in documentation/Documents/FileDocumentation.rst
./scripts/standalone/generate_file_documentation.py >> documentation/Documents/FileDocumentation.rst
if [[ $? -ne 0 ]];
then
  echo "Generating file documentation failed. See above errors (in stderr) for details"
  exit 1
fi

mkdir -p build
cd build
if [[ $# == 0 ]];
then
  cmake \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
    -DCMAKE_BUILD_TYPE=Debug \
    -DBUILD_MAIN=OFF \
    -DBUILD_TEST=OFF \
    -DBUILD_DOCS=ON \
    -DENABLE_PROFILING=OFF \
    -DENABLE_MARCH_NATIVE=OFF \
    ..
fi
cmake --build . -j8
cd ../documentation
rm `grep -r -L -P "(.gitignore)" RST`
doxygen Doxyfile
make html
cd ..
cp -R documentation/build/html/. docs/documentation
