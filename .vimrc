" My vim config

" = List of VIM Plugins =
"" This list should be kept as minimal as possible: only use plugins in case
"" the functionality cannot be easily achieved by tweaking the vim config.
call plug#begin('~/.nvim/plugged')

""" visuals/statusline/icons
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
""" file searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-tree.lua'
""" highlight git changes in the sidebar
Plug 'airblade/vim-gitgutter'

""" language support
"""" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'arcticicestudio/nord-vim'
"""" syntax highlighting for a plethora of different languages
Plug 'sheerun/vim-polyglot'
call plug#end()

set expandtab
set smarttab
set clipboard^=unnamed,unnamedplus
set bs=2
set mouse=a
""" incremental refined search
set hlsearch
set incsearch
set ignorecase
set smartcase
set nobackup
set nowritebackup
set noswapfile
set encoding=utf8
set termguicolors
"" do not print out mode
set noshowmode
set autoread
"" fast scrolling
set ttyfast
"" spelling
set spell
set backspace=2
""" do not automatically wrap on load 
set nowrap
""" no wrap while typing
set fo-=t 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
""" numbering
set nu
set rnu
""" command history
set history=700
set undolevels=700

""" maintain undo history when closing the file
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" = Keybindings =

"" leader key
let mapleader = ' '
let maplocalleader = ' '

"" buffer navigation
nnoremap <silent> <leader>bp :bprevious<CR> 
nnoremap <silent> <leader>bn :bnext<CR> 
nnoremap <leader>bd :bd<CR> 
nnoremap <leader>bl :ls<CR>

"" indentation
vnoremap < <gv 
vnoremap > >gv

"" indentation
vmap Q gq
nmap Q gqap

"" do not use arrow keys
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>

"" map jk instead of ESC
imap jk <Esc>

syntax on
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
colorscheme nord

set tw=79
set ruler
set cursorline
set colorcolumn=80

""" Nvim tree
map <leader>fm :NvimTreeToggle<CR>

"" fzf settings start
" TODO: Replace this with a lua script
if executable("fzf")
    nnoremap <leader>ff :Files<CR> 
endif

""" grep quickly and interactively through files with rg
if executable("rg")
    nnoremap <leader>rg :Rg<CR>
endif

"" fzf settings end

" = LSP =
"" Keybindings
nmap     <leader>lrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ldf :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>ldc :lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>lhv :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>li  :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>lm  :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>ltd :lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>lr  :lua vim.lsp.buf.references()<CR>
nnoremap <leader>lds :lua vim.lsp.buf.document_symbol()<CR>
nnoremap <leader>lws :lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <leader>lca :lua vim.lsp.buf.code_action()<CR>

"" Setup language servers and status line
lua << EOF
  require 'lspconfig'.clojure_lsp.setup{ name = "clojure_lsp" }
  require 'lspconfig'.gopls.setup{on_attach=require'completion'.on_attach }
  require 'lspconfig'.solargraph.setup { on_attach=require'completion'.on_attach } 
  require 'lspconfig'.rust_analyzer.setup{on_attach=require'completion'.on_attach }
  require 'lspconfig'.texlab.setup{on_attach=require'completion'.on_attach }

  require('lualine').setup{
    options = {
      theme = 'nord',
      section_separators = {'', ''},
      component_separators = {'', ''},
      icons_enabled = true,
    },
    sections = {
      lualine_a = { {'mode', upper = true} },
      lualine_b = { {'branch', icon = ''} },
      lualine_c = { {'filename', file_status = true} },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location'  },
    },
    inactive_sections = {
      lualine_a = {  },
      lualine_b = {  },
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {  },
      lualine_z = {   }
    },
    extensions = { 'fzf' }
  }
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

