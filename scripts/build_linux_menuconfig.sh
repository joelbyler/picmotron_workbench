#!/bin/bash
set -e

rm -rf /opt/build
cp -r /out/build /opt/build

cd /opt/build
make menuconfig
