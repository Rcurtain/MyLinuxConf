
set nocompatible               " be iMproved
filetype off                   " required!
 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
 
" My Bundles here:
"
" original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
Bundle 'junegunn/goyo.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Shougo/wildfire.vim'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/vimgdb'
Bundle 'tomasr/molokai'
Bundle 'yonchu/accelerated-smooth-scroll'
Bundle 'Lokatlog/vim-powerline'
Bundle 'jlanzarotta/bufexplorer'
" Bundle 'bling/vim-airline'
" Bundle 'altercation/vim-colors-solarized'
" Bundle 'larrupingpig/vimgdb-for-vim7.3'
" Bundle 'sjl/gundo.vim'

" vim-scripts repos
" Bundle 'L9'
Bundle 'taglist.vim'
Bundle 'winmanager'
Bundle 'cscope.vim'
Bundle 'minibufexpl.vim'
Bundle 'a.vim'
Bundle 'grep.vim'
Bundle 'OmniCppComplete'
Bundle 'SuperTab'
Bundle 'lookupfile'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'AutoClose'
Bundle 'syntastic'
Bundle 'calendar.vim'
Bundle 'DoxygenToolkit.vim'
Bundle 'DrawIt'
Bundle 'sketch.vim'
Bundle 'snipmate'
Bundle 'Conque-shell'
Bundle 'Gundo'
" Bundle 'statusline.vim'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...


"vim 配置

"语法高亮
syntax enable
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  "have Vim load indentation rules and plugins according to the detected filetype
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

"set ignorecase        " 搜索模式里忽略大小写
"set smartcase        " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
set autowrite        " 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
set autoindent        " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
"set smartindent        " 智能对齐方式
set tabstop=4        " 设置制表符(tab键)的宽度
set softtabstop=4     " 设置软制表符的宽度    
set shiftwidth=4    " (自动) 缩进使用的4个空格
set cindent            " 使用 C/C++ 语言的自动缩进方式
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s     "设置C/C++语言的具体缩进方式
"set backspace=2    " 设置退格键可用
set showmatch        " 设置匹配模式，显示匹配的括号
set linebreak        " 整词换行
set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
"set hidden " Hide buffers when they are abandoned
set mouse=a            " Enable mouse usage (all modes)    "使用鼠标
set number            " Enable line number    "显示行号
"set previewwindow    " 标识预览窗口
set history=50        " set command history to 50    "历史记录50条

"--ctags setting--
"" 按下F12重新生成tag文件，并更新taglist
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate <CR>
imap <C-F12> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate <CR>
set tags=tags
set tags+=./tags "add current directory's generated tags file
"set tags+=~/arm/linux-2.6.24.7/tags "add new tags
"file(刚刚生成tags的路径，在ctags -R
"生成tags文件后，不要将tags移动到别的目录，否则ctrl+］时，会提示找不到源码文件)
set tags+=/usr/include/c++/tags "c++文件的配置文件

"-- Taglist setting --
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=1 "实时更新tags
let Tlist_Inc_Winwidth=0

"NerdTree的设置 并且相对行号显示
nmap <leader>nt :NERDTree<cr>:set rnu<cr>
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.$','\~$']
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos=0
"autocmd vimenter * NERDTree

" -- MiniBufferExplorer -- 
let g:miniBufExplMapCTabSwitchBufs = 1 " <C-Tab>Tab <C-S-Tab> 向前循环切换到每个buffer上,并在但前窗口打开
let g:miniBufExplMapWindowNavVim = 1 " 按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapWindowNavArrows = 1 " 按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapCTabSwitchBufs = 1 " 启用以下两个功能：Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开；ubuntu好像不支持
let g:miniBufExplMapCTabSwitchWindows = 1 " 启用以下两个功能：Ctrl+tab移到下一个窗口；Ctrl+Shift+tab移到上一个窗口；ubuntu好像不支持
let g:miniBufExplModSelTarget = 1    " 不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer

"-- WinManager setting --
let g:winManagerWindowLayout='FileExplorer|TagList, BufExplorer' " 设置我们要管理的插件
"let g:persistentBehaviour=0 " 如果所有编辑文件都关闭了，退出vim
" nmap wm :WMToggle<cr>
nmap wm :NERDTreeToggle<cr> :TlistToggle<cr>

"-- Cscope setting --
if has("cscope")
    set csprg=/usr/bin/cscope        " 指定用来执行cscope的命令
    set csto=0                        " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
    set cst                            " 同时搜索cscope数据库和标签文件
    set cscopequickfix=s-,c-,d-,i-,t-,e-    " 使用QuickFix窗口来显示cscope查找结果
    set nocsverb
    if filereadable("cscope.out")    " 若当前目录下存在cscope数据库，添加该数据库到vim
        cs add cscope.out
    elseif $CSCOPE_DB != ""            " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
        cs add $CSCOPE_DB
    endif
    set csverb
endif
"map <F10> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
"imap <F10> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
map <C-F11> :! cscope -Rbq <CR> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
map <C-F11> <ESC> :! cscope -Rbq <CR> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
cs add /usr/include/c++/cscope.out /usr/include/c++

