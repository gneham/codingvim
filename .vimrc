"配置vundle
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'gneham/potion' "例子
Plugin 'tmhedberg/SimpylFold' "折叠插件
Plugin 'vim-scripts/indentpython.vim' "python缩进插件
Plugin 'scrooloose/nerdtree' "工程树目录插件
Plugin 'bling/vim-airline'   "状态栏插件 另外需要下载powerline的字体
Plugin 'altercation/vim-colors-solarized'   "solarized配色方案插件
Plugin 'matrix.vim--Yang'   "例子插件,黑客帝国
Plugin 'Yggdroot/indentLine'   "垂直对齐线插件
Plugin 'rkulla/pydiction'  "python自动补全
Plugin 'taglist.vim'  

call vundle#end()

"filetype on "侦测文件类型
filetype plugin on "载入文件类型插件
filetype plugin indent on

"Enable folding
"set foldenable    "打开折叠功能，如果foldmethod选项已设置，则默认已经打开,无须在设置此选项
"set foldcolunms=3 "设置折叠可视线索

"设置文件类型,vim会自动检测python，c等语言的类型，此处不用设置
"au BufNewFile,BufRead *.py set filetype=python

au BufNewFile,BufRead *.py exec ":call FilePython()" 

"折叠插件配置
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod< 


set tabstop=4  
set softtabstop=4 
set shiftwidth=4 
set expandtab 
set autoindent 
set fileformat=unix 


function! FilePython()
    set tabstop=4  
    set softtabstop=4 
    set shiftwidth=4 
    set expandtab 
    set autoindent 
    set fileformat=unix 
    setlocal makeprg=python\ % 
    set textwidth=110 
    set foldmethod=indent  "定义折叠方式为indent,会自动折叠,有六中方式
    set foldlevel=99  "控制可见的折叠的层次，只显示折叠层次小于等于参数的行的内容
    let g:SimpylFold_docstring_preview=1 "python折叠插件配置
    
    "配置python自动补全
    let g:pydiction_location = "~/.vim/bundle/pydiction/complete-dict"
endfunction
    

set encoding=utf-8

au BufNewFile,BufRead *.js, *.html, *.css
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2 |

"let g:airline_theme="luna"
let g:airline_powerline_fonts=1

"设置配色方案,solarized方案
"if has("gui_running")
"    set background=dark
"    colorscheme solarized 
"else
"    set background=dark
"endif
set background=dark
colorscheme murphy 

"solarized方案提供了两种色调的主题，F5可以用来切换
"call togglebg#map("<F7>")

set guifont=DejaVu\ Sans\ Mono\ 15
set guioptions=aegic


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
        call setline(1,"#coding=utf-8")
        call append(line("."),"\"\"\"")
        call append(line(".")+1,"> File Name:".expand("%"))
        call append(line(".")+2,"> author:gneham")
        call append(line(".")+3,"> mail:gneham2012@hotmail.com")
        call append(line(".")+4,"> Created Time:".strftime("%c"))
        call append(line(".")+5,"\"\"\"")
        call append(line(".")+6,"")
    endif
    autocmd BufNewFile * exec ":$"
endfunction
        

"设置鼠标可用
if has("mouse") 
    set mouse-=a  "此时光标不能跟随鼠标移动，但是可以复制粘贴
endif
"set mouse=a  "设置在任何模式下光标可以跟随鼠标移动，但此时不能够复制粘贴

set number
set autowrite
set autoread
set cursorcolumn "突出显示当前列
set cursorline "突出显示当前行
set ruler "打开状态栏标尺 显示光标位置的行号和列号，每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。
set magic "设置魔术,用于正则表达式
set backspace=2 "设置退格键在插入模式可用

"禁止生成临时文件
set nobackup
set noswapfile

set incsearch
"set highlight

set laststatus=2
set showmatch  "高亮显示匹配的括号
"去掉输入错误提示音
set noerrorbells
"隐藏缓冲区
set hidden

nnoremap <F2> :NERDTreeToggle<CR>        

"映射全选+复制 ctrl+a
"map <C-A> ggVG
"map! <C-A> <Esc>ggVG
"vmap <C-c> "+y

"去空行
nnoremap <F4> :g/^\s*$/d<CR>


"配置垂直对齐线
"let g:indentLine_enabled=0  
"let g:indentLine_color_term=239
"let g:indentLine_char="|"  
"let g:indentLine_concealcursor='vc'
"let g:indentLine_concealleval=0
"set list lcs=tab:\|\ 
map <F6> :IndentLinesToggle<CR>  "开启和关闭垂直对其线

map <F5> :make<CR>  编译程序快捷键

nnoremap Y y$  "从新定义普通模式下Y的功能"


set nowrapscan "禁止搜索绕回文件的开头 例如？和/
"set wrapmargin=0 "设置一行的字符个数，以便自动插入换行符

"自动补全(,[,{,',",<
inoremap (  ()<Esc>i
inoremap [  []<Esc>i
"inoremap "  ""<Esc>i
inoremap <  <><Esc>i


"taglist插件配置
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidth=28
nnoremap <F3> :TlistToggle<CR>



