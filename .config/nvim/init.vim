"{{{ Plugins -------------------------------------------------------------------

	call plug#begin('~/.config/vim/plugged')
		Plug 'haya14busa/is.vim'
		Plug 'w0rp/ale'
		Plug 'tpope/vim-repeat'
		Plug 'tpope/vim-surround'
		Plug 'tpope/vim-commentary'
		Plug 'vim-scripts/ReplaceWithRegister'
		Plug 'easymotion/vim-easymotion'
		Plug 'terryma/vim-multiple-cursors'
		Plug 'scrooloose/nerdtree', { 'for': ['r', 'tex'] }
		Plug 'vimwiki/vimwiki'
		Plug 'alex-raw/vimling'
		Plug 'jiangmiao/auto-pairs'

		" Looky-looky
		Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
		Plug 'junegunn/goyo.vim'
		Plug 'junegunn/limelight.vim'
		Plug 'baskerville/vim-sxhkdrc'
		Plug 'junegunn/seoul256.vim'
		Plug 'vim-scripts/wombat256.vim'
		Plug 'jnurmine/Zenburn'

		" Tex, markdown
		Plug 'matze/vim-tex-fold'
		Plug 'vim-pandoc/vim-pandoc', { 'for': ['rmarkdown', 'markdown', 'pandoc'] }
		Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': ['rmarkdown', 'markdown', 'pandoc'] }
		Plug 'vim-pandoc/vim-rmarkdown'

		" R
		Plug 'roxma/nvim-yarp', { 'for': ['r', 'rmarkdown'] }
		Plug 'ncm2/ncm2', { 'for': ['r', 'rmarkdown']  }
		Plug 'sirver/UltiSnips', { 'for': ['r', 'rmarkdown']  }
		Plug 'ncm2/ncm2-ultisnips', { 'for': ['r', 'rmarkdown']  }
		Plug 'gaalcaras/ncm-R', { 'for': ['r', 'rmarkdown']  }
		Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'rmarkdown']  }
		Plug 'vim-scripts/argtextobj.vim'
		Plug 'chrisbra/csv.vim'

		" test/remove
		Plug 'PotatoesMaster/i3-vim-syntax' " remove?
		" Plug 'kana/vim-textobj-user' " remove?
		" Plug 'kana/vim-textobj-fold' " remove?
		" Plug 'junegunn/vim-easy-align' " remove?
		Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

	call plug#end()

"}}}
"{{{ General Settings ----------------------------------------------------------

	let mapleader ="," " swap with easymotion leader?
	let maplocalleader ="ß"
	filetype plugin on
	syntax on
	au BufEnter *(?=[^R]) lcd %:p:h " Set working directory to file opened (except R console)

	set nocompatible
	set encoding=utf-8
	set number relativenumber ruler showcmd
	set wildmode=longest,list,full
	set showcmd
	set hls is
	set splitbelow
	set splitright
	set wrap
	set linebreak
	set breakindent
	set cursorline
	set foldmethod=marker
	set iskeyword-=_

" Mouse
	set mouse=a

	function! ToggleMouse()
		if &mouse == 'a'
			set mouse=v
		else
			set mouse=a
		endif
	endfunc

	nnoremap <CR> :call ToggleMouse()<CR>

" Color Scheme and Powerline
	let g:airline_powerline_fonts = 1
	let g:airline_theme='wombat'

	colorscheme zenburn
	hi Normal ctermbg=236
	hi CursorLine ctermbg=237
	hi MatchParen ctermfg=219 ctermbg=236
	hi ColorColumn ctermbg=235
	hi Visual ctermbg=239
	hi FoldColumn ctermbg=235
	hi Folded ctermbg=235
	hi Conceal ctermbg=236
	hi Float ctermfg=116
	hi SpellBad ctermbg=236
	hi SpellCap ctermbg=236
	hi SpellRare ctermbg=236
	hi SpellLocal ctermbg=236

" Disables automatic commenting on newline:
	au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically delete trailing whitespace on save
	au BufWritePre * %s/\s\+$//e

"}}}
"{{{ Plugin Options ------------------------------------------------------------

" Easymotion
	map <Space> <Plug>(easymotion-prefix)

" Vim Wiki
	" au BufRead,BufNewFile ~/Dropbox/vimwiki/* set filetype=vimwiki
	let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
	let g:vimwiki_global_ext = 0

	au FileType vimwiki colorscheme wombat256mod
	au Filetype vimwiki setlocal nospell
	au Filetype vimwiki call Umlauts()


