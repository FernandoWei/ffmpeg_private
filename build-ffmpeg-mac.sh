#!/bin/sh

PWD=`pwd`
LIB=${PWD}/lib
INCLUDE=${PWD}/include
SOURCE=${PWD}/ffmpeg

rm -rf "${LIB}"
rm -rf "${INCLUDE}"

mkdir -p "${LIB}"
mkdir -p "${INCLUDE}"

echo "Building ffmpeg ......"

cd "${SOURCE}"

CONFIGURE_FLAGS="--disable-debug --disable-programs \
                 --disable-doc --enable-pic --incdir=${INCLUDE} \
                 --libdir=${LIB} \
                 --disable-videotoolbox  \
                 --disable-audiotoolbox  \
                 --disable-vda \
                 --disable-sdl \
                 --disable-ffplay \
                 --disable-ffserver \
                 --disable-ffprobe \
                 --disable-ffmpeg"
                 
                 
${SOURCE}/configure ${CONFIGURE_FLAGS} \
                   --target-os=darwin \
                   --prefix=${PWD} || exit 1


make 2>&1
make install 2>&1

echo "Done."

