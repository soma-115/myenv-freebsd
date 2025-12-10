#!/bin/sh

echo "-- runc --"
git clone https://github.com/opencontainers/runc.git ~/runc
sudo apt install -y libseccomp2 libseccomp-dev

cd ~/runc
go build
cp ./runc ~/bin/runc
