#!/bin/bash

set -e
MAKE="make --jobs=$NUM_THREADS --keep-going"

export CMAKE_ARGS=""
if $PREBUILD_ITKVTK; then
    CMAKE_ARGS="-DSimVascular_USE_SYSTEM_VTK=1 -DVTK_DIR=$VTK_DIR -DSimVascular_USE_SYSTEM_ITK=1 -DITK_DIR=$ITK_DIR"
fi
echo $CMAKE_ARGS

if $WITH_CMAKE; then
  mkdir $BUILD_DIR
  cd $BUILD_DIR

  cmake $CMAKE_ARGS -DBUILD_ThreeDSolver=1 ../Code
  $MAKE
  
  $MAKE clean

  cd -

else
    echo "Not supported yet"

fi