" Search for word under cursor in files of this type
command GREP :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%:e') | copen

" Search for word under cursor within this file
command GREPIN :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen
