#!/bin/sh
cd ~/
rm -Rf pokyzeus
git clone -b zeus git://git.yoctoproject.org/poky pokyzeus
cd pokyzeus
git clone -b develop ssh://bernard@192.168.0.25:8723/volume1/rpi3-build
git clone -b zeus  git://git.yoctoproject.org/meta-raspberrypi
. ./oe-init-build-env rpi3-build
bitbake  core-image-minimal
bitbake package-index
cd tmp/deploy/ipk/
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo python -m SimpleHTTPServer 80
