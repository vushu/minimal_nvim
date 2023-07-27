set nocompatible " Disable compatibility to old-time vi"

filetype off
filetype plugin indent on

filetype plugin on

""""""SETTINGS""""""""

" Sets how many lines of history VIM has to remember
set history=700

" Splits
" Note: Check the leader key shortcuts below for some commands that might
" conflict with these if you need to change these around...
set splitright  " Make vertical splits appear to the right
set splitbelow  " Make horizontal splits appear to the bottom


" Search
set hlsearch    " Highlight searched pattern
set ignorecase  " Ignore case when pattern searching
set incsearch   " Refine search as each character is typed


" Backspace
set backspace=2 " Make backspace delete past where insert mode began

" Tab completion
set wildmode=longest,list,full
set wildmenu

set colorcolumn=80
" set an 80 column border for good coding style
set cc=80
set completeopt=menu

" Show matching brackets
set showmatch
setf html
""replace tab with spaces

"set expandtab   " Expand tabs into several spaces
set smarttab    " Tab to implied indentation depth automatically (I think?)
set nowrap      " Don't wrap text
set encoding=utf8
set autoindent
set smartindent
"----------------------------------------------------------------
" 6. Files and backup
"----------------------------------------------------------------
" Disable swap files
set noswapfile
" No backup (use Git instead)
set nobackup
" Prevents automatic write backup
set nowritebackup
" Use Unix as the standard file type
set fileformats=unix,dos,mac
" Autoread a file when it is changed from the outside
set autoread
" Reload a file when it is changed from the outside
let g:f5msg = 'Buffer reloaded.'
nnoremap <F5> :e<CR>:echo g:f5msg<CR>
" Adding Syntax
syntax on
" Enable filetype plugins
filetype plugin indent on

"show lines numbers
set number
set relativenumber



""""""StandardMappings"""""
"
" With a map leader it's possible to do extra key combinations
let mapleader = " "
let g:mapleader = " "

" command mode with kj
inoremap kj <Esc>
" Fast saving
nmap <leader>w :w!<cr>

nnoremap <leader>q :q<CR>

nmap <leader>n :Dirvish<CR>

call plug#begin('~/.local/share/nvim/plugged')
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Chiel92/vim-autoformat'
Plug 'machakann/vim-highlightedyank'
Plug 'lfilho/cosco.vim'
Plug 'tpope/vim-unimpaired'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'

"Buffer"
Plug 'ap/vim-buftabline'


""Folder explorer
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'christoomey/vim-tmux-navigator'

"" Auto completetion
Plug 'sheerun/vim-polyglot'
"" THEMEs
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'


call plug#end()

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=number

""CUSTOM
nmap <leader><cr> :nohl<cr>

au FileType * nmap <leader>f :Autoformat<CR>
"exit terminal with <ESC>
tnoremap <Esc> <C-\><C-n>
""""""Navigate Buffers""""""
" To open a new empty buffer
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

augroup fast_keys
    autocmd!

    autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,cs nmap <silent><leader>; <Plug>(cosco-commaOrSemiColon)

    autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,cs imap <silent><C-a> <ESC><Plug>(cosco-commaOrSemiColon)
    "autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java typescript ,javascript,css,rust,cs imap <silent> <C-a> <ESC>A;<ESC>o
    autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,cs imap <silent> <C-a> <ESC>A;<ESC>
    autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,cs imap <silent> <C-o> <ESC>A();
    autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,cs imap <silent> <C-c> <ESC>ci)<CR>
    autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,cs imap <silent> <C-j> <ESC>j

    autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,cs imap <silent> <C-k> <ESC>k

    autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,cs imap <silent> <C-l> <ESC>A

    autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,cs imap <silent> <C-h> <ESC>I
    autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,cs imap <silent> <C-f> <ESC>A() {<CR>}<ESC>O
    autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,cs imap <silent> <C-b> <ESC>A {<CR>}<ESC>O

    autocmd FileType ruby imap <silent> <C-b> <ESC>A do<CR>end<ESC>O

    autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,cs imap <silent> <C-v> <ESC>"0p
    autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,cs imap <silent> <C-s> <ESC>S
    autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,cs nmap <leader>0 f)ci)

    autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,cs nmap <leader>9 F(ci)
    autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,cs nmap <leader>' f"ci"
    autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,cs nmap <leader>" F"ci"
    "autocmd FileType dart,glsl,fsharp,cpp,c,haxe,java,typescript,javascript,css,rust,html,cs nmap <leader>> f>
    autocmd FileType html nmap <leader>. f<F>ldt<i

augroup END


augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * if argc() == 0 | Dirvish | endif
augroup END

" Resize window
map <silent> <A-y> <C-w>>
map <silent> <A-i> <C-W>-
map <silent> <A-u> <C-W>+
map <silent> <A-o> <C-w><
" Maps Alt-[s.v] to horizontal and vertical split respectively

"Splitbuffer
nmap <C-s> :vsplit<CR>
nmap <C-d> :split<CR>

"Navigate windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

"auto paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

noremap <leader>t :registers<cr>

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction]]"]]"

"
""""""FZF settings"
function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <leader>r :FZFMru<cr>
nnoremap <leader>e :ProjectFiles<cr>

"""""Evaluate"""""""
au Filetype * nnoremap <leader>v :vsplit ~/.config/nvim/init.vim<CR>


""THEME

set cursorline        ""# highlight current line
set cursorcolumn ""# highlight current column
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowTogglea Set true color in the terminal

"""buftabline
nmap <leader><BS><BS> :bufdo bd<cr>
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(0)

let g:buftabline_show = 2       " Always show
let g:buftabline_numbers = 2    " Ordinal from left-to-right

let g:lightline = {}

function! ToggleTheme()
    let &background = ( &background == "dark"? "light" : "dark" )
    if exists("g:lightline")
      runtime autoload/lightline/colorscheme/gruvbox.vim
      call lightline#colorscheme()
    endif
endfunction

set background=dark

nmap <leader>bg :call ToggleTheme()<CR>

""uncomment
colorscheme gruvbox
"let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_contrast_dark ='hard'
let g:lightline.colorscheme = 'gruvbox'
