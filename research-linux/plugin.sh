#!/bin/sh

echo "-- plugins --"
git clone https://github.com/containernetworking/plugins.git ~/plugins

cd ~/plugins
./build_linux.sh
sudo mkdir -p /opt/cni/
sudo cp -r ./bin /opt/cni/
