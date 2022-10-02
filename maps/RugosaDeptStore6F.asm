	const_def 2 ; object constants
	const MAHOGANYDEPTSTORE6F_LASS
	const MAHOGANYDEPTSTORE6F_SUPER_NERD

RugosaDeptStore6F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RugosaDeptStoreVendingMachine:
	opentext
	writetext RugosaDeptStoreVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FreshWater
	ifequal 2, .SodaPop
	ifequal 3, .Lemonade
	closetext
	end

.FreshWater:
	checkmoney YOUR_MONEY, 200
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 200
	itemtotext FRESH_WATER, MEM_BUFFER_0
	jump .VendItem

.SodaPop:
	checkmoney YOUR_MONEY, 300
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 300
	itemtotext SODA_POP, MEM_BUFFER_0
	jump .VendItem

.Lemonade:
	checkmoney YOUR_MONEY, 350
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 350
	itemtotext LEMONADE, MEM_BUFFER_0
	jump .VendItem

.VendItem:
	special PlaceMoneyTopRight
	pause 10
	playsound SFX_ENTER_DOOR
	writetext RugosaDeptStoreClangText
	buttonsound
	itemnotify
	jump .Start

.NotEnoughMoney:
	writetext RugosaDeptStoreVendingNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext RugosaDeptStoreVendingNoSpaceText
	waitbutton
	jump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "FRESH WATER  ¥200@"
	db "SODA POP     ¥300@"
	db "LEMONADE     ¥350@"
	db "CANCEL@"

RugosaDeptStore6FLassScript:
	jumptextfaceplayer RugosaDeptStore6FLassText

RugosaDeptStore6FSuperNerdScript:
	jumptextfaceplayer RugosaDeptStore6FSuperNerdText

RugosaDeptStore6FPokefanMScript:
	jumptextfaceplayer RugosaDeptStore6FPokefanMText
	
RugosaDeptStore6FTeacherScript:
	jumptextfaceplayer RugosaDeptStore6FTeacherText

RugosaDeptStore6FDirectory:
	jumptext RugosaDeptStore6FDirectoryText

RugosaDeptStore6FElevatorButton:
	jumpstd elevatorbutton

RugosaDeptStoreVendingText:
	text "A vending machine!"
	line "Here's the menu."
	done

RugosaDeptStoreClangText:
	text "Clang! A can of"
	line "@"
	text_ram wStringBuffer3
	text_start
	cont "popped out!"
	done

RugosaDeptStoreVendingNoMoneyText:
	text "Oops, not enough"
	line "money."
	done

RugosaDeptStoreVendingNoSpaceText:
	text "There's no more"
	line "room for stuff."
	done

RugosaDeptStore6FLassText:
	text "Hm…"
	
	para "There are so many"
	line "drinks to choose"
	cont "from. I can't pick"
	cont "one!"
	done

RugosaDeptStore6FSuperNerdText:
	text "There are no shops"
	line "on this floor."
	
	para "It's nice to have"
	line "a quiet place to"
	cont "relax here."
	done
	
RugosaDeptStore6FPokefanMText:
	text "I really needed a"
	line "drink from the"
	cont "vending machine."
	
	para "While they are"
	line "meant for people,"
	cont "#MON love them" 
	cont "too."
	
	para "A nice cold SODA"
	line "POP is just enough"
	cont "to get me back on"
	cont "my feet!"
	done
	
RugosaDeptStore6FTeacherText:
	text "Could you please"
	line "keep your voice"
	cont "down in here?"
	
	para "People come here"
	line "to get away from"
	cont "the rowdiness of"
	cont "the city."
	done

RugosaDeptStore6FDirectoryText:
	text "Take a Break from"
	line "Shopping!"

	para "6F TRANQUIL SQUARE"
	done

RugosaDeptStore6F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 15,  0, RUGOSA_DEPT_STORE_5F, 2
	warp_event  2,  0, RUGOSA_DEPT_STORE_ELEVATOR, 1
	warp_event 13,  0, RUGOSA_DEPT_STORE_ROOF, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 14,  0, BGEVENT_READ, RugosaDeptStore6FDirectory
	bg_event  3,  0, BGEVENT_READ, RugosaDeptStore6FElevatorButton
	bg_event  8,  1, BGEVENT_UP, RugosaDeptStoreVendingMachine
	bg_event  9,  1, BGEVENT_UP, RugosaDeptStoreVendingMachine
	bg_event 11,  1, BGEVENT_UP, RugosaDeptStoreVendingMachine

	db 4 ; object events
	object_event 10,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RugosaDeptStore6FLassScript, -1
	object_event  5,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RugosaDeptStore6FPokefanMScript, -1
	object_event 13,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RugosaDeptStore6FSuperNerdScript, -1
	object_event  3,  6, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RugosaDeptStore6FTeacherScript, -1
