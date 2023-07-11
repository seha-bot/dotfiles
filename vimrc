call plug#begin()
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

" Ale
let g:ale_c_cc_options = '-std=c11 -Wall -Iinc -Ibuild/deps'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_fix_on_save = 1

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
