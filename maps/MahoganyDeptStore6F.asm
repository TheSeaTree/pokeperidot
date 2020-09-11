	const_def 2 ; object constants
	const MAHOGANYDEPTSTORE6F_LASS
	const MAHOGANYDEPTSTORE6F_SUPER_NERD

MahoganyDeptStore6F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyDeptStoreVendingMachine:
	opentext
	writetext MahoganyDeptStoreVendingText
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
	pause 10
	playsound SFX_ENTER_DOOR
	writetext MahoganyDeptStoreClangText
	buttonsound
	itemnotify
	jump .Start

.NotEnoughMoney:
	writetext MahoganyDeptStoreVendingNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext MahoganyDeptStoreVendingNoSpaceText
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

MahoganyDeptStore6FLassScript:
	jumptextfaceplayer MahoganyDeptStore6FLassText

MahoganyDeptStore6FSuperNerdScript:
	jumptextfaceplayer MahoganyDeptStore6FSuperNerdText

MahoganyDeptStore6FPokefanMScript:
	jumptextfaceplayer MahoganyDeptStore6FPokefanMText
	
MahoganyDeptStore6FTeacherScript:
	jumptextfaceplayer MahoganyDeptStore6FTeacherText

MahoganyDeptStore6FDirectory:
	jumptext MahoganyDeptStore6FDirectoryText

MahoganyDeptStore6FElevatorButton:
	jumpstd elevatorbutton

MahoganyDeptStoreVendingText:
	text "A vending machine!"
	line "Here's the menu."
	done

MahoganyDeptStoreClangText:
	text "Clang! A can of"
	line "@"
	text_ram wStringBuffer3
	text_start
	cont "popped out!"
	done

MahoganyDeptStoreVendingNoMoneyText:
	text "Oops, not enough"
	line "money."
	done

MahoganyDeptStoreVendingNoSpaceText:
	text "There's no more"
	line "room for stuff."
	done

MahoganyDeptStore6FLassText:
	text "Hm…"
	
	para "There are so many"
	line "drinks to choose"
	cont "from. I can't pick"
	cont "one!"
	done

MahoganyDeptStore6FSuperNerdText:
	text "There are no shops"
	line "on this floor."
	
	para "It's nice to have"
	line "a quiet place to"
	cont "relax here."
	done
	
MahoganyDeptStore6FPokefanMText:
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
	
MahoganyDeptStore6FTeacherText:
	text "Could you please"
	line "keep your voice"
	cont "down in here?"
	
	para "People come here"
	line "to get away from"
	cont "the rowdiness of"
	cont "the city."
	done

MahoganyDeptStore6FDirectoryText:
	text "Take a Break from"
	line "Shopping!"

	para "6F TRANQUIL SQUARE"
	done

MahoganyDeptStore6F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 15,  0, MAHOGANY_DEPT_STORE_5F, 2
	warp_event  2,  0, MAHOGANY_DEPT_STORE_ELEVATOR, 1
	warp_event 13,  0, MAHOGANY_DEPT_STORE_ROOF, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 14,  0, BGEVENT_READ, MahoganyDeptStore6FDirectory
	bg_event  3,  0, BGEVENT_READ, MahoganyDeptStore6FElevatorButton
	bg_event  8,  1, BGEVENT_UP, MahoganyDeptStoreVendingMachine
	bg_event  9,  1, BGEVENT_UP, MahoganyDeptStoreVendingMachine
	bg_event 11,  1, BGEVENT_UP, MahoganyDeptStoreVendingMachine

	db 4 ; object events
	object_event 10,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore6FLassScript, -1
	object_event  5,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore6FPokefanMScript, -1
	object_event 13,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore6FSuperNerdScript, -1
	object_event  3,  6, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore6FTeacherScript, -1
