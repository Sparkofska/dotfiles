" true
" forces vim to source .vimrc file if it is present in working directory
" set exrc
" might be security hole -> enable security option (restrict some commands)
set secure

" A plugin installation tool
" https://github.com/tpope/vim-pathogen
" execute pathogen#infect()


" VUNDLE BEGIN ----------------
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Plugin 'scrooloose/nerdtree' " https://github.com/scrooloose/nerdtree
Bundle 'Valloric/YouCompleteMe'
Plugin 'alvan/vim-closetag' " close xml tag automatically
Plugin 'Valloric/MatchTagAlways' " highlight matching xml tag
Plugin 'vim-latex/vim-latex' " https://github.com/vim-latex/vim-latex
Plugin 'rakr/vim-two-firewatch'
Plugin 'morhetz/gruvbox' " gruvbox colorscheme
Plugin 'christoomey/vim-tmux-navigator' " seemless navigation between vim and tmux panes
Plugin 'majutsushi/tagbar' " tags and outline plugin
Plugin 'tpope/vim-surround' " add surround functionality
Plugin 'can3p/incbool.vim' " Toggle true/false
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy file finder


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" VUNDLE END ----------------

" Setting the Colorscheme
set t_Co=256   " This is may or may not needed.
set background=dark
colorscheme gruvbox
" colo two-firewatch

" enable syntax highlighting
syntax on

" show line numbers
" disable via set nonumber
set number
set relativenumber

" leave some lines visible at top and end of screen when scrolling
set scrolloff=3

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" display whitespaces
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

" highlight search results
set hlsearch
" highlight search result while typing
set incsearch
" only case sensitive when search string contains uppercase letter (does not " apply for * and #)
set smartcase

"display incomplete commands
set showcmd
"display the mode you are in everytime
set showmode
" activate mouse
set mouse=a

" when in insert mode, ready to paste, if you press <F2>, Vim will switch to paste mode, disabling all kinds of smartness and just pasting a whole buffer of text. Then, you can disable paste mode again with another press of <F2>. Nice and simple
set pastetoggle=<F2>

" default to wrapped lines broken at wohle words
set wrap linebreak
" move in wrapped lines
" map j gj
" map k gk

" let vim handle typing mistakes
command! W w
command! Q q
command! Wq wq
command! WQ wq
command! Qa qa
command! Wa wa

" " Mappings
" " ========

" easier increment/decrement of numbers (tmux escape key <C-a> also interferes with the default mapping)
nnoremap + <C-a>
nnoremap - <C-x>

" Keep selection after indenting
:vnoremap < <gv
:vnoremap > >gv

" Some mappings copied from <https://github.com/bag-man/dotfiles/blob/master/vimrc>
" That is a nice one: have a look again :)
" ---------------------------------------------------------------------------------
" write file as sudo (without having opened as sudo)
cmap w!! w !sudo tee > /dev/null %
map n nzz
"map <Cr> O<Esc>j
map <Cr> o<Esc>

" free mappings
" <leader><leader>
nnoremap <Space> mm*`m
" <leader><space>
" <C-Space>

" leader
:let mapleader = ","

" reload default vimrc
nnoremap <leader><F5> :source $MYVIMRC<cr>

" indent all lines and jump back to last position
nnoremap <leader>f mmgg=G`m
" toggle nerdtree
nmap <leader>n :NERDTreeToggle<cr>

" quick open vimrc file in new tab
nnoremap <leader>v :tabe $MYVIMRC<cr>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>gv
inoremap <C-S> <C-O>:update<CR>
"
" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" switch case of word's first letter
nmap <leader>c mmb~`m

" toggle checkbox in markdown syntax (first in row) [ ] <-> [x]
nnoremap <leader>x :s/\[[x ]\]/\=submatch(0) == '[x]' ? '[ ]' : '[x]'/<cr>:noh<cr><c-o>

" more natural split opening
set splitbelow
set splitright

" for Markdown .md files
" underline headings
nmap <leader>h1 yypVr=
nmap <leader>h2 yypVr-

" Plugin Settings
" =================

" CrtlP
" -----
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP .'

set wildignore+=*.so,*.swp,*.zip,*.pdf
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pdf)$',
  \ }

" Makes CtrlP faster:
" - set a persistent cache dir
" - Use ag for listing files. Lightning fast and respects .gitignore
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore "\.git$\|\.hg$\|\.svn$"'
" Fallback to grep would be nice
" else
"   " Fall back to using git ls-files if Ag is not available
"   let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
"   let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

" YouCompleteMe
" ---------------

" close ycm auto completion window when you're done
let g:ycm_autoclose_preview_window_after_completion=1
" shortcut for ycm for goto definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" TagBar
" ------

nmap <leader>o :TagbarToggle<CR>

" define BadWhitespace before using in a match
" highlight BadWhitespace ctermbg=red guibg=darkred
" mark extra whitespace as bad, and probably color it red
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Language dependend Setings
" ==========================
" see this post for a clean way of handling language specific settings:
" https://medium.com/usevim/language-specific-settings-8aaae487fc17

" Python
" ------

" python intendation
au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set smarttab |
      \ set fileformat=unix


" make vim aware of virtualenv, ans use it in autocompletion
"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  #execfile(activate_this, dict(__file__=activate_this) )
  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
EOF

" html and co
" -----------

" html intendation
au BufNewFile,BufRead *.js,*.html,*.css
      \ set tabstop=2 |
      \ set softtabstop=2 |
      \ set shiftwidth=2 |
      \ set expandtab |
      \ set smarttab

au BufNewFile,BufRead *.h,*.hpp,*.cpp
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set expandtab |
      \ set autoindent |
      \ set smarttab

" Octave syntax  ----------------------------------------
augroup filetypedetect 
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave 
augroup END 

" Latex 
" -----

" latex intendation
au BufNewFile,BufRead *.tex
      \ set tabstop=2 |
      \ set softtabstop=2 |
      \ set shiftwidth=2 |
      \ set expandtab

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a single file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" disable automatic folding on startup
let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""

" disable smart quotes
let g:Tex_SmartKeyQuote=0

" redef C-j to C-space: the <++> placeholder of latex-suite interferes with the window switching c-j
verbose nmap <C-g> <Plug>IMAP_JumpForward
verbose imap <C-g> <Plug>IMAP_JumpForward
verbose vmap <C-g> <Plug>IMAP_JumpForward
