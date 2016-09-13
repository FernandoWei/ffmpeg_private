#!/bin/sh

PWD=`pwd`
LIB=${PWD}/lib
INCLUDE=${PWD}/include
SOURCE=${PWD}/ffmpeg

mkdir -p "${LIB}"
mkdir -p "${INCLUDE}"

echo "Building ffmpeg ......"

cd "${SOURCE}"

CONFIGURE_FLAGS="--disable-debug --disable-programs \
                 --disable-doc --enable-pic --incdir=${INCLUDE} \
                 --libdir=${LIB}"
                 
./configure \
${CONFIGURE_FLAGS} \
--prefix=${PWD} || exit 1


make 2>&1
make install 2>&1

echo "Done."

