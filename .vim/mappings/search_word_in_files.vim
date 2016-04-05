" Search for word under cursor in files of this type
command GREP :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%:e') | copen
command AG :execute 'Ag <cword> --'.expand('%:e')

" Search for word under cursor within this file
command GREPIN :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen
