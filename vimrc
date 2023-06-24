call plug#begin()
Plug 'natebosch/vim-lsc' " Language server
Plug 'dense-analysis/ale' " Linter
Plug 'tikhomirov/vim-glsl' " GLSL syntax
Plug 'sainnhe/everforest' " Color theme
Plug 'sheerun/vim-polyglot' " Syntax highlight
Plug 'preservim/nerdtree' " File explorer
Plug 'kien/ctrlp.vim' " File finder
call plug#end()

" GLSL language for these files TODO maybe replace with polyglot
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

" Theme settings
if has('termguicolors')
    set termguicolors
endif
set background=dark
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
colorscheme everforest

" LSP and lint
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
    \ 'FindCodeActions': '<C-a>',
    \ 'Rename': '<F2>',
    \ 'ShowHover': v:true,
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
    \}
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
nnoremap <C-f> :LSClientAllDiagnostics<cr>
set completeopt=menu,menuone,noinsert,noselect
let g:ale_c_cc_options = '-std=c11 -Wall -Iinc -Ibuild/deps'

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

" Tabs and terminal
nnoremap <C-n> :below term<cr>
nnoremap <C-l> :tabnext<cr>
nnoremap <C-h> :tabprevious<cr>
nnoremap <C-c> :tabclose<cr>

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

