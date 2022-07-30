" Move the cursor based on physical lines, not the actual lines.
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap ^ g^
nnoremap 0 g0

" Jump to matching pairs easily in normal mode
nnoremap <Tab> %

" Go to start or end of line easier
noremap H ^
noremap L g_

" Move cursor in insert mode
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>

" Quit insert mode
inoremap jk <Esc>
inoremap jj <Esc>

noremap U <C-r>
nnoremap  <leader>q :q<CR>

" Change text without putting into register
" see https://stackoverflow.com/q/54255/6064933
nnoremap c "_c

" Replace visual selection with text in register
xnoremap p "_c<ESC>p

" Continuous visual shifting
xnoremap < <gv
xnoremap > >gv

" Keep cursor position after yanking
nnoremap y myy

" Window
nnoremap <leader>w <C-w>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Run Command easier
nnoremap ; :
nnoremap : ;

" Terminal
tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>

" Nvim-tree
nnoremap <leader>po :NvimTreeToggle<CR>
nnoremap <leader>pO :NvimTreeFindFile<CR>

" Telescope
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fc :Telescope live_grep<CR>

" Bufferline
nnoremap <silent><leader>] :BufferLineCycleNext<CR>
nnoremap <silent><leader>[ :BufferLineCyclePrev<CR>
nnoremap <silent>gb :BufferLinePick<CR>
nnoremap <silent><leader>q :w \| :Bdelete<CR>


