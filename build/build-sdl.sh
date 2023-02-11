#!/bin/bash
PATH="${PATH}:/opt/miyoo/bin:/opt/miyoo/arm-miyoo-linux-uclibcgnueabi/sysroot/usr/bin"
CROSS_COMPILE=/opt/miyoo/bin/arm-miyoo-linux-uclibcgnueabi-
CC=${CROSS_COMPILE}gcc
AR=${CROSS_COMPILE}ar
AS=${CROSS_COMPILE}as
LD=${CROSS_COMPILE}ld
CXX=${CROSS_COMPILE}g++
HOST=arm-miyoo-linux-uclibcgnueabi
PREFIX=/opt/miyoo/

git clone -b release-1.2.15 https://github.com/libsdl-org/SDL-1.2.git
cd SDL-1.2 
patch -t -p1 < /root/build/patches/rg35xx-sdl-vsync.patch
./autogen.sh 
./configure --host=${HOST} --prefix=${PREFIX}
make clean
make install