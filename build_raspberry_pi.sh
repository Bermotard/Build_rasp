#!/bin/sh
cd ~/
echo "rm -Rf pokyzeus"
rm -Rf pokyzeus
echo "git clone -b zeus git://git.yoctoproject.org/poky pokyzeus"
git clone -b zeus git://git.yoctoproject.org/poky pokyzeus
echo "cd pokyzeus"
cd pokyzeus
echo "git clone git@github.com:Bermotard/Build_rasp.git -b develop rpi3_build"
git clone git@github.com:Bermotard/Build_rasp.git -b develop rpi3_build
# Meta-openembedded
echo "git clone -b zeus git://git.openembedded.org/meta-openembedded"
git clone -b zeus git://git.openembedded.org/meta-openembedded
# 96boards
echo "git clone -b zeus git://github.com/96boards/meta-96boards"
git clone -b zeus git://github.com/96boards/meta-96boards
# realsense
echo "git clone -b zeus https://github.com/IntelRealSense/meta-intel-realsense.git"
git clone -b zeus https://github.com/IntelRealSense/meta-intel-realsense.git
# Yocto zeus meta raspeberry
echo "git clone -b zeus  git://git.yoctoproject.org/meta-raspberrypi"
git clone -b zeus  git://git.yoctoproject.org/meta-raspberrypi
echo "source oe-init-build-env rpi3_build"
source oe-init-build-env rpi3_build
echo "core-image-minimal"
bitbake  core-image-minimal
echo "bitbake package-index"
bitbake package-index
echo "cd tmp/deploy/ipk/"
cd tmp/deploy/ipk/
echo "sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT"
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
echo "sudo python -m SimpleHTTPServer 80"
sudo python -m SimpleHTTPServer 80
