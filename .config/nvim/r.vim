""".r
autocmd BufRead,BufNewFile *.r set filetype=r
autocmd BufRead,BufNewFile *.R set filetype=r
autocmd FileType r inoremap ä {<Enter><Enter>}<Enter><++><Esc>2ki<Tab>
autocmd FileType r inoremap ü {<Enter><Enter>}<Enter><++><Esc>2ki<Tab>
autocmd FileType r inoremap ,> %>%<Enter>
autocmd FileType r inoremap ,< <End><Space>%>%<Enter>
autocmd FileType r inoremap ,f function()<Space>{<Enter><++><Enter>}<Enter><Enter><++><Esc>4kf)i
autocmd FileType r inoremap ,if if()<Space>{<Enter><++><Enter>}<++><Enter><Enter><++><Esc>4ki
autocmd FileType r inoremap ,el <Space>else<Space>{<Enter><Enter>}<Esc>ki<Tab>
autocmd FileType r inoremap ,ef <Space>else<Space>if()<Space>{<Enter><++><Enter>}<++><Esc>2kf)i
