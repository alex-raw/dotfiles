""".r
autocmd BufEnter *.r call ncm2#enable_for_buffer()
autocmd BufEnter *.R call ncm2#enable_for_buffer()
" autocmd BufEnter *.rmd call ncm2#enable_for_buffer()
autocmd BufEnter *.rnw call ncm2#enable_for_buffer()

autocmd BufRead,BufNewFile *.r set filetype=r
autocmd BufRead,BufNewFile *.R set filetype=r
autocmd BufRead,BufNewFile *.rnw set filetype=r

autocmd FileType r inoremap ä {<Enter><Enter>}<Enter><++><Esc>2ki<Tab>
" autocmd FileType r inoremap ü {<Enter><Enter>}<Enter><++><Esc>2ki<Tab>
autocmd FileType r,rmd inoremap ,> %>%<Enter>
autocmd FileType r,rmd inoremap ,< <End><Space>%>%<Enter>
autocmd FileType r,rmd inoremap ,f function()<Space>{<Enter><++><Enter>}<Enter><Enter><++><Esc>4kf)i
autocmd FileType r,rmd inoremap ,if if()<Space>{<Enter><++><Enter>}<++><Enter><Enter><++><Esc>4ki
autocmd FileType r,rmd inoremap ,el <Space>else<Space>{<Enter><Enter>}<Esc>ki<Tab>
autocmd FileType r,rmd inoremap ,ef <Space>else<Space>if()<Space>{<Enter><++><Enter>}<++><Esc>2kf)i

autocmd FileType r inoremap <Tab> <c-n>
autocmd FileType r inoremap <S-Tab> <c-p>
autocmd FileType r,rmd inoremap ,, <Esc>/<++><Enter>"_c4l
autocmd FileType r,rmd vnoremap ,, <Esc>/<++><Enter>"_c4l
autocmd FileType r,rmd map ,, <Esc>/<++><Enter>"_c4l

autocmd FileType r map <C-h> <C-w>h
autocmd FileType r map <C-j> <C-w>j
autocmd FileType r map <C-k> <C-w>k
autocmd FileType r map <C-l> <C-w>l


autocmd BufRead,BufNewFile *.rmd set filetype=rmd
autocmd FileType rmd inoremap <Tab> <Tab>
autocmd FileType rmd inoremap <S-Tab> <S-Tab>
" autocmd FileType rmd inoremap ,t |<Space><++><Space>|<Space><++><Space>|<Space><++><Space>|<Space><++><Space>|<Enter>|---|---|---|---|<Enter>|<Space><++><Space>|a<Space><++><Space>|<Space><++><Space>|<Space><++><Space>|<Esc>kk0a,t

autocmd FileType rmd inoremap ,r ```{r,<Space>,<Space>echo=FALSE}<Enter><++><Enter>```<Esc>kk2f,i
autocmd FileType rmd inoremap ´ `r `<Left>
autocmd FileType rmd inoremap ** **<Left>
autocmd FileType rmd inoremap *** ****<++><Left><Left>
autocmd FileType rmd inoremap ,or ~~~~<++><Esc>2F~i
autocmd FileType rmd inoremap ,ins <red></red><++><Esc>2F<

autocmd FileType rmd inoremap ,n (@)<Space>
autocmd FileType rmd inoremap ,ex (@)<Space><Enter>(@)<Space><++><Enter>(@)<Space><++><Esc>kkA

autocmd FileType rmd inoremap ,c [@]<Left>

autocmd FileType rmd inoremap ,mc <div<Space>class='left'><Enter><Enter></div><Enter><div<Space>class='right'><Enter><++><Enter></div><Esc>4kA
autocmd FileType rmd inoremap ,3mc <div<Space>class='first'><Enter><Enter></div><Enter><div<Space>class='second'><Enter><++><Enter></div><Enter><div class='third'><Enter><++><Enter></div><Esc>7kA

autocmd FileType rmd inoremap ,fig ![](<++>)<Esc>F[a
autocmd FileType rmd inoremap ,pic ![]()<Esc>F(a
autocmd FileType rmd inoremap ,ref [](#)<Esc>F[a

autocmd FileType rmd inoremap ,: ː
autocmd FileType rmd inoremap ,. ˑ

autocmd FileType rmd inoremap ,( 〈
autocmd FileType rmd inoremap ,) 〉

autocmd FileType rmd inoremap ,' ˈ
autocmd FileType rmd inoremap ,, ˌ

autocmd FileType rmd inoremap ,up ʌ
autocmd FileType rmd inoremap ,ur ɜ
autocmd FileType rmd inoremap ,oi ø
autocmd FileType rmd inoremap ,ue ʏ
autocmd FileType rmd inoremap ,rr ʀ
