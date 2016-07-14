"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一般设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设定默认解码
set fenc=utf-8
set fencs=ucs-bom,utf-8,gb18030,cp936,latin1
set enc=utf-8
set fileencodings=ucs-bom,utf-8,gb18030,cp936,latin1
let &termencoding=&encoding

" 不要使用vi的键盘模式，而是vim自己的
set nocompatible

" history文件中需要记录的行数
set history=100

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 与windows共享剪贴板
set clipboard+=unnamed

" 侦测文件类型
filetype on

" 载入文件类型插件
filetype plugin on

" 为特定文件类型载入相关缩进文件
filetype indent on

" 保存全局变量
set viminfo+=!

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 语法高亮
syntax on

" 高亮字符，让其不受100列限制
:highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
:match OverLength '\%101v.*'

" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White

" xterm 设置
:colorscheme colorer
if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endi

"保存文件
:noremap <C-s> :w<cr>
:inoremap <C-s> <esc>:w<cr>a
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 要备份文件（根据自己需要取舍）
"set backup
"设置无备份文件
set writebackup
set nobackup

" 不要生成swap文件，当buffer被丢弃的时候隐藏它
"setlocal noswapfile
set bufhidden=hide
set dir=~/.vim/tmp

" 字符间插入的像素行数目
set linespace=0

" 增强模式中的命令行自动完成操作
set wildmenu

" 在状态行上显示光标所在位置的行号和列号
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

" 不让vim发出讨厌的滴滴声
set noerrorbells
if has('autocmd')
    autocmd GUIEnter * set vb t_vb=
endif
"No bell settings End }}}

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

"在屏幕最后一行显示 (部分的) 命令
set showcmd

"在每个tab上显示编号
set guitablabel=%{tabpagenr()}.%t\ %m

set autoread                " 自动重新加载外部修改内容
set autochdir               " 自动切换当前目录为当前文件所在的目录

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索和匹配
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5

" 在搜索的时候忽略大小写
set ignorecase

" 不要高亮被搜索的句子（phrases）
set nohlsearch

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch

" 输入:set list命令是应该显示些啥？
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 不要闪烁
set novisualbell

" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" 总是显示状态行
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本格式和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"缩进相关

" ambiwidth 默认值为 single。在其值为 single 时，
" 若 encoding 为 utf-8，gvim 显示全角符号时就会
" 出问题，会当作半角显示。
set ambiwidth=double

function! GnuIndent()
    setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
    setlocal shiftwidth=2
    setlocal tabstop=8
endfunction

