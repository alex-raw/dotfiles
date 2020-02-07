"""LATEX

	" Code snippets from LukeSmithxyz
	 inoremap <leader>fr \begin{frame}{}<Enter><++><Enter>\end{frame}<Enter><Enter><++><Esc>4k2f}i
	 inoremap <leader>em \emph{}<++><Esc>T{i
	 inoremap <leader>bf \textbf{}<++><Esc>T{i
	 inoremap <leader>sc \textsc{}<Space><++><Esc>T{i
	 inoremap <leader>tt \texttt{}<Space><++><Esc>T{i
	 inoremap <leader>ct \textcite{}<++><Esc>T{i
	 inoremap <leader>cp \parencite{}<++><Esc>T{i
	 inoremap <leader>glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
	 inoremap <leader>ex \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><++><Esc>2kA
	 inoremap <leader>ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><++><Esc>2kA\item<Space>
	 inoremap <leader>ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><++><Esc>2kA\item<Space>
	 inoremap <leader>ref \ref{}<Space><++><Esc>T{i
	 inoremap <leader>tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><++><Esc>3kA{}<Esc>i
	 inoremap <leader>chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	 inoremap <leader>sec \section{}<Enter><Enter><++><Esc>2kf}i
	 inoremap <leader>ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	 inoremap <leader>sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	 inoremap <leader>beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	 inoremap <leader>col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA

	" repair
	 inoremap <leader>up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	 nnoremap <leader>up /usepackage<Enter>o\usepackage{}<Esc>i

	" Alex additions
	 inoremap "" ``''<Esc>hi
	 inoremap '' `'<Esc>i
	 inoremap ... \ldots
	 inoremap ß <Space>\\<Enter>
	 inoremap <leader>ß <Space>\\~\<Enter><Enter>
	 inoremap <leader>mc \begin{multicols}{2}<Enter>\columnbreak<Enter><++><Enter>\end{multicols}<Esc>3kA<Enter>
	 inoremap <leader>3mc \begin{multicols}{3}<Enter>\columnbreak<Enter><++><Enter>\columnbreak<Enter><++><Enter>\end{multicols}<Esc>5kA<Enter>
	 inoremap <leader>pic \begin{figure}<Enter>\includegraphics[width=0.7\linewidth]{img/}<Enter>\end{figure}<Enter><++><Esc>2kf}i
	 inoremap <leader>fig \begin{figure}<Enter>\includegraphics[width=0.7\linewidth]{img/}<Enter>\caption{<++>\label{fig:<++>}}<Enter>\end{figure}<Enter><Enter><++><Esc>4kf}i
	 inoremap <leader>des \begin{description}[leftmargin=!,labelwidth=\widthof{\bfseries <++>}]<Enter>\item[]<Enter>\item[<++>]<Enter>\item[<++>]<Enter>\end{description}<Esc>3kF]i
	 inoremap <leader>cl \textcolor{}{<++>}<++><Esc>2F{a
	 inoremap <leader>p \pause
	 nnoremap <leader>a A<Space>\pause<Esc>
	 inoremap <leader>bb \bigbreak<Enter>
	 inoremap <leader>bp \bigbreak\pause<Enter>
	 inoremap <leader>i \textit{}<++><Esc>T{i
	 inoremap <leader>it <Enter>\item<Space>
	 nnoremap <leader>it o\item<Space>
	 inoremap <leader>or \orange{}<++><Esc>F}i
	 inoremap <leader>rd \red{}<++><Esc>F}i
	 inoremap <leader>gr \green{}<++><Esc>F}i
	 inoremap <leader>hr \href{}{<++>}<Space><++><Esc>2T{i

	" Latex Syntax
	 inoremap ö \
	 inoremap Ö {}<Esc>i
	 inoremap <leader>ö \{<++>}<Esc>T\i
	 inoremap ä ()<Esc>i

	" Go to beginning of the word to surround with emphasis
	 nnoremap <leader>bf i\textbf{<Esc>ea}<Esc>
	 nnoremap <leader>it i\textit{<Esc>ea}<Esc>
	 nnoremap <leader>sc i\textsc{<Esc>ea}<Esc>
	 nnoremap <leader>or i\orange{<Esc>ea}<Esc>
	 nnoremap <leader>rd i\red{<Esc>ea}<Esc>
	 nnoremap <leader>gr i\green{<Esc>ea}<Esc>

	" IPA stuff
	 inoremap <leader>: \textlengthmark
	 inoremap <leader>; \textprimstress
	 inoremap <leader>. \textsecstress
	 inoremap <leader>gr \textlangle{}\textrangle{}<++><Esc>2F}a

	" Toggle Answers in homework or pauses in presentations
	 nnoremap <F9> :g/Answer/norm gc}<CR>
	 nnoremap <F10> :%s/\\pause/%\\pause/g

	""".bib
	inoremap <leader>ba @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	inoremap <leader>bb @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
	inoremap <leader>bc @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
