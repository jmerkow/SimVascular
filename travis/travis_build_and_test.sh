#!/bin/bash

set -e
MAKE="make --jobs=$NUM_THREADS --keep-going"

if $WITH_CMAKE; then
  mkdir $BUILD_DIR
  cd $BUILD_DIR

  cmake ../Code
  $MAKE
  
  $MAKE clean

  cd -

else
    echo "Not supported yet"

fi