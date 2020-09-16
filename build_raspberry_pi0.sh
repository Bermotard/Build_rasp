#!/bin/sh
cd ~/
rm -Rf pokyzeus
git clone -b zeus git://git.yoctoproject.org/poky pokyzeus
cd pokyzeus
# raspberry configuration
git clone -b develop ssh://bernard@192.168.0.25:8723/volume1/rpi3-build
# Meta-openembedded
git clone -b zeus git://git.openembedded.org/meta-openembedded
# 96boards
git clone -b zeus git://github.com/96boards/meta-96boards
# realsense
git clone -b zeus https://github.com/IntelRealSense/meta-intel-realsense.git
# Yocto zeus meta raspeberry
git clone -b zeus  git://git.yoctoproject.org/meta-raspberrypi
. ./oe-init-build-env rpi3-build
# GUI X11 image
bitbake core-image-sato
