" DEFAULT is ...
set nocompatible
set softtabstop=4
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set nohls       " don't highlight searches
syntax on       " higlight syntax
set encoding=utf-8              " Set the default file encoding to UTF-8: 
set fileformat=unix
set textwidth=79

let python_highlight_all=1      " For full syntax highlighting:

set title       " terminal tile = current active buffer
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}


set showmatch   " flash matching parent when typing
"set cursorline  " highlight current line
"set cursorcolumn
set matchpairs+=<:>
"set laststatus=2
colorscheme advantage
set background=dark

filetype on
filetype plugin on

func! Python_init()
    setlocal smartindent smarttab
    setlocal expandtab
    setlocal sw=4 ts=4 sts=4        " as per PEP8
    setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
    setlocal complete+=k~/.vim/pydiction "use auto-completion from the specified dictionary
    setlocal nowrap "don't wrap source code, it's evil
    setlocal noignorecase nosmartcase "avoid corrupting source code on search/replace operations
    "match ExtraWhiteSpace /\s\+\%#\@<!$/
    "match OverLength /\%80v.\+/
endfunc

func! JS_init()
    setlocal shiftwidth=2 tabstop=2 softtabstop=2 "standard PEP8 Tab length
    "setlocal smartindent "use the keywords below to add additional indentation
    setlocal formatoptions=cqtro textwidth=79 "wrap lines longer than 79 characters
    setlocal noignorecase nosmartcase "avoid corrupting source code on search/replace operations
endfunc

func! HTML_init()
    setlocal wrap
    setlocal formatoptions-=t
    "setlocal formatoptions+=tl1 textwidth=80
endfunc

autocmd FileType python call Python_init()
autocmd FileType pyrex call Python_init()

"autocmd FileType css setlocal smartindent
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

" enable folding
set foldenable
set foldmethod=indent
set foldlevel=999   " really high so as not to display by default
"nnoremap <space> za " enable folding via spacebar
nnoremap <F9> za    " enable folding via F9 key
"
" flag unnecessary white space
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"
" syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
" Nice statusbar
set laststatus=2
set statusline=\ "
set statusline+=%f\ " file name
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&fileformat}] " file format
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=%= " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }        " hush up some of the msgs
let g:syntastic_python_pylint_args = "--load-plugins pylint_django"
let g:syntastic_html_validator_exec = '/usr/local/bin/tidy'
"
"
" by default, lets DISABLE syntastic
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" but let F8 toggle it on or off
nnoremap <F8> :SyntasticCheck<CR> :SyntasticToggleMode<CR>
