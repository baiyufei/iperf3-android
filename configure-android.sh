#!/bin/bash

export TOOLCHAIN=$PWD/android-toolchain
mkdir -p $TOOLCHAIN
API=21
NDK_ROOT=$1
echo $API
export CFLAGS="-D__ANDROID_API__=$API"

function build() {
 ARCH=$1
 PREFIX=$2
 TARGET=$3
 OUT=out_$ARCH
 $NDK_ROOT/build/tools/make-standalone-toolchain.sh \
    --toolchain=arm-linux-androideabi-4.9 \
    --arch=$ARCH \
    --install-dir=$TOOLCHAIN \
    --platform=android-$API \
    --force

  export PATH=$TOOLCHAIN/bin:$PATH
  export AR=$PREFIX-ar
  export CC=$PREFIX-clang
  export CXX=$PREFIX-clang++
  export LINK=$PREFIX-clang++
  gyp --depth=. -Goutput_dir=$OUT
  make V=1 -j16
}

function build_arm() {
  build arm arm-linux-androideabi arm
}

build_arm

