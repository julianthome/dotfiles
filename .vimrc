" My minimal vim configuration

" = List of VIM Plugins =
call plug#begin('~/.nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'
Plug 'neomake/neomake'
" syntax highlighting for a plethora of different languages
Plug 'sheerun/vim-polyglot'
" highlight changed lines for git
Plug 'airblade/vim-gitgutter'
" LSP
" Switch to nvim-lsp once it is mature enough
" Plug 'neovim/nvim-lsp'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
" set spell
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

""" KISS lightline settings
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

" lightline-buffer function settings
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
    \ 'V' : 'v-v',
    \ "\<C-v>": 'c-v',
    \ 'c' : 'c',
    \ 's' : 's',
    \ 'S' : 'v-S',
    \ "\<C-s>": 'c-S',
    \ 't': 't',
    \ }

" File search
" fzf settings
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

" = LSP/Coc =
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

