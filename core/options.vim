let g:mapleader=' '

"""
" Editor
"""

" General tab settings
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " expand tab to spaces so that tabs are spaces

set smartindent

" Align indent to next multiple value of shiftwidth. For its meaning,
" see http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
set shiftround

set nowrap

" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>

" Show line number and relative line number
set number relativenumber  

" Ignore case in general, but become case-sensitive when uppercase is present
set ignorecase smartcase

set scrolloff=10

set cursorline

set nohlsearch

" Fold by treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

"""
" Interface
"""

" Split window below/right when creating horizontal/vertical windows
set splitbelow splitright

set title

" Text after this column number is not highlighted
set synmaxcol=200  

set signcolumn=auto:2

set termguicolors


"""
" Setting
"""

" Clipboard settings, always use clipboard for all delete, yank, change, put
" operation, see https://stackoverflow.com/q/30691466/6064933
if !empty(provider#clipboard#Executable())
  set clipboard+=unnamedplus
endif

" Disable creating swapfiles, see https://stackoverflow.com/q/821902/6064933
set noswapfile

" Minimum lines to keep above and below cursor when scrolling
set mouse=nic

" Persistent undo even after you close a file and re-open it
set undofile

set hidden

