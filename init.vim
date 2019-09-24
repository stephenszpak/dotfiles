scriptencoding utf-8

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plug_install
    autocmd VimEnter * PlugInstall
  augroup end
endif

" ================ Plugins ================
call plug#begin('~/.config/nvim/plugged')

Plug 'rakr/vim-one'
Plug 'junegunn/seoul256.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'cskeeters/vim-smooth-scroll'
Plug 'exu/pgsql.vim'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-nginx', {'for' : 'nginx'}
Plug 'gcavallanti/vim-noscrollbar'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'maximbaz/lightline-trailing-whitespace'
Plug 'maximbaz/lightline-ale'
Plug 'mileszs/ack.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'ntpeters/vim-better-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
      \  if isdirectory(expand('<amatch>'))
      \|   call plug#load('nerdtree')
      \|   execute 'autocmd! nerd_loader'
      \| endif
augroup END
Plug 'SirVer/ultisnips'
Plug 'sgur/vim-editorconfig'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-scriptease'
Plug 'Yggdroot/indentLine'

call plug#end()

let s:coc_extensions = [
\   'coc-css',
\   'coc-html',
\   'coc-json',
\   'coc-eslint',
\   'coc-prettier',
\   'coc-ultisnips'
\ ]

if exists('*coc#add_extension')
  call call('coc#add_extension', s:coc_extensions)
endif

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
set background=dark
let g:seoul256_background = 234  " For seoul dark background
colo seoul256

"  These are to provide better color experience....or so they say
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" ================ General Configs ================
augroup vimrc
  autocmd!
augroup END

set nocompatible
filetype off
filetype plugin indent on

set laststatus=2              " ensures you see the status bar
set number                    " Line Numbers
set hidden                    " Allows buffers to exist in the background w/o being in the window
set history=1000              " Remembers last 20 commands
set autoread                  " Automatically reread changed files without asking me anything
set autoindent
set showcmd                   " Show me what I'm typing
set noswapfile                " Don't use swapfile
set nobackup                  " Don't create annoying backup files
set splitright                " Split vertical windows right to the current windows
set splitbelow                " Split horizontal windows below to the current windows
set autowrite                 " Automatically save before :next, :make etc.
set ignorecase smartcase
set nocursorcolumn            " speed up syntax highlighting
set nocursorline
set updatetime=300
set lazyredraw
set maxmempattern=20000       " increase max memory to show syntax highlighting for large files
set viminfo='1000             " ~/.viminfo needs to be writable and readable. Set oldfiles to 1000 last recently opened files, :FzfHistory uses it
set smartindent
set expandtab smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set clipboard^=unnamed
set clipboard^=unnamedplus
set backspace=indent,eol,start
set ruler                     " show line/column
set scrolloff=4               " keep more lines on screen while scrolling
set sidescroll=1              " horizontal scroll amount
set sidescrolloff=5           " horizontal scrolloff
set wildmenu
set wildmode=full
set noshowmode                " do not show mode since using lightline
set nowrap                " don't wrap lines
syntax on                     " Turns on syntax highlighting

" Auto indent pasted text
" nnoremap p p=`]<C-o>
" nnoremap P P=`]<C-o>
set list listchars=trail:·

if isdirectory($HOME . '/.config/nvim/undo') == 0
  :silent !mkdir -p ~/.config/nvim/undo > /dev/null 2>&1
endif
set undofile
set undodir=~/.config/nvim/undo/

augroup whitespace
  " automatically strip trailiing whitespace on save
  autocmd BufWritePre * StripWhitespace
augroup end

" ================ Base Keybindings  ================

let mapleader = ' '

" buffer management
nnoremap <leader>x  :bn<cr>
nnoremap <leader>z  :bp<cr>
nnoremap <leader>c  :bd<cr>

" Easy splitscreen
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

nnoremap <leader>w :wa!<cr>

" ** Navigation **
" Move around panes
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

nnoremap <leader>o :only<CR>

" Jump backwards one word
nnoremap <silent> w b

" ================ Plugin Bindings/Settings  ================
" ==== Highlighted Yank ====
let g:highlightedyank_highlight_duration = 350


" ==== Bookmark ====
nmap <leader>b <Plug>BookmarkToggle
nmap <leader>j <Plug>BookmarkNext
nmap <leader>k <Plug>BookmarkPrev
nmap <leader>bb <Plug>BookmarkClearAll

" ==== Limelight ====
nnoremap <leader>l :Limelight<cr>
nnoremap <leader>L :Limelight!<cr>
xmap <leader>l <Plug>(Limelight)
let g:limelight_conceal_ctermfg = 236

" ==== Fugitive ====
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gl :Gcommit<cr>

" ==== NERDTree ====
nmap <C-\> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1

" ==== Fuzzy Finder ====
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>rg       :Rg
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>

inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" ==== delimitmate ====
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

" ==== pgsql  ====
let g:sql_type_default = 'pgsql'

" ==== ag ====
let g:ackprg = 'ag --vimgrep --smart-case'

