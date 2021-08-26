	const_def 2 ; object constants

RidgeCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RidgeCafeClerkScript:
	opentext
	pokemart MARTTYPE_DRINKS, MART_VIOLET
	closetext
	end

RidgeCafeVendingMachine:
	opentext
	writetext CafeVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .PokeBall
	ifequal 2, .GreatBall
	ifequal 3, .RageCandyBar
	closetext
	end

.PokeBall:
	checkmoney YOUR_MONEY, 200
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem POKE_BALL
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 200
	itemtotext POKE_BALL, MEM_BUFFER_0
	jump .VendItem
	
.GreatBall:
	checkmoney YOUR_MONEY, 600
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem GREAT_BALL
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 600
	itemtotext GREAT_BALL, MEM_BUFFER_0
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
	writetext CafeClangText
	buttonsound
	itemnotify
	writetext CafeAnythingElseText
	jump .Start

.NotEnoughMoney:
	writetext CafeVendingNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext CafeVendingNoSpaceText
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
	db "POKE BALL    ¥200@"
	db "GREAT BALL   ¥600@"
	db "RAGECANDYBAR ¥800@"
	db "CANCEL@"

RidgeCafeFisher:
	jumptextfaceplayer RidgeCafeFisherText

RidgeCafeLass:
	jumptextfaceplayer RidgeCafeLassText

RidgeCafeYoungster:
	jumptextfaceplayer RidgeCafeYoungsterText
	
RidgeCafeSailor:
	jumptextfaceplayer RidgeCafeSailorText
	
RidgeCafeGramps:
	jumptextfaceplayer RidgeCafeGrampsText
	
RidgeCafeChef:
	jumptextfaceplayer RidgeCafeChefText
	
RidgeCafeFridge:
	jumptext RidgeCafeFridgeText
	
RidgeCafeFood:
	jumptext RidgeCafeFoodText

RidgeCafeTrash:
	jumptext RidgeCafeTrashText
	
CafeVendingText:
	text "A vending machine!"
	line "Here's the menu."
	done

CafeClangText:
	text "Clang!"

	para "@"
	text_from_ram wStringBuffer3
	text_start
	line "popped out."
	done
	
CafeAnythingElseText:
	text "Anything else?"
	done
	
CafeVendingNoMoneyText:
	text "Oops, not enough"
	line "money…"
	done

CafeVendingNoSpaceText:
	text "There's no more"
	line "room for stuff…"
	done

RidgeCafeGrannyText:
	text "It is important to"
	line "treat your #MON"
	cont "with respect."
	
	para "It will never grow"
	line "to love you if you"
	cont "keep sending it"
	cont "out into battles"
	cont "it can't win!"
	done

RidgeCafeTwinText:
	text "I'm not a trainer."
	
	para "I just like coming"
	line "here to look at"
	cont "all of the #MON"
	cont "merchandise."
	done
	
RidgeCafeSailorText:
	text "Mmm-mm!"
	
	para "I love the food"
	line "here! It's just"
	cont "like my mom used"
	cont "to make!"
	done
	
RidgeCafeGrampsText:
	text "I have been coming"
	line "to this place ever"
	cont "since it opened."
	
	para "I can't help but"
	line "admire the beauti-"
	cont "ful waitress!"
	done
	
RidgeCafeChefText:
	text "Are you a trainer?"
	line "I'm sorry, but we"
	cont "only serve food to"
	cont "people here."
	
	para "If you'd like, you"
	line "can get something"
	cont "for your #MON"
	cont "at the bar."
	done
	
RidgeCafeFisherText:
	text "I always look for-"
	line "ward to the SWEET"
	cont "TEA served here."
	
	para "It really keeps me"
	line "going when I'm out"
	cont "at sea!"
	done
	
RidgeCafeLassText:
	text "Do you mind? I am"
	line "trying to enjoy a"
	cont "meal with my"
	cont "boyfriend."
	done
	
RidgeCafeYoungsterText:
	text "I need to stop"
	line "taking my girl-"
	cont "friend out to eat."
	
	para "She can eat so"
	line "much, it is a real"
	cont "pain in my wallet!"
	done

RidgeCafeFridgeText:
	text "It's stocked full"
	line "of fresh seafood"
	cont "and salads."
	done
	
RidgeCafeFoodText:
	text "This food smells"
	line "delicious!"
	
	para "It looks good too!"
	done
	
RidgeCafeTrashText:
	text "There's nothing"
	line "but trash here."
	done
	
RidgeCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  7, RIDGE_VILLAGE, 1
	warp_event  4,  7, RIDGE_VILLAGE, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 11,  1, BGEVENT_UP, RidgeCafeVendingMachine
	bg_event 12,  1, BGEVENT_READ, RidgeCafeFridge
	bg_event 13,  1, BGEVENT_READ, RidgeCafeFridge
	bg_event  6,  1, BGEVENT_READ, RidgeCafeTrash

	db 9 ; object events
	object_event  9,  1, SPRITE_CHEF, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RidgeCafeChef, -1
	object_event  0,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RidgeCafeClerkScript, -1
	object_event  2,  1, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RidgeCafeGramps, -1
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RidgeCafeFisher, -1
	object_event 13,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RidgeCafeYoungster, -1
	object_event 10,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RidgeCafeLass, -1
	object_event 11,  7, SPRITE_FOOD, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RidgeCafeFood, -1
	object_event  7,  5, SPRITE_FOOD, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RidgeCafeFood, -1
	object_event  6,  5, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RidgeCafeSailor, -1
