" Search for word under cursor in files of this type
command GREP :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%:e') | copen
" -Q will search for literal string. Otherwise `ag` will search for regex.
command AG :execute 'Ag -Q <cword> --'.expand('%:e')

" Search for word under cursor within this file
command GREPIN :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen
