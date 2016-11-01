let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap \ <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap \ <Plug>(easymotion-overwin-f2)

nmap / <Plug>(easymotion-sn)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Search for word
map \w <Plug>(easymotion-w)

" JK motions: Line motions
map \h <Plug>(easymotion-linebackward)
map \j <Plug>(easymotion-j)
map \k <Plug>(easymotion-k)
map \l <Plug>(easymotion-lineforward)
