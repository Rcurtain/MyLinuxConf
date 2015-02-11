set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tomasr/molokai'
" Bundle 'yonchu/accelerated-smooth-scroll'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'kevinw/pyflakes'
Bundle 'fs111/pydoc.vim'
"Vim plugin that allows you to save files into directorys with the parents doesn't exist
Bundle 'DataWraith/auto_mkdir' 
" Bundle 'rosenfeld/conque-term' " this is week
" Track the engine.
Bundle 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Bundle 'honza/vim-snippets'
Bundle 'xolox/vim-session'
Bundle 'xolox/vim-misc'
"Bundle 'Shougo/neocomplete.vim'

" vim-scripts repos
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
Bundle 'DoxygenToolkit.vim'
Bundle 'python.vim'
Bundle 'Gundo'
Bundle 'cmdline-completion'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

"vim 配置
""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""
"" 按下F12重新生成tag文件，并更新taglist
nmap <f12> <esc>:call Go_Project_Root()<cr>:!ctags -R --fields=+lS $PWD<cr><cr>
			\:!cscope -Rbkq<cr><cr>:!CreateNameTags.sh<cr><cr>:call Go_Curr_Dir()<cr>
imap <f12> <esc>:call Go_Project_Root()<cr>:!ctags -R --fields=+lS $PWD<cr><cr>
			\:!cscope -Rbkq<cr><cr>:!CreateNameTags.sh<cr><cr>:call Go_Curr_Dir()<cr>
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate <CR>
"imap <C-F12> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate <CR>
set tags=tags
set tags+=./tags "add current directory's generated tags file
"set tags+=~/arm/linux-2.6.24.7/tags "add new tags
"file(刚刚生成tags的路径，在ctags -R
"生成tags文件后，不要将tags移动到别的目录，否则ctrl+］时，会提示找不到源码文件)
set tags+=/usr/include/c++/tags "c++文件的配置文件

"切换到工程的根目录(该目录包含PROJECT_ROOT文件)
function! Go_Project_Root()
	wall
	let g:Curr_dir=getcwd()
	let i = 1
	while i < 10
		if filereadable("PROJECT_ROOT")
			return
		else
			cd ..
			let i += 1
		endif
	endwhile
	exec 'cd'.g:Curr_dir
endfunction

"切换到当前文件目录
function! Go_Curr_Dir()
	exec 'cd'.g:Curr_dir
endfunction

"refresh the NERDTree
function! RefreshNERDTree()
	:NERDTreeClose
	:NERDTree
endfunction


"-- Taglist setting --
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=1 "实时更新tags
let Tlist_Inc_Winwidth=0

"NerdTree的设置 并且相对行号显示
""""""""""""""""""""""""""""""
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.$','\~$']
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos=0

" -- MiniBufferExplorer -- 
""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1 " 按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapWindowNavArrows = 1 " 按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapCTabSwitchBufs = 1 " 启用以下两个功能：Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开；ubuntu好像不支持
let g:miniBufExplMapCTabSwitchWindows = 1 " 启用以下两个功能：Ctrl+tab移到下一个窗口；Ctrl+Shift+tab移到上一个窗口；ubuntu好像不支持
let g:miniBufExplModSelTarget = 1    " 不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer
"解决FileExplorer窗口变小问题
let g:bufExplorerMaxHeight=30
let g:miniBufExplorerMoreThanOne=0

"-- WinManager setting --
"let g:winManagerWindowLayout='NERDTree|TagList, BufExplorer' " 设置我们要管理的插件
let g:winManagerWindowLayout='FileExplorer|TagList, BufExplorer' " 设置我们要管理的插件
let g:persistentBehaviour=0 " 如果所有编辑文件都关闭了，退出vim
let g:winManagerWidth = 25 " 设置winmanager的宽度，默认为25
nmap <F2> :NERDTreeToggle<cr> :TlistToggle<cr>

