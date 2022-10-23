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
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .StartPostgame
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RageCandyBar
	ifequal 2, .UltraBall
	ifequal 3, .RareCandy
	closetext
	end

.StartPostgame:
	special PlaceMoneyTopRight
	loadmenu .MenuHeaderPostgame
	verticalmenu
	closewindow
	ifequal 1, .RageCandyBar
	ifequal 2, .UltraBall
	ifequal 3, .RareCandyPostgame
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
	checkmoney YOUR_MONEY, 9800
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RARE_CANDY
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 9800
	itemtotext RARE_CANDY, MEM_BUFFER_0
	jump .VendItem

.RareCandyPostgame:
	checkmoney YOUR_MONEY, 4900
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RARE_CANDY
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 4900
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
	db "RARE CANDY  ¥9800@"
	db "CANCEL@"

.MenuHeaderPostgame:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuDataPostgame
	db 1 ; default option

.MenuDataPostgame:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "RAGECANDYBAR ¥800@"
	db "ULTRA BALL  ¥1200@"
	db "RARE CANDY  ¥4900@"
	db "CANCEL@"

PokemonLeagueCafeChef:
	opentext
	writetext MushroomManIntroductionText
	waitbutton
	checkitem TINYMUSHROOM
	iftrue .HaveMushrooms
.CheckBigMushrooms
	checkitem BIG_MUSHROOM
	iffalse .NoMushrooms
.HaveMushrooms
	writetext MushroomManHaveMushroomsText
	waitbutton
.Selling
	special PlaceMoneyTopRight
	special SelectMushroomForMushroomMan
	ifequal BIG_MUSHROOM, .sell_bigmushroom
	ifequal TINYMUSHROOM, .sell_tinymushroom
	jump .Cancel

.sell_tinymushroom
	checkcode VAR_MUSHROOMS_SOLD
	ifequal 1, .OneTinyMushroom
	writetext SellingTinyMushroomsText
	waitbutton
.loop_tinymushroom
	givemoney YOUR_MONEY, 500
	
	checkcode VAR_MUSHROOMS_SOLD
	addvar -1
	writevarcode VAR_MUSHROOMS_SOLD

	checkcode VAR_MUSHROOMS_SOLD
	checkcode VAR_MUSHROOMS_SOLD
	ifgreater 0, .loop_tinymushroom

	special PlaceMoneyTopRight
	playsound SFX_TRANSACTION
	waitsfx
	checkitem TINYMUSHROOM
	iftrue .Selling
	checkitem BIG_MUSHROOM
	iftrue .Selling
	jump .NoMoreMushrooms

.sell_bigmushroom
	checkcode VAR_MUSHROOMS_SOLD
	ifequal 1, .OneBigMushroom
	writetext SellingBigMushroomsText
	waitbutton
.loop_bigmushroom
	givemoney YOUR_MONEY, 5000
	checkcode VAR_MUSHROOMS_SOLD
	addvar -1
	writevarcode VAR_MUSHROOMS_SOLD

	checkcode VAR_MUSHROOMS_SOLD
	ifgreater 0, .loop_bigmushroom

	special PlaceMoneyTopRight
	playsound SFX_TRANSACTION
	waitsfx
	checkitem TINYMUSHROOM
	iftrue .Selling
	checkitem BIG_MUSHROOM
	iftrue .Selling
.NoMoreMushrooms
	writetext MushroomManThanksText
	waitbutton
	closetext
	end

.OneTinyMushroom
	writetext SellingOneTinyMushroomText
	waitbutton
	jump .loop_tinymushroom

.OneBigMushroom
	writetext SellingOneBigMushroomText
	waitbutton
	jump .loop_bigmushroom

.Cancel
	writetext MushroomManCancelText
	waitbutton
	closetext
	end

.NoMushrooms
	writetext MushroomManNoMushroomsText
	waitbutton
	closetext
	end