" Limelight and goyo
	au! User GoyoEnter Limelight
	au! User GoyoLeave Limelight!
	nnoremap <A-g> :Goyo <Enter>
	nnoremap <leader>g :Goyo <Enter>

	" Quit goyo on one :q (als fix goyo in mutt)
	function! Goyo_before()
		let b:quitting = 0
		autocmd QuitPre <buffer> let b:quitting = 1
	endfunction

	function! Goyo_after()
		" Quit Vim if this is the only remaining buffer
		if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
			qa
		endif
	endfunction

	let g:goyo_callbacks = [function('Goyo_before'), function('Goyo_after')]

" Limelight Options
	let g:limelight_conceal_ctermfg = 'gray'
	let g:limelight_conceal_ctermfg = 240
	let g:limelight_conceal_guifg = 'DarkGray'
	let g:limelight_conceal_guifg = '#777777'
	let g:limelight_default_coefficient = 0.7
	let g:limelight_paragraph_span = 0
	let g:limelight_priority = -1

	au FileType * let g:limelight_bop = '^\s'
	au FileType * let g:limelight_eop = '\ze\n^\s'

" NERDtree
	nnoremap <C-f> :NERDTreeToggle <Enter>
	au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vimling:
	nm <leader>i :call ToggleIPA()<CR>
	imap <leader>i <esc>:call ToggleIPA()<CR>a

" Ncm2
	inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
	let g:rout_follow_colorscheme = 1
	let g:Rout_more_colors = 1
	au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect,preview
	au User Ncm2PopupClose set completeopt=menuone

	" Autocompletion for bibliography files
	augroup my_cm_setup
		autocmd!
		au Filetype rmarkdown,r call ncm2#enable_for_buffer()
		au Filetype pandoc,rmarkdown call ncm2#register_source({
					\ 'name': 'pandoc',
					\ 'priority': 8,
					\ 'scope': ['pandoc','rmarkdown'],
					\ 'mark': 'md',
					\ 'word_pattern': '\w+',
					\ 'complete_pattern': ['@'],
					\ 'on_complete': ['ncm2#on_complete#omni', 'pandoc#completion#Complete'],
					\ })
	augroup END

	let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
	let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
	let g:UltiSnipsRemoveSelectModeMappings = 0

" Nvim-R
	let R_args = ['--quiet']
	let g:R_show_args = 1
	let R_start_libs = 'base,stats,graphics,grDevices,utils,methods,tidyverse,ggplot2'
	let R_objbr_place = 'script,left'
	let R_objbr_w = 23

"}}}
"{{{ Remapping keys ------------------------------------------------------------

	inoremap <S-F13> <C-n>
	inoremap <M-BS> <C-w>
	nnoremap <Backspace> :q<Return>
	nnoremap Q :q!
	nnoremap j gj
	nnoremap k gk
	nnoremap c "_c
	nnoremap C "_C
	nnoremap Y y$
	" nnoremap S

" External script
	map <leader>b :40vsp<space>~/Dropbox/latex/uni.bib<CR>
	map <leader>c :w! \| !compiler <c-r>%<CR>
	map <leader>x :w! \| !xelatex %<CR>
	map <leader>p :!opout <c-r>%<CR><CR>

" Clipboard
	nnoremap <A-c> "*y
	nnoremap <A-c> "*y
	vnoremap <A-c><A-c>  "*yy
	vnoremap <A-c><A-c>  "*yy
	nnoremap <A-v> "*p
	vnoremap <A-v> "*p
	inoremap <A-v> <C-r>*

	nnoremap <A-p> "*p
	vnoremap <A-p> "*p
	inoremap <A-p> <C-r>*

	nnoremap <A-d> "*d
	vnoremap <A-d> "*d
	nnoremap <A-d><A-d> "*dd
	vnoremap <A-d><A-d> "*dd

" Navigating with guides
	inoremap ,, <Esc>/<++><Enter>"_c4l
	vnoremap ,, <Esc>-<++><Enter>"_c4l
	map ,,  <Esc>-<++><Enter>"_c4l

" extend HJKL navigation
	nnoremap <A-h> <C-w>h
	nnoremap <A-j> <C-w>j
	nnoremap <A-k> <C-w>k
	nnoremap <A-l> <C-w>l

	nnoremap L $
	onoremap L $
	vnoremap L $

	nnoremap H ^
	onoremap H ^
	vnoremap H ^

	nnoremap K {k
	onoremap K {k
	vnoremap K {k

	nnoremap J }j
	onoremap J }j
	vnoremap J }j

	nnoremap <c-j> J
	onoremap <c-j> J
	vnoremap <c-j> J

