set nocompatible
filetype off

" call vundle#begin()
" let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'

" call vundle#end()

set rtp+=~/.vim/bundle/Vundle.vim
syntax on " 开启语法高亮

set nu " 开启行号
set relativenumber " 相对行号

set guifont=Courier_New:h10:cANSI " 设置字体，好像是失败的

set autoindent " 设置自动缩进
set smartindent
set tabstop=4 " 制表符占位4
set smarttab

set hlsearch " 高亮搜索结果
set enc=utf-8 " utf-8编码
set showmatch " 括号匹配
set noswapfile " 不要swapfile
set clipboard+=unnamed " 可以全局复制粘贴
" colorscheme desert " 设置主题，好像没有生效

set cursorcolumn " 突出显示当前列
set cursorline " 突出显示当前行
set ruler " 显示当前的行号，列号
set showmode
set scrolloff=7 " 保留显示
set incsearch " 增量搜索
set foldenable " 代码折叠
set foldmethod=manual " 折叠方式-手工折叠

let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
	if g:FoldMethod == 0
		exe "normal! zM"
		let g:FoldMethod = 1
	else
		exe "normal! zR"
		let g:FoldMethod = 0
	endif
endfun

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd

autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
	if &filetype == 'sh'
		call setline(1, "\#!/bin/bash")
	endif

	if &filetype == 'python'
		call setline(1, "\# -*- coding: utf-8 -*-")
	endif

	normal G
	normal o
	normal o
endfunc

set background=dark
set t_Co=256

colorscheme industry

hi! link SignColumn LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange


filetype plugin indent on
