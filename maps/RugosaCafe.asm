	const_def 2 ; object constants
	const MAHOGANYCAFE_CLERK
	const MAHOGANYCAFE_SLOWPOKE
	const MAHOGANYCAFE_GRANNY
	const MAHOGANYCAFE_COOLTRAINER_M

RugosaCafe_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Tiles
	
.Tiles:
	changeblock   6, 4, $3e
	changeblock  10, 6, $41
	changeblock  12, 6, $3f
	return

RugosaCafeClerkScript:
	opentext
	pokemart MARTTYPE_DRINKS, MART_MAHOGANY
	closetext
	end

RugosaCafeVendingMachine:
	opentext
	writetext RugosaCafeVendingText
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
	writetext RugosaCafeClangText
	buttonsound
	itemnotify
	writetext RugosaCafeAnythingElseText
	jump .Start

.NotEnoughMoney:
	writetext RugosaCafeVendingNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext RugosaCafeVendingNoSpaceText
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

RugosaCafeCooltrainerM:
	jumptextfaceplayer RugosaCafeCooltrainerMText

RugosaCafeBeauty:
	jumptextfaceplayer RugosaCafeBeautyText

RugosaCafeYoungster:
	jumptextfaceplayer RugosaCafeYoungsterText
	
RugosaCafeSailor:
	jumptextfaceplayer RugosaCafeSailorText
	
RugosaCafeScientist:
	jumptextfaceplayer RugosaCafeScientistText
	
RugosaCafeChef:
	opentext
	writetext RugosaCafeChefIntroText
	waitbutton
	checkflag ENGINE_BOUGHT_SLOWPOKETAIL_TODAY
	iftrue .OutOfStock
	writetext RugosaCafeChefAskBuyText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Decline
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem SLOWPOKETAIL
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 5000
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	itemnotify
	setflag ENGINE_BOUGHT_SLOWPOKETAIL_TODAY
	jump .CheckBackTomorrow

.OutOfStock
	writetext RugosaCafeChefOutOfStockText
	waitbutton
.CheckBackTomorrow
	writetext RugosaCafeChefCheckBackTomorrowText
	waitbutton
	closetext
	end

.NotEnoughSpace:
	writetext RugosaCafeChefNoSpaceText
	waitbutton
.Decline
	writetext RugosaCafeChefDeclineText
	waitbutton
	closetext
	end

.NotEnoughMoney
	writetext RugosaCafeChefNoMoneyText
	waitbutton
	closetext
	end

RugosaCafeSlowpoke:
	opentext
	writetext RugosaCafeSlowpokeText1
	pause 60
	writetext RugosaCafeSlowpokeText2
	cry SLOWPOKE
	waitbutton
	checkflag ENGINE_BOUGHT_SLOWPOKETAIL_TODAY
	iftrue .TailMissing
	closetext
	end

.TailMissing
	writetext RugosaCafeSlowpokeTailMissingText
	waitbutton
	closetext
	end

RugosaCafeFridge:
	jumptext RugosaCafeFridgeText

RugosaCafeLeftovers:
	hiddenitem LEFTOVERS, EVENT_MAHOGANY_HIDDEN_LEFTOVERS

RugosaCafeTrash:
	jumptext RugosaCafeTrashText
	
RugosaCafeVendingText:
	text "A vending machine!"
	line "Here's the menu."
	done

RugosaCafeClangText:
	text "Clang!"

	para "@"
	text_from_ram wStringBuffer3
	text_start
	line "popped out."
	done
	
RugosaCafeAnythingElseText:
	text "Anything else?"
	done
	
RugosaCafeVendingNoMoneyText:
	text "Oops, not enough"
	line "money…"
	done

RugosaCafeVendingNoSpaceText:
	text "There's no more"
	line "room for stuff…"
	done

RugosaCafeSailorText:
	text "This place can be"
	line "quite busy some-"
	cont "times, but the"
	cont "food they serve is"
	cont "worth the wait!"
	done
	
