call plug#begin('~/.vim/plugged')
Plug 'davidhalter/jedi', {'on_ft': 'python'}
Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'
Plug 'klen/python-mode'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wincent/command-t'
Plug 'tpope/vim-surround'
Plug 'chriskempson/tomorrow-theme'
Plug 'chriskempson/base16-vim'
Plug 'mhartington/oceanic-next'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'mattn/calendar-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mbbill/undotree',             { 'on': 'UndotreeToggle'   }
Plug 'mhinz/vim-signify'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
call plug#end()


" remap leader
let mapleader = ","
let maplocalleader = ','
" general
autocmd! BufWritePost .vimrc source
autocmd! BufWritePost * Neomake
filetype plugin indent on

set encoding=utf8
set termguicolors
set noshowmode
filetype on
syntax enable
syntax on

colorscheme base16-eighties
"colorscheme OceanicNext
set background=dark
let g:solarized_termtrans = 1
" set termcolors to 256 instead of std 16
let g:solarized_termcolors = 256
let g:vim_markdown_folding_disabled = 1
" turn on spelling for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
" highlight bad words in red
autocmd BufRead,BufNewFile *.md hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224
" disable markdown auto-preview. Gets annoying
let g:instant_markdown_autostart = 0


set autoread
set ttyfast
set spell
set nu
set hlsearch
set backspace=2
set number
set rnu
set tw=79
set nowrap " no wrap on load
set fo-=t " no wrap while typing
set colorcolumn=80
set ruler
set cursorline
highlight ColorColumn ctermbg=244
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
hi SpellBad guibg=#F08080 guifg=#000000 ctermbg=224 ctermfg=0

" buffers
set hidden " allow hidden buffers

autocmd BufRead,BufNew,BufNewFile *.tex syntax spell toplevel

nnoremap <silent> [b :bprevious<CR> 
nnoremap <silent> ]b :bnext<CR> 
nnoremap <silent> [B :bfirst<CR> 
nnoremap <silent> ]B :blast<CR>
nnoremap <leader>bd :bd<CR> 
nnoremap <leader>bl :ls<CR>

" command history
cnoremap <C-p> <Up> 
cnoremap <C-n> <Down>

" ,lv to display pdf
map ,lv <leader>lv

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

set pastetoggle=<f2>
set clipboard=unnamed
set mouse=a
set bs=2

" remap ctrl + [ to escape
"inoremap <c-[> <esc>

" quicksave
noremap <c-z> :update<cr>
vnoremap <c-z> <c-c>:update<cr>
vnoremap <c-z> <c-o>:update<cr>

" quit
noremap <leader>x :x<cr>

" windows and tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" indentation
vnoremap < <gv 
vnoremap > >gv

" sort 
vnoremap <Leader>s :sort<CR>

" indentation
vmap Q gq
nmap Q gqap

" history
set history=700
set undolevels=700

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

set nobackup
set nowritebackup
set noswapfile

" thanks to https://skyuuka.wordpress.com/2014/07/11/setup-synctex-with-vim-pdflatex-and-skim/
map ,ls :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> main.pdf %<CR><CR>
map ,lv :w<CR>:silent !open main.pdf %<CR><CR>

let g:neomake_rinfo_maker = {
\ 'exe': 'rubber-info',
\ 'args': ['main.tex'],
\ 'append_file': 0,
\ 'errorformat': '%f:%l: %m,%f:%l-%\d%\+: %m,%f: %m',
\ }

let g:neomake_rubsync_maker = {
\ 'exe': 'rubber',
\ 'args': ['--pdf', '--synctex', '--warn=all', 'main.tex'],
\ 'append_file': 0,
\ 'errorformat': '%f:%l: %m,%f: %m',
\ }

autocmd FileType tex map <leader>lr :w<CR>:Neomake! rubsync<CR>
autocmd FileType tex map <leader>lc :w<CR>:NeomakeSh! rubber --clean *.tex<CR>

autocmd VimEnter * wincmd p

" airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'

nmap <leader>t :term<cr>
nmap <leader>, :bnext<CR>
nmap <leader>. :bprevious<CR>
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h13
"}}}

" ctags
command! MakeTags !ctags -R .
autocmd BufWritePost *
            \ if filereadable('tags') |
            \   call system('ctags -a '.expand('%')) |
            \ endif

" file search
set path+=**
set wildmenu

" nnoremap <leader>fg :-1read $HOME/.vim/templates/tex/simplefigure.tex<CR>

" nerd tree
nnoremap <leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <leader>v :NERDTreeFind<CR>
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

set modifiable

"asciidoc
autocmd FileType asciidoc map <leader>lr :w<CR>:Start! asciidoctor -toc *.main -o index.html<CR>
autocmd FileType asciidoc map <leader>lv :w<CR>:Start! open index.html<CR>

"markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal = 0

"fuzzy search
if executable("fzf")
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
    if executable("rg")
        nnoremap <leader>rg :Rg<CR>
    endif
endif

"util snips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.vim/plugged/vim-snippets/UltiSnips"
let g:UltiSnipsSnippetsDirectories=["~/.vim/plugged/vim-snippets/UltiSnips"]
let g:UltiSnipsEditSplit="vertical"
nnoremap <leader>y :UltiSnipsEdit<CR>

" deoplete 
if has('nvim')
    let g:deoplete#enable_at_startup = 1
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" ripgrep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" persistent undo
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
nnoremap <leader>e :UndotreeToggle<cr>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" tagbar
nmap <leader>tb :TagbarToggle<CR>

" gv.vim
nmap <leader>g :GV<CR>
nmap <leader>gf :GV?<CR>

