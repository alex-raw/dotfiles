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
		Plug 'scrooloose/nerdtree'
		Plug 'vimwiki/vimwiki'
		Plug 'vim-scripts/argtextobj.vim'

		" Looky-looky
		Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
		Plug 'junegunn/goyo.vim'
		Plug 'junegunn/limelight.vim'
		Plug 'PotatoesMaster/i3-vim-syntax'
		Plug 'baskerville/vim-sxhkdrc'
		Plug 'junegunn/seoul256.vim'
		Plug 'vim-scripts/wombat256.vim'
		Plug 'jnurmine/Zenburn'

		" Tex, markdown
		Plug 'matze/vim-tex-fold'
		Plug 'vim-pandoc/vim-pandoc'
		Plug 'vim-pandoc/vim-pandoc-syntax'
		Plug 'vim-pandoc/vim-rmarkdown'
		Plug 'kana/vim-textobj-user'
		Plug 'kana/vim-textobj-fold'

		" R
		Plug 'roxma/nvim-yarp'
		Plug 'ncm2/ncm2'
		Plug 'sirver/UltiSnips'
		Plug 'ncm2/ncm2-ultisnips'
		Plug 'gaalcaras/ncm-R'
		Plug 'jalvesaq/Nvim-R'

		" test/remove
		Plug 'junegunn/vim-easy-align' " remove?
		Plug 'alex-raw/vimling'
		Plug 'chrisbra/csv.vim'
		Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

	call plug#end()

"}}}
"{{{ General Settings ----------------------------------------------------------

	let mapleader ="," " swap with easymotion leader?
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

" Spellchecking
	map <F6> :setlocal spell! spelllang=en_us<Return>
	map <F7> :setlocal spell! spelllang=de<Return>

	au Filetype mail,pandoc setlocal spell
	au Filetype vimwiki setlocal nospell

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
	let g:airline_theme='zenburn'
	let g:zenburn_high_Contrast=0

	colorscheme zenburn
	hi Normal ctermbg=236
	hi CursorLine ctermbg=237
	hi ColorColumn ctermbg=235
	hi Visual ctermbg=239
	hi FoldColumn ctermbg=235
	hi Folded ctermbg=235
	hi Conceal ctermbg=236
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
	" let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
	let g:vimwiki_global_ext = 0

	au FileType vimwiki colorscheme wombat256mod

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
	au BufEnter * call ncm2#enable_for_buffer()
	au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect,preview
	au User Ncm2PopupClose set completeopt=menuone

	" Autocompletion for bibliography files
	augroup my_cm_setup
		autocmd!
		au BufEnter * call ncm2#enable_for_buffer()
		au Filetype pandoc call ncm2#register_source({
					\ 'name': 'pandoc',
					\ 'priority': 8,
					\ 'scope': ['pandoc'],
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

"}}}
"{{{ Remapping keys ------------------------------------------------------------

	inoremap <S-F13> <C-n>
	nnoremap <Backspace> :q<Return>
	nnoremap Q :q!
	nnoremap j gj
	nnoremap k gk
	nnoremap c "_c
	nnoremap C "_C
	nnoremap Y y$

" External script
	map <leader>b :40vsp<space>~/Dropbox/latex/uni.bib<CR>
	map <leader>c :w! \| !compiler <c-r>%<CR>
	map <leader>x :w! \| !xelatex %<CR>
	map <leader>p :!opout <c-r>%<CR><CR>
	au VimLeave *.tex !texclear %
	au BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Clipboard
	nnoremap <A-c> "*y
	vnoremap <A-c> "*y
	nnoremap <A-v> "*p
	vnoremap <A-v> "*p
	inoremap <A-v> <C-r>*

	nnoremap <A-p> "*p
	vnoremap <A-p> "*p
	inoremap <A-p> <C-r>*

	nnoremap <A-d> "*d
	onoremap <A-d> "*d
	vnoremap <A-d> "*d
	nnoremap <A-d><A-d> "*dd
	onoremap <A-d><A-d> "*dd
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

	nnoremap K {
	onoremap K {
	vnoremap K {

	nnoremap J }
	onoremap J }
	vnoremap J }

	nnoremap <c-j> J
	onoremap <c-j> J
	vnoremap <c-j> J

" de-germanify
	nnoremap - /
	onoremap - /
	vnoremap - /

	nnoremap _ ?
	onoremap _ ?
	vnoremap _ ?

	nnoremap ö <C-o>
	onoremap ö <C-o>
	vnoremap ö <C-o>

	nnoremap Ö <C-i>
	onoremap Ö <C-i>
	vnoremap Ö <C-i>

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

" Spellchecking
	nnoremap ü [s
	onoremap ü [s
	vnoremap ü [s

	nnoremap Ü ]s
	onoremap Ü ]s
	vnoremap Ü ]s

	inoremap Ü <Esc>[sz=1<Enter>A

	nnoremap ß z=1<CR><Enter>
	nnoremap ? z=

" Delimiters
	inoremap ö ""<Esc>i
	inoremap Ö ()<Esc>i
	inoremap ä {}<Esc>i
	inoremap Ä []<Esc>i

	inoremap << <><Esc>i
	inoremap '' ''<Esc>i
	inoremap ´ ``<Esc>i

	inoremap ü <Right>

"}}}
"{{{ Work in Progress ----------------------------------------------------------

	" Map Alt-Gr keys
	nnoremap đ :vertical wincmd f<CR>
	nnoremap ſ :%s//g<left><left>
	vnoremap ſ :s//g<left><left>

	" umgewöhnen zu original ~ !!
	nnoremap ^ ~
	onoremap ^ ~
	vnoremap ^ ~

	nnoremap ä @
	onoremap ä @
	vnoremap ä @

	" nnoremap Ä
	" onoremap Ä
	" vnoremap Ä

	" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"}}}
"{{{ File-specific -------------------------------------------------------------

	au BufRead,BufNewFile *.rmd set filetype=rmarkdown
	au BufRead,BufNewFile *R set filetype=R

	" r
	au FileType r set colorcolumn=81
	au FileType r,pandoc,rmarkdown,html set tabstop=2
	au FileType r,pandoc,rmarkdown,html set expandtab

	" (r)markdown
	au FileType markdown,pandoc,rmarkdown setlocal commentstring=<\!--\ %s\ -->
	au FileType markdown,pandoc,rmarkdown let g:limelight_bop = '^#\s'
	au FileType markdown,pandoc,rmarkdown let g:limelight_eop = '\ze\n^#\s'
	let g:pandoc#syntax#conceal#urls = 1
	let g:pandoc#syntax#conceal#backslash = 1

	" mail
	au BufRead,BufNewFile neomutt* set filetype=mail
	au BufEnter,BufNewFile mail setlocal spell spelllang=en_us

	" Snippets
	au FileType r,R,pandoc,rmarkdown source ~/.config/nvim/r.vim
	au FileType tex,bib source ~/.config/nvim/latex.vim
	au FileType mail source ~/Dropbox/mail/mail.vim

"}}}
