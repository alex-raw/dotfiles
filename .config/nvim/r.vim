" rmarkdown snippets
" r
inoremap <leader>> %>%<Enter>
inoremap <leader>< <End><Space>%>%<Enter>
inoremap <leader>f function()<Space>{<Enter><++><Enter>}<Enter><Enter><++><Esc>4kf)i
inoremap <leader>l library("")<Left><Left>
inoremap <leader>if if()<Space>{<Enter><++><Enter>}<++><Enter><Enter><++><Esc>4ki
inoremap <leader>el <Space>else<Space>{<Enter><Enter>}<Esc>ki<Tab>
inoremap <leader>ef <Space>else<Space>if()<Space>{<Enter><++><Enter>}<++><Esc>2kf)i

" rmarkdown
inoremap <leader>r ```{r,<Space>,<Space>echo=FALSE}<Enter><++><Enter>```<Esc>kk2f,i
inoremap ´ `r `<Left>

inoremap ** **<Left>
inoremap *** ****<++><Left><Left>
inoremap <leader>or ~~~~<++><Esc>2F~i

inoremap <leader>n (@)<Space>
inoremap <leader>ex (@)<Space><Enter>(@)<Space><++><Enter>(@)<Space><++><Esc>kkA
inoremap <leader>c [@]<Left>
inoremap <leader>fig ![](<++>)<Esc>F[a
inoremap <leader>pic ![]()<Esc>F(a
inoremap <leader>ref [](#)<Esc>F[a

inoremap <leader>ins <red></red><++><Esc>2F<

" Multicols
inoremap <leader>mc <div<Space>class='left'><Enter><Enter></div><Enter><div<Space>class='right'><Enter><++><Enter></div><Esc>4kA
inoremap <leader>3mc <div<Space>class='first'><Enter><Enter></div><Enter><div<Space>class='second'><Enter><++><Enter></div><Enter><div class='third'><Enter><++><Enter></div><Esc>7kA

" Table template
inoremap <leader>t <bar><Space><Space><bar><Space><++><Space><bar><Space><++><Space><bar><Space><++><Space><bar><Enter><bar>---<bar>---<bar>---<bar>---<bar><Enter><bar><Space><++><Space><bar><Space><++><Space><bar><Space><++><Space><bar><Space><++><Space><bar><Esc>kk0la
