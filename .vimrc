" .vimrc -- murj

" 非兼容模式
set nocp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" backup
set backup
" for *~ and *.swp files which anoying you. 2004.04.29, Mu.
" http://www.vim.org/tips/tip.php?tip_id=20
set backupdir=./.backup,~/.vim/backup,/tmp
set directory=.,./.backup,~/.vim/backup,/tmp

" 底部标尺
set ru
" 搜索时高亮显示结果
set nohls
" do incremental searching
set incsearch
" 输入搜索命令时，显示目前输入的模式的匹配位置
set is
" 显示行号
" set number
" 使用:e命令的时候 可选项预览
set wildmenu
" 文件默认编码
set enc=utf-8
" 文件保存时使用的编码
"fileencoding=utf-8
"打开文件进行解码的猜测列表，优先以utf-8打开
set fileencodings=utf-8,gbk
" 文件默认格式unix
set ff=unix
" 缩进为4个空格宽度
set tabstop=4
" 自动缩进使用的空格数
set shiftwidth=4
" 编辑插入tab时，把tab算作的空格数
set softtabstop=4
" 缩进使用空格
set expandtab
" 自动缩进
set autoindent
" 鼠标捕捉
set mouse=a
" 打开语法高亮
syntax on

" 默认配色为desert
color desert
" 显示标签栏 0: 从不 1: 大于1个时显示 2: 总是
set showtabline=2

" keep 50 lines of command line history
set history=50
" display incomplete commands
set showcmd

if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

" Lines with equal indent form a fold. 2004.04.29
" But cannot create fold using this foldmethod.
set foldmethod=syntax 

" 重新载入配置
map <leader>s :source ~/.vimrc<CR>

" visual模式修改缩进时不退出该模式
vnoremap < <gv
vnoremap > >gv 

filetype on
au BufNewFile,BufRead *.as set filetype=actionscript
" Multiple filetype for freemarker
au BufNewFile,BufRead *.ftl set filetype=ftl.html
au BufReadCmd *.jar,*.xpi,*.egg call zip#Browse(expand("<amatch>"))
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set foldmethod=marker
autocmd FileType python filetype plugin indent on
autocmd FileType python setlocal et sta sw=4 sts=4


"""""""""""""""""""""""""""""
" TagList setting
"""""""""""""""""""""""""""""
"Exuberant ctags程序的位置
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Inc_Winwidth=0
"在右侧窗口打开
let Tlist_Use_Right_Window=1
"只显示当前文件的tag
let Tlist_File_Fold_Auto_Close=1
"如果Taglist是最后一个窗口则退出vim
let Tlist_Exit_OnlyWindow = 1


""""""""""""""""""""""""""""""
" BufExplore settingr
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.

""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout = \""BufExplorer,FileExplorer|TagList"
let g:winManagerWindowLayout = "FileExplorer"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<CR>
nmap <C-W><C-B> :BottomExplorerWindow<CR>
nmap <silent> <leader>wm :WMToggle<CR> 

"" handle common typos: tip #22
command! Q  quit
command! W  write
command! Wq wq

"" always show status line
set laststatus=2

"" set help lang
set helplang=cn

" Edit another file in the same directory. Tip #2
if has("unix")
    map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
else
    map ,e :e <C-R>=expand("%:p:h") . "\" <CR>
endif

" autoload .vimrc in each directory
au BufRead *
	\   if filereadable(expand("%:p:h")."/.vimrc")  && expand("%p:h") != $VIMRUNTIME
	\ |     exe 'source '.expand("%:p:h")."/.vimrc"
	\ | endif

" Enable color in secureCRT, August.11, 2003.
" Also check 'ANSI color' chechbox in secureCRT's session options.
if !has("gui_running")
	set t_Co=8
	set t_Sf=[3%p1%dm
	set t_Sb=[4%p1%dm
endif 

:autocmd BufRead,BufNewFile *.php set makeprg=php\ -l\ %
:autocmd BufRead,BufNewFile *.py set expandtab tabstop=4 shiftwidth=4 autoindent smartindent
au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/thrift.vim
inoremap # X#

