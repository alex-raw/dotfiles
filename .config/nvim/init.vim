"{{{ Plugins -------------------------------------------------------------------

call plug#begin('~/.config/vim/plugged')
Plug 'haya14busa/is.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree', { 'for': ['r', 'tex', 'rmarkdown', 'pandoc'] }
Plug 'vimwiki/vimwiki'
Plug 'alex-raw/vimling'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'

" Looky-looky
Plug 'itchyny/lightline.vim'
Plug 'junegunn/seoul256.vim'
Plug 'jnurmine/Zenburn'
Plug 'jacoborus/tender.vim'
Plug 'mhartington/oceanic-next'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'baskerville/vim-sxhkdrc'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Tex, markdown, html
Plug 'matze/vim-tex-fold'
Plug 'vim-pandoc/vim-pandoc', { 'for': ['rmarkdown', 'markdown', 'pandoc'] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': ['rmarkdown', 'markdown', 'pandoc'] }
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'junegunn/vim-easy-align'

" R
Plug 'roxma/nvim-yarp', { 'for': ['r', 'rmarkdown'] }
Plug 'ncm2/ncm2', { 'for': ['r', 'rmarkdown']  }
Plug 'gaalcaras/ncm-R', { 'for': ['r', 'rmarkdown']  }
Plug 'sirver/UltiSnips'
Plug 'ncm2/ncm2-ultisnips', { 'for': ['r', 'rmarkdown']  }
Plug 'honza/vim-snippets'
Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'rmarkdown']  }
Plug 'vim-scripts/argtextobj.vim'

" test/remove
" Plug 'chrisbra/csv.vim' " remove?
" Plug 'honza/vim-snippets' " remove?
" Plug 'PotatoesMaster/i3-vim-syntax' " remove?
" Plug 'junegunn/vim-easy-align' " remove?
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" Plug 'vim-scripts/ReplaceWithRegister' " remove?
" Plug 'easymotion/vim-easymotion' " remove?

call plug#end()

"}}}
"{{{ General Settings ----------------------------------------------------------

	autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set filetype=sh | endif
	let mapleader ="," " swap with easymotion leader?
	let maplocalleader ="ö"
	filetype plugin on
	syntax on
	au BufEnter *.\(r\|R\|rmd\|Rmd\) lcd %:p:h " Set working directory to file opened (except R console)

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
	set termguicolors

" Disables automatic commenting on newline:
	au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically delete trailing whitespace on save
	au BufWritePre * %s/\s\+$//e

"}}}
" Colors {{{
" Color Scheme and Powerline
	let g:zenburn_alternate_Visual = 1
	colorscheme zenburn
	au FileType r colorscheme seoul256

	" au FileType sh colorscheme tender
	hi Normal 		ctermbg=236 guibg=#3f3f3f
	hi Conceal 		ctermbg=236 guibg=#3f3f3f
	hi SpellBad 		ctermbg=236 guibg=#3f3f3f
	hi SpellCap 		ctermbg=236 guibg=#3f3f3f
	hi SpellRare 		ctermbg=236 guibg=#3f3f3f
	hi SpellLocal 		ctermbg=236 guibg=#3f3f3f
	hi MatchParen 		ctermbg=236 ctermfg=219 guibg=#3f3f3f guifg=#ffafff
	hi FoldColumn 		ctermbg=235 guibg=#262626
	hi Folded 		ctermbg=235 guibg=#262626
	hi ColorColumn 		ctermbg=235 guibg=#3b3b3b
	hi CursorLine 		ctermbg=237 guibg=#3b3b3b
	" hi Visual 		ctermbg=239 guibg=#4e4e4e
	hi pandocEmphasis 	ctermfg=116 guifg=#87d7d7
	hi pandocBlockQuote 	ctermfg=150 guifg=#afd787
	" hi Float 		ctermfg=116

	let g:seoul256_srgb = 1
	au FileType r,R colorscheme seoul256
	au FileType r,R hi SignColumn 	guibg=#3a3a3a
	au FileType r,R hi MatchParen 	ctermfg=219 ctermbg=237 guifg=#ffafff    guibg=#3a3a3a
	au FileType r,R hi VertSplit 	ctermfg=237 ctermbg=240 guifg=#3a3a3a	 guibg=#585858
	au FileType r,R hi LineNr 	ctermfg=239 ctermbg=237 guifg=#585858	 guibg=#3a3a3a
	au FileType r,R hi Todo 	gui=italic  ctermbg=237 guibg=#3a3a3a
	au FileType r,R hi Folded 	gui=bold    ctermbg=237 guibg=#3a3a3a
	au FileType r,R hi CursorColumn	            ctermbg=237 guibg=#3a3a3a
	au FileType pandoc,html,tex hi Comment ctermfg=245 guifg=#8a8a8a
	au FileType r,pandoc,rmarkdown,html,tex hi Comment gui=italic

	au FileType r,R hi margrittr ctermfg=242 guifg=#808080
	au FileType r,R hi CursorLine            guibg=#363636
	au FileType r,R syntax match margrittr "%>%"

	au FileType vimwiki colorscheme tender
	au FileType vimwiki highlight Conceal guibg=Default
	" au FileType vimwiki syntax match Entity "^#" conceal cchar=§
	au Filetype vimwiki hi VimwikiHeader2 gui=bold ctermfg=78  cterm=bold guifg=#5fd787
	au Filetype vimwiki hi VimwikiHeader3 gui=bold ctermfg=219 cterm=bold guifg=#ff8787
	au Filetype vimwiki hi VimwikiHeader4 gui=bold ctermfg=210 cterm=bold guifg=#ffafff
	au Filetype vimwiki hi VimwikiHeader5 gui=bold ctermfg=193 cterm=bold guifg=#d7ffaf

