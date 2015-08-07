" Replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Replace selection under cursor
" Does not work correctly, because it would just paste and not escape content.
" vnoremap <Leader>s :%s/'<,'>/
