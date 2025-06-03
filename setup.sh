#!/bin/bash

cd ./shell
./setup-bash.sh
. ~/.bash_profile
cd ../vim
./setup-vim.sh
cd ../conf
sudo ./setup-rc.sh
cd ../