" }}} Colors "
"{{{ Plugin Options ------------------------------------------------------------
let g:lightline = { 'colorscheme': 'seoul256', }
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Hexokinase
	let g:Hexokinase_highlighters = ['backgroundfull']
	let g:Hexokinase_refreshEvents = ['TextChanged', 'InsertLeave']

" Vim Wiki
	" au BufRead,BufNewFile ~/Dropbox/vimwiki/* set filetype=vimwiki
	let g:vimwiki_list = [{'path': '~/Nextcloud/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
	let g:vimwiki_global_ext = 0


" Limelight and goyo
	au! User GoyoEnter Limelight
	au! User GoyoLeave Limelight!

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

" NERDtree
	au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Ncm2
	inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
	let g:rout_follow_colorscheme = 1
	let g:Rout_more_colors = 1
	au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect,preview
	au User Ncm2PopupClose set completeopt=menuone

	" Autocompletion from bibliography files
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

" Nvim-R
	let R_args = ['--quiet']
	let g:R_show_args = 1
	let R_start_libs = 'base,stats,graphics,grDevices,utils,methods,tidyverse'
	let R_objbr_place = 'script,left'
	let R_objbr_w = 32
	let R_assign_map = '<M-->'
	let R_hi_fun_paren = 1 "slow?
	let rrst_syn_hl_chunk = 1
   	let rmd_syn_hl_chunk = 1

"}}}
" Mouse and Plugin mappings {{{
	" Mouse options
	set mouse=a

	nnoremap <LeftMouse> m'<LeftMouse>
	nnoremap <RightMouse> <M-RightMouse>
	nnoremap <C-RightMouse> <LeftMouse>za
	nnoremap <M-RightMouse> <RightMouse>
	au Filetype vimwiki nnoremap <C-LeftMouse> <LeftMouse>:VimwikiFollowLink<CR>

	" Plugin
	nm <leader>i :call ToggleIPA()<CR>
	imap <leader>i <esc>:call ToggleIPA()<CR>a
	nnoremap <C-f> :NERDTreeToggle <Enter>
	nnoremap <A-g> :Goyo <Enter>

	" Ultisnips
	let g:UltiSnipsJumpForwardTrigger	= "<Tab>"
	let g:UltiSnipsJumpBackwardTrigger	= "<S-Tab>"
	let g:UltiSnipsRemoveSelectModeMappings = 0
	let g:UltiSnipsExpandTrigger		= "<Tab>"
	let g:UltiSnipsEditSplit		= "vertical"

" }}} Mouse and Plugin mappings
"{{{ Remapping keys ------------------------------------------------------------

" General
	" inoremap <M-CR>
	inoremap <S-F13> <C-n>
	inoremap <M-BS> <C-w>
	nnoremap <Backspace> :q<CR>
	nnoremap Q :q!
	nnoremap j gj
	nnoremap k gk
	nnoremap c "_c
	nnoremap C "_C
	nnoremap Y y$
	nnoremap <C-o> o<CR><CR><Up>
	" nnoremap S

	" <count> numbered list
	nnoremap <leader>n o0.<Space><++><Esc>v?\(^0\..*\n\)\@<!0\.<CR>g<C-a>$ciW

" External script
	map <leader>b :40vsp<space>~/Dropbox/latex/uni.bib<CR>
	map <leader>c :w! \| !compiler <c-r>%<CR>
	map <leader>x :w! \| !xelatex %<CR>
	map <leader>p :!opout <c-r>%<CR><CR>

" Clipboard
	nnoremap <A-c> "*y
	nnoremap <A-c> "*y
	vnoremap <A-c><A-c> "*yy
	vnoremap <A-c><A-c> "*yy
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

	nnoremap <C-h> :tabnext<CR>
	nnoremap <C-l> :tabprev<CR>

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
	imap ´ `
	inoremap ü <Right>
	inoremap <M-Space> <Right><Space>
	inoremap <C-Space> <Right>,<Space>""<left>

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
	nnoremap ä <C-o>
	onoremap ä <C-o>
	vnoremap ä <C-o>

	nnoremap Ä <C-i>
	onoremap Ä <C-i>
	vnoremap Ä <C-i>

	nnoremap ü [
	onoremap ü [
	vnoremap ü [

	nnoremap Ü ]
	onoremap Ü ]
	vnoremap Ü ]

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

" nnoremap <CR>

" Map Alt-Gr keys
" f
nnoremap đ :vertical wincmd f<CR>
" s
nnoremap ſ :%s//g<left><left>
vnoremap ſ :s//g<left><left>

" update tags file and highlighting
" t
nnoremap ŧ :w \| !ctags<Space>-R<CR>:UpdateTypesFile<CR>
" b
nmap “ ysiw)
" c
nmap ¢ ysiw"
" r
nmap ¶ :so ~/.config/nvim/init.vim<CR>

"}}}
"{{{ File-specific -------------------------------------------------------------

	" mail
	au BufRead,BufNewFile neomutt* set filetype=mail
	au FileType mail source ~/Dropbox/mail/mail.vim
	au BufEnter,BufNewFile mail setlocal spell spelllang=en_us

	" Tex
	au BufRead,BufNewFile *.tex set filetype=tex
	au FileType tex,bib source ~/.config/nvim/latex.vim
	au VimLeave *.tex !texclear %

	" (r)markdown
	au BufRead,BufNewFile *.rmd set filetype=rmarkdown
	au FileType markdown,pandoc,rmarkdown setlocal commentstring=<\!--\ %s\ -->
	au FileType markdown,pandoc,rmarkdown let g:limelight_bop = '^#\s'
	au FileType markdown,pandoc,rmarkdown let g:limelight_eop = '\ze\n^#\s'
	let g:pandoc#syntax#conceal#urls = 1
	let g:pandoc#syntax#conceal#backslash = 1
	let g:closetag_filetypes = 'rmarkdown'

	au FileType pandoc,rmarkdown,markdown let g:AutoPairs['*']='*'
	au FileType pandoc,rmarkdown,markdown let g:AutoPairs['**']='**'
	au FileType pandoc,rmarkdown,markdown nnoremap æ mPvip:EasyAlign<Space>*\|<CR>`P

	" r
	au BufRead,BufNewFile *R set filetype=r
	au FileType r,pandoc,html set expandtab
	au FileType r,pandoc,html set shiftwidth=2

	au FileType r,rmarkdown inoremap <M-+> <End><Space>+<CR>
	au FileType r inoremap <bar> %>%
	au FileType r,rmarkdown inoremap ´ `r `<Left>
	au FileType r,rmarkdown inoremap <leader>c [@]<Left>
	au FileType r,rmarkdown nnoremap <leader>d diwmP%mp%x`px`P
	au FileType r nnoremap <leader>r :tabnew %:r\.Rmd<CR>
	au FileType rmarkdown nnoremap <leader>r :tabnew %:r\.R<CR>

	" open full r workspace
	au FileType r,rmarkdown nnoremap <F9> :call StartR("R") <bar>
			\ sleep 3 <bar>
	 		\ call RObjBrowser()<CR>

	au FileType rmarkdown inoremap <leader>ex <CR>(@)<Space>
	au FileType rmarkdown nnoremap <leader>ex o(@) <++><Esc>?\(^(@).*\n\)\@<!(@)<CR>$ciW

	" various
	au BufWritePost *sxhkdrc !pkill -USR1 sxhkd
	au FileType vim let g:AutoPairs['<']='>'
	au Filetype vimwiki setlocal nospell
	au Filetype vimwiki set nowrap
	au Filetype vimwiki call Umlauts()
	au BufEnter *toml set ft=yaml

"}}}
