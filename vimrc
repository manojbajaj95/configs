
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

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'mkitt/tabline.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'alvan/vim-indexer'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-signify'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'haya14busa/incsearch.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'MattesGroeger/vim-bookmarks'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'mbbill/code_complete'
"Plugin 'dominikduda/vim_current_word'
Plugin 'skywind3000/vim-terminal-help'


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

set encoding=utf-8
nnoremap <silent> <C-l> :nohl<CR><C-l>
set number relativenumber
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>
nnoremap <F5> :UndotreeToggle<cr>
set completeopt-=preview
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4   " Sets the number of columns for a TAB
set shiftwidth=4
set expandtab
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_global_ycm_extra_conf = '/home/alok/fastproc/.ycm_extra_conf.py'



nnoremap <C-n> :NERDTreeTabsToggle<CR>
set encoding=utf-8
set background=dark
set t_Co=256
set mouse=
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
            \ 'file': '\.so$\|\.dat$|\.DS_Store$'
            \ }
nnoremap H gT
nnoremap L gt
" press comma to run the last macro
:map , @@
let g:indentLine_char = '|'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '-'

" opens complementary cpp or h file
function OpenPairFile()
    let g:f_name = expand('%:r')
    if match(g:f_name, 'src')!=-1
        let g:final_name = substitute(g:f_name, 'src','include','g').'.h'
    else
        let g:final_name = substitute(g:f_name, 'include','src','g').'.cpp'
    endif

    execute 'edit' g:final_name
endfunction

function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc

autocmd BufNewFile,BufRead *.cpp,*.h nnoremap <buffer> <F7> :call OpenPairFile()<CR>
nnoremap <F2> :call ToggleMouse()<CR>
nnoremap <F8> :Tagbar<CR>
nnoremap <F9> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

let g:indentLine_fileTypeExclude = ["nerdtree"]

nnoremap S :w<CR>


map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


set pastetoggle=<F10>

set noswapfile

"set background=dark
set background=light
colorscheme PaperColor
"!ctags -R --c-kinds=+p --fields=+S . "
