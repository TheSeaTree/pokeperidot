DefaultOptions:
; wOptions: med text speed
	db %01100001 ;Fast text, battle scene on, battle style set, stereo sound
; wSaveFileExists: no
	db FALSE
; wTextBoxFrame: frame 1
	db FRAME_1
; wTextBoxFlags: use text speed
	db 1 << FAST_TEXT_DELAY_F
; wGBPrinter: normal brightness
	db GBPRINTER_NORMAL
; wOptions2: menu account on
	db 1 << MENU_ACCOUNT

	db $00
	db $00
