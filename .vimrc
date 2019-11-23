" Plugins
	call plug#begin('~/.config/vim/plugged')
		Plug 'haya14busa/is.vim'
		Plug 'tpope/vim-repeat'
		Plug 'tpope/vim-surround'
		Plug 'tpope/vim-commentary'
		Plug 'vim-scripts/ReplaceWithRegister'

		Plug 'LukeSmithxyz/vimling'

		Plug 'scrooloose/nerdtree'
		Plug 'severin-lemaignan/vim-minimap'

		Plug 'PotatoesMaster/i3-vim-syntax'
		Plug 'vim-airline/vim-airline'
		Plug 'junegunn/goyo.vim'
		Plug 'junegunn/limelight.vim'
		Plug 'junegunn/seoul256.vim'

		Plug 'wellle/targets.vim'

		Plug 'easymotion/vim-easymotion'
		Plug 'kana/vim-textobj-user'
		Plug 'kana/vim-textobj-line'
		Plug 'glts/vim-textobj-comment'
		Plug 'michaeljsmith/vim-indent-object'
		Plug 'Julian/vim-textobj-brace'

		Plug 'rbonvall/vim-textobj-latex'
		Plug 'matze/vim-tex-fold'

		Plug 'terryma/vim-multiple-cursors'
	call plug#end()

" Settings
	let mapleader =","
	filetype plugin on
	syntax on
	autocmd BufEnter * lcd %:p:h " Set working directory to file opened
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

" Color Scheme
	" colo seoul256
	" hi Normal guifg=#44cc44 guibg=NONE ctermbg=none
	colorscheme zenburn

" Limelight and goyo
	autocmd! User GoyoEnter Limelight
	autocmd! User GoyoLeave Limelight!
	nnoremap <A-g> :Goyo <Enter>

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically delete trailing whitespace on save
	autocmd BufWritePre * %s/\s\+$//e

" Limelight Options
	let g:limelight_conceal_ctermfg = 'gray'
	let g:limelight_conceal_ctermfg = 240
	let g:limelight_conceal_guifg = 'DarkGray'
	let g:limelight_conceal_guifg = '#777777'
	" Default: 0.5
	let g:limelight_default_coefficient = 0.7
	let g:limelight_paragraph_span = 0
	let g:limelight_bop = '^\s'
	let g:limelight_eop = '\ze\n^\s'
	let g:limelight_priority = -1

" vimling:
	nm <leader>d :call ToggleDeadKeys()<CR>
	imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader>i :call ToggleIPA()<CR>
	imap <leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader>q :call ToggleProse()<CR>

" Remapping keys
	map <Space> <Plug>(easymotion-prefix)
	nnoremap <Backspace> :q<Return>
	nmap <CR> o<Esc>
	nnoremap j gj
	nnoremap k gk

" swap remaps
	nnoremap <silent> gw daWea<Space><Esc>pxh
	nnoremap <silent> gW daWbPh
	nnoremap gü {dap}P{
	nnoremap gp {dap}P{

" NERDtree
	nnoremap <C-f> :NERDTreeToggle <Enter>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Navigating with guides
	inoremap <Tab> <Esc>/<++><Enter>"_c4l
	vnoremap <Tab> <Esc>-<++><Enter>"_c4l
	map <Tab> <Esc>-<++><Enter>"_c4l

	vnoremap <S-Tab> <Esc>_<++><Enter>"_c4l
	map <S-Tab> <Esc>_<++><Enter>"_c4l
	inoremap <S-Tab> <++>

	inoremap ß <Tab>

	nnoremap <C-o> <C-o>zz

" de-germanify
	nnoremap - /
	onoremap - /
	vnoremap - /

	nnoremap _ ?
	onoremap _ ?
	vnoremap _ ?

	nnoremap / _
	onoremap / _
	vnoremap / _

	nnoremap ö }
	onoremap ö }
	vnoremap ö }

	nnoremap Ö {
	onoremap Ö {
	vnoremap Ö {

	nnoremap ü $
	onoremap ü $
	vnoremap ü $

	nnoremap Ü ^
	onoremap Ü ^
	vnoremap Ü ^

	nnoremap ä `
	onoremap ä `
	vnoremap ä `

	nnoremap Ä [
	onoremap Ä [
	vnoremap Ä [

	nnoremap # '
	onoremap # '
	vnoremap # '

	nnoremap ' ]
	onoremap ' ]
	vnoremap ' ]

	nnoremap + *
	onoremap + *

	nnoremap * #
	onoremap * #

	nnoremap < >
	nnoremap > <
	onoremap < >
	onoremap > <
	vnoremap < >
	vnoremap > <

	nnoremap m mZ
	nnoremap M `Z
	nnoremap µ m

	nnoremap ^ ~
	vnoremap ^ ~

" Unmapped
	" nnoremap <c-ö>
	" nnoremap <c-ä>
	" nnoreap <c-ü>
	" nnoremap ´
	" nnoremap `
	" nnoremap °
	" nnoremap §
	" nnoremap ?
	" nnoremap $
	" nnoremap H
	" nnoremap L
	" nnoremap ß
	""" remap K

	inoremap ö ()<Esc>i
	inoremap Ö ""<Esc>i
	inoremap ä {}<Esc>i
	inoremap Ä []<Esc>i
	inoremap ü <Right><Space>
	inoremap Ü <Right>.

	inoremap << <><Esc>i
	inoremap '' ''<Esc>i

" Copy paste from clipboard
	nnoremap <A-c> "+y
	nnoremap <A-v> "+p

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Scripts
	map <leader>b :40vsp<space>~/Dropbox/latex/uni.bib<CR>
	map <leader>c :w! \| !compiler <c-r>%<CR>
	map <leader>x :w! \| !xelatex %<CR>
	map <leader>p :!opout <c-r>%<CR><CR>
	autocmd VimLeave *.tex !texclear %



source ~/.config/nvim/latex.vim
source ~/.config/nvim/r.vim
source ~/.config/nvim/mail.vim