PokemonLeagueCafeGymGuyScript:
	jumptextfaceplayer PokemonLeagueCafeGymGuyText

PokemonLeagueCafePokefanFScript:
	jumptextfaceplayer PokemonLeagueCafePokefanFText
	
PokemonLeagueCafeLassScript:
	jumptextfaceplayer PokemonLeagueCafeLassText

PokemonLeagueCafeCooltrainerFScript:
	jumptextfaceplayer PokemonLeagueCafeCooltrainerFText

PokemonLeagueCafeFridge:
	jumptext PokemonLeagueCafeFridgeText
	
PokemonLeagueCafeFood:
	jumptext PokemonLeagueCafeFoodText
	
PokemonLeagueCafeAbandonedFood:
	giveitem TINYMUSHROOM, 20
	giveitem BIG_MUSHROOM, 20
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

MushroomManIntroductionText:
	text "As a CHEF, I am"
	line "always on the"
	cont "lookout for the"
	cont "best ingredients."

	para "I found the most"
	line "flavorful of them"
	cont "all are MUSHROOMs."

	para "BIG or TINY, I am"
	line "looking to buy all"
	cont "that I can."

	para "I'm even willing to"
	line "pay a premium for"
	cont "them!"
	done

MushroomManHaveMushroomsText:
	text "Oh, you have some"
	line "MUSHROOMs to sell"
	cont "me? Let me see!"
	done

SellingOneTinyMushroomText:
	text "Let's see…"
	
	para "One TINYMUSHROOM?"

	para "I'll give you"
	line "¥500 for it."
	done

SellingOneBigMushroomText:
	text "Let's see…"
	
	para "One BIG MUSHROOM?"

	para "I'll give you"
	line "¥5000 for it."
	done

SellingTinyMushroomsText:
	text "Let's see…"
	
	para "@"
	deciram wMushroomQuantity, 1, 2
	text " TINYMUSHROOMs"
	line "for ¥500 apiece?"

	para "Can do!"
	done

SellingBigMushroomsText:
	text "Let's see…"
	
	para "@"
	deciram wMushroomQuantity, 1, 2
	text " BIG MUSHROOMs"
	line "for ¥5000 apiece?"

	para "Can do!"
	done

MushroomManThanksText:
	text "Thank you so much!"

	para "I can tell that my"
	line "dishes will only"
	cont "be improved with"
	cont "this batch!"

	para "I'm your man if you"
	line "come across any"
	cont "more MUSHROOMs!"
	done

MushroomManCancelText:
	text "Oh, okay."

	para "You must want to"
	line "cook them on your"
	cont "own, I understand."

	para "I hope those"
	line "MUSHROOMs turn out"
	cont "well for you!"
	done

MushroomManNoMushroomsText:
	text "Hm… No. That won't"
	line "do!"

	para "I only want to buy"
	line "MUSHROOMs!"

	para "If you find any,"
	line "bring them to me."

	para "I heard PARAS and"
	line "PARASECT can be"
	cont "found holding them"
	cont "sometimes."
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

PokemonLeagueCafeCooltrainerFText:
	text "It's important to"
	line "reward myself and"
	cont "my #MON when"
	cont "they do well."

	para "Hehe!"

	para "That's why I spend"
	line "lots of time here!"
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

	db 8 ; object events
	object_event  9,  1, SPRITE_CHEF, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeagueCafeChef, -1
	object_event  0,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeagueCafeClerkScript, -1
	object_event  2,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeagueCafeGymGuyScript, -1
	object_event 13,  7, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PokemonLeagueCafePokefanFScript, -1
	object_event  2,  1, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokemonLeagueCafeLassScript, -1
	object_event  2,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokemonLeagueCafeCooltrainerFScript, -1
	object_event  7,  5, SPRITE_FOOD, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeagueCafeAbandonedFood, -1
	object_event 12,  7, SPRITE_FOOD, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeagueCafeFood, -1