" ==== Lightline ====
let g:lightline = {
      \   'colorscheme': 'palenight',
      \   'active': {
      \     'left': [ [ 'mode' ], [ 'pwd' ] ],
      \     'right': [ [ 'cocstatus', 'trailing', 'lineinfo' ], [ 'fileinfo' ], [ 'currentfunction' ], [ 'gitbranch' ] ],
      \   },
      \   'inactive': {
      \     'left': [ [ 'pwd' ] ],
      \     'right': [ [ 'lineinfo' ], [ 'fileinfo' ] ],
      \   },
      \   'tabline': {
      \     'left': [ [ 'buffers' ] ],
      \     'right': [ [ 'close' ] ],
      \   },
      \   'separator': { 'left': '', 'right': '' },
      \   'subseparator': { 'left': '', 'right': '' },
      \   'mode_map': {
      \     'n' : 'N',
      \     'i' : 'I',
      \     'R' : 'R',
      \     'v' : 'V',
      \     'V' : 'V-LINE',
      \     "\<C-v>": 'V-BLOCK',
      \     'c' : 'C',
      \     's' : 'S',
      \     'S' : 'S-LINE',
      \     "\<C-s>": 'S-BLOCK',
      \     't': 'TERMINAL',
      \   },
      \   'component': {
      \     'lineinfo': '%l:%-v',
      \     'mode': '%{lightline#mode() . " " . ObsessionStatus()}',
      \   },
      \   'component_expand': {
      \     'buffers': 'lightline#bufferline#buffers',
      \     'trailing': 'lightline#trailing_whitespace#component',
      \   },
      \   'component_function': {
      \     'pwd': 'LightlineWorkingDirectory',
      \     'gitbranch': 'fugitive#head',
      \     'scrollbar': 'LightlineScrollbar',
      \     'cocstatus': 'coc#status',
      \     'currentfunction': 'CocCurrentFunction',
      \     'fileinfo': 'LightlineFileinfo',
      \   },
      \   'component_type': {
      \     'buffers': 'tabsel',
      \     'trailing': 'error',
      \   },
      \ }

" Custom components
function! LightlineFileinfo()
  if winwidth(0) < 90
    return ''
  endif

  let type = &ft !=# "" ? &ft . ' ' . WebDevIconsGetFileTypeSymbol() : "no filetype"
  return type
endfunction

function! LightlineWorkingDirectory()
  return &ft =~ 'help\|qf' ? '' : fnamemodify(getcwd(), ":~:.")
endfunction
" Lightline trailing whitespace
let g:lightline#trailing_whitespace#indicator = '•'

" CoC
function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

" Lightline BufferLine
set showtabline=2

let g:lightline#bufferline#filename_modifier = ':t' " Show filename relative to current directory
let g:lightline#bufferline#unicode_symbols = 1        " Use fancy unicode symbols for various indicators
let g:lightline#bufferline#modified = ''             " Default pencil is too ugly
let g:lightline#bufferline#unnamed = '[No Name]'      " Default name when no buffer is opened
let g:lightline#bufferline#shorten_path = 0           " Don't compress ~/my/folder/name to ~/m/f/n
let g:lightline#bufferline#enable_devicon = 1
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#number_map = {
    \ 0: '₀', 1: '₁', 2: '₂', 3: '₃', 4: '₄',
    \ 5: '₅', 6: '₆', 7: '₇', 8: '₈', 9: '₉',
    \ }

" === CoC ===
set shortmess+=c

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
noremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" rewrite current word
nmap <leader>rw <Plug>(coc-rename)

" setup prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nmap <silent> [W <Plug>(coc-diagnostic-first)
nmap <silent> [w <Plug>(coc-diagnostic-previous)
nmap <silent> ]w <Plug>(coc-diagnostic-next)
nmap <silent> ]W <Plug>(coc-diagnostic-last)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" just notes since I don't want to add keybindings for this
"  :CocCommand snippets.editSnippets
"  :CocCommand workspace.showOutput snippets

" ======= Buffer Management =======

" close all other buffers
command! BufOnly :%bd|e#
command! BufCleanup :call BufCleanup()
nnoremap <silent> <Leader>cc        :BufCleanup<CR>

function! BufCleanup()
  let l:tabs = map(copy(gettabinfo()), 'v:val.tabnr')

  let l:openBuffers = []
  for l:i in l:tabs
  	call extend(l:openBuffers, tabpagebuflist(l:i))
  endfor

  let l:buffers = map(filter(filter(copy(getbufinfo()), 'v:val.listed'), {i, info -> info.changed == v:false}), 'v:val.bufnr')
  for l:bnr in l:buffers
    if index(l:openBuffers, l:bnr) < 0
    	exe 'bd '.l:bnr
  	endif
	endfor
endfunction

" ==== GitGutter ====
let g:gitgutter_map_keys = 0

" ==== indentLine ====
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

" ==== UltiSnip ====
let g:UltiSnipsExpandTrigger="<c-*"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit = 'horizontal'
let g:ultisnips_javascript = {
      \ 'semi': 'never',
      \ 'space-before-function-paren': 'never',
      \ }

" ==== Commentary ====
autocmd FileType yaml setlocal commentstring=--\ %s