function! MyIndent()
    setlocal cinoptions=:0,g0,(0,w1,t0
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal smartindent
endfunction

au FileType c,cpp call MyIndent()
au FileType diff  setlocal shiftwidth=4 tabstop=4
au FileType html  setlocal autoindent indentexpr=
au FileType changelog setlocal textwidth=76

" Recognize standard C++ headers
au BufEnter /usr/include/c++/*    setf cpp
au BufEnter /usr/include/g++-3/*  setf cpp
au BufEnter ~/Source/cpp_src/*  setf cpp
au BufEnter ~/Source/cpp_src/stl/* setf cpp
" Setting for files following the GNU coding standard
au BufEnter /usr/*                call GnuIndent()

au BufEnter *.cpp setf cpp
au BufEnter *.cxx setf cpp
au BufEnter *.hpp setf cpp
au BufEnter *.c++ setf cpp
au BufEnter *.cc setf cpp
au BufEnter *.h setf cpp
au BufEnter *.c setf c
au BufEnter *.tex setf tex
au BufEnter *.f setf fortran
au BufEnter *.for setf fortran
au BufEnter *.f77 setf fortran
au BufEnter *.f90 setf fortran


function! RemoveTrailingSpace()
    if $VIM_HATE_SPACE_ERRORS != '0' &&
                \(&filetype == 'c' || &filetype == 'cpp' || &filetype == 'vim')
        normal m`
        silent! :%s/\s\+$//e
        normal ``
    endif
endfunction
" Remove trailing spaces for C/C++ and Vim files
au BufWritePre *                  call RemoveTrailingSpace()

" 自动格式化
set formatoptions=tcrqn

" 继承前一行的缩进方式，特别适用于多行注释
set autoindent

" 为C程序提供自动缩进
"set smartindent

" 使用C样式的缩进
"set cindent

" 制表符为4
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 要用空格代替制表符
"set noexpandtab
set expandtab

" 要换行
"set nowrap

" 在行和段开始处使用制表符
"set smarttab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen load
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

" Check code every save
let g:pymode_lint_write = 0
" use other local set
let g:pymode_options_other= 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示

if has("autocmd")
    autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby,go,verilog set number
    autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
    autocmd FileType java,c,cpp,cs vmap <C-o> <ESC>'<o/*<ESC>'>o*/
    autocmd FileType c,cpp,cs source ~/.vim/cpp/project.vim
    autocmd FileType fortran source ~/.vim/fortran/project.vim
    autocmd BufEnter *.tex source ~/.vim/tex/project.vim
"    autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python setlocal textwidth=100
    autocmd Filetype html,xml,xsl source ~/.vim/plugin/closetag.vim
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
    autocmd BufNewFile *.py 0r ~/.vim/template/python/tmpl.py
    autocmd BufNewFile *.go 0r ~/.vim/template/hello.go
endif " has("autocmd")

" 能够漂亮地显示.NFO文件
set encoding=utf-8
function! SetFileEncodings(encodings)
    let b:myfileencodingsbak=&fileencodings
    let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
    let &fileencodings=b:myfileencodingsbak
    unlet b:myfileencodingsbak
endfunction

au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()

" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt


"Gui action mapping
nnoremap <F7> :set guioptions+=m<CR>
nnoremap <C-F7> :set guioptions-=m<CR>

"字典完成
set dictionary-=~/.vim/dic/words dictionary+=~/.vim/dic/words

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Keybinding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 双反斜杠\\即可打开bufexplorer
map <leader><leader> \be

nnoremap <silent> <F4> :tabprevious<CR>

:set cscopequickfix=s-,c-,d-,i-,t-,e-
nnoremap <silent> <F3> :Grep<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""
"	:inoremap ( ()<ESC>i
"	:inoremap ) <c-r>=ClosePair(')')<CR>
"	:inoremap { {}<ESC>i
"	:inoremap } <c-r>=ClosePair('}')<CR>
"	:inoremap [ []<ESC>i
"	:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>

function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

" mapping
" 如果下拉菜单弹出，回车映射为接受当前所选项目，否则，仍映射为回车；
"
" 如果下拉菜单弹出，CTRL-J映射为在下拉菜单中向下翻页。否则映射为CTRL-X CTRL-O；
"
" 如果下拉菜单弹出，CTRL-K映射为在下拉菜单中向上翻页，否则仍映射为CTRL-K；
"
" 如果下拉菜单弹出，CTRL-U映射为CTRL-E，即停止补全，否则，仍映射为CTRL-U；
"inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
:inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
:inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
"
:inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>"a

"在有弹出菜单的情况下
:inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
:inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
:inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"

"选中一段文字并全文搜索这段文字
:vnoremap <silent> ,/ y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
:vnoremap <silent> ,? y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"查找选中文本
"vnoremap <c-s> "zy/<c-r>=substitute(escape(@z,'[]*.\\/'),'\n', '\\n', 'g')<cr><cr><cr>

"Super paste
inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

let g:bufExplorerSortBy = "name"
"""""""""""""""""""""""""""""""""""""""""
"TextMate-Like
"""""""""""""""""""""""""""""""""""""""""
set runtimepath+=~/.vim/textmateOnly/
set runtimepath+=~/.vim/textmateOnly/after/

"字典
"set keywordprg=~/Apps/dicty
:inoremap <C-f> <esc>:!~/.vim/Apps/dicty <cWORD><cr>a
"""""""""""""""""""""""""""""""""""""""""

""使用模板, 新建或打开空文件时自动调用模板
"autocmd FileType perl
"         \ if 1 == line('$') && empty(getline(1)) |
"         \   if has('gui_running')      |
"         \      0r D:/xxxxx/templates\pl.pl |
"         \   else            |
"         \      0r /xxxxx/templates/pl.pl |
"         \   endif   |
"         \   normal G |
"         \ endif
"
autocmd BufEnter *.tex
         \ if 1 == line('$') && empty(getline(1)) |
         \   if has('gui_running')      |
         \      0r ~/.vim/tex/xetex.template |
         \   else            |
         \      0r ~/.vim/tex/xetex.template |
         \   endif   |
         \   normal G |
         \ endif

autocmd BufEnter resume.tex
         \ if 1 == line('$') && empty(getline(1)) |
         \   if has('gui_running')      |
         \      0r ~/.vim/tex/resume.tex |
         \   else            |
         \      0r ~/.vim/tex/resume.tex |
         \   endif   |
         \   normal G |
         \ endif
"查找包含符合特定模式的字符串的行数
function! MyCountMatchLine(MyRegMatch) range
   let matchCount = 0
   for LineNum in range(a:firstline,a:lastline)
      let LineContent = getline(LineNum)
      if LineContent =~ a:MyRegMatch
         let matchCount += 1
      endif
   endfor
   echo matchCount
endfunction

"查找符合特定模式的字符串的个数
function! MyCountPattern(MyRegMatch) range
   let matchCount = 0
   for LineNum in range(a:firstline,a:lastline)
      let LineContent = getline(LineNum)
      let MyLineTmp = substitute(LineContent, a:MyRegMatch, '', 'g')
      let matchCount -= strlen(substitute(MyLineTmp, "[^@]", '', 'g'))
      let MyLineTmp = substitute(LineContent, a:MyRegMatch, '@', 'g')
      let matchCount += strlen(substitute(MyLineTmp, "[^@]", '', 'g'))
   endfor
   echomsg matchCount
endfunction

" nerd tree
nmap nt   :NERDTreeToggle<CR>

" :W & :Q
nmap :W :w
nmap :Wq :wq
nmap :Q :q
nmap :Qa :qa

" pydiction python word complete
let g:pydiction_location='/home/zz/.vim/after/ftplugin/pydict/complete-dict'

" stardict-vim
nmap F :!sdcv -u "朗道英汉字典5.0" -n "<cword>" <C-R><CR><CR>
"function! Mydict()
"  let expl=system('sdcv -n -u '. '朗道英汉字典5.0 '.
"        \  expand("<cword>"))
"  windo if
"        \ expand("%")=="diCt-tmp" |
"        \ q!|endif
"  25vsp diCt-tmp
"  setlocal buftype=nofile bufhidden=hide noswapfile
"  1s/^/\=expl/
"  1
"endfunction
"nmap F :call Mydict()<CR>

" paste
set pastetoggle=<leader>p
function! ShowMan()
	let word = expand("<cword>")
	new
	exe "r!man -a ".word."|col -b"
	1 "Go to the first line
endfun

map M :call ShowMan()<CR>
"== USAGE ==
"
"Type :ConqueTerm <command> to run your command in vim, for example:
"
":ConqueTerm bash
":ConqueTerm mysql -h localhost -u joe -p sock_collection
":ConqueTerm ipython
"
"To open ConqueTerm in a new horizontal or vertical buffer use:
"
":ConqueTermSplit <command>
":ConqueTermVSplit <command>
":ConqueTermTab <command>
"
"All text typed in insert mode will be sent to your shell. Use the <F9> key to send a visual selection from any buffer to the shell.
"
"For more help type :help ConqueTerm
map <F8> :ConqueTermSplit bash<CR>
nmap tl :Tlist<cr>
let Tlist_Show_One_File        = 1             " 只显示当前文件的tags
let Tlist_Exit_OnlyWindow      = 1             " 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window     = 1             " 在右侧窗口中显示
"let Tlist_File_Fold_Auto_Close = 1             " 自动折叠
"let Tlist_Sort_Type = "name"                   " items in tags sorted by name


set tags+=/usr/include/gtk-2.0/tags
"set path+=/usr/include/gtk-2.0/gtk

"" 打开语法高亮
"syntax enable
"syntax on
"
"" 打开对文件类型插件的支持
"filetype indent on
"filetype plugin on
"filetype plugin indent on

" ######### Vimwiki 写作助手 ######### "

" 使用鼠标映射
let g:vimwiki_use_mouse = 1

" 不要将驼峰式词组作为 Wiki 词条
let g:vimwiki_camel_case = 0

" 切换列表项的开关（选中/反选）原始为C-Space,易冲突
map <S-t> <Plug>VimwikiToggleListItem

" 用F5和Shift-F5生成html
map <S-F5> :VimwikiAll2HTML<cr>
map <F5> :Vimwiki2HTML<cr>

"加上日期
":map <F2> <ESC>gg:read !echo `date '+\%Y-\%m-\%d \%H:\%M:\%S'`<CR>
:map <F2> <ESC>gg:read !echo -e "*`date '+\%Y-\%m-\%d \%H:\%M:\%S'`*\n_cat_\n\`tag\`\n----\n\%toc"<CR>

let g:vimwiki_list = [{
\ 'path': '/mnt/DATA/proj/wikiblog/',
\ 'path_html': '/mnt/DATA/proj/vimwikiblog/html/',
\ 'template_path': '/mnt/DATA/proj/vimwikiblog/config/',
\ 'template_default': 'vimwiki',
\ 'template_ext': '.tpl',
\ 'css_name': 'style0.css',
\ 'auto_export': 1,},{
\ 'path': '/mnt/DATA/proj/vimwikiblog/wiki/',
\ 'path_html': '/mnt/DATA/proj/vimwikiblog/wiki/html/',
\ 'auto_export': 0,}]

:set directory=.,$TEMP

"------- vim-go  ---------
"<leader> is \
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>i <Plug>(go-install)
au FileType go nmap <Leader>e <Plug>(go-rename)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

"for lagging
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

"------- vim-go  end   ---------

" 设置快捷键复制选中文本块
vnoremap <Leader>y "+y
nmap <Leader>p "+p

" 缩进可视化插件 Indent Guides
" 随 vim 自启动
"let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=white
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=lightgrey

" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>

" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：grep. NEED ack-grep
nnoremap <Leader>gr :CtrlSF<CR>

" vim-multiple-cursors v选中内容后C-n多选,可一起编辑
" Default mapping
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'

" easymotion 快速精确跳转
" usage: <leader><leader>fa v<leader><leader>w

" wildfire 回车选中结对符中字符
" 快捷键
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip","a'", 'a"', "a)", "a]", "a}"]

" TODO UltiSnips 模版补全
" TODO NERD Commenter 注释