" Spellchecking
	map <F6> :setlocal spell! spelllang=en_us<Return>
	map <F7> :setlocal spell! spelllang=de<Return>
	nnoremap ? z=
	inoremap Ü <Esc>[sz=1<Enter>A

" Delimiters
	imap ö (
	imap Ö "
	imap ä {
	imap Ä [
	imap << <><Esc>i
	imap ´ `
	inoremap ü <Right>
	inoremap <M-Space> <Right><Space>
	inoremap <C-Space> <Right>,<Space>""<left>
	inoremap <M-CR> <End><CR>

	" bring back Umlauts if necessary
	function! Umlauts()
		imap ö ö
		imap Ö Ö
		imap ä ä
		imap Ä Ä
		imap ü ü
		imap Ü Ü
		imap ß ß
	endfunction

" de-germanify
	nnoremap ö [
	onoremap ö [
	vnoremap ö [

	nnoremap Ö ]
	onoremap Ö ]
	vnoremap Ö ]

	nnoremap ä <C-o>
	onoremap ä <C-o>
	vnoremap ä <C-o>

	nnoremap Ä <C-i>
	onoremap Ä <C-i>
	vnoremap Ä <C-i>

" de-germanify
	nnoremap - /
	onoremap - /
	vnoremap - /

	nnoremap _ ?
	onoremap _ ?
	vnoremap _ ?

	nnoremap # '
	onoremap # '
	vnoremap # '

	nnoremap ' `
	onoremap ' `
	vnoremap ' `

	nnoremap + *
	onoremap + *
	vnoremap + *

	nnoremap * #
	onoremap * #
	vnoremap * #

	nnoremap < >
	onoremap < >
	vnoremap < >

	nnoremap > <
	onoremap > <
	vnoremap > <

	nnoremap m mZ
	nnoremap M `Z
	nnoremap µ m

	nnoremap ° _
	onoremap ° _

	nnoremap § +
	onoremap § +

	nnoremap $ -
	onoremap $ -

"}}}
"{{{ Work in Progress ----------------------------------------------------------

	" Map Alt-Gr keys
	nnoremap đ :vertical wincmd f<CR>
	nnoremap ſ :%s//g<left><left>
	vnoremap ſ :s//g<left><left>

	" nnoremap ü
	" onoremap ü
	" vnoremap ü

	" nnoremap Ü
	" onoremap Ü
	" vnoremap Ü

"}}}
"{{{ File-specific -------------------------------------------------------------

	" (r)markdown
	au BufRead,BufNewFile *.rmd set filetype=rmarkdown
	au FileType r,pandoc,rmarkdown,html set expandtab
	au FileType r,pandoc,rmarkdown,html set shiftwidth=2
	au FileType r,pandoc,rmarkdown source ~/.config/nvim/r.vim
	au FileType markdown,pandoc,rmarkdown setlocal commentstring=<\!--\ %s\ -->
	au FileType markdown,pandoc,rmarkdown let g:limelight_bop = '^#\s'
	au FileType markdown,pandoc,rmarkdown let g:limelight_eop = '\ze\n^#\s'
	let g:pandoc#syntax#conceal#urls = 1
	let g:pandoc#syntax#conceal#backslash = 1

	" r
	au BufRead,BufNewFile *R set filetype=r
	au FileType r set colorcolumn=81
	au FileType r inoremap <M-+> <End><Space>%>%<CR><Tab>
	au FileType r inoremap <bar> <End><Space>+<CR>
	au FileType r inoremap = <Space>=<Space>
	au FileType r inoremap != <Space>!=<Space>
	au FileType r inoremap + <Space>+<Space>
	au FileType r inoremap - <Space>-<Space>
	au FileType r inoremap * <Space>*<Space>

	" mail
	au BufRead,BufNewFile neomutt* set filetype=mail
	au FileType mail source ~/Dropbox/mail/mail.vim
	au BufEnter,BufNewFile mail setlocal spell spelllang=en_us

	" Tex
	au FileType tex,bib source ~/.config/nvim/latex.vim
	au VimLeave *.tex !texclear %

	" sxhkd
	au BufWritePost *sxhkdrc !pkill -USR1 sxhkd

"}}}