" 将:cs find c等Cscope查找命令映射为<C-_>c等快捷键（按法是先按Ctrl+Shift+-, 然后很快再按下c）
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  " 查找字符串出现的位置 
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>                 " 查找定义的位置
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  " 查找本函数的调用函数
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  " 查找调用本函数的函数
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  " 查找指定的字符串
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  " 查找egrep模式
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>                 " 查找文件
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>  " 查找包含本文件的文件


"-- QuickFix setting --
"" 按下Ctrl-F7，执行make clean
 map <C-F7> :make clean<CR><CR><CR>
" 按下F7，执行make编译程序，并打开quickfix窗口，显示编译信息
 map <F7> :make<CR><CR><CR> :copen<CR><CR>
" " 按下 F9，光标移到上一个错误所在的行
 map <F9> :cp<CR>
" " 按下F4，光标移到下一个错误所在的行
 map <F4> :cn<CR>
" " 以上的映射是使上面的快捷键在插入模式下也能用
 imap <C-F7> <ESC>:make clean<CR><CR><CR>
 imap <F7> <ESC>:make<CR><CR><CR> :copen<CR><CR>
 imap <F9> <ESC>:cp<CR>
 imap <F4> <ESC>:cn<CR>

"实现在头文件和源文件之间的切换
nnoremap <silent> <F12> :A<CR>

"实现全局的查找
nnoremap <silent> <F3> :Grep<CR>


"-- omnicppcomplete setting --
"" 按下F2自动补全代码，注意该映射语句后不能有其他字符，包括tab；否则按下F3会自动补全一些乱码
imap <F2> <C-X><C-O>
" 按下F4根据头文件内关键字补全
imap <C-F2> <C-X><C-I>
set completeopt=menu,menuone " 关掉智能补全时的预览窗口
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included
files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the
""last column
let OmniCpp_ShowAccess=1 

""设置LookupFile的寻找路径
""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
"if filereadable("./filenametags")                "设置tag文件的名字
"文件的名字let g:LookupFile_TagExpr = '"./filenametags"'
"endif
"映射LookupFile为,lk
nmap <silent> <leader>lk :LUTags<cr>
" "映射LUBufs为,ll
nmap <silent> <leader>ll :LUBufs<cr>
" "映射LUWalk为,lw
nmap <silent> <leader>lw :LUWalk<cr>


""对NERD_commenter的设置
let NERDShutUp=1
"支持单行和多行的选择，//格式
map <c-h> ,c<space>


" Goyo的配置
nnoremap <Leader>m :Goyo<CR>

""就可以按引导键加逗号呼出goyo模式了。 可以按自己的需求配置宽高和位置：

" let g:goyo_width (default: 80)
" let g:goyo_margin_top (default: 4)
" let g:goyo_margin_bottom (default: 4)
" let g:goyo_linenr (default: 0)

" "goyo模式中默认禁用了 vim-airline, vim-powerline, powerline, lightline.vim, and vim-gitgutter插件。如果需要自定义goyo模式或者一些插件的enable/disable，

function! s:goyo_before()
silent !tmux set status off
set noshowmode
set noshowcmd
"" ...
endfunction
		
function! s:goyo_after()
silent !tmux set status on
set showmode
set showcmd
" ...
endfunction
	
" let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]

""ynastic 配置

""当然也可以做一些简单的配置，比如设置为每次打开buffer就执行语法检查，而不只是在保存时：

let g:syntastic_check_on_open = 1


" multi_cursor 配置
""let g:multi_cursor_use_default_mapping=0
""You can then map the 'next', 'previous', 'skip', and 'exit' keys like the following:
" Default mapping
 let g:multi_cursor_next_key='<C-n>'
 let g:multi_cursor_prev_key='<C-p>'
 let g:multi_cursor_skip_key='<C-x>'
 let g:multi_cursor_quit_key='<Esc>'


" This selects the next closest text object.
 let g:wildfire_fuel_map = "<ENTER>"
"
 " This selects the previous closest text object.
 let g:wildfire_water_map = "<BS>"
"
" 候选的文本对象也是可以配置的：
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]

"powerline{ 
" set laststatus=2
" set guifont=PowerlineSymbols\for\Powerline 
" set t_Co=256 
" let g:Powerline_symbols = 'fancy' 
""} "

" DoxygenToolkit.vim
let g:DoxygenToolkit_briefTag_pre="@Synopsis  " 
let g:DoxygenToolkit_paramTag_pre="@Param " 
let g:DoxygenToolkit_returnTag="@Returns   " 
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------" 
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
let g:DoxygenToolkit_authorName="Mathias Lorente" 
let g:DoxygenToolkit_licenseTag="My own license"  

" molokai_original 的配置
let g:molokai_original = 1

" If you want to use fancy, need to add font patch-> git clone
" git//gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline
" let g:Powerline_symboles = 'fancy'
" let g:Powerline_symboles = 'unicode'
"

let g:airline_section_b = '%{strftime("%C")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
