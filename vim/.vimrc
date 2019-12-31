" use vim not vi
set nocompatible
filetype off

" init minpac
try
    packadd minpac
catch
    fun! InstallPlug() " install minpac if not available
        exe '!git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac'
    endfun
endtry

if exists('*minpac#init') "{{{
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('junegunn/fzf', { 'do': 'yes n \| ./install' })
call minpac#add('junegunn/fzf.vim')
call minpac#add('junegunn/vim-emoji')
call minpac#add('junegunn/goyo.vim', { 'on': 'Goyo' })
call minpac#add('junegunn/limelight.vim', { 'on': 'Goyo' })
call minpac#add('itchyny/lightline.vim')
call minpac#add('justinmk/vim-sneak')
call minpac#add('scooloose/syntastic')
call minpac#add('scooloose/nerdcommenter')
call minpac#add('scooloose/nerdtree')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('mhinz/vim-signify')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('tpope/vim-surround')
call minpac#add('w0rp/ale')
call minpac#add('wellle/targets.vim')
call minpac#add('rstacruz/vim-closer')
endif "}}}

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

" general settings
filetype plugin indent on
set autoindent
set backspace=indent,eol,start
set clipboard^=unnamed
set completeopt=noinsert,menuone,noselect
set copyindent
set cursorline
set encoding=utf-8 nobomb
set expandtab shiftwidth=2 softtabstop=-1
set hidden
set history=1000
set incsearch hlsearch ignorecase smartcase
set lazyredraw
set linebreak
set list listchars=tab:.\ ,trail:.
set matchpairs+=<:>
set nobackup
set noswapfile
set nu
set scrolloff=5
set shortmess+=cW
set showmatch
set splitright
set tags=./tags;,tags
set termguicolors
set ttimeoutlen=0
set undofile
set undodir=~/.vim/undo
set visualbell
set wildignore+=tags,*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.pyc,*.swp,*~,*/.DS_Store
set wildmode=longest:full,list,full

if !exists("g:syntax_on")
  syntax enable
endif

set t_Co=256
syntax on

set termguicolors

hi Normal guibg=NONE ctermbg=NONE

" Vim Sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:sneak#absolute_dir = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Leader general mapping
let mapleader = ","
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>s <c-w>w
nnoremap <leader>r :source ~/.config/nvim/init.vim<cr>
nnoremap <silent><leader><cr> :let @/ = ""<cr>

" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" JS use 2 spaces
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" use fzf
set rtp+=/usr/local/opt/fzf

" FZF
nnoremap <leader>h :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>

" Ripgrep
noremap <leader>rg <esc>:Rg<space>
noremap <leader>rw <esc>:Rg <c-r><c-w>
noremap <leader>rh <esc>:Rg<up><cr>

" Vim-fugitive and vim-rhubarb
noremap <silent> gb :Gblame<CR>
noremap <silent> ghub :Gbrowse<CR>

" notify file save
autocmd BufWritePost * silent ! notify-send '✔️ % saved"

" auto close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap {<CR> {<CR>}<ESC>0
inoremap {;<CR> {<CR>};<ESC>0

" ale
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '× '
let g:ale_sign_warning = '> '
let g:ale_linters = {'javascript': ['standard']}
hi ALEErrorSign ctermbg=NONE ctermfg=magenta

" git gutter speed
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
let g:gitgutter_max_signs = 1500
let g:gitgutter_diff_args = '-w'

" distraction free writing mode
let g:limelight_conceal_ctermfg = 240
function! s:goyo_enter()
  Limelight
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z | tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set wrap
  set scrolloff=999
endfunction

function! s:goyo_leave()
  Limelight!
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set nowrap
  set scrolloff=0
endfunction

augroup goyoactions
  au!
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup end

" lightline
set noruler
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'filename' ],
  \             [ 'gitbranch' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'filetype' ] ]
  \ },
  \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
  \ 'subseparator': { 'left': '▒', 'right': '░' }
  \ }

" ale status
augroup alestatus
    au!
    autocmd User ALELint call lightline#update()
augroup end

" nerdtree
"autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

" devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:webdevicons_conceal_nerdtree_brackets = 0

set noshowmode
