"
" DEFAULT is ...
set softtabstop=4
set tabstop=4
set shiftwidth=4
set autoindent
set noexpandtab

" 
" -- new, Sun Mar 28 10:49:14 CDT 2010 
" -------------------------------------
" I've protected python settings with autocommand (au)
"
" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
"au BufRead,BufNewFile *py,*pyw,*.c,*.h,*html set tabstop=8
au BufRead,BufNewFile *py,*pyw,*.c,*.h,*html set tabstop=4

" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
" C: tabs (pre-existing files) or 4 spaces (new files)
au BufRead,BufNewFile *.py,*pyw,*.html,*.js set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw,*.html,*.js set expandtab
" --- was commented out
fu Select_c_style()
	if search('^\t', 'n', 150)
                set autoindent
                set cindent
                set softtabstop=8
                set tabstop=4
		set shiftwidth=8
		set noexpandtab
                set backspace=indent,eol,start
	el 
		set shiftwidth=4
		set expandtab
	en
endf
" --- was commented out

au BufRead,BufNewFile *.c,*.h call Select_c_style()
au BufRead,BufNewFile Makefile* set noexpandtab

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" highlight when past 80 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
match OverLength /\%81v.\+/

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Wrap text after a certain number of characters
" Python: 79 
" C: 79
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79


" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
" Python: yes
" C: yes
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" ------------ useful extras ----------
" Set the default file encoding to UTF-8: 
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

"Automatically indent based on file type: 
"filetype indent on
" Keep indentation level from previous line: 
"set autoindent

" Folding based on indentation: 
"set foldmethod=indent
"set nofoldenable

filetype plugin on

"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS

autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

set softtabstop=4
"set cursorline
set laststatus=2

" numbering
"set nu 
" don't copy numbering, when mouse cut/paste
"set mouse=a

set nohls
set expandtab

"
" -- orig
" -------------------------------------
"  
"set cindent
"set autoindent
"set softtabstop=4
"set tabstop=4
"set shiftwidth=4
"
"set textwidth=79
"set noexpandtab
"set smartindent

"filetype plugin indent on

"set hidden
"set title
"runtime macros/matchit.vim
"syntax on
"set hlsearch
"set nohls
"set noincsearch
colorscheme advantage
set background=dark

" try:
" :set filetype htmldjango
" :set filetype django 
"
