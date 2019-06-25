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
	
;EVENT_EXPLAINED_POWER_PLANT
;	"Sorry, kid. The SUBWAY is out of commission for the time being. The POWER PLANT isn't producing enough electricity to run the thing. It's ruining this city's economy! We rely on our tourism to stay afloat, and not many people are coming up around here without our SUBWAY system."
;	"I sent a crew up to check it out, but they were overrun by a group of wild GRIMER that made a nest there. They must be mucking up all the turbines."
;	"If you think you can clear out those GRIMER, be my guest, but you're going to need a way to get across the lake behind the GYM to reach the POWER PLANT. You're not much of a swimmer, are you?"
;	"I know! I have a friend down by the coast who owes me a favor. Go find him and he'll give you something to cross the water."
;	"Now that you have the HM for SURF, you can access the POWER PLANT."

MahoganyTown_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 23, 33, MAHOGANY_GATE, 1
	warp_event 24, 33, MAHOGANY_GATE, 2
	warp_event  2,  3, MAHOGANY_TOWN, 3
	warp_event 27, 29, MAHOGANY_POKECENTER_1F, 1
	warp_event 10, 19, MAHOGANY_MAGNET_TRAIN_STATION, 1
	warp_event 24, 13, MAHOGANY_GYM, 1

	db 1 ; coord events
	coord_event  2,  3, -1, PowerPlantDoor

	db 1 ; bg events
	bg_event 24, 21, BGEVENT_UP, MahoganyTownVendingMachine

	db 5 ; object events
	object_event 28, 21, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 26, 17, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 25, 20, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 29, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 10, 20, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
