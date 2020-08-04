	const_def 2 ; object constants
	const MAHOGANYCAFE_CLERK
	const MAHOGANYCAFE_GRANNY
	const MAHOGANYCAFE_COOLTRAINER_M

MahoganyCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyCafeClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VIOLET
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
	db "POKE BALL    ¥200@"
	db "GREAT BALL   ¥600@"
	db "RAGECANDYBAR ¥800@"
	db "CANCEL@"

MahoganyCafeFisher:
	jumptextfaceplayer MahoganyCafeFisherText

MahoganyCafeLass:
	jumptextfaceplayer MahoganyCafeLassText

MahoganyCafeYoungster:
	jumptextfaceplayer MahoganyCafeYoungsterText
	
MahoganyCafeSailor:
	jumptextfaceplayer MahoganyCafeSailorText
	
MahoganyCafeGramps:
	jumptextfaceplayer MahoganyCafeGrampsText
	
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

MahoganyCafeGrannyText:
	text "It is important to"
	line "treat your #MON"
	cont "with respect."
	
	para "It will never grow"
	line "to love you if you"
	cont "keep sending it"
	cont "out into battles"
	cont "it can't win!"
	done

MahoganyCafeTwinText:
	text "I'm not a trainer."
	
	para "I just like coming"
	line "here to look at"
	cont "all of the #MON"
	cont "merchandise."
	done
	
MahoganyCafeSailorText:
	text "Mmm-mm!"
	
	para "I love the food"
	line "here! It's just"
	cont "like my mom used"
	cont "to make!"
	done
	
MahoganyCafeGrampsText:
	text "I have been coming"
	line "to this place ever"
	cont "since it opened."
	
	para "I can't help but"
	line "admire the beauti-"
	cont "ful waitress!"
	done
	
MahoganyCafeChefText:
	text "Are you a trainer?"
	line "I'm sorry, but we"
	cont "only serve food to"
	cont "people here."
	
	para "If you'd like, you"
	line "can get something"
	cont "for your #MON"
	cont "at the bar."
	done
	
MahoganyCafeFisherText:
	text "I always look for-"
	line "ward to the SWEET"
	cont "TEA served here."
	
	para "It really keeps me"
	line "going when I'm out"
	cont "at sea!"
	done
	
MahoganyCafeLassText:
	text "Do you mind? I am"
	line "trying to enjoy a"
	cont "meal with my"
	cont "boyfriend."
	done
	
MahoganyCafeYoungsterText:
	text "I need to stop"
	line "taking my girl-"
	cont "friend out to eat."
	
	para "She can eat so"
	line "much, it is a real"
	cont "pain in my wallet!"
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
	warp_event  5,  7, MAHOGANY_TOWN, 10
	warp_event  4,  7, MAHOGANY_TOWN, 10

	db 0 ; coord events

	db 4 ; bg events
	bg_event 11,  1, BGEVENT_UP, MahoganyCafeVendingMachine
	bg_event 12,  1, BGEVENT_READ, MahoganyCafeFridge
	bg_event 13,  1, BGEVENT_READ, MahoganyCafeFridge
	bg_event  6,  1, BGEVENT_READ, MahoganyCafeTrash

	db 8 ; object events
	object_event  9,  1, SPRITE_CHEF, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyCafeChef, -1
	object_event  0,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyCafeClerkScript, -1
	object_event  2,  1, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyCafeGramps, -1
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyCafeFisher, -1
	object_event 13,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyCafeYoungster, -1
	object_event 10,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyCafeLass, -1
	object_event 12,  7, SPRITE_FOOD, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyCafeSailor, -1
