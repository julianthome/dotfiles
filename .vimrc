" My vim config

" = List of VIM Plugins =
"" This list should be kept as minimal as possible: only use plugins in case
"" the functionality cannot be easily achieved by tweaking the vim config.
call plug#begin('~/.nvim/plugged')

""" visuals/statusline/icons
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'kyazdani42/nvim-tree.lua'
Plug 'RRethy/vim-illuminate'

""" highlight git changes in the sidebar
Plug 'airblade/vim-gitgutter'

""" language support
"""" LSP
Plug 'neovim/nvim-lspconfig'

"""" Completion
Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-buffer', { 'branch': 'main' }
Plug 'hrsh7th/cmp-path', { 'branch': 'main' }
Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-vsnip', { 'branch': 'main' }
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'EdenEast/nightfox.nvim', { 'branch': 'main' }

"""" syntax highlighting for a plethora of different languages

""" Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rafamadriz/friendly-snippets', { 'branch': 'main' }
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

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

set tw=79
set ruler
set cursorline
set colorcolumn=80
let g:tab_open = 1
nnoremap <leader>fm :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

" = Searching = "
lua << EOF
-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
EOF

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fl <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fB <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fv <cmd>lua require('telescope.builtin').git_files()<cr>

function! Synctex()
  " remove 'silent' for debugging
  execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . bufname('%')[:-5]. ".pdf"
  redraw!
endfunction

map <leader>lv :call Synctex()<CR><CR>

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

imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']
let g:vsnip_filetypes.golang = ['go']

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect


"" Setup language servers and status line
lua << EOF
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local cmp = require'cmp'
    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        mapping = {
            ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
            ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
            ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
            { name = 'buffer' },
            },
        experimental = {
            native_menu = false,
            ghost_text = true,
            },
})

  -- vim.lsp.set_log_level("debug")
  require 'lspconfig'.gopls.setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  require 'lspconfig'.solargraph.setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  require('lualine').setup{
    options = {
      theme = 'nightfox',
      section_separators = {'', ''},
      component_separators = {'', ''},
      icons_enabled = false,
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
  require'nvim-tree'.setup()
  vim.cmd("colorscheme nordfox")
EOF

let g:vsnip_snippet_dir = resolve('~/.config/nvim/snippets')

" Avoid showing message extra message when using completion
set shortmess+=c
let g:Illuminate_ftHighlightGroups = {
     \ 'vim': ['vimVar', 'vimString', 'vimLineComment',
     \         'vimFuncName', 'vimFunction', 'vimUserFunc', 'vimFunc']
     \ }
let g:Illuminate_highlightUnderCursor = 0
let g:Illuminate_delay = 500

let g:indentLine_setColors = 0
let g:indentLine_char_list = ['·']


