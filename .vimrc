" true
" forces vim to source .vimrc file if it is present in working directory
set exrc
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

Plugin 'alvan/vim-closetag' " close xml tag automatically
Plugin 'christoomey/vim-tmux-navigator' " seemless navigation between vim and tmux panes
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy file finder
Plugin 'michaeljsmith/vim-indent-object' " indent as text object. Add mappings ai, ii, aI, iI
Plugin 'morhetz/gruvbox' " gruvbox colorscheme
Plugin 'scrooloose/nerdtree' " https://github.com/scrooloose/nerdtree
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround' " add surround functionality
Plugin 'Valloric/MatchTagAlways' " highlight matching xml tag


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" VUNDLE END ----------------

" Setting the Colorscheme
"set t_Co=256   " This is may or may not needed.
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
"let g:gruvbox_termcolors='16'

" enable syntax highlighting
syntax on
syntax enable

" show line numbers
set number

" leave some lines visible at top and end of screen when scrolling
set scrolloff=1

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
" case insensitive search
set ignorecase
" only case sensitive when search string contains uppercase letter (does not apply for * and #)
set smartcase

set nowrap

"display incomplete commands
set showcmd
" activate mouse (but without visual mode)
"set mouse=nicr
set mouse=a

" let vim handle typing mistakes
command! W w
command! Q q
command! Wq wq
command! WQ wq
command! Qa qa
command! Wa wa

" " Mappings
" " ========

" Keep selection after indenting
:vnoremap < <gv
:vnoremap > >gv

" Some mappings copied from <https://github.com/bag-man/dotfiles/blob/master/vimrc>
" That is a nice one: have a look again :)
" ---------------------------------------------------------------------------------
" write file as sudo (without having opened as sudo)
cmap w!! w !sudo tee > /dev/null %
"map n nzz

" leader
:let mapleader = ","

" highlight all occurences and show count stats in command line
nnoremap <space> mm*:%s///gn<cr>`m
" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>
nnoremap <BS> :b#<CR>


" reload default vimrc
nnoremap <leader><F5> :source $MYVIMRC<cr>

" 'tail mode' for e.g. logfiles
nnoremap <F5> :e<CR>G

" indent all lines and jump back to last position
nnoremap <leader>f mmgg=G`m
" toggle nerdtree
nmap <leader>n :NERDTreeToggle<cr>
" find current file in tree view
nmap <C-Left> :NERDTreeFind<cr>
" open nerdtree on right side
let g:NERDTreeWinPos = "right"

" netrw settings
" nnoremap <leader>n :Lexplore<cr>
" display in tree style
" let g:netrw_liststyle=3
" let g:netrw_winsize = 40

" quick open vimrc file in new tab
nnoremap <leader>v :tabe $MYVIMRC<cr>

" open current file in a gui editor for easier (mouse based) copy-paste
nnoremap <leader>e :w<cr> :!gedit %<cr>


" append semicolon to end of line
nnoremap <leader>, mmA;<Esc>`m

" replace \  by / in current line
nnoremap <leader>/ :s/\\/\//g<cr>


" switch case of word's first letter
nmap <leader>c mmb~`m

" toggle checkbox in markdown syntax (first in row) [ ] <-> [x]
nnoremap <leader>x :s/\[[x ]\]/\=submatch(0) == '[x]' ? '[ ]' : '[x]'/<cr>:noh<cr><c-o>

" mappings for programming
" join variable declaration
nnoremap <leader>pj mmgdf=w"my$"_ddV`m:s//<c-r>m/gc<cr>

nnoremap <leader>) A)<Esc>
nnoremap <leader>= =i{

" surround selection
vnoremap <leader>( c()<Esc>P
vnoremap <leader>[ c[]<Esc>P
vnoremap <leader>{ c{}<Esc>P
vnoremap <leader>' c''<Esc>P
vnoremap <leader>" c""<Esc>P
vnoremap <leader>$ c$$<Esc>P

" more natural split opening
set splitbelow
set splitright

" for Markdown .md files
" underline headings
nmap <leader>h1 yypVr=
nmap <leader>h2 yypVr-

" indentation settings
autocmd FileType xml,xslt setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType xsl,dtcapp,dtcinc setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab


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
      \ set fileformat=unix |
      \ nnoremap <Leader>l :ALELint<CR>



" html and co
" -----------

" html intendation
au BufNewFile,BufRead *.js,*.html,*.css,*.scss,*.json
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


" explicitly do it 5 times in a row instead of using 5command : simple smooth anymation
nmap <up> <c-y><c-y><c-y><c-y><c-y><c-y>
nmap <down> <c-e><c-e><c-e><c-e><c-e><c-e>
nmap <left> zhzhzhzhzh
nmap <right> zlzlzlzlzl