"-- Cscope setting --
""""""""""""""""""""""""""""""
if has("cscope")
	set csprg=/usr/bin/cscope        " 指定用来执行cscope的命令
	set csto=0                        " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
	set cst                            " 同时搜索cscope数据库和标签文件
	set cscopequickfix=s-,c-,d-,i-,t-,e-    " 使用QuickFix窗口来显示cscope查找结果
	set nocsverb
	if filereadable("cscope.out")    " 若当前目录下存在cscope数据库，添加该数据库到vim
		cs add cscope.out .
		cs add /usr/include/c++/cscope.out /usr/include/c++
	elseif $CSCOPE_DB != ""            " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
		cs add $CSCOPE_DB
	endif
	set csverb
endif
map <C-F11> :! cscope -Rbq <CR> :cs add ./cscope.out . :cs add /usr/include/c++/cscope.out /usr/include/c++ <CR><CR><CR> :cs reset<CR>
map <C-F11> <ESC> :! cscope -Rbq <CR> :cs add ./cscope.out .  :cs add /usr/include/c++/cscope.out /usr/include/c++ <CR><CR><CR> :cs reset<CR>

" 将:cs find c等Cscope查找命令映射为<C-_>c等快捷键（按法是先按Ctrl+Shift+-, 然后很快再按下c）
"nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  查找字符串出现的位置 
"nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>                 查找定义的位置
"nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  查找本函数的调用函数
"nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  查找调用本函数的函数
"nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  查找指定的字符串
"nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  查找egrep模式
"nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>                 查找文件
"nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>  查找包含本文件的文件
nmap <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  " 查找字符串出现的位置 
nmap <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>                 " 查找定义的位置
nmap <leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  " 查找本函数的调用函数
nmap <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  " 查找调用本函数的函数
nmap <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  " 查找指定的字符串
nmap <leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  " 查找egrep模式
nmap <leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>                 " 查找文件
nmap <leader>fi :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>  " 查找包含本文件的文件

"QMake file setting
"""""""""""""""""""""""""""""""
" 按下Ctrl-F6，Use Qmake Generate MakeFile
" 按下F6
nmap <F6> <esc>:call Go_Project_Root()<cr>:!CreateMakeFileUseQmake<cr><cr>:call Go_Curr_Dir()<cr>:NERDTree<cr>
imap <F6> <esc>:call Go_Project_Root()<cr>:!CreateMakeFileUseQmake<cr><cr>:call Go_Curr_Dir()<cr>:NERDTree<cr>

"-- QuickFix setting --
""""""""""""""""""""""""""""""
"" 按下Ctrl-F7，执行make clean
map <C-F7> <ESC>:make clean<CR><CR><CR>
" 按下F7，执行make编译程序，并打开quickfix窗口，显示编译信息
map <F7> <ESC>:make<CR><CR><CR> :copen<CR><CR>
" " 按下 C-F9，光标移到上一个错误所在的行
map <C-F9> <ESC>:cp<CR>
" " 按下F9，光标移到下一个错误所在的行
map <F9> <ESC>:cn<CR>
" " 以上的映射是使上面的快捷键在插入模式下也能用
imap <C-F7> <ESC>:make clean<CR><CR><CR>
imap <F7> <ESC>:make<CR><CR><CR> :copen<CR><CR>
imap <C-F9> <ESC>:cp<CR>
imap <F9> <ESC>:cn<CR>

"实现在头文件和源文件之间的切换
map <C-F12> <ESC>:A<CR>
imap <C-F12> <ESC>:A<CR>

"实现全局的查找
nnoremap <silent> <F3> :Grep<CR>

"-- omnicppcomplete setting --
""""""""""""""""""""""""""""""
" 按下F2自动补全代码，注意该映射语句后不能有其他字符，包括tab；否则按下F3会自动补全一些乱码
" imap <S-tab> <C-X><C-O>
" 按下F2根据头文件内关键字补全
" imap <C-F2> <C-X><C-I>
set completeopt=menu,menuone " 关掉智能补全时的预览窗口
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1 

