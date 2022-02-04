set nocompatible " Disable compatibility to old-time vi"
filetype off
filetype plugin indent on

filetype plugin on
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

""Folder explorer
Plug 'tpope/vim-vinegar'
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'christoomey/vim-tmux-navigator'

"" Auto completetion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
"" THEMEs
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'


call plug#end()

"FROM COC

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
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"""""""""""""""""""""""" FOR COC


""CUSTOM
au FileType * nmap <leader>f :Autoformat<CR>

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

""THEME

set cursorline        ""# highlight current line
set cursorcolumn ""# highlight current column
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowTogglea Set true color in the terminal
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

highlight link CocErrorSign GruvboxRed
""uncomment
colorscheme gruvbox
"let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_contrast_dark ='hard'
let g:lightline.colorscheme = 'gruvbox'
