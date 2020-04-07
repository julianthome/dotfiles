" My vim config

" = List of VIM Plugins =
"" This list should be kept as minimal as possible: only use plugins in case
"" the functionality cannot be easily achieved by tweaking the vim config.
call plug#begin('~/.nvim/plugged')
""" visuals
Plug 'junegunn/seoul256.vim'
Plug 'itchyny/lightline.vim'

""" file searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'

""" highlight git changes in the sidebar
Plug 'airblade/vim-gitgutter'

""" language support
"""" LSP
""""" TODO: switch to nvim-lsp once it is mature enough
"""" Plug 'neovim/nvim-lsp'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"""" syntax highlighting for a plethora of different languages
Plug 'sheerun/vim-polyglot'

""" editing
"""" TODO: reimplement in lua
Plug 'tpope/vim-surround'
call plug#end()

set expandtab
set smarttab
set clipboard=unnamed
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
set hlsearch
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

" = Visuals =

"" main theme
colorscheme seoul256
let g:seoul256_background = 235
set background=dark
syntax on
set tw=79
set ruler
set cursorline
set colorcolumn=80

"" spelling errors highlighting colors
hi clear SpellBad
hi SpellBad cterm=underline
hi SpellBad gui=undercurl
hi SpellBad ctermfg=15 ctermbg=88 cterm=NONE guifg=#ffffff guibg=#990000 gui=NONE
"hi SpellBad ctermfg=009 ctermbg=011 guifg=#ff0000 guibg=#ffff00

"" KISS lightline settings
set hidden
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ 'tabline': {
    \   'left': [ [ 'bufferinfo' ],
    \             [ 'separator' ],
    \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
    \ },
    \ 'component_expand': {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
    \ },
    \ 'component_type': {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
    \ },
    \ 'component_function': {
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \ },
    \ 'component': {
    \   'separator': '',
    \ },
    \ 'separator':    { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '|', 'right': '|' },
    \ 'tabline_separator': { 'left' : '', 'right' : '' },
    \ }

let g:lightline_buffer_logo = ''
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = ''
let g:lightline_buffer_git_icon = ''
let g:lightline_buffer_ellipsis_icon = ''
let g:lightline_buffer_expand_left_icon = '< '
let g:lightline_buffer_expand_right_icon = ' >'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = ''

"" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20
let g:lightline.mode_map = {
    \ 'n' : 'n',
    \ 'i' : 'i',
    \ 'R' : 'r',
    \ 'v' : 'v',
    \ 'V' : 'v',
    \ "\<C-v>": 'c',
    \ 'c' : 'c',
    \ 's' : 's',
    \ 'S' : 'v',
    \ "\<C-s>": 'c',
    \ 't': 't',
    \ }

"" popup settings
hi Pmenu ctermfg=NONE ctermbg=238 cterm=NONE guifg=NONE guibg=#323232 gui=NONE
hi PmenuSel ctermfg=188 ctermbg=24 term=reverse guifg=NONE guibg=#214283 gui=NONE
hi PmenuSbar  ctermfg=NONE ctermbg=24 guifg=NONE guibg=#8e9292
hi PmenuThumb ctermfg=59 ctermbg=NONE guifg=NONE guibg=NONE
hi ErrorMsg ctermfg=15 ctermbg=88 cterm=NONE guifg=#ffffff guibg=#990000 gui=NONE
hi WarningMsg ctermfg=15 ctermbg=88 cterm=NONE guifg=#ffffff guibg=#990000 gui=NONE
hi Float ctermfg=67 ctermbg=NONE cterm=NONE guifg=#7ca8c6 guibg=NONE gui=NONE

"" vertical split separator
hi VertSplit ctermfg=60 ctermbg=236 cterm=NONE guifg=#555555 guibg=#323232 gui=NONE

"" netrw settings
""" automatically switch to current working dir
set autochdir

""" let netrw look like a file browser
"" https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

map <leader>op :NERDTreeToggle<CR>

"" fzf settings start
" TODO: Replace this with a lua script
if executable("fzf")
    autocmd BufNew * set rnu
    autocmd TermOpen * set rnu
    let g:fzf_layout = { 'window': 'enew' }
    let g:fzf_tags_command = 'ctags -R'
    command! -bang -nargs=* Rg
                \ call fzf#vim#grep(
                \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
                \   <bang>0 ? fzf#vim#with_preview('up:60%')
                \           : fzf#vim#with_preview('right:50%:hidden', '?'),
                \   <bang>0)

nnoremap <c-p> :FZF<CR> 
nnoremap <leader>c :Commit<CR>
nnoremap <leader>h :History<CR>

""" grep quickly and interactively through files with rg
if executable("rg")
    nnoremap <leader>rg :Rg<CR>
endif

""" integrate fzf into UI
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
endif
"" fzf settings end

" = LSP/Coc =
"" Keybindings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

