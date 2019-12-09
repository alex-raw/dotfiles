""".r
autocmd BufEnter *.r call ncm2#enable_for_buffer()
autocmd BufEnter *.R call ncm2#enable_for_buffer()
autocmd BufEnter *.rmd call ncm2#enable_for_buffer()
autocmd BufEnter *.rnw call ncm2#enable_for_buffer()
autocmd BufRead,BufNewFile *.r set filetype=r
autocmd BufRead,BufNewFile *.R set filetype=r
autocmd BufRead,BufNewFile *.rmd set filetype=r
autocmd BufRead,BufNewFile *.rnw set filetype=r
autocmd FileType r inoremap ä {<Enter><Enter>}<Enter><++><Esc>2ki<Tab>
autocmd FileType r inoremap ü {<Enter><Enter>}<Enter><++><Esc>2ki<Tab>
autocmd FileType r inoremap ,> %>%<Enter>
autocmd FileType r inoremap ,< <End><Space>%>%<Enter>
autocmd FileType r inoremap ,f function()<Space>{<Enter><++><Enter>}<Enter><Enter><++><Esc>4kf)i
autocmd FileType r inoremap ,if if()<Space>{<Enter><++><Enter>}<++><Enter><Enter><++><Esc>4ki
autocmd FileType r inoremap ,el <Space>else<Space>{<Enter><Enter>}<Esc>ki<Tab>
autocmd FileType r inoremap ,ef <Space>else<Space>if()<Space>{<Enter><++><Enter>}<++><Esc>2kf)i

autocmd FileType r inoremap <Tab> <c-n>
autocmd FileType r inoremap <S-Tab> <c-p>
autocmd FileType r inoremap ,, <Esc>/<++><Enter>"_c4l
autocmd FileType r vnoremap ,, <Esc>/<++><Enter>"_c4l
autocmd FileType r map ,, <Esc>/<++><Enter>"_c4l

autocmd FileType r map <C-h> <C-w>h
autocmd FileType r map <C-j> <C-w>j
autocmd FileType r map <C-k> <C-w>k
autocmd FileType r map <C-l> <C-w>l
