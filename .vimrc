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

Plugin 'scrooloose/nerdtree' " https://github.com/scrooloose/nerdtree
Plugin 'alvan/vim-closetag' " close xml tag automatically
Plugin 'Valloric/MatchTagAlways' " highlight matching xml tag
Plugin 'morhetz/gruvbox' " gruvbox colorscheme
Plugin 'christoomey/vim-tmux-navigator' " seemless navigation between vim and tmux panes
Plugin 'tpope/vim-surround' " add surround functionality
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy file finder
Plugin 'michaeljsmith/vim-indent-object' " indent as text object. Add mappings ai, ii, aI, iI


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

"display incomplete commands
set showcmd
"display the mode you are in everytime
set showmode
" activate mouse (but without visual mode)
set mouse=nicr

" when in insert mode, ready to paste, if you press <F2>, Vim will switch to paste mode, disabling all kinds of smartness and just pasting a whole buffer of text. Then, you can disable paste mode again with another press of <F2>. Nice and simple
set pastetoggle=<F2>

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
map n nzz

" highlight all occurences and show count stats in command line
nnoremap <space> mm*:%s///gn<cr>`m
nnoremap <BS> :b#<CR>

"nnoremap <F6> :setlocal spell spelllang=de_de<cr>
"nnoremap <F7> :setlocal spell spelllang=en_us<cr>
" Spell Check
" Toggles between no checking, german and english
let g:myLangList=["nospell","de_de","en_us"]
function! ToggleSpell()
  if !exists( "b:myLang" )
    if &spell
      let b:myLang=index(g:myLangList, &spelllang)
    else
      let b:myLang=0
    endif
  endif
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction

nmap <silent> <F6> :call ToggleSpell()<CR>

" leader
:let mapleader = ","

" reload default vimrc
nnoremap <leader><F5> :source $MYVIMRC<cr>

" indent all lines and jump back to last position
nnoremap <leader>f mmgg=G`m
" toggle nerdtree
nmap <leader>n :NERDTreeToggle<cr>
" find current file in tree view
nmap <C-Left> :NERDTreeFind<cr>
" open nerdtree on right side
let g:NERDTreeWinPos = "right"

" quick open vimrc file in new tab
nnoremap <leader>v :tabe $MYVIMRC<cr>

" open current file in a gui editor for easier (mouse based) copy-paste
nnoremap <leader>e :w<cr> :!gedit %<cr>

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" switch case of word's first letter
nmap <leader>c mmb~`m

" toggle checkbox in markdown syntax (first in row) [ ] <-> [x]
nnoremap <leader>x :s/\[[x ]\]/\=submatch(0) == '[x]' ? '[ ]' : '[x]'/<cr>:noh<cr><c-o>

" mappings for programming
" join variable declaration
nnoremap <leader>pj mmgdf=w"my$"_ddV`m:s//<c-r>m/gc<cr>

nnoremap <leader>) A)<Esc>

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


" Some experiments on smooth scroll
" This is alsop accomplished by this plugin:
" https://github.com/Kazark/vim-SimpleSmoothScroll
function! SmoothScroll(up)
    if a:up
        let scrollaction=""
    else
        let scrollaction=""
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    while counter<&scroll
        let counter+=1
        sleep 5m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction
nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>

" explicitly do it 5 times in a row instead of using 5command : simple smooth anymation
nmap <up> <c-y><c-y><c-y><c-y><c-y><c-y>
nmap <down> <c-e><c-e><c-e><c-e><c-e><c-e>
nmap <left> zhzhzhzhzh
nmap <right> zlzlzlzlzl
