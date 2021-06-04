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
set background=dark

set tw=79
set ruler
set cursorline
set colorcolumn=80

""" Nvim tree default config
let g:nvim_tree_side = 'left' "left by default
let g:nvim_tree_width = 40 "30 by default
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

nnoremap <leader>fm :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue


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
  require 'lspconfig'.r_language_server.setup{on_attach=require'completion'.on_attach }

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

