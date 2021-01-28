"{{{1 Plugins

call plug#begin('~/.config/vim/plugged')

" Essentials
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'dense-analysis/ale'

" Looky-looky
Plug 'haya14busa/incsearch.vim'
Plug 'romainl/vim-cool'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'baskerville/vim-sxhkdrc'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'ayu-theme/ayu-vim'
Plug 'ayu-theme/ayu-vim-airline'
" Plug 'Kjwon15/vim-transparent'

" Tex, markdown, html
Plug 'masukomi/vim-markdown-folding'
Plug 'alex-raw/vimling'
Plug 'soywod/phonetics.vim'

" R
Plug 'roxma/nvim-yarp', { 'for': ['r', 'R','rmarkdown'] }
Plug 'ncm2/ncm2', { 'for': ['r', 'R','rmarkdown']  }
Plug 'gaalcaras/ncm-R', { 'for': ['r', 'R', 'rmarkdown']  }
Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'R', 'rmarkdown']  }
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'ncm2/ncm2-ultisnips', { 'for': ['r', 'R', 'rmarkdown']  }

" Rmarkdown syntax highlighting overkill
Plug 'vim-pandoc/vim-pandoc', { 'for': ['rmarkdown', 'markdown', 'pandoc'] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': ['rmarkdown', 'markdown', 'pandoc'] }
Plug 'vim-pandoc/vim-rmarkdown'

" Julia stuff
Plug 'JuliaEditorSupport/julia-vim'
Plug 'kassio/neoterm'

" More objects and motions
Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'

Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'kana/vim-textobj-line'
Plug 'ctholho/vim-textobj-sentence'
Plug 'julian/vim-textobj-variable-segment' " div civ...
Plug 'adolenc/vim-textobj-toplevel'        " diT ciT...
Plug 'mattn/vim-textobj-url'               " diu ciu...
Plug 'adriaanzon/vim-textobj-matchit'      " dim cim...
Plug 'beloglazov/vim-textobj-quotes'       " diq ciq...

" Remove?
" Plug 'mhinz/vim-startify'
Plug 'matze/vim-tex-fold'
Plug 'kana/vim-textobj-function'           " dif cif...
" Plug 'julian/vim-textobj-brace'          " dij cij...
" Plug 'junegunn/vim-easy-align'
" Plug 'coachshea/vim-textobj-markdown'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(1) } }

call plug#end()

"{{{1 General Settings

autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set filetype=sh | endif
autocmd BufWinEnter,WinEnter term://* startinsert
filetype plugin on
syntax on
au BufRead,BufNewFile *.\(r\|R\|rmd\|Rmd\) lcd %:p:h " Set working directory to file opened (except R console)

set nocompatible
set encoding=utf-8
set number
set relativenumber
set showcmd
set wildmode=longest,list,full
set hls is
set splitbelow
set splitright
set wrap
set linebreak
set breakindent
set cursorline
set foldmethod=marker
set termguicolors
set clipboard=unnamedplus
set expandtab
set shiftwidth=2
set iskeyword+=-
set scrolloff=8
set signcolumn=yes
" set complete+=kspell

" Disables automatic commenting on newline:
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically delete trailing whitespace on save
au BufWritePre * %s/\s\+$//e

" Colors {{{1
" Color Scheme and Powerline
" colorscheme zenburn
" let g:zenburn_alternate_Visual = 1

" let g:seoul256_srgb = 1
" colorscheme seoul256
" au FileType sh colorscheme tender
" au FileType sh hi SignColumn guibg=#282828

" au FileType sh colorscheme tender
" hi Normal 		ctermbg=236 guibg=#3f3f3f
" hi Conceal 		ctermbg=236 guibg=#3f3f3f
" hi SpellBad 		ctermbg=236 guibg=#3f3f3f
" hi SpellCap 		ctermbg=236 guibg=#3f3f3f
" hi SpellRare 		ctermbg=236 guibg=#3f3f3f
" hi SpellLocal 		ctermbg=236 guibg=#3f3f3f
" hi MatchParen 		ctermbg=236 ctermfg=219 guibg=#3f3f3f guifg=#ffafff
" hi FoldColumn 		ctermbg=235 guibg=#262626
" hi Folded 		ctermbg=235 guibg=#262626
" hi LineNr 	        ctermfg=239 ctermbg=237 guifg=#808080	 guibg=#3a3a3a
" hi ColorColumn 		ctermbg=235 guibg=#3b3b3b
" hi CursorLine 		ctermbg=237 guibg=#3b3b3b
" " hi Visual 		ctermbg=239 guibg=#4e4e4e
" hi pandocEmphasis 	ctermfg=116 guifg=#ffafff
" hi pandocBlockQuote 	ctermfg=150 guifg=#afd787
" " hi Float 		ctermfg=116
" hi Pmenu ctermfg=238 ctermbg=224 guibg=#303030 guifg=#8a8a8a

" au FileType r,R hi SignColumn ctermbg=none guibg=none
" au FileType r,R hi MatchParen 	ctermfg=219 ctermbg=237 guifg=#ffafff    guibg=#3a3a3a
" au FileType r,R hi VertSplit 	ctermfg=237 ctermbg=240 guifg=#3a3a3a	 guibg=#585858
" au FileType r,R hi Todo 	gui=italic  ctermbg=237 guibg=#3a3a3a
" au FileType r,R hi Folded 	gui=bold    ctermbg=237 guibg=#3a3a3a
" au FileType r,R hi CursorColumn	            ctermbg=237 guibg=#3a3a3a
" au FileType pandoc,html,tex hi Comment ctermfg=245 guifg=#8a8a8a
" au FileType r,pandoc,rmarkdown,html,tex hi Comment gui=italic

" au FileType r,R hi margrittr ctermfg=242 guifg=#808080
" au FileType r,R hi CursorLine            guibg=#363636
" au FileType r,R syntax match margrittr "%>%"

" au FileType vimwiki colorscheme tender
" au FileType vimwiki highlight Conceal guibg=Default
" au Filetype vimwiki hi VimwikiHeader2 gui=bold ctermfg=78  cterm=bold guifg=#5fd787
" au Filetype vimwiki hi VimwikiHeader3 gui=bold ctermfg=219 cterm=bold guifg=#ff8787
" au Filetype vimwiki hi VimwikiHeader4 gui=bold ctermfg=210 cterm=bold guifg=#ffafff
" au Filetype vimwiki hi VimwikiHeader5 gui=bold ctermfg=193 cterm=bold guifg=#d7ffaf

let ayucolor="mirage"
colorscheme ayu
hi MatchParen 	ctermbg=236 ctermfg=219 guibg=#0a0a0a guifg=#ffafff
hi Normal 		ctermbg=237 guibg=none
au Filetype r,R hi Normal 		ctermbg=237 guibg=#2E3440
hi Visual guibg=#48525d

"{{{1 Plugin Options

" Hexokinase

  let g:Hexokinase_optInPatterns = 'full_hex,triple_hex,rgb,rgba,hsl,hsla'

" incsearch
        let g:incsearch#auto_nohlsearch = 1
        let g:CoolTotalMatches = 1

" FZF
map <C-P> :FZF<CR>

" Operator flashy
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" Lightline
let g:vim_textobj_parameter_mapping = 'a'

" Lightline
" let g:lightline = { 'colorscheme': 'seoul256', }
let g:lightline = { 'colorscheme': 'ayu'}
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Hexokinase
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_refreshEvents = ['TextChanged', 'InsertLeave']

" Pandoc folding
let g:pandoc#folding#mode = 'stacked'
let g:pandoc#folding#fold_yaml = 1

" Vim Wiki
let g:vimwiki_list = [{'path': '~/Nextcloud/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

" Goyo
" Quit goyo on one :q (fix goyo in mutt)
function! Goyo_before()
	let b:quitting = 0
	autocmd QuitPre <buffer> let b:quitting = 1
endfunction

" Quit Vim if this is the only remaining buffer
function! Goyo_after()
	if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
		qa
	endif
endfunction

let g:goyo_callbacks = [function('Goyo_before'), function('Goyo_after')]

" Nvim-R
" let R_app = 'R-devel'
let R_args = ['--quiet']
let R_objbr_place = 'script,right'
let R_objbr_w = 32
let R_assign_map = '<M-->'
let rrst_syn_hl_chunk = 1
   	let rmd_syn_hl_chunk = 1

" Ncm2
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
let g:rout_follow_colorscheme = 1
let g:Rout_more_colors = 1
au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect,preview
au User Ncm2PopupClose set completeopt=menuone

" Autocompletion from bibliography files
augroup my_cm_setup
autocmd!
	" au Filetype rmarkdown,r call ncm2#enable_for_buffer()
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

" Mouse and Plugin mappings {{{1
let mapleader =","
let maplocalleader =" "

" Mouse options
set mouse=a

nnoremap <RightMouse> <M-RightMouse>
nnoremap <M-RightMouse> <RightMouse>
nnoremap <C-RightMouse> <LeftMouse>za
au Filetype vimwiki nnoremap <C-LeftMouse> <LeftMouse>:VimwikiFollowLink<CR>

" Include mouse clicks in jump list
nnoremap <LeftMouse> m'<LeftMouse>

" Plugin
nm <leader>i :call ToggleIPA()<CR>
imap <leader>i <esc>:call ToggleIPA()<CR>a
nnoremap <A-g> :Goyo <Enter>

" Ultisnips
" let g:UltiSnipsJumpForwardTrigger	= ""
" let g:UltiSnipsJumpBackwardTrigger	= ""
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsExpandTrigger		= "<S-Tab>"
let g:UltiSnipsEditSplit		= "vertical"


" change word to phonetic transcription vimling?
" nnoremap <leader>p :redir @p<CR>:silent Phonetics<CR>:redir END<CR>:put =split(@p)[-1]<CR>
nnoremap <leader>P :redir @p<CR>:silent Phonetics<CR>:redir END<CR>diwi<CR><Esc>:put! =split(@p)[-1]<CR>kJJe

"{{{1 Remapping keys
" General {{{2
inoremap <M-CR>
inoremap <S-F13> <C-p>
" au Filetype r,R  inoremap <Tab> <C-x><C-o>
inoremap <Tab> <C-p>
au Filetype r,R inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
      \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
au Filetype r,R inoremap <expr> <Tab> pumvisible() ? '<C-n>' :
      \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
nnoremap <F5> :w<CR>
nnoremap <Backspace> :q<CR>
nnoremap Q :q!
nnoremap j j
nnoremap k k
nnoremap c "_c
nnoremap C "_C
" nnoremap Y y$
nnoremap ' `
nnoremap ` '
nnoremap M `m
nnoremap dae daw
nnoremap die diw
nnoremap cae caw
nnoremap cie ciw

nnoremap ä <C-o>
onoremap ä <C-o>
vnoremap ä <C-o>

nnoremap Ä <C-i>
onoremap Ä <C-i>
vnoremap Ä <C-i>

" External script
map <leader>b :40vsp<space>~/Nextcloud/templates/uni.bib<CR>
map <leader>c :w! \| !compiler <c-r>%<CR>
map <leader>x :w! \| !xelatex %<CR>
map <leader>p :!opout <c-r>%<CR><CR>

" Spellchecking
map <F6> :setlocal spell! spelllang=en_us<Return>
map <F7> :setlocal spell! spelllang=de<Return>:call Umlauts()<Return>
inoremap Ü <Esc>[sz=1<Enter>A

" Navigating with guides
inoremap ,, <Esc>/<++><Enter>"_c4l
vnoremap ,, <Esc>/<++><Enter>"_c4l
nnoremap ,,  <Esc>/<++><Enter>"_c4l

" extend HJKL navigation
nnoremap <Left> <C-w>h
nnoremap <Down> <C-w>j
nnoremap <Up> <C-w>k
nnoremap <Right> <C-w>l

nnoremap L $
onoremap L $
vnoremap L $

nnoremap H ^
onoremap H ^
vnoremap H ^

" nnoremap J }j
" onoremap J }j
" vnoremap J }j

" nnoremap K {k
" onoremap K {k
" vnoremap K {k

" nnoremap <c-j> J
" onoremap <c-j> J
" vnoremap <c-j> J

" Delimiters {{{2
imap ö (
imap Ö "
imap ä {
imap Ä [
imap ´ `
" inoremap <C-Space> " broken? why
au FileType r,R inoremap ,, <Right>,<Space>""<Left>

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

" Auto pair
inoremap () ()<left>
inoremap {} {}<left>
inoremap [] []<left>
inoremap <> <><left>
inoremap "" ""<left>
inoremap `` ``<left>
inoremap '' ''<left>
inoremap ``` ```<CR>```<Up>

inoremap ,( <Esc>o)<Esc>kA(
inoremap {{ <Esc>o}<Esc>kA{<CR>
inoremap ,[ <Esc>o]<Esc>kA[

" Alt-Gr and R-programming {{{2
" f
" nnoremap đ :vertical wincmd f<CR> <---- map to v („)?
inoremap đ <c-x><c-f>
" s
nnoremap ſ :%s//g<left><left>
vnoremap ſ :s//g<left><left>
" r
nmap ¶ :so ~/.config/nvim/init.vim<CR>

" R mappings
" e
nnoremap € :call RAction("example")<CR>
" h
nnoremap ħ :call RAction("help")<CR>
" o
nnoremap ø :call RObjBrowser()<CR>
" a
nnoremap æ :call RAction("args")<CR>

nnoremap <M-1> :call RAction("head")<CR>
nnoremap <M-2> :call RAction("tail")<CR>
nnoremap <M-3> :call RAction("class")<CR>
nnoremap <M-4> :call RAction("str")<CR>
nnoremap <M-5> :call RAction("summary")<CR>

nnoremap ö :call SendLineToR("down")<CR>0
vnoremap ö :call SendSelectionToR("silent", "stay")<CR>
nnoremap ü :call RAction("print")<CR>
nnoremap Ü :call RSendFile("silent")<CR>
nnoremap Ö :call RSendAboveLinesToR()<CR>
nnoremap <c-l> :call RClearConsole()<CR>
nnoremap <Space><Space> :RSend<Space>

au filetype r,R nnoremap <CR> :call SendLineToR("down")<CR>0
au filetype r,R inoremap -- <Space><-<Space>
au filetype r,R inoremap (( (<End>)<Esc>i
au filetype r,R inoremap [[ [<End>]<Esc>i
au FileType r,R inoremap >> <Esc>A<Space>%>%<CR>
au FileType r,rmarkdown inoremap <M-+> <End><Space>+<CR>
au FileType r,rmarkdown inoremap ´ `r `<Left>
au FileType r,rmarkdown inoremap <leader>c [@]<Left>
au FileType r,rmarkdown nnoremap <leader>d diwmP%mp%x`pdT)X`P

"{{{1 File-specific
" mail
au BufRead,BufNewFile neomutt* set filetype=mail
au FileType mail source ~/Nextcloud/mail/mail.vim
au BufRead,BufNewFile mail setlocal spell spelllang=en_us

" Tex
au BufRead,BufNewFile *.tex set filetype=tex
au FileType tex,bib source ~/.config/nvim/latex.vim
au VimLeave *.tex !texclear %
au FileType bib set nowrap

" (r)markdown
au BufRead,BufNewFile *.rmd set filetype=rmarkdown
au FileType markdown,pandoc,rmarkdown setlocal commentstring=<\!--\ %s\ -->
au FileType markdown,pandoc,rmarkdown let g:limelight_bop = '^#\s'
au FileType markdown,pandoc,rmarkdown let g:limelight_eop = '\ze\n^#\s'
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#syntax#conceal#backslash = 1
let g:closetag_filetypes = 'rmarkdown'

au FileType pandoc,rmarkdown,markdown inoremap ** **<left>
au FileType pandoc,rmarkdown,markdown inoremap *** ****<left><left>

" r
au BufRead,BufNewFile *R set filetype=r
au FileType r,R set completeopt=longest,menuone

" au FileType r nnoremap <leader>r :tabnew %:r\.Rmd<CR>
" au FileType rmarkdown nnoremap <leader>r :tabnew %:r\.R<CR>

" open full r workspace
au FileType r,rmarkdown nnoremap <F11> :call StartR("R")<CR>
"<bar>
		" \ sleep 3 <bar>
 		" \ call RObjBrowser()<CR>

au FileType rmarkdown inoremap <leader>ex <CR>(@)<Space>

" various
au BufWritePost *sxhkdrc !pkill -USR1 sxhkd
" au FileType vim let g:AutoPairs['<']='>'
au Filetype vimwiki setlocal nospell
au Filetype vimwiki,r set nowrap
au Filetype vimwiki call Umlauts()
au BufRead,BufNewFile *toml set ft=yaml
au BufRead,BufNewFile *vifmrc* set filetype=vim

" Julia
autocmd BufRead,BufNewFile *.jl :set filetype=julia
runtime macros/matchit.vim

"{{{1 Abbreviations

   func Eatchar(pat)
      let c = nr2char(getchar(0))
      return (c =~ a:pat) ? '' : c
   endfunc
   au FileType r,R iabbr <silent> if if ()<C-R>=Eatchar('\s')<CR>

	" au FileType r,rmarkdown ia f FALSE
	" au FileType r,rmarkdown ia t TRUE

        " ia ar Alexander Rauhut
        " ia fu Freie Universit<C-V>ät Berlin
        " ia cm Campus Management
        " ia bb Blackboard
        " ia hw homework assignment
        " ia lola Levels of Linguistic Analysis
        " ia intr Introduction to Linguistics

        " ia cl Cognitive Linguistics
        " ia cr Corpus Linguistics
        " ia cg Construction Grammar
        " ia gg Generative Grammar
        " ia rcg Radical Construction Grammar
        " ia clx Collostruction Analysis
        " ia zl Zipf's Law

"{{{1 Testing

" Persistent undo
" Keep undo history across sessions by storing it in a file
let vimDir = '$HOME/.config/nvim'
let &runtimepath.=','.vimDir

if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Julia stuff

""" misc
autocmd FileType julia setlocal shiftwidth=4 foldmethod=indent tabstop=4 softtabstop=4

""" julia-vim
" let g:default_julia_version = "devel"

""" neoterm
let g:neoterm_default_mod = 'vertical'

" -- commands and send (shortcuts partly based on Nvim-R - quick and dirty)
" - *t*erminal (julia only starts with the first send command)
nnoremap <silent> <localleader>tn :Tnew<cr>
nnoremap <silent> <localleader>to :Topen<cr>
nnoremap <silent> <localleader>tc :Tclose<cr>
" - *c*lear, *c*trl-c, workspace *c*ommand
nnoremap <silent> <localleader>cl :call neoterm#clear()<cr>
nnoremap <silent> <localleader>cc :call neoterm#kill()<cr>
nnoremap <silent> <localleader>cw :call neoterm#do("workspace()")<cr>
" - show *j*ulia @doc, show(info)
nnoremap <silent> <localleader>jd :call neoterm#do("@doc " . expand("<cword>"))<cr>
nnoremap <silent> <localleader>je :call neoterm#do("@edit " . expand("<cword>"))<cr>
nnoremap <silent> <localleader>ji :call neoterm#do(expand("<cword>"))<cr>
" - send *a*ll, i.e. file
nnoremap <silent> <localleader>aa :w<cr>:call neoterm#do("include(\"%\")")<cr>
nnoremap <silent> <localleader>ae :w<cr>:TREPLSendFile<cr>
" - send *p*aragraph (cursor location changes)
nnoremap <silent> <localleader>pp vip:TREPLSendLine<cr><esc>
nnoremap <silent> <localleader>pd vip:TREPLSendLine<cr><esc>}
" - send *s*election (cursor location changes)
vnoremap <silent> <localleader>ss :TREPLSendSelection<cr>
vnoremap <silent> <localleader>sd :TREPLSendSelection<cr>j
" - send *l*ine, optionally go *d*own, *q*uickly continue editing...
nnoremap <silent> <localleader>l :TREPLSendLine<cr>
nnoremap <silent> <localleader>d :TREPLSendLine<cr>j
nnoremap <silent> <localleader>q :TREPLSendLine<cr>i




hi SignColumn ctermbg=none guibg=none
