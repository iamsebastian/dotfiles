if has("unix") && has("gui_running")
    let __system = system("uname -s")
    if match(__system, '^Linux') > -1
        call system('wmctrl -ir ' . v:windowid . ' -b toggle,fullscreen')
        nnoremap <F11>
                    \ :call system('wmctrl -ir ' . v:windowid . ' -b toggle,fullscreen')<CR>
    else
        echo 'System is not Linux'
    endif
endif
