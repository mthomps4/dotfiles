" Install Plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
 " Fuzzy Find -- works with AG
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'

 " color scheme
 Plug 'https://github.com/joshdick/onedark.vim'

 " linter
 Plug 'w0rp/ale'

 " Status Bar
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'

 " GitHub
 Plug 'tpope/vim-fugitive'

 " Language support
 Plug 'sheerun/vim-polyglot'
 Plug 'MaxMEllon/vim-jsx-pretty'
 Plug 'avdgaag/vim-phoenix'
 Plug 'slashmili/alchemist.vim'

 " Deoplete Setup - Requires Python 3
 " pip3 install --user pynvim
 if has('python3')
  if has('nvim')
   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
   Plug 'Shougo/deoplete.nvim'
   Plug 'roxma/nvim-yarp'
   Plug 'roxma/vim-hug-neovim-rpc'
  endif
 else
  echo 'python3 required for deoplete'
endif
" Pair with Deoplete Later
" https://www.gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/
 " Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

call plug#end()
" Mirror Terminator Split Commands
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-o': 'split',
  \ 'ctrl-e': 'vsplit' }

"ONE DARK THEME 24-bit Code
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" ONE DARK OPTIONS - set before colorscheme
let g:onedark_terminal_italics=1
let g:onedark_color_overrides = {
\ "black": {"gui": "#000000", "cterm": "0", "cterm16": "0" },
\ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" }
\}

syntax on
colorscheme onedark

" General Config
scriptencoding utf-8
set number "relativenumber
set history=50 "Stores :cmdline history
set autoread " Reload files changed outside of vim
set wildmenu " visual autocomplete for command menu
set showmatch " highlight matching [{()}]
set lazyredraw " redraw when needed
set wildignore+=node_modules/**
set wildignore+=*.beam/**
set wildignore+=_build/**
set wildignore+=deps/**
set ignorecase
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set nolist
set clipboard=unnamedplus

" Fat Finger Commands
command! WQ wq
command! Wq wq
command! W w
command! Q q

" ctrl p Files
map <c-p> <esc>:FZF<cr>

" Move Lines
map <c-Down> <esc>:m+1<cr>
map <c-Up> <esc>:m-2<cr>

" tmp file location for swp
if isdirectory($HOME . '/.vim-swap') == 0
 :silent !mkdir -p ~/.vim-swap > /dev/null 2>&1
endif
set directory=~/.vim-swap/

" Set syntax for exs files
au BufRead,BufNewFile *.exs set filetype=elixir

" let g:deoplete#enable_at_startup=1
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Use ALE as completion sources for all code.
call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})

"You can disable deoplete in specific languages like this:
" autocmd FileType c,cpp
" \ call deoplete#custom#buffer_option('auto_complete', v:false)

" ALE LINTER SETUP

" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
" let g:ale_completion_enabled = 1

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'javascript.jsx': ['stylelint', 'prettier','eslint'],
      \ 'jsx': ['stylelint', 'prettier', 'eslint'],
      \ 'typescript': ['prettier', 'eslint'],
      \ 'ts': ['stylelint', 'prettier', 'eslint'],
      \ 'tsx': ['stylelint', 'prettier', 'eslint'],
      \ 'elixir': ['mix_format'],
      \ 'exs': ['mix_format']
      \ }

let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
" USED until VIM gtk bug fixed -- cursor dissapears
let g:ale_echo_cursor = 0

" Jump Between Errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-i> <esc>:ALEDetail<cr>

" listing errors
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1
" let g:ale_cursor_detail = 1
" let g:ale_close_preview_on_insert = 1
" let g:ale_list_window_size = 4
" let g:ale_echo_cursor = 1


" AIRLINE STATUS BAR INTEGRATIONS
let g:airline_theme='onedark'
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_statusline_ontop=1
let g:airline#extensions#ale#enabled = 1

" Allows Elixir Recompile and Nodemon observe file changes with timeout
augroup AleGroup
  autocmd!
  autocmd User ALELint call TouchOpenFile()
augroup END

 func! TouchOpenFile()
  let g:ale_enabled = 0
  sleep 500m
  w
  let g:ale_enabled = 1
 endfunc
