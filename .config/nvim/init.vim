"------------------------------------------------------------------------------ 
"      - Lua imports
"------------------------------------------------------------------------------ 
lua require("plugins")

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

" -----------------------------------------------------------------------------
"     - Default settings -
" -----------------------------------------------------------------------------
filetype plugin indent on
syntax on

set nopreviewwindow
set fillchars+=vert:│
set tabstop=4
set expandtab
set shiftwidth=4
set whichwrap=b,s,<,>,h,l,[,]
set incsearch
set ignorecase
set smartcase
set smartindent
set wildmenu
set wildmode=full
set foldmethod=indent
set foldenable
set foldlevelstart=10
set foldnestmax=10
set ruler
set laststatus=0
set splitright
set splitbelow
set backspace=indent,eol,start
set nowrap
set nohlsearch
set ttimeoutlen=10
set mouse=
set noswapfile
set colorcolumn=80
set nosmd
set hidden
set nomodeline

let g:netrw_banner=0

" -----------------------------------------------------------------------------
"     - Color settings -
" -----------------------------------------------------------------------------
colorscheme nightfox

" -----------------------------------------------------------------------------
"     - Custom Key Mapping -
" -----------------------------------------------------------------------------
let mapleader=","

nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd <cmd>Telescope diagnostics<cr>

" -----------------------------------------------------------------------------
"     - Rust Stuff -
" -----------------------------------------------------------------------------

let g:rustfmt_autosave = 1

" -----------------------------------------------------------------------------
"     - Spelling Stuff -
" -----------------------------------------------------------------------------
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

let g:rustfmt_autosave = 1

" -----------------------------------------------------------------------------
"     - Lua Bits -
" -----------------------------------------------------------------------------

lua << EOF
require('telescope').setup {}
require('telescope').load_extension('fzf')
EOF

lua  << EOF
require('lspconfig').rust_analyzer.setup {
    on_attach = function()
        vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
        vim.api.nvim_buf_set_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
        vim.api.nvim_buf_set_keymap(0, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true})
        vim.api.nvim_buf_set_keymap(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true})

        vim.api.nvim_buf_set_keymap(0, 'n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', {noremap = true})
        vim.api.nvim_buf_set_keymap(0, 'n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {noremap = true})
        
        vim.api.nvim_buf_set_keymap(0, 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true})
    end,
    settings = {
        ['rust-analyzer'] = {
            assist = {
                importMergeBehavior = "last",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true,
            },
            procMacro = {
                enable = true,
            },
            checkOnSave = {
                command = "clippy",
            },
        }
    }
}
EOF
