#!/bin/sh
cd ~/
rm -Rf pokyzeus
git clone -b zeus git://git.yoctoproject.org/poky pokyzeus
cd pokyzeus
git clone git@github.com:Bermotard/Build_rasp.git -b develop rpi3_build
# Meta-openembedded
git clone -b zeus git://git.openembedded.org/meta-openembedded
# 96boards
git clone -b zeus git://github.com/96boards/meta-96boards
# realsense
git clone -b zeus https://github.com/IntelRealSense/meta-intel-realsense.git
# Yocto zeus meta raspeberry
git clone -b zeus  git://git.yoctoproject.org/meta-raspberrypi
. ./oe-init-build-env rpi3-build
bitbake  core-image-minimal
bitbake package-index
cd tmp/deploy/ipk/
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo python -m SimpleHTTPServer 80
