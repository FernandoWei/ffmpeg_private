#!/bin/sh

PWD=`pwd`
LIB=${PWD}/lib
INCLUDE=${PWD}/include
BUILD=${PWD}/build
SOURCE=${PWD}/ffmpeg

mkdir -p "${LIB}"
mkdir -p "${INCLUDE}"

echo "Building ffmpeg ......"

cd "${SOURCE}"
./configure --prefix=${PWD} --disable-ffmpeg --disable-ffplay --disable-ffserver --disable-ffprobe --disable-shared --enable-static --disable-swscale --disable-avfilter --disable-everything --disable-avdevice  --libdir=${LIB} --incdir=${INCLUDE} || exit 1

make 2>&1
make install 2>&1

echo "Done."

