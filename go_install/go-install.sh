#!/bin/sh
VERSION="$(cat version | tr -d '\n' | tr -d '\r')"

curl -LO https://golang.org/dl/go$VERSION.freebsd-amd64.tar.gz
tar -xzf go$VERSION.freebsd-amd64.tar.gz
mv go/ go$VERSION.freebsd-amd64

sudo mv go$VERSION.freebsd-amd64 /usr/local
sudo ln -s /usr/local/go$VERSION.freebsd-amd64 /usr/local/go

echo "PATH=/usr/local/go/bin:$PATH" >> ~/.bashrc
echo "GOPATH=$HOME/go" >> ~/.bashrc
