	const_def 2 ; object constants

MahoganyTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_MAHOGANY
	return
	
PowerPlantDoor:
	checkevent POWER_PLANT_1F_MUK
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	special FadeOutMusic
	waitsfx
	iftrue .Lights
	warpfacing UP, POWER_PLANT_1F, 5, 21
	end
	
.Lights
	warpfacing UP, POWER_PLANT_1F_B, 5, 21
	end

MahoganyTownVendingMachine:
	opentext
	writetext MahoganyVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FreshWater
	ifequal 2, .PokeDoll
	ifequal 3, .NES
	closetext
	end

.FreshWater:
	checkmoney YOUR_MONEY, 350
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 350
	itemtotext FRESH_WATER, MEM_BUFFER_0
	jump .VendItem
	
.PokeDoll:
	checkmoney YOUR_MONEY, 1000
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem POKE_DOLL
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 1000
	itemtotext POKE_DOLL, MEM_BUFFER_0
	jump .VendItem

.NES:
	checkmoney YOUR_MONEY, 1000
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem POKE_DOLL
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 1000
	itemtotext POKE_DOLL, MEM_BUFFER_0
	jump .VendItem
	
.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	writetext MahoganyClangText
	buttonsound
	itemnotify
	jump .Start

.NotEnoughMoney:
	writetext MahoganyVendingNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext MahoganyVendingNoSpaceText
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
	db "FRESH WATER ¥350@"
	db "POKE DOLL  ¥1000@"
	db "NES       ¥10000@"
	db "CANCEL@"

MahoganyVendingText:
	text "A vending machine!"
	line "Here's the menu."
	done

MahoganyClangText:
	text "Clang!"

	para "@"
	text_from_ram wStringBuffer3
	text_start
	line "popped out."
	done
	
MahoganyVendingNoMoneyText:
	text "Oops, not enough"
	line "money…"
	done

MahoganyVendingNoSpaceText:
	text "There's no more"
	line "room for stuff…"
	done

MahoganyTown_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 25, 33, OLIVINE_CITY, 3
	warp_event 26, 33, OLIVINE_CITY, 3
	warp_event  4,  3, MAHOGANY_TOWN, 3

	db 1 ; coord events
	coord_event  4,  3, -1, PowerPlantDoor

	db 1 ; bg events
	bg_event 26, 21, BGEVENT_UP, MahoganyTownVendingMachine

	db 4 ; object events
	object_event 30, 21, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 28, 17, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 27, 20, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 31, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
