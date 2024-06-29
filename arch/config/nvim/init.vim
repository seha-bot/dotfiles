" Packages
call plug#begin()
Plug 'sheerun/vim-polyglot' " Syntax highlight
Plug 'nvim-lua/plenary.nvim' " Telescope dependency
Plug 'nvim-telescope/telescope.nvim' " Telescope (grep)
Plug 'nvim-telescope/telescope-file-browser.nvim' " File browser
Plug 'neovim/nvim-lspconfig' " LSP
" TODO setup this plugin
" Plug 'mfussenegger/nvim-lsp-compl' " Autocomplete
call plug#end()

" Telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap ff <cmd>Telescope live_grep<cr>

" Telescope file browser
nnoremap fb <cmd>Telescope file_browser<cr>

" LSP
lua local lspconfig = require('lspconfig')
" lua require'lspconfig'.clangd.setup{on_attach=require'lsp_compl'.attach}
lua require'lspconfig'.clangd.setup{}

" Quck fix
nnoremap <silent> ga <cmd>lua vim.lsp.buf.code_action()<cr>

" Mandatory setup
set number
set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=0
set belloff=all
set clipboard=unnamedplus
autocmd BufWritePre * %s/\s\+$//e
