set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'gneham/potion' "例子
Plugin 'tmhedberg/SimpylFold' 
Plugin 'vim-scripts/indentpython.vim' "python缩进插件
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'   "状态栏插件
Plugin 'altercation/vim-colors-solarized'
Plugin 'matrix.vim--Yang'
Plugin 'Yggdroot/indentLine'   "垂直对齐线插件
Plugin 'rkulla/pydiction'

call vundle#end()

filetype on "侦测文件类型
filetype plugin on "载入文件类型插件
filetype plugin indent on

"Enable folding
set foldmethod=indent
set foldlevel=99

let g:SimpylFold_docstring_preview=1

"au BufNewFile,BufRead *.py set filetype=python
au BufNewFile,BufRead *.py 
\ set tabstop=4 | 
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix |
"\ set textwidth=110 |

set encoding=utf-8

au BufNewFile,BufRead *.js, *.html, *.css
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2 |


"let g:airline_theme="luna"
let g:airline_powerline_fonts=1

colorscheme murphy
if has("gui_running")
    colorscheme solarized
endif
set guifont=DejaVu\ Sans\ Mono\ 15
set guioptions=aegic
set background=dark


"新建.c,.h,.sh,java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.sh,*.java,*.py exec ":call SetTitle()"
"定义函数SetTitle,自动插入文件头
function! SetTitle()
    if &filetype=='sh'
        call setline(1,"\##############################################################")
        call append(line("."),"\# File Name:".expand("%"))
        call append(line(".")+1,"\# author:gneham")
        call append(line(".")+2,"\# mail:gneham2012@hotmail.com")
        call append(line(".")+3,"\# Created Time:".strftime("%c"))
        call append(line(".")+4,"\################################################################")
        call append(line(".")+5,"\# !/bin/bash")
    elseif &filetype=='python'
        call setline(1,"\"\"\"")
        call append(line("."),"> File Name:".expand("%"))
        call append(line(".")+1,"> author:gneham")
        call append(line(".")+2,"> mail:gneham2012@hotmail.com")
        call append(line(".")+3,"> Created Time:".strftime("%c"))
        call append(line(".")+4,"\"\"\"")
        call append(line(".")+5,"#coding=utf-8")
        call append(line(".")+6,"")
    endif
    autocmd BufNewFile * normal G
endfunction
        

set mouse=a
set autowrite
set autoread
set cursorcolumn "突出显示当前列
set cursorline "突出显示当前行
set ruler "打开状态栏标尺
set magic "设置魔术

"禁止生成临时文件
set nobackup
set noswapfile

set incsearch
"set highlight

set laststatus=2
set showmatch

map <F2> :NERDTreeToggle<CR>        

"映射全选+复制 ctrl+a
"map <C-A> ggVG
"map! <C-A> <Esc>ggVG
"vmap <C-c> "+y

"去空行
nnoremap <F3> :g/^\s*$/d<CR>

"去掉输入错误提示音
set noerrorbells
set hidden

"配置垂直对齐线
"let g:indentLine_enabled=0  
"let g:indentLine_color_term=239

"let g:indentLine_char="|"  
"let g:indentLine_concealcursor='vc'
"let g:indentLine_concealleval=0
"set list lcs=tab:\|\ 

map <F4> :IndentLinesToggle<CR>

"配置python自动补全
let g:pydiction_location = "~/.vim/bundle/pydiction/complete-dict"




