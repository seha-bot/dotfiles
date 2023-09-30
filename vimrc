call plug#begin()
Plug 'sainnhe/everforest' " Color theme
Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP
Plug 'sheerun/vim-polyglot' " Syntax highlight
Plug 'preservim/nerdtree' " File explorer
Plug 'kien/ctrlp.vim' " File finder
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
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
let g:coc_global_extensions = ['coc-json', 'coc-clangd', 'coc-highlight', 'coc-rust-analyzer']
inoremap <silent><expr> <C-n> coc#refresh()
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <silent> gd <Plug>(coc-definition)
nmap ga <Plug>(coc-codeaction-selected)
nmap <F2> <Plug>(coc-rename)
let g:rustfmt_autosave = 1
inoremap <nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

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

" Build & run
nnoremap <F5> :w<cr>:exe "!clear && make && build/main"<cr>
nnoremap <F4> :w<cr>:exe "!clear && make && build/main " . input("Args: ")<cr>

" Window management
nnoremap <C-n> :botright term<cr>
nnoremap <C-L> :tabnext<cr>
nnoremap <C-H> :tabprevious<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-w> :q<cr>

" Mandatory setup
set number
set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=0
set belloff=all
set clipboard=unnamedplus
autocmd BufWritePre * %s/\s\+$//e

" Fancy cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Transparent background
hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" 80 column line
" set colorcolumn=80