" supertab setting
""""""""""""""""""""""""""""""
" complete的默认值是". , w , b , u , U , t , i"意思是补全列表会先搜索当前文件(.) 再搜索其他窗口(w) , 再搜索其他buffer(b) , 再搜索已经卸载的buffer(u), 再搜索不再buffer列表中的buffer(U), 再搜索tags(t), 最后搜索源码中通过#include包含进来的头文件.
set cpt=.,b,u

"dict setting
""""""""""""""""""""""""""""""
set dictionary+=~/.vim/tab/C.dic
" change the default complete short key
" dict complete
nmap id <c-x><c-k>  
" path complete
nmap ip <c-x><c-f>  
" include file complete
nmap if <c-x><c-i>  
" tags complete
nmap it <c-x><c-]>  
" buffer complete
nmap ib <c-x><c-n>  
imap <Tab> <c-x><c-n>  

nmap <silent> <leader>qa :qall!<cr>

""设置LookupFile的寻找路径
""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
" name.tags is my filenametags's file name
let g:name_file=findfile("name.tags", ".;")
let g:LookupFile_TagExpr='g:name_file'
"映射LookupFile为,lk
nmap <silent> <leader>lk :LUTags<cr>
" "映射LUBufs为,ll
nmap <silent> <leader>ll :LUBufs<cr>
" "映射LUWalk为,lw
nmap <silent> <leader>lw :LUWalk<cr>
"LookupFile搜索时不区分大小写
func! LookupFile_IgnoreCaseFunc(pattern)
	let _tags = &tags
	try
		let &tags = eval(g:LookupFile_TagExpr)
		let newpattern = '\c' . a:pattern
		let tags = taglist(newpattern)
	catch
		echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
		return ""
	finally
		let &tags = _tags
	endtry
	let files = map(tags, 'v:val["filename"]')
	return files
endfunc
let File_LookupFunc = 'LookupFile_IgnoreCaseFunc'"


""对NERD_commenter的设置
""""""""""""""""""""""""""""""
let NERDShutUp=1
"支持单行和多行的选择，//格式
" Most of the following mappings are for normal/visual mode only. The |NERDComInsertComment| mapping is for insert mode only. 
" [count]<leader>cc |NERDComComment| Comment out the current line or text selected in visual mode. 
" [count]<leader>cn |NERDComNestedComment| Same as <leader>cc but forces nesting. 
" [count]<leader>c<space> |NERDComToggleComment| Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa. 
" [count]<leader>cm |NERDComMinimalComment| Comments the given lines using only one set of multipart delimiters. 
" [count]<leader>ci |NERDComInvertComment| Toggles the comment state of the selected line(s) individually. 
" [count]<leader>cs |NERDComSexyComment| Comments out the selected lines ``sexily'' 
" [count]<leader>cy |NERDComYankComment| Same as <leader>cc except that the commented line(s) are yanked first. 
" <leader>c$ |NERDComEOLComment| Comments the current line from the cursor to the end of line. 
" <leader>cA |NERDComAppendComment| Adds comment delimiters to the end of line and goes into insert mode between them. 
" |NERDComInsertComment| Adds comment delimiters at the current cursor position and inserts between.  Disabled by default. 
" <leader>ca |NERDComAltDelim| Switches to the alternative set of delimiters. 
" [count]<leader>cl 
" [count]<leader>cb    |NERDComAlignedComment| Same as |NERDComComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb). 
" [count]<leader>cu |NERDComUncommentLine| Uncomments the selected line(s). 

""synastic 配置
""""""""""""""""""""""""""""""
""当然也可以做一些简单的配置，比如设置为每次打开buffer就执行语法检查，而不只是在保存时：
let g:syntastic_check_on_open = 1

