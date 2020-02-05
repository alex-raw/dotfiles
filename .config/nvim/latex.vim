"""LATEX

	" Code snippets from LukeSmithxyz
	autocmd FileType tex inoremap <leader>fr \begin{frame}{}<Enter><++><Enter>\end{frame}<Enter><Enter><++><Esc>4k2f}i
	autocmd FileType tex inoremap <leader>em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap <leader>bf \textbf{}<++><Esc>T{i
	autocmd FileType tex inoremap <leader>sc \textsc{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap <leader>tt \texttt{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap <leader>ct \textcite{}<++><Esc>T{i
	autocmd FileType tex inoremap <leader>cp \parencite{}<++><Esc>T{i
	autocmd FileType tex inoremap <leader>glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
	autocmd FileType tex inoremap <leader>ex \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><++><Esc>2kA
	autocmd FileType tex inoremap <leader>ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><++><Esc>2kA\item<Space>
	autocmd FileType tex inoremap <leader>ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><++><Esc>2kA\item<Space>
	autocmd FileType tex inoremap <leader>ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap <leader>tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><++><Esc>3kA{}<Esc>i
	autocmd FileType tex inoremap <leader>chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap <leader>sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap <leader>ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap <leader>sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap <leader>beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	autocmd FileType tex inoremap <leader>col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA

	" repair
	autocmd FileType tex inoremap <leader>up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex nnoremap <leader>up /usepackage<Enter>o\usepackage{}<Esc>i

	" Alex additions
	autocmd FileType tex inoremap "" ``''<Esc>hi
	autocmd FileType tex inoremap '' `'<Esc>i
	autocmd FileType tex inoremap ... \ldots
	autocmd FileType tex inoremap ß <Space>\\<Enter>
	autocmd FileType tex inoremap <leader>ß <Space>\\~\<Enter><Enter>
	autocmd FileType tex inoremap <leader>mc \begin{multicols}{2}<Enter>\columnbreak<Enter><++><Enter>\end{multicols}<Esc>3kA<Enter>
	autocmd FileType tex inoremap <leader>3mc \begin{multicols}{3}<Enter>\columnbreak<Enter><++><Enter>\columnbreak<Enter><++><Enter>\end{multicols}<Esc>5kA<Enter>
	autocmd FileType tex inoremap <leader>pic \begin{figure}<Enter>\includegraphics[width=0.7\linewidth]{img/}<Enter>\end{figure}<Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap <leader>fig \begin{figure}<Enter>\includegraphics[width=0.7\linewidth]{img/}<Enter>\caption{<++>\label{fig:<++>}}<Enter>\end{figure}<Enter><Enter><++><Esc>4kf}i
	autocmd FileType tex inoremap <leader>des \begin{description}[leftmargin=!,labelwidth=\widthof{\bfseries <++>}]<Enter>\item[]<Enter>\item[<++>]<Enter>\item[<++>]<Enter>\end{description}<Esc>3kF]i
	autocmd FileType tex inoremap <leader>cl \textcolor{}{<++>}<++><Esc>2F{a
	autocmd FileType tex inoremap <leader>p \pause
	autocmd FileType tex nnoremap <leader>a A<Space>\pause<Esc>
	autocmd FileType tex inoremap <leader>bb \bigbreak<Enter>
	autocmd FileType tex inoremap <leader>bp \bigbreak\pause<Enter>
	autocmd FileType tex inoremap <leader>i \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap <leader>it <Enter>\item<Space>
	autocmd FileType tex nnoremap <leader>it o\item<Space>
	autocmd FileType tex inoremap <leader>or \orange{}<++><Esc>F}i
	autocmd FileType tex inoremap <leader>rd \red{}<++><Esc>F}i
	autocmd FileType tex inoremap <leader>gr \green{}<++><Esc>F}i
	autocmd FileType tex inoremap <leader>hr \href{}{<++>}<Space><++><Esc>2T{i

	" Latex Syntax
	autocmd FileType tex inoremap ö \
	autocmd FileType tex inoremap Ö {}<Esc>i
	autocmd FileType tex inoremap <leader>ö \{<++>}<Esc>T\i
	autocmd FileType tex inoremap ä ()<Esc>i

	" Go to beginning of the word to surround with emphasis
	autocmd FileType tex nnoremap <leader>bf i\textbf{<Esc>ea}<Esc>
	autocmd FileType tex nnoremap <leader>it i\textit{<Esc>ea}<Esc>
	autocmd FileType tex nnoremap <leader>sc i\textsc{<Esc>ea}<Esc>
	autocmd FileType tex nnoremap <leader>or i\orange{<Esc>ea}<Esc>
	autocmd FileType tex nnoremap <leader>rd i\red{<Esc>ea}<Esc>
	autocmd FileType tex nnoremap <leader>gr i\green{<Esc>ea}<Esc>

	" IPA stuff
	autocmd FileType tex inoremap <leader>: \textlengthmark
	autocmd FileType tex inoremap <leader>; \textprimstress
	autocmd FileType tex inoremap <leader>. \textsecstress
	autocmd FileType tex inoremap <leader>gr \textlangle{}\textrangle{}<++><Esc>2F}a

	" Toggle Answers in homework or pauses in presentations
	autocmd FileType tex nnoremap <F9> :g/Answer/norm gc}<CR>
	autocmd FileType tex nnoremap <F10> :%s/\\pause/%\\pause/g

	""".bib
	autocmd FileType bib inoremap <leader>a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap <leader>b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
	autocmd FileType bib inoremap <leader>c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap <leader>i \textit{}<++><Esc>T{i
