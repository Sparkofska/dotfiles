#!/bin/bash

set -x #echo on

echo "source $PWD/.bashrc" >> $HOME/.bashrc

# create link to i3 config
ln -si $PWD/.config/i3/config $HOME/.config/i3/config

# create link to tmux config
ln -si $PWD/.tmux.conf $HOME/.tmux.conf

# create link to vimrc
ln -si $PWD/.vimrc $HOME/.vimrc

# install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# install vim Plugins via Vundle
vim +PluginInstall +qall

