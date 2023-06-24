call plug#begin()
Plug 'natebosch/vim-lsc' " Language server
Plug 'tikhomirov/vim-glsl' " GLSL syntax
Plug 'sainnhe/everforest' " Color theme
Plug 'sheerun/vim-polyglot' " Syntax highlight
Plug 'preservim/nerdtree' " File explorer
Plug 'kien/ctrlp.vim' " File finder
call plug#end()

" GLSL language for these files TODO maybe replace with polyglot
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

if has('termguicolors')
    set termguicolors
endif
set background=dark
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
colorscheme everforest

let g:lsc_server_commands = {
    \ 'c': {
    \     'command': 'clangd',
    \     'log_level': -1,
    \     'suppress_stderr': v:true,
    \ }
    \}
let g:lsc_auto_map = {
    \ 'GoToDefinition': 'gd',
    \ 'FindReferences': 'gr',
    \ 'NextReference': '<C-j>',
    \ 'PreviousReference': '<C-k>',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': '<F2>',
    \ 'ShowHover': v:true,
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
    \}
set completeopt=menu,menuone,noinsert,noselect

let NERDTreeMapPreview='a'
let NERDTreeMapActivateNode='f'

inoremap <C-s>[ []<Left>
inoremap <C-s>( ()<Left>
inoremap <C-s>{ {}<Left><Return><Up><Right>
inoremap <C-s>" ""<Left>
inoremap <C-s>' ''<Left>

nnoremap <C-f> :LSClientAllDiagnostics<Return>
nnoremap <F5> :w<Return>:exe "!cd " .. expand("%:p:h") .. " && ./start.sh"<Return>
nnoremap <F4> :w<Return>:exe "!cd " .. expand("%:p:h") .. "/../ && clear && make && build/main"<Return>
nnoremap <C-s> :NERDTreeToggle<cr>
nnoremap <C-s> :NERDTreeToggle<cr>

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

