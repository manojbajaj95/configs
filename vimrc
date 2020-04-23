set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Keep Plugin commands between vundle#begin/end.

" Themes
Plugin 'morhetz/gruvbox'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'NLKNguyen/papercolor-theme'
" Plugin 'liuchengxu/space-vim-dark'

Plugin 'vim-airline/vim-airline'
Plugin 'Yggdroot/indentLine'

" Utilites
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'preservim/nerdcommenter'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'haya14busa/incsearch.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'prettier/vim-prettier'
" Plugin 'eaymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'

" Git Plugins
Plugin 'airblade/vim-gitgutter'

" C++ Specific Plugins
Plugin 'majutsushi/tagbar'
Plugin 'alvan/vim-indexer'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" --------------------------------------------------
" Look and Feel

set encoding=utf-8
set number relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set cindent
set smarttab
colorscheme gruvbox
set background=dark

" --------------------------------------------------
" Remaps
source ~/.remaps.rc
" --------------------------------------------------
" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

" --------------------------------------------------
" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" --------------------------------------------------
" Nerd Tree Settings
nmap <C-b> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['^node_modules$','^.git']

" sync open file with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()

" --------------------------------------------------
" Nerd tree git plugin
"let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",
    "\ "Modified"  : "#d9bf91",
    "\ "Renamed"   : "#51C9FC",
    "\ "Untracked" : "#FCE77C",
    "\ "Unmerged"  : "#FC51E6",
    "\ "Dirty"     : "#FFBD61",
    "\ "Clean"     : "#87939A",
    "\ "Ignored"   : "#808080"
    "\ }

" --------------------------------------------------
" Nerd Tree Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" --------------------------------------------------

" Vim Tagbar
nmap <F8> :TagbarToggle<CR>
" --------------------------------------------------
"Vim Indexer
let g:indexer_root_markers = ['.git']
let g:indexer_user_modules = ['log', 'tag']
let g:indexer_logs_maxsize = 100
let g:indexer_tags_watches = ["*.c", "*.h", "*.c++", "*.cpp", "*.hpp", "*.py"]
let g:indexer_tags_command = "ctags"
let g:indexer_tags_options = "-R --sort=yes --c++-kinds=+p+l --fields=+iaS --extra=+q --languages=c,c++,python"
let g:indexer_tags_savedir = "~/.vim_indexer_tags/"
let g:indexer_tags_handler_locate = ["locate"]
let g:indexer_tags_handler_reload = ["reload", "-1"]
let g:indexer_tags_handler_update = ["update"]
" --------------------------------------------------
"  Vim Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 1
" --------------------------------------------------
" Easymotion
