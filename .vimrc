set nocompatible

set showcmd "show (partial) command keys in the status line
set showmode "display the current mode in the status line
set display+=lastline "show last line even if it doesn't fit

set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅,eol:$
set nolist "whitespace off

set incsearch "search while typing
set ignorecase "ignore case in search
set smartcase "...unless a capital is typed

set tabstop=4 "spaces represented by a tab
set shiftwidth=4 "spaces for each step of (auto)indent
set expandtab "replace tabs with spaces
set smarttab "correct to tabstop/indent beginning of line
set softtabstop=4 "temporary tabstop to use while editing
set autoindent "new line indents to same level as previous line
set nosmartindent "prevent detecting when to change indent
set timeoutlen=5000 "wait this long for another keypress
set formatoptions+=j "delete comment character when joining commented lines
set scrolloff=5 "number of lines to show on either side of cursor when scrolling vertically
set sidescrolloff=5 "and horizontally
set number "turn on line numbers
set norelativenumber "line numbers are absolute
set nowrap "line wrapping off
set hlsearch "highlight search results
set noswapfile "don't create swap files
set nobackup
set noautoread "dont automatically reload files modified externally
set bsdir=last "go to last folder when browsing
set splitright "open new split pane on right
set complete-=i "don't scan include files (just use ctags)
set wildmenu "tab shows matches for partial command
set wildmode=list:longest "complete up to the point of ambiguity, still showing options
set path+=** "enables tab completion for filenames
set history=1000
set tabpagemax=50

set cindent
set cinkeys-=0#
set indentkeys-=0#
set nrformats-=octal "needed to inc/dec file suffixes eg part-04

source	~/.vim/functions.vim

set diffexpr=MyDiff()

set statusline=
set statusline+=[%f]    "filename
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{&fileformat}]
set statusline+=%*
set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \  "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2        "always show status line

set guifont=Inconsolata\ 12
set guitablabel=%{GuiTabLabel()}
set guioptions-=T "hide gvim toolbar

set foldnestmax=1
set foldmethod=indent

syntax enable
filetype off                  " vundle required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'thaerkh/vim-workspace'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'grep.vim'
Plugin 'tpope/vim-rsi'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'mbbill/undotree'
"Plugin 'pangloss/vim-javascript'
"Plugin 'leafgarland/typescript-vim'
Plugin 'ryanoasis/vim-devicons' "must be last

call vundle#end()

filetype on                  " required
filetype plugin on
filetype plugin indent on

set background=dark
if !has("gui_running")
    let g:solarized_termcolors=256
endif
colorscheme solarized
hi NonText gui=NONE guifg=#cc8000
hi SpecialKey gui=NONE guifg=#cc8000

let g:workspace_autosave = 0
let g:workspace_autosave_untrailspaces = 0

map <C-n> :NERDTreeToggle<CR>

let g:NERDCustomDelimiters = { 'vim': { 'left': '"' } }
let g:NERDCustomDelimiters = { '.vimrc': { 'left': '"' } }

let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1

autocmd BufNewFile,BufRead,BufWrite *.apxc set syntax=java

"allow undo of <C-U> after inserting a line
inoremap <C-U> <C-G>u<C-U> 

nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>
inoremap <C-tab>   <Esc>:tabnext<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

:nnoremap <silent><C-k> :let save_a=@a<Cr><Up>"add"ap<Up>:let @a=save_a<Cr>
:nnoremap <silent><C-j> :let save_a=@a<Cr>"add"ap:let @a=save_a<Cr>

:inoremap <buffer> ;; <C-o>/%%%<CR><C-o>c3l
:nnoremap <buffer> ;; /%%%<CR>c3l
