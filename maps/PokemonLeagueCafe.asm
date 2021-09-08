	const_def 2 ; object constants

PokemonLeagueCafe_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Tiles
	
.Tiles:
	changeblock   8, 4, $38
	changeblock  10, 6, $41
	changeblock  12, 6, $3f
	return

PokemonLeagueCafeClerkScript:
	opentext
	pokemart MARTTYPE_DRINKS, MART_POKEMON_LEAGUE_CAFE
	closetext
	end

PokemonLeagueCafeVendingMachine:
	opentext
	writetext PokemonLeagueCafeVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RageCandyBar
	ifequal 2, .UltraBall
	ifequal 3, .RareCandy
	closetext
	end

.RageCandyBar:
	checkmoney YOUR_MONEY, 800
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RAGECANDYBAR
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 800
	itemtotext RAGECANDYBAR, MEM_BUFFER_0
	jump .VendItem
	
.UltraBall:
	checkmoney YOUR_MONEY, 1200
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem ULTRA_BALL
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 1200
	itemtotext ULTRA_BALL, MEM_BUFFER_0
	jump .VendItem

.RareCandy:
	checkmoney YOUR_MONEY, 4800
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RARE_CANDY
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 4800
	itemtotext RARE_CANDY, MEM_BUFFER_0
	jump .VendItem
	
.VendItem:
	special PlaceMoneyTopRight
	pause 10
	playsound SFX_ENTER_DOOR
	writetext PokemonLeagueCafeClangText
	buttonsound
	itemnotify
	writetext PokemonLeagueCafeAnythingElseText
	jump .Start

.NotEnoughMoney:
	writetext PokemonLeagueCafeVendingNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext PokemonLeagueCafeVendingNoSpaceText
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
	db "RAGECANDYBAR ¥800@"
	db "ULTRA BALL  ¥1200@"
	db "RARE CANDY  ¥4800@"
	db "CANCEL@"

PokemonLeagueCafeChef:
	jumptextfaceplayer PokemonLeagueCafeChefText

PokemonLeagueCafeGymGuyScript:
	jumptextfaceplayer PokemonLeagueCafeGymGuyText

PokemonLeagueCafePokefanFScript:
	jumptextfaceplayer PokemonLeagueCafePokefanFText
	
PokemonLeagueCafeLassScript:
	jumptextfaceplayer PokemonLeagueCafeLassText

PokemonLeagueCafeFridge:
	jumptext PokemonLeagueCafeFridgeText
	
PokemonLeagueCafeFood:
	jumptext PokemonLeagueCafeFoodText
	
PokemonLeagueCafeAbandonedFood:
	jumptext PokemonLeagueCafeAbandonedFoodText

PokemonLeagueCafeTrash:
	jumptext PokemonLeagueCafeTrashText
	
PokemonLeagueCafeVendingText:
	text "A vending machine!"
	line "Here's the menu."
	done

PokemonLeagueCafeClangText:
	text "Clang!"

	para "@"
	text_from_ram wStringBuffer3
	text_start
	line "popped out."
	done
	
PokemonLeagueCafeAnythingElseText:
	text "Anything else?"
	done
	
PokemonLeagueCafeVendingNoMoneyText:
	text "Oops, not enough"
	line "money…"
	done

PokemonLeagueCafeVendingNoSpaceText:
	text "There's no more"
	line "room for stuff…"
	done

PokemonLeagueCafeChefText:
	text "Hey! What can I"
	line "get you?"
	
	para "……………"
	
	para "I don't make any"
	line "#MON food, but"
	cont "our bar serves"
	cont "lots of drinks"
	cont "that #MON find"
	cont "delicious!"
	done

PokemonLeagueCafeGymGuyText:
	text "Yo! Champ in the"
	line "making!"
	
	para "How has the"
	line "#MON LEAGUE"
	cont "been treating you?"
	
	para "Come take a"
	line "break and have a"
	cont "bite to eat before"
	cont "challenging the"
	cont "ELITE FOUR!"
	done

PokemonLeagueCafePokefanFText:
	text "I'm taking a well-"
	line "deserved break be-"
	cont "fore I visit the"
	cont "#MON LEAGUE"
	cont "tower."
	
	para "The trainers I saw"
	line "on the S.S.MAKO"
	cont "were already so"
	cont "strong, I'm afraid"
	cont "of how powerful"
	cont "the ELITE FOUR"
	cont "will be."
	done

PokemonLeagueCafeLassText:
	text "Hi there!"

	para "……………"

	para "Oh, I'm not a"
	line "competitor."

	para "My dad is a chef"
	line "here, so I can"
	cont "come see strong"
	cont "trainers from all"
	cont "over."

	para "So where are you"
	line "from?"

	para "……………"

	para "ELKHORN TOWN?"

	para "Wow! I never expe-"
	line "cted to meet some-"
	cont "one from such a"
	cont "small town here!"
	done

PokemonLeagueCafeFridgeText:
	text "It's stocked full"
	line "of fresh seafood"
	cont "and salads."
	done
	
PokemonLeagueCafeFoodText:
	text "This food smells"
	line "delicious!"
	
	para "It looks good too!"
	done

PokemonLeagueCafeAbandonedFoodText:
	text "How could somebody"
	line "leave such a good"
	cont "meal like this?"
	
	para "What a waste…"
	done

PokemonLeagueCafeTrashText:
	text "There's nothing"
	line "but trash here."
	done
	
PokemonLeagueCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  7, POKEMON_LEAGUE, 5
	warp_event  4,  7, POKEMON_LEAGUE, 5

	db 0 ; coord events

	db 4 ; bg events
	bg_event 11,  1, BGEVENT_UP, PokemonLeagueCafeVendingMachine
	bg_event 12,  1, BGEVENT_READ, PokemonLeagueCafeFridge
	bg_event 13,  1, BGEVENT_READ, PokemonLeagueCafeFridge
	bg_event  6,  1, BGEVENT_READ, PokemonLeagueCafeTrash

	db 7 ; object events
	object_event  9,  1, SPRITE_CHEF, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeagueCafeChef, -1
	object_event  0,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeagueCafeClerkScript, -1
	object_event  2,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeagueCafeGymGuyScript, -1
	object_event 13,  7, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PokemonLeagueCafePokefanFScript, -1
	object_event  2,  1, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokemonLeagueCafeLassScript, -1
	object_event  7,  5, SPRITE_FOOD, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeagueCafeAbandonedFood, -1
	object_event 12,  7, SPRITE_FOOD, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeagueCafeFood, -1
