" --------------------------- rmarkdown snippets -------------------------------- "

autocmd FileType r,rmd inoremap <leader>> %>%<Enter>
autocmd FileType r,rmd inoremap <leader>< <End><Space>%>%<Enter>
autocmd FileType r,rmd inoremap <leader>f function()<Space>{<Enter><++><Enter>}<Enter><Enter><++><Esc>4kf)i
autocmd FileType r,rmd inoremap <leader>if if()<Space>{<Enter><++><Enter>}<++><Enter><Enter><++><Esc>4ki
autocmd FileType r,rmd inoremap <leader>el <Space>else<Space>{<Enter><Enter>}<Esc>ki<Tab>
autocmd FileType r,rmd inoremap <leader>ef <Space>else<Space>if()<Space>{<Enter><++><Enter>}<++><Esc>2kf)i


autocmd FileType r,rmd inoremap <leader>r ```{r,<Space>,<Space>echo=FALSE}<Enter><++><Enter>```<Esc>kk2f,i
autocmd FileType r,rmd inoremap ´ `r `<Left>
autocmd FileType r,rmd inoremap ** **<Left>
autocmd FileType r,rmd inoremap *** ****<++><Left><Left>
autocmd FileType r,rmd inoremap <leader>or ~~~~<++><Esc>2F~i
autocmd FileType r,rmd inoremap <leader>ins <red></red><++><Esc>2F<

autocmd FileType r,rmd inoremap <leader>n (@)<Space>
autocmd FileType r,rmd inoremap <leader>ex (@)<Space><Enter>(@)<Space><++><Enter>(@)<Space><++><Esc>kkA

autocmd FileType r,rmd inoremap <leader>c [@]<Left>

" Multicols
autocmd FileType r,rmd inoremap <leader>mc <div<Space>class='left'><Enter><Enter></div><Enter><div<Space>class='right'><Enter><++><Enter></div><Esc>4kA
autocmd FileType r,rmd inoremap <leader>3mc <div<Space>class='first'><Enter><Enter></div><Enter><div<Space>class='second'><Enter><++><Enter></div><Enter><div class='third'><Enter><++><Enter></div><Esc>7kA

autocmd FileType r,rmd inoremap <leader>fig ![](<++>)<Esc>F[a
autocmd FileType r,rmd inoremap <leader>pic ![]()<Esc>F(a
autocmd FileType r,rmd inoremap <leader>ref [](#)<Esc>F[a

" autocmd FileType r,rmd inoremap <leader>t |<Space><++><Space>|<Space><++><Space>|<Space><++><Space>|<Space><++><Space>|<Enter>|---|---|---|---|<Enter>|<Space><++><Space>|a<Space><++><Space>|<Space><++><Space>|<Space><++><Space>|<Esc>kk0a,t

" -------------------------- r only ------------------------------------------------- "

autocmd FileType r inoremap ä {<Enter><Enter>}<Enter><++><Esc>2ki<Tab>
