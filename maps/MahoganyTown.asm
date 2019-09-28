	const_def 2 ; object constants
	const MAHOGANYTOWN_MERCHANT1
	const MAHOGANYTOWN_CLERK
	const MAHOGANYTOWN_MERCHANT2
	const MAHOGANYTOWN_MERCHANT3
	const MAHOGANYTOWN_LASS
	const MAHOGANYTOWN_ADMIN1

MahoganyTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_MAHOGANY
	return
	
PowerPlantDoor:
	checkevent EVENT_POWER_PLANT_1F_MUK
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

MahoganyMartGuy:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_1
	closetext
	turnobject LAST_TALKED, DOWN
	end

MahoganyPunchGuy:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_2
	closetext
	turnobject LAST_TALKED, DOWN
	end
	
MahoganyVitaminGuy:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_3
	closetext
	turnobject LAST_TALKED, DOWN
	end
	
MahoganyTownPowerPlantGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM_SURF
	iftrue .GotSurf
	checkevent EVENT_EXPLAINED_POWER_PLANT
	iftrue .ExplainedPlant
	writetext MahoganyPowerPlantGuyIntroText
	waitbutton
	setevent EVENT_EXPLAINED_POWER_PLANT
	checkcode VAR_BADGES
	ifless 6, .NotEnoughBadges
	writetext MahoganyPowerPlantGuyAskText
	yesorno
	iffalse .No

.ExplainedPlant
	checkcode VAR_BADGES
	ifless 6, .NotEnoughBadges
	writetext MahoganyPowerPlantGuyAgree
	waitbutton
	closetext
	setevent EVENT_UNLOCKED_SURF
	end
	
.GotSurf
	writetext MahoganyPowerPlantGotSurf
	waitbutton
	closetext
	end
	
.No
	writetext MahoganyPowerPlantGuyComeBack
	yesorno
	iftrue .ExplainedPlant
	iffalse .No
	
.NotEnoughBadges
	writetext MahoganyPowerPlantNotEnoughBadges
	waitbutton
	closetext
	end
	
MahoganyGymEvent:
	scall MahoganyGymEntrance
	iffalse .no
	warpfacing UP, MAHOGANY_GYM, 12, 31
.no
	end	
	
MahoganyGymEntrance:
	jumpstd gymdoor
	end

MahoganyTownLass:
	jumptextfaceplayer MahoganyTownLassText
	
MahoganyTownFruitTree:
	fruittree FRUITTREE_MAHOGANY_TOWN

MahoganyGymMovement:
	step UP
	step_resume

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

MahoganyPowerPlantGuyIntroText:
	text "Sorry, kid."
	
	para "The SUBWAY is out"
	line "of commission for"
	cont "the time being."
	
	para "The POWER PLANT is"
	line "not producing"
	cont "enough electricity"
	cont "to run the thing."
	
	para "This city relies"
	line "on tourism to make"
	cont "the majority of"
	cont "its money. With no"
	cont "SUBWAY, this city"
	cont "is not accessible"
	cont "enough for non-"
	cont "trainers."
	
	para "I sent a crew up"
	line "to the POWER PLANT"
	cont "to check it out,"
	cont "but they were not"
	cont "able to deal with"
	cont "the wild GRIMER"
	cont "nesting there."
	
	para "They must be muck-"
	line "ing up all the"
	cont "turbines."
	done
	
MahoganyPowerPlantGuyAskText:
	para "It's a lot to ask,"
	line "but would you take"
	cont "care of them?"
	done
	
MahoganyPowerPlantGuyComeBack:
	text "What do you mean"
	line "you won't?"
	
	para "Our economy is on"
	line "the line!"
	done
	
MahoganyPowerPlantGuyAgree:
	text "You will need a"
	line "way to get across"
	cont "the lake behind"
	cont "the GYM, and you"
	cont "don't look like"
	cont "much of a swimmer."
	
	para "I have a buddy"
	line "down on the shore."
	
	para "He's not too kind"
	line "to outsiders, but"
	cont "he owes me a favor"
	cont "so I'll let him"
	cont "know you are"
	cont "coming."
	
	para "He can get you"
	line "something to cross"
	cont "the water."
	done
	
MahoganyPowerPlantGotSurf:
	text "Now that you have"
	line "the HM for SURF,"
	cont "you can cross the"
	cont "water and clean up"
	cont "the POWER PLANT."
	done
	
MahoganyPowerPlantNotEnoughBadges:
	text "I don't know any"
	line "trainers strong"
	cont "enough for this"
	cont "task!"
	
	para "There was one"
	line "trainer I asked,"
	cont "but he refused."
	
	para "He said it wasn't"
	line "his problem."
	
	para "Oh, what will I"
	line "do?"
	done
	
MahoganyTownLassText:
	text "With the merchants"
	line "all trying to sell"
	cont "items to the"
	cont "tourists staying"
	cont "at the hotel, this"
	cont "city's #MART"
	cont "owner sold his"
	cont "shop to join them."
	
	para "He couldn't beat"
	line "the competition"
	cont "otherwise."
	done
	
MahoganyTownStockChangesText:
	text "My stock changes"
	line "daily!"
	done
	
MahoganyTown_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 23, 33, MAHOGANY_GATE, 1
	warp_event 24, 33, MAHOGANY_GATE, 2
	warp_event  2,  3, MAHOGANY_TOWN, 3
	warp_event 27, 29, MAHOGANY_POKECENTER_1F, 1
	warp_event 10, 19, MAHOGANY_MAGNET_TRAIN_STATION, 1
	warp_event 35, 19, EMYS_HOUSE, 1
	warp_event 37,  9, MOVE_DELETERS_HOUSE, 1
	warp_event 19, 29, SUBSTITUTE_HOUSE, 1

	db 1 ; coord events
	coord_event  2,  3, -1, PowerPlantDoor

	db 2 ; bg events
	bg_event 24, 21, BGEVENT_UP, MahoganyTownVendingMachine
	bg_event 24, 13, BGEVENT_UP, MahoganyGymEvent

	db 7 ; object events
	object_event 28, 21, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 26, 17, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMartGuy, -1
	object_event 25, 20, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPunchGuy, -1
	object_event 29, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyVitaminGuy, -1
	object_event 26, 24, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 3, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownLass, -1
	object_event 10, 20, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyTownPowerPlantGuy, EVENT_POWER_PLANT_1F_MUK
	object_event 22,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownFruitTree, -1
