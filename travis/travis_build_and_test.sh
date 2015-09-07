#!/bin/bash

set -e
MAKE="make --jobs=$NUM_THREADS --keep-going"
if $PREBUILD_ITKVTK
    # lets try just exiting 0 to make the cache?
    exit 0
fi

if $WITH_CMAKE; then
  mkdir -p $BUILD_DIR
  cd $BUILD_DIR
    if $PREBUILD_ITKVTK; then
        cmake -DSimVascular_USE_SYSTEM_VTK:BOOL="1" -DSimVascular_USE_SYSTEM_ITK:BOOL="1" -DVTK_DIR:PATH=$VTK_DIR -DITK_DIR:PATH=$ITK_DIR -DBUILD_ThreeDSolver=1 ../Code

    else
        cmake -DBUILD_ThreeDSolver=1 ../Code
        

    fi

  $MAKE  
  $MAKE clean
  cd -

else
    echo "Not supported yet"

fi