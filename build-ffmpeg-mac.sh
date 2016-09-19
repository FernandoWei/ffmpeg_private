#!/bin/sh

PWD=`pwd`
LIB=${PWD}/lib
INCLUDE=${PWD}/include
SOURCE="ffmpeg-3.1"

rm -rf "${LIB}"
rm -rf "${INCLUDE}"

mkdir -p "${LIB}"
mkdir -p "${INCLUDE}"

if [ ! -r $SOURCE ]
then
	echo 'FFmpeg source not found. Trying to download...'
	curl http://www.ffmpeg.org/releases/$SOURCE.tar.bz2 | tar xj \
			|| exit 1
fi

echo "Building ffmpeg ......"

cd ${PWD}/${SOURCE}

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
                 
                 
./configure ${CONFIGURE_FLAGS} --prefix=${PWD} || exit 1


make 2>&1
make install 2>&1

echo "Done."

