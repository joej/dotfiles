" DEFAULT is ...
set softtabstop=4
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set nohls       " don't highlight searches
syntax on       " higlight syntax
set encoding=utf-8              " Set the default file encoding to UTF-8: 

let python_highlight_all=1      " For full syntax highlighting:

set title       " terminal tile = current active buffer
set showmatch   " flash matching parent when typing
"set cursorline  " highlight current line
"set cursorcolumn
set matchpairs+=<:>
set laststatus=2
colorscheme advantage
set background=dark

filetype on
filetype plugin on

func! Python_init()
    setlocal smartindent
    setlocal sw=4 ts=4 sts=4        " as per PEP8
    setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
    setlocal complete+=k~/.vim/pydiction "use auto-completion from the specified dictionary
    setlocal nowrap "don't wrap source code, it's evil
    setlocal noignorecase nosmartcase "avoid corrupting source code on search/replace operations
    match ExtraWhitespace /\s\+\%#\@<!$/
    match OverLength /\%80v.\+/
endfunc

func! JS_init()
    setlocal shiftwidth=2 tabstop=2 softtabstop=2 "standard PEP8 Tab length
    setlocal smartindent "use the keywords below to add additional indentation
    setlocal formatoptions=cqtro textwidth=79 "wrap lines longer than 79 characters
    setlocal noignorecase nosmartcase "avoid corrupting source code on search/replace operations
endfunc

func! HTML_init()
    setlocal shiftwidth=2 tabstop=2 softtabstop=2 "by default, Tab moves by 2 spaces
    setlocal wrap
    setlocal formatoptions-=t
    "setlocal formatoptions+=tl1 textwidth=80
endfunc

autocmd FileType python call Python_init()
autocmd FileType pyrex call Python_init()

autocmd FileType css setlocal smartindent
autocmd BufNewFile,BufRead *.cconf setlocal filetype=python

autocmd BufNewFile,BufRead *.json setlocal filetype=javascript
autocmd BufNewFile,BufRead *.phpt setlocal filetype=php

autocmd BufNewFile,BufRead *.cinc setlocal filetype=python
autocmd BufNewFile,BufRead *.ctest setlocal filetype=python
autocmd BufNewFile,BufRead *.smcprops setlocal filetype=python
autocmd BufNewFile,BufRead *.thrift-cvalidator setlocal filetype=python
autocmd BufNewFile,BufRead *.tw setlocal filetype=python

autocmd BufNewFile,BufRead *.html setlocal filetype=htmldjango
autocmd FileType html call HTML_init()
autocmd FileType htmldjango call HTML_init()

autocmd FileType make setlocal noexpandtab shiftwidth=8 tabstop=8 softtabstop=8

autocmd FileType python autocmd BufWritePost <buffer> botright cwindow 4

autocmd FileType c,cabal,cpp,haskell,javascript,php,python,readme,rst,text
  \ autocmd BufWritePre <buffer>
    \ :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

"
" Specific plug-in configuration
"
let python_highlight_builtins=1
let python_highlight_exceptions=1
let python_highlight_indent_errors=1
let python_highlight_space_errors=1
let python_highlight_string_formatting=1
let python_highlight_string_format=1
let python_highlight_string_templates=1
let python_highlight_doctests=1
let python_slow_sync=1

"au BufRead,BufNewFile *py,*pyw,*.c,*.h,*html set tabstop=4
"au BufRead,BufNewFile *.py,*pyw,*.html,*.js set shiftwidth=4
"au BufRead,BufNewFile *.py,*.pyw,*.html,*.js set expandtab
"
" --- was commented out
"fu Select_c_style()
"	if search('^\t', 'n', 150)
"                set autoindent
"                set cindent
"                set softtabstop=8
"                set tabstop=4
"		set shiftwidth=8
"		set noexpandtab
"                set backspace=indent,eol,start
"	el 
"		set shiftwidth=4
"		set expandtab
"	en
"endf
" --- was commented out

"au BufRead,BufNewFile *.c,*.h call Select_c_style()
"au BufRead,BufNewFile Makefile* set noexpandtab
"
"" Use the below highlight group when displaying bad whitespace is desired.
"highlight BadWhitespace ctermbg=red guibg=red

" highlight when past 80 chars
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
"match OverLength /\%81v.\+/

" Display tabs at the beginning of a line in Python mode as bad.
"au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Wrap text after a certain number of characters
" Python: 79 
" C: 79
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79


" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
"au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
" Python: yes
" C: yes
"au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix



"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

"set cursorline

