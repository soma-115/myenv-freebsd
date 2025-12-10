#!/bin/sh

echo "-- containerd --"
git clone https://github.com/containerd/containerd.git ~/containerd -b release/1.7

cd ~/containerd
go build -o ~/bin/containerd ./cmd/containerd
go build -o ~/bin/ctr ./cmd/ctr
go build -o ~/bin/containerd-shim-runc-v2 ./cmd/containerd-shim-runc-v2

