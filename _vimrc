" comment
set termguicolors                       " enable background colors in themes

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'			" Project and file navigation	
Plugin 'kshenoy/vim-signature'
Plugin 'easymotion/vim-easymotion'
Plugin 'mileszs/ack.vim'
" status bar
Plugin 'vim-airline/vim-airline'
" rust.vim
" This is a vim plugin that provides Rust file detection, syntax highlightning
" formattin, Syntastic inegration and more
" https://github.com/rust-lang/rust.vim
Plugin 'rust-lang/rust.vim'
" tagbar
" Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file 
" and get an overview of its structure. 
" It does this by creating a sidebar that displays the ctags-generated tags 
" of the current file, ordered by their scope. 
" This means that for example methods in C++ are displayed under the class they are defined in.
Plugin 'majutsushi/tagbar'
"---------------=== Languages support ===-------------
" --- Python ---
Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

syntax on
" let mapleader=','
let mapleader=" "
" switch between splits
" map <Leader>j <C-w>j
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

set number
set relativenumber
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" set guifont=hack:h10.7
set guifont=hack:h10.5

set encoding=utf-8

colorscheme onedark

set lines=50 columns=200
set tabstop=4

" search for the word under cursor in the current directory 
" aud all subdirectories
map <F4> :execute "vim /" . expand("<cword>") . "/j **" <Bar> cw<CR>

map <C-Up> :exe "res +5"<CR>
map <C-Down> :exe "res -5"<CR>
map <C-Left> :exe "vertical resize +5"<CR>
map <C-Right> :exe "vertical resize -5"<CR>

" open NERDTree with Ctrl+n
" map <C-n> :NERDTreeToggle<CR>
" open NERDTree with F2
map <F2> :NERDTreeToggle<CR>
" open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree

function! NERDTreeToggleInCurDir()                                                                                                                                                             
·   " If NERDTree is open in the current buffer
·   if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
·   ·   exe ":NERDTreeClose"
·   else
·   ·   if (expand("%:t") != '')
·   ·   ·   exe ":NERDTreeFind"
·   ·   else
·   ·   ·   exe ":NERDTreeToggle"
·   ·   endif
·   endif
endfunction

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

hi Search guibg=black guifg=white

" Toggle Tagbar
nmap <F8> :TagbarToggle<CR>


set encoding=UTF-8

" remap only command
command O on


