	autocmd BufEnter,BufNewFile mail setlocal spell spelllang=en_us

	autocmd FileType mail inoremap <Tab> <C-n>

	" English mail
	autocmd FileType mail nnoremap ,e ODear Mr<Enter><Enter>Best regards,<Enter>Alexander Rauhut<Esc>ggA

	" Introduction
	autocmd FileType mail nnoremap ,i ODear all,<Enter><Enter><Enter><Enter>Homework and presentations: https://kutt.it/introling<Enter>Additional material: https://kutt.it/course_material<Enter><Enter>Best regards,<Enter>Alexander Rauhut<Enter><Esc>ggjji

	" Levels
	autocmd FileType mail nnoremap ,l ODear all,<Enter><Enter><Enter><Enter>Homework and presentations: https://kutt.it/lolamorph<Enter>Additional material: https://kutt.it/lola_bb<Enter><Enter>Best regards,<Enter>Alexander Rauhut<Enter><Esc>ggjji

	" German polite mail
	autocmd FileType mail nnoremap ,gp :set<Space>spelllang=de<Enter>:inoremap<Space>ö<SPACE>ö<Enter>:inoremap<Space>Ö<SPACE>Ö<Enter>:inoremap<Space>ä<SPACE>ä<Enter>:inoremap<Space>Ä<SPACE>Ä<Enter>:inoremap<Space>ü<SPACE>ü<Enter>:inoremap<Space>Ü<SPACE>Ü<Enter>OSehr geehrte<Enter><Enter>Mit freundlichen Grüßen,<Enter>Alexander Rauhut<Enter><Esc>ggA

	" German friendly mail
	autocmd FileType mail nnoremap ,gf :set<Space>spelllang=de<Enter>:inoremap<Space>ö<SPACE>ö<Enter>:inoremap<Space>Ö<SPACE>Ö<Enter>:inoremap<Space>ä<SPACE>ä<Enter>:inoremap<Space>Ä<SPACE>Ä<Enter>:inoremap<Space>ü<SPACE>ü<Enter>:inoremap<Space>Ü<SPACE>Ü<Enter>OLiebe<Enter><Enter>Viele Grüße,<Enter>Alexander Rauhut<Enter><Esc>ggA
