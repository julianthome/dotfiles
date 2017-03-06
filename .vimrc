call plug#begin('~/.vim/plugged')
Plug 'blueshirts/darcula'
Plug 'davidhalter/jedi', {'on_ft': 'python'}
Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'
Plug 'klen/python-mode'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-latex/vim-latex'
Plug 'wincent/command-t'
Plug 'tpope/vim-dispatch'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'chriskempson/tomorrow-theme'
Plug 'chriskempson/base16-vim'
Plug 'mhartington/oceanic-next'
call plug#end()
" remap leader
let mapleader = ","

" general
autocmd! BufWritePost .vimrc source
autocmd! BufWritePost * Neomake
filetype plugin indent on

"set encoding=utf8
set termguicolors
set termguicolors
set noshowmode
filetype on
syntax enable
syntax on

"colorscheme base16-eighties
colorscheme OceanicNext
set background=dark

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

" buffers
set hidden " allow hidden buffers

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
inoremap <c-[> <esc>

" quicksave
noremap <c-z> :update<cr>
vnoremap <c-z> <c-c>:update<cr>
vnoremap <c-z> <c-o>:update<cr>

" quit
noremap <leader>e :quit<cr>
noremap <leader>e :qa!<cr>

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

" vim latex
let g:tex_flavor='latex'
let g:Tex_TreatMacViewerAsUNIX = 1
let g:Tex_ExecuteUNIXViewerInForeground = 1
let g:Tex_ViewRule_ps = 'open -a Skim'
let g:Tex_ViewRule_pdf = 'open -a Skim'
let g:Tex_ViewRule_dvi = 'open -a Skim'

" Change default target to pdf, if not dvi is used
let g:Tex_DefaultTargetFormat = 'pdf'

let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf = "latexmk -pdflatex='pdflatex -file-line-error -synctex=1 -interaction=nonstopmode' -bibtex -pdf $*"

if has('nvim')
    let g:vimtex_latexmk_progname = 'nvr'
    
endif 
map <leader>lr :w<CR>:Start! latexmk -f -bibtex -pdf *.main<CR>
map <leader>lc :w<CR>:Start! latexmk -C<CR>

autocmd VimEnter * wincmd p

" airline
let g:airline#extensions#tabline#enabled = 1
set hidden
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
"let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'
"cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
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
"set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h13
"}}}



" ctags
command! MakeTags !ctags -R .

" file search
set path+=**
set wildmenu

" simple templates
nnoremap <leader>fg :-1read $HOME/.vim/templates/tex/simplefigure.tex<CR>

" nerd tree
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

set modifiable
