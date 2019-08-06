set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
    Plug 'altercation/vim-colors-solarized'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'tomtom/tlib_vim'
    Plug 'garbas/vim-snipmate'
    Plug 'honza/vim-snippets'
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'luochen1990/rainbow'
    Plug 'scrooloose/nerdtree'
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-indent'
    Plug 'kana/vim-textobj-line'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'christoomey/vim-sort-motion'
    Plug 'christoomey/vim-system-copy'
call plug#end()

set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile

set history=100
set ruler

set number
set relativenumber
set nowrap
set laststatus=2

set cursorline
set cursorcolumn
set wildmenu
set wildmode=list:longest,full

set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab

set scrolloff=5
set sidescroll=1
set sidescrolloff=5

set autoindent
set smartindent
set cindent

set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb2312,cp936

set fileformat=unix
set foldmethod=indent
set background=dark

filetype plugin indent on
syntax enable
colorscheme solarized

highlight folded cterm=bold

let g:rainbow_active=1
let g:rainbow_conf={
 \ 'ctermfgs': ['darkblue', 'darkmagenta', 'darkgreen', 'darkyellow', 'darkred']
 \ }

let g:solarized_termcolors=256
let g:solarized_bold=0
let g:solarized_italic=0
let g:solarized_underline=0

let g:lightline={
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"❖":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'component_function': {
  \   'filename': 'LightlineFilename'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '~', 'right': '❂' }
  \ }

function! LightlineFilename()
    let root = fnamemodify(get(b:, 'git_dir'), ':h')
    let path = expand('%:p')
    if path[:len(root)-1] ==# root
        return path[len(root)+1:]
    endif
    return expand('%')
endfunction

" easy-align
xmap ga <Plug>(EasyAlign)

" NERDTree
map <C-n> :NERDTreeToggle<CR>