" multi_cursor 配置
""""""""""""""""""""""""""""""
""let g:multi_cursor_use_default_mapping=0
""You can then map the 'next', 'previous', 'skip', and 'exit' keys like the following:
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" DoxygenToolkit.vim
""""""""""""""""""""""""""""""
let g:DoxygenToolkit_briefTag_pre="@Synopsis  " 
let g:DoxygenToolkit_paramTag_pre="@Param " 
let g:DoxygenToolkit_returnTag="@Returns   " 
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------" 
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
let g:DoxygenToolkit_authorName="NJ" 
let g:DoxygenToolkit_licenseTag="My own license" 
let g:DoxygenToolkit_commentType = "C++"
" Use:
" Type of comments (C/C++: /// or /** ... */, Python: ## and # ) : 
" In vim, default C++ comments are : /** ... */. But if you prefer to use /// 
" Doxygen comments just add 'let g:DoxygenToolkit_commentType = "C++"' 
" License : 
" In vim, place the cursor on the line that will follow doxygen license 
" comment.  Then, execute the command :DoxLic.  This will generate license 
" comment and leave the cursor on the line just after. 
" - Author : 
" In vim, place the cursor on the line that will follow doxygen author 
" comment.  Then, execute the command :DoxAuthor.  This will generate the 
" skeleton and leave the cursor just after @author tag if no variable 
" define it, or just after the skeleton. 
" - Function / class comment : 
" In vim, place the cursor on the line of the function header (or returned 
" value of the function) or the class.  Then execute the command :Dox.  This 
" will generate the skeleton and leave the cursor after the @brief tag. 
" - Ignore code fragment (C/C++ only) : 
" In vim, if you want to ignore all code fragment placed in a block such as : 
" #ifdef DEBUG 
" ... 
" #endif 
" You only have to execute the command :DoxUndoc(DEBUG) ! 

" molokai_original 的配置
""""""""""""""""""""""""""""""
let g:molokai_original = 1

"ConqueTerm的使用说明
""""""""""""""""""""""""""""""
""ConqueTermSplit <command> 
""ConqueTermVSplit <command> 
""ConqueTermTab <command> 

" If you want to use fancy, need to add font patch-> git clone
" git//gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline
" let g:Powerline_symboles = 'fancy'
" let g:Powerline_symboles = 'unicode'

" Untilsnips configuretion
""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetDirectories=['UltiSnips']
" let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/vim-snippets/snippets'
let g:UltiSnipsExpandTrigger="<S-Tab>"
"let g:UltiSnipsExpandTrigger="<leader>is"
let g:UltiSnipsListSnippets ='<leader>il'
let g:UltiSnipsJumpForwardTrigger="ff"
let g:UltiSnipsJumpBackwardTrigger="bb"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical""

"session setting
""""""""""""""""""""""""""""""
" If you only want to save the current tab page:
set sessionoptions-=tabpages
"
" If you don't want help windows to be restored:
set sessionoptions-=help
" g:session_directory Its default value is ~/.vim/sessions
" g:session_lock_directory
let g:session_lock_directory = '/var/lock'
let g:session_default_name = "Project"
let g:session_extension = ".session"
let g:session_autoload = "no"
let g:session_autosave = "no"

" my SaveSession function for C/c++ project
function CProjectSaveSession()
	"execute 'mksession! ~/.vim/sessions/' . project_name
	:call Go_Project_Root()
	let g:session_directory = getcwd()
	:SaveSession
	:NERDTree
	call Go_Curr_Dir()
endfunction

" my SaveSession function for python  project
function PythonProjectSaveSession()
	let g:session_directory = getcwd()
	:SaveSession
	:NERDTree
endfunction

nmap <silent> <leader>ss :call CProjectSaveSession()<cr>
nmap <silent> <leader>ps :call PythonProjectSaveSession()<cr>

" my RestoreSession function
function MyRestoreSession()
	if filereadable("Project.session")    " 若当前目录下存在Project.session 文件 则调用session
		let g:session_directory = getcwd()
		:OpenSession Project
		"because the NERD window will change size 
		:call RefreshNERDTree()
	endif
endfunction

"autocmd VimLeave * call CProjectSaveSession
autocmd VimEnter * call MyRestoreSession()
