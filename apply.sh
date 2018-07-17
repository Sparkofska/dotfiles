#!/bin/bash
set -x #echo on

cp .vimrc ~/
cp .tmux.conf ~/
cp own.sty ~/texmf/tex/latex/jonasOwn/

# install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# install vim Plugins via Vundle
vim +PluginInstall +qall
