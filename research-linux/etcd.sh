#!/bin/sh

echo "-- etcd --"
git clone https://github.com/etcd-io/etcd.git -b v3.5.21 ~/etcd

cd ~/etcd
./build.sh
cp ./bin/etcd ~/bin/etcd
cp ./bin/etcdctl ~/bin/etcdctl
