	const_def 2 ; object constants
	const MAHOGANYCAFE_CLERK
	const MAHOGANYCAFE_GRANNY
	const MAHOGANYCAFE_COOLTRAINER_M

MahoganyCafe_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Tiles
	
.Tiles:
	changeblock   6, 4, $3e
	changeblock  10, 6, $41
	changeblock  12, 6, $3f
	return

MahoganyCafeClerkScript:
	opentext
	pokemart MARTTYPE_DRINKS, MART_MAHOGANY
	closetext
	end

MahoganyCafeVendingMachine:
	opentext
	writetext MahoganyCafeVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .GreatBall
	ifequal 2, .EnergyPowder
	ifequal 3, .RageCandyBar
	closetext
	end
	
.GreatBall:
	checkmoney YOUR_MONEY, 600
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem GREAT_BALL
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 600
	itemtotext GREAT_BALL, MEM_BUFFER_0
	jump .VendItem
	
.EnergyPowder:
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem ENERGYPOWDER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 500
	itemtotext ENERGYPOWDER, MEM_BUFFER_0
	jump .VendItem

.RageCandyBar:
	checkmoney YOUR_MONEY, 800
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RAGECANDYBAR
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 800
	itemtotext RAGECANDYBAR, MEM_BUFFER_0
	jump .VendItem
	
.VendItem:
	special PlaceMoneyTopRight
	pause 10
	playsound SFX_ENTER_DOOR
	writetext MahoganyCafeClangText
	special PlaceMoneyTopRight
	buttonsound
	itemnotify
	writetext MahoganyCafeAnythingElseText
	jump .Start

.NotEnoughMoney:
	writetext MahoganyCafeVendingNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext MahoganyCafeVendingNoSpaceText
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
	db "GREAT BALL   ¥600@"
	db "ENERGYPOWDER ¥500@"
	db "RAGECANDYBAR ¥800@"
	db "CANCEL@"

MahoganyCafeCooltrainerM:
	jumptextfaceplayer MahoganyCafeCooltrainerMText

MahoganyCafeBeauty:
	jumptextfaceplayer MahoganyCafeBeautyText

MahoganyCafeYoungster:
	jumptextfaceplayer MahoganyCafeYoungsterText
	
MahoganyCafeSailor:
	jumptextfaceplayer MahoganyCafeSailorText
	
MahoganyCafeScientist:
	jumptextfaceplayer MahoganyCafeScientistText
	
MahoganyCafeChef:
	jumptextfaceplayer MahoganyCafeChefText
	
MahoganyCafeFridge:
	jumptext MahoganyCafeFridgeText

MahoganyCafeTrash:
	jumptext MahoganyCafeTrashText
	
MahoganyCafeVendingText:
	text "A vending machine!"
	line "Here's the menu."
	done

MahoganyCafeClangText:
	text "Clang!"

	para "@"
	text_from_ram wStringBuffer3
	text_start
	line "popped out."
	done
	
MahoganyCafeAnythingElseText:
	text "Anything else?"
	done
	
MahoganyCafeVendingNoMoneyText:
	text "Oops, not enough"
	line "money…"
	done

MahoganyCafeVendingNoSpaceText:
	text "There's no more"
	line "room for stuff…"
	done

MahoganyCafeSailorText:
	text "This place can be"
	line "quite busy some-"
	cont "times, but the"
	cont "food they serve is"
	cont "worth the wait!"
	done
	
MahoganyCafeScientistText:
	text "These drinks taste"
	line "much better than"
	cont "the ones sold in"
	cont "the POWER PLANT's"
	cont "machines."
	
	para "It must be the"
	line "glass bottles."
	done
	
MahoganyCafeChefText:
	text "You are welcome to"
	line "visit the bar, but"
	cont "this establishment"
	cont "only serves food"
	cont "to people."
	
	para "#MON must stay"
	line "inside a BALL at"
	cont "all times."
	done
	
MahoganyCafeCooltrainerMText:
	text "I make sure to buy"
	line "a few extra drinks"
	cont "every time I come"
	cont "here."
	
	para "I give them to my"
	line "#MON as treats!"
	done
	
MahoganyCafeBeautyText:
	text "My boyfriend likes"
	line "to take me here,"
	cont "but it's always"
	cont "busy."
	
	para "I don't want to"
	line "wait so long when"
	cont "I'm this hungry!"
	done
	
MahoganyCafeYoungsterText:
	text "This is my favor-"
	line "ite place to sit."
	
	para "I can see everyone"
	line "who enters while I"
	cont "eat."

	para "It's fun to see all"
	line "the different kinds"
	cont "of tourists!"
	done

MahoganyCafeFridgeText:
	text "It's stocked full"
	line "of fresh seafood"
	cont "and salads."
	done
	
MahoganyCafeTrashText:
	text "There's nothing"
	line "but trash here."
	done
	
MahoganyCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, MAHOGANY_TOWN, 10
	warp_event  5,  7, MAHOGANY_TOWN, 10

	db 0 ; coord events

	db 4 ; bg events
	bg_event 11,  1, BGEVENT_UP, MahoganyCafeVendingMachine
	bg_event 12,  1, BGEVENT_READ, MahoganyCafeFridge
	bg_event 13,  1, BGEVENT_READ, MahoganyCafeFridge
	bg_event  6,  1, BGEVENT_READ, MahoganyCafeTrash

	db 9 ; object events
	object_event  9,  1, SPRITE_CHEF, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyCafeChef, -1
	object_event  0,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyCafeClerkScript, -1
	object_event  2,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyCafeScientist, -1
	object_event  2,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyCafeCooltrainerM, -1
	object_event  9,  4, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyCafeBeauty, -1
	object_event 13,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyCafeYoungster, -1
	object_event 12,  7, SPRITE_FOOD, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyCafeSailor, -1
