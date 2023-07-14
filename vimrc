call plug#begin()
Plug 'sainnhe/everforest' " Color theme
Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP
Plug 'sheerun/vim-polyglot' " Syntax highlight
Plug 'preservim/nerdtree' " File explorer
Plug 'kien/ctrlp.vim' " File finder
call plug#end()

" Everforest
if has('termguicolors')
    set termguicolors
endif
set background=dark
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
colorscheme everforest

" CoC
let g:coc_global_extensions = ['coc-json', 'coc-clangd']
inoremap <silent><expr> <C-n> coc#refresh()
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Nerdtree
nnoremap <C-s> :NERDTreeToggle<cr>
let NERDTreeMapPreview='a'
let NERDTreeMapActivateNode='f'

" Duplicate symbols
inoremap <C-s>[ []<Left>
inoremap <C-s>( ()<Left>
inoremap <C-s>{ {}<Left><cr><Up><Right>
inoremap <C-s>" ""<Left>
inoremap <C-s>' ''<Left>

" Run program
nnoremap <F5> :w<cr>:exe "!cd " .. expand("%:p:h") .. " && ./start.sh"<cr>
nnoremap <F4> :w<cr>:exe "!cd " .. expand("%:p:h") .. "/../ && clear && make && build/main"<cr>

" Window management
nnoremap <C-n> :botright term<cr>
nnoremap <C-l> :tabnext<cr>
nnoremap <C-h> :tabprevious<cr>
nnoremap <Esc>h <C-w>h
nnoremap <Esc>l <C-w>l
nnoremap <Esc>j <C-w>j
nnoremap <Esc>k <C-w>k
nnoremap <Esc>H <C-w>H
nnoremap <Esc>L <C-w>L
nnoremap <Esc>J <C-w>J
nnoremap <Esc>K <C-w>K
nnoremap <C-w> :q<cr>

" Mandatory setup
set number
set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=0
set belloff=all
set clipboard=unnamedplus

" Fancy cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Transparent background
hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

