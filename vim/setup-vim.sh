#!/bin/bash

set -e

# 1. .vimrc をホームにコピー
mkdir -p ./backup
if [ -f ~/.vimrc ]; then
    cp ~/.vimrc ./backup/.vimrc.old
fi
cp ./.vimrc ~/.vimrc

# 2. vim-plug のインストール
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 3. Powerline フォントのインストール
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# 4. rootにコピー
sudo ln -s ~/.vimrc /root/.vimrc
sudo ln -s ~/.vim    /root/.vim

# 5. プラグインのインストール（Vim バッチモード）
vim +PlugInstall +qall
sudo vim +PlugInstall +qall
