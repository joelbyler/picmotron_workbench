#!/bin/bash
set -e

export NERVES_SYSTEM_CACHE=none
export NERVES_SYSTEM_COMPILER=local
export NERVES_SYSTEM=/opt/build/nerves_system_rpi3
export NERVES_TARGET=rpi3
export MIX_ENV=prod

echo "cleaning build dir"
rm -rf /opt/build
echo "refreshing build"
mkdir /opt/build
tar -xzvf /out/artifacts/nerves_system_rpi3.tar.gz -C /opt/build
# cp -r /out/build /opt/build

echo "cleaning app"
cp -r /project/picmotron /opt/picmotron
echo "refreshing app dir"
cd /opt/picmotron/apps/firmware/

echo "getting deps"
mix deps.get
echo "compiling"
mix compile
echo "building firmware"
mix firmware

cp _images/rpi3/firmware.fw /out/artifacts/firmware.fw
