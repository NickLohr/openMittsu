#!/usr/bin/env bash

# set shell settings (see https://sipb.mit.edu/doc/safe-shell/)
set -eufv -o pipefail

# make all warnings into errors
CFLAGS="-Werror"
CXXFLAGS="-Werror"

# set special flag for clang (see https://github.com/travis-ci/travis-ci/issues/5383)
if [ "$CC" = "clang" ]; then CFLAGS+=" -Qunused-arguments"; fi
if [ "$CXX" = "clang++" ]; then CXXFLAGS+=" -Qunused-arguments"; fi

git pull --unshallow
mkdir build
cd build

if [ $TRAVIS_OS_NAME = linux ]; then
	cmake .. -DOPENMITTSU_DEBUG=OFF -DCMAKE_BUILD_TYPE=Release
else
	cmake .. -DOPENMITTSU_DEBUG=OFF -DCMAKE_BUILD_TYPE=Release -DWITH_APP_BUNDLE=On
fi
make -j8
