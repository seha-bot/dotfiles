call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <C-s>[ []<Left>
inoremap <C-s>( ()<Left>
inoremap <C-s>{ {}<Left>
inoremap <C-s>" ""<Left>
inoremap <C-s>' ''<Left>

nnoremap <F5> :w<Return>:exe "!cd " .. expand("%:p:h") .. " && ./start.sh"<Return>
nnoremap <F2> :LspRename<Return>

set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=0
set belloff=all
set clipboard=unnamedplus

