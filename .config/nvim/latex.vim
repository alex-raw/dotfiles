"""LATEX
" Open bibliography file in split
	map <leader>b :40vsp<space>~/Dropbox/latex/uni.bib<CR>
	map <leader>c :w! \| !compiler <c-r>%<CR>
	map <leader>x :w! \| !xelatex %<CR>
	map <leader>p :!opout <c-r>%<CR><CR>
	autocmd VimLeave *.tex !texclear %

	autocmd BufRead,BufNewFile *.tex set filetype=tex
	" Word count:
	autocmd FileType tex map <leader>w :w !detex \| wc -w<CR>

	" Latex Syntax
	autocmd FileType tex inoremap ö \
	autocmd FileType tex inoremap Ö {}<Esc>i
	autocmd FileType tex inoremap ,ö \{<++>}<Esc>T\i
	autocmd FileType tex inoremap ä ()<Esc>i

	" Code snippets
	autocmd FileType tex inoremap ,fr \begin{frame}{}<Enter><++><Enter>\end{frame}<Enter><Enter><++><Esc>4k2f}i
	autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
	autocmd FileType tex inoremap ,i \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
	autocmd FileType tex inoremap ,ex \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><++><Esc>2kA
	autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><++><Esc>2kA\item<Space>
	autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><++><Esc>2kA\item<Space>
	autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><++><Esc>3kA{}<Esc>i
	autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA

	" repair
	autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i

	autocmd FileType tex inoremap ,nu $\varnothing$
	autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
	autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
	autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
	autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i

" Alex additions
	autocmd FileType tex inoremap "" ``''<Esc>hi
	autocmd FileType tex inoremap '' `'<Esc>i
	autocmd FileType tex inoremap ... \ldots
	autocmd FileType tex inoremap ß <Space>\\<Enter>
	autocmd FileType tex inoremap ,ß <Space>\\~\<Enter><Enter>
	autocmd FileType tex inoremap ,mc \begin{multicols}{2}<Enter>\columnbreak<Enter><++><Enter>\end{multicols}<Esc>3kA<Enter>
	autocmd FileType tex inoremap ,3mc \begin{multicols}{3}<Enter>\columnbreak<Enter><++><Enter>\columnbreak<Enter><++><Enter>\end{multicols}<Esc>5kA<Enter>
	autocmd FileType tex inoremap ,pic \begin{figure}<Enter>\includegraphics[width=0.7\linewidth]{img/}<Enter>\end{figure}<Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,fig \begin{figure}<Enter>\includegraphics[width=0.7\linewidth]{img/}<Enter>\caption{<++>\label{fig:<++>}}<Enter>\end{figure}<Enter><Enter><++><Esc>4kf}i
	autocmd FileType tex inoremap ,des \begin{description}[leftmargin=!,labelwidth=\widthof{\bfseries <++>}]<Enter>\item[]<Enter>\item[<++>]<Enter>\item[<++>]<Enter>\end{description}<Esc>3kF]i
	autocmd FileType tex inoremap ,cl \textcolor{}{<++>}<++><Esc>2F{a
	autocmd FileType tex inoremap ,p \pause
	autocmd FileType tex inoremap ,bb \bigbreak<Enter>
	autocmd FileType tex inoremap ,bp \bigbreak\pause<Enter>
	autocmd FileType tex inoremap ,it <Enter>\item<Space>
	autocmd FileType tex nnoremap ,it o\item<Space>

	""".bib
	autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
	autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap ,i \textit{}<++><Esc>T{i

	" IPA stuff
	" add to vimling!
	autocmd FileType tex inoremap ,: \textlengthmark
	autocmd FileType tex inoremap ,; \textprimstress
	autocmd FileType tex inoremap ,. \textsecstress
	autocmd FileType tex inoremap ,gr \textlangle{}\textrangle{}<++><Esc>2F}a

	" Toggle Answers in homework or pauses in presentations
	autocmd FileType tex nnoremap <F9> :g/Answer/norm gc}<CR>
	autocmd FileType tex nnoremap <F10> :%s/\\pause/%\\pause/g
