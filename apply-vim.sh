#!/bin/bash

cp .vimrc ~/

# install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# install vim Plugins via Vundle
vim +PluginInstall +qall
