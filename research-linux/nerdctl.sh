#!/bin/sh

echo "-- nerdctl --"
git clone https://github.com/containerd/nerdctl.git ~/nerdctl

cd ~/nerdctl
go build -o ~/bin/nerdctl ./cmd/nerdctl