RugosaCafeScientistText:
	text "These drinks taste"
	line "much better than"
	cont "the ones sold in"
	cont "the POWER PLANT's"
	cont "machines."
	
	para "It must be the"
	line "glass bottles."
	done
	
RugosaCafeChefIntroText:
	text "This establishment"
	line "does not serve"
	cont "food to #MON."

	para "However, I do sell"
	line "ethically-sourced"
	cont "SLOWPOKETAIL."
	done

RugosaCafeChefAskBuyText:
	text "Would you like to"
	line "buy one?"

	para "It will cost"
	line "¥5000."
	done

RugosaCafeChefOutOfStockText:
	text "…Unfortunately, I"
	line "don't have any more"
	cont "to sell today."
	done

RugosaCafeChefCheckBackTomorrowText:
	text "Check back"
	line "tomorrow for more."

	para "I want to give"
	line "SLOWPOKE enough"
	cont "time to grow back"
	cont "its tail."
	done

RugosaCafeChefNoMoneyText:
	text "I'm sorry, I can't"
	line "afford to lower"
	cont "the price any"
	cont "further than that."

	para "SLOWPOKETAIL is"
	line "simply too rare."
	done

RugosaCafeChefNoSpaceText:
	text "You can't carry any"
	line "more items."

	para "You'd better hurry"
	line "and make room."
	done

RugosaCafeChefDeclineText:
	text "I can't promise"
	line "that I won't sell"
	cont "out today."
	done

RugosaCafeCooltrainerMText:
	text "I make sure to buy"
	line "a few extra drinks"
	cont "every time I come"
	cont "here."
	
	para "I give them to my"
	line "#MON as treats!"
	done
	
RugosaCafeBeautyText:
	text "My boyfriend likes"
	line "to take me here,"
	cont "but it's always"
	cont "busy."
	
	para "I don't want to"
	line "wait so long when"
	cont "I'm this hungry!"
	done
	
RugosaCafeYoungsterText:
	text "This is my favor-"
	line "ite place to sit."
	
	para "I can see everyone"
	line "who enters while I"
	cont "eat."

	para "It's fun to see all"
	line "the different"
	cont "kinds of tourists!"
	done

RugosaCafeSlowpokeText1:
	text "SLOWPOKE: …"

	para "<……> <……> <……>"
	done

RugosaCafeSlowpokeText2:
	text "<……> <……>Yawn?"
	done

RugosaCafeSlowpokeTailMissingText:
	text "SLOWPOKE's tail"
	line "seems to be miss-"
	cont "ing."
	done

RugosaCafeFridgeText:
	text "It's stocked full"
	line "of fresh seafood"
	cont "and salads."
	done
	
RugosaCafeTrashText:
	text "There's nothing"
	line "but trash here."
	done
	
RugosaCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, RUGOSA_CITY, 10
	warp_event  5,  7, RUGOSA_CITY, 10

	db 0 ; coord events

	db 5 ; bg events
	bg_event 11,  1, BGEVENT_UP, RugosaCafeVendingMachine
	bg_event 12,  1, BGEVENT_READ, RugosaCafeFridge
	bg_event 13,  1, BGEVENT_READ, RugosaCafeFridge
	bg_event  6,  1, BGEVENT_ITEM, RugosaCafeLeftovers
	bg_event  6,  1, BGEVENT_READ, RugosaCafeTrash

	db 10 ; object events
	object_event  9,  1, SPRITE_CHEF, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaCafeChef, -1
	object_event  8,  1, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaCafeSlowpoke, -1
	object_event  0,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaCafeClerkScript, -1
	object_event  2,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RugosaCafeScientist, -1
	object_event  2,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RugosaCafeCooltrainerM, -1
	object_event  9,  4, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RugosaCafeBeauty, -1
	object_event 13,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RugosaCafeYoungster, -1
	object_event 12,  7, SPRITE_FOOD, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RugosaCafeSailor, -1
