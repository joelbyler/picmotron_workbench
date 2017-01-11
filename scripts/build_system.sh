#!/bin/bash
set -e

cp -r /system/nerves_system_br /opt/nerves_buildroot
cp -r /system/nerves_system_rpi3_ap /opt/nerves_system

export NERVES_SYSTEM=/opt/nerves_system
export NERVES_TARGET=rpi3

cd /opt/nerves_system
rm -rf /opt/build
rm -rf /out/build

/opt/nerves_buildroot/create-build.sh /opt/nerves_system/nerves_defconfig /opt/build
cd /opt/build
make
make system
cp /opt/build/nerves_system_rpi3.tar.gz /out/artifacts
# cp -rf /opt/build /out/build
