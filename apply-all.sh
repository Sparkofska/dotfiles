#!/bin/bash
set -x #echo on

cp .tmux.conf ~/
cp own.sty ~/texmf/tex/latex/jonasOwn/

sh apply-vim.sh
