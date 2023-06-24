call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'sainnhe/everforest'
Plug 'sheerun/vim-polyglot'
call plug#end()

if has('termguicolors')
    set termguicolors
endif
set background=dark
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
colorscheme everforest

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <C-s>[ []<Left>
inoremap <C-s>( ()<Left>
inoremap <C-s>{ {}<Left><Return><Up><Right>
inoremap <C-s>" ""<Left>
inoremap <C-s>' ''<Left>

nnoremap <F5> :w<Return>:exe "!cd " .. expand("%:p:h") .. " && ./start.sh"<Return>
nnoremap <F4> :w<Return>:exe "!cd " .. expand("%:p:h") .. "/../ && clear && make && build/main"<Return>
nnoremap <F2> :LspRename<Return>

autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=0
set belloff=all
set clipboard=unnamedplus
" Transparent background
hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

