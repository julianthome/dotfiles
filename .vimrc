execute pathogen#infect()

" remap leader
let mapleader = ","

" general
autocmd! bufwritepost .vimrc source 
filetype plugin indent on

syntax enable
syntax on
set background=dark
colorscheme darcula
let g:solarized_termtrans = 1

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

autocmd VimEnter * wincmd p

" Background commands for building latex documents
map <leader>lr :w<CR>:Start! latexmk -f -bibtex -pdf *.main<CR>
map <leader>lc :w<CR>:Start! latexmk -C<CR>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='laederon'
set background=dark
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts=1
let g:pymode_rope_goto_def_newwin="vnew"
let g:pymode_rope_extended_complete=1
let g:pymode_breakpoint=1
let g:pymode_syntax=1
let g:pymode_syntax_builtin_objs=0
let g:pymode_syntax_builtin_funcs=0

" jedi mode
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
" Better navigating through omnicomplete option list
" " See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
" set completeopt=longest,menuone
function! OmniPopup(action)
	if pumvisible()
		if a:action == 'j'
			return "\<C-N>"
		elseif a:action == 'k'
			return "\<C-P>"
		endif
	endif
	return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>i

" ctags
command! MakeTags !ctags -R .
"autocmd BufWritePost * call system("ctags -R")

" file search
set path+=**
set wildmenu

" simple templates
nnoremap <leader>fg :-1read $HOME/.vim/templates/tex/simplefigure.tex<CR>

" nerd tree
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
set modifiable
