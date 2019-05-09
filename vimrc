"------------------------------------------------------------------------------
" plugins
"------------------------------------------------------------------------------
if filereadable($HOME . "/.vimplugrc")
    source ~/.vimplugrc
endif

"------------------------------------------------------------------------------
" basic settings
"------------------------------------------------------------------------------
let mapleader = ","

set modeline
set modelines=5
set shiftwidth=4
set softtabstop=4
set expandtab
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set novisualbell
set ttyfast
set lazyredraw
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set wrap
set textwidth=80
set formatoptions=qrn1m
set colorcolumn=80
set foldmethod=indent
set hlsearch
set incsearch
set nofoldenable
set maxmempattern=10000

"------------------------------------------------------------------------------
" theme settings
"------------------------------------------------------------------------------
set guifont=Monaco:h12
syntax enable
" let g:solarized_termcolors=256
" colorscheme badwolf
colorscheme PaperColor
set background=dark
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
      \ set guioptions-=T <Bar>
      \ set guioptions-=m <bar>
      \ else <Bar>
      \ set guioptions+=T <Bar>
      \ set guioptions+=m <Bar>
      \ endif <CR>

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}\ %f\ %y\ %3l/%L

"------------------------------------------------------------------------------
" key mappings
"------------------------------------------------------------------------------
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <tab> <c-n>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap jk <esc>
nnoremap <c-a> <c-w>
nnoremap <leader>p vi(d<ESC>
nnoremap <leader>o F>l<ESC>dw<ESC>
inoremap <leader>i <ESC>viwU<ESC>ea
nnoremap <leader>q :Files<CR>
nnoremap <leader>m :sp term://make<CR>a
nnoremap <F8> :TagbarToggle<CR>
nnoremap <silent> <leader>a :ArgWrap<CR>

if has('nvim')
    tnoremap <ESC> <C-\><C-n>
    tnoremap jk <C-\><C-n>
    set nopaste
endif

if bufwinnr(1)
    nnoremap > <C-W>>
    nnoremap < <C-W><
    nnoremap + <C-W>+
    nnoremap - <C-W>-
endif

"------------------------------------------------------------------------------
" filetypes
"------------------------------------------------------------------------------
au FileType go inoremap . .<c-x><c-o><c-p>
au FileType ejs setl sw=2 sts=2 et colorcolumn=0
au FileType html setl sw=2 sts=2 et colorcolumn=0
au FileType htmldjango setl sw=4 sts=4 et colorcolumn=0
au FileType twig set ft=html
au FileType css setl sw=2 sts=2 et
au FileType less setl sw=2 sts=2 et
au FileType scss setl sw=2 sts=2 et
au FileType rml setl sw=2 sts=2 et colorcolumn=0
au FileType json setl sw=2 sts=2 et colorcolumn=0
au FileType pde setl sw=2 sts=2 et colorcolumn=79
au FileType markdown setl sw=2 sts=2 et colorcolumn=80 textwidth=1000
au FileType rst setl sw=2 sts=2 et colorcolumn=80 textwidth=1000
au FileType sml setl sw=2 sts=2 et
au FileType coffee setl sw=2 sts=2 et
au FileType ruby setl sw=2 sts=2 et
au FileType yaml setl sw=2 sts=2 et
au FileType go setl sw=8 sts=8 et
au FileType vue setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et
au BufRead,BufNewFile *.asm set filetype=nasm
au BufRead,BufNewFile *.pde set filetype=processing
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.ex set filetype=elixir
au BufRead,BufNewFile *.es6 set filetype=javascript
autocmd BufWritePre * %s/\s\+$//e
au Syntax java setl colorcolumn=90
au FileType go setl colorcolumn=120

"------------------------------------------------------------------------------
" local configs
"------------------------------------------------------------------------------
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif
