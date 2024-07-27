	const_def 2 ; object constants

PavonaOasis_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PavonaOasisLevelBallGuy:
	faceplayer
	opentext
	checkevent EVENT_LEVEL_BALLS_FOR_SALE
	iftrue .SellBalls
	writetext LevelBallGuyIntro
	waitbutton
	checkcode VAR_DEXCAUGHT
	ifgreater 99, .EnoughMons
	writetext LevelBallGuyNotEnoughMonsText
	waitbutton
	closetext
	end

.EnoughMons
	writetext LevelBallGuyEnoughMonsText
	waitbutton
	setevent EVENT_LEVEL_BALLS_FOR_SALE
.SellBalls
	writetext LevelBallGuySellText
	jump .Start
.PurchaseMore:
	writetext LevelBallGuyMoreSelection
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .OneBall
	ifequal 2, .TenBalls
	writetext LevelBallGuyComeBack
	waitbutton
	closetext
	end

.OneBall:
	checkmoney YOUR_MONEY, 900
	ifequal HAVE_LESS, .NotEnoughMoney
	itemtotext LEVEL_BALL, MEM_BUFFER_0
	jump .AskToVend1

.TenBalls:
	checkmoney YOUR_MONEY, 9000
	ifequal HAVE_LESS, .NotEnoughMoney
	jump .AskToVend10
	
.AskToVend1:
	writetext LevelBallGuyBuy1Text
	yesorno
	iffalse .No
	giveitem LEVEL_BALL
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 900
	jump .VendItem
.AskToVend10:
	writetext LevelBallGuyBuy10Text
	yesorno
	iffalse .No
	giveitem LEVEL_BALL, 10
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 9000
.VendItem
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	itemnotify
	jump .PurchaseMore

.NotEnoughMoney:
	writetext LevelBallGuyNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext LevelBallGuyNoSpaceText
	waitbutton
	jump .PurchaseMore
	
.No:
	writetext LevelBallGuyNo
	waitbutton
	jump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 10, TEXTBOX_Y - 2
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "1   ¥900@"
	db "10 ¥9000@"
	db "CANCEL@"

PavonaOasisItemBush:
	itembush FRUITTREE_PAVONA_OASIS

PavonaOasisWaterStone:
	itemball WATER_STONE

PavonaOasisMysticWater:
	itemball MYSTIC_WATER
	
PavonaOasisHiddenXSpAtk:
	hiddenitem X_SP_ATK, EVENT_PAVONA_OASIS_HIDDEN_X_SP_ATK

LevelBallGuyIntro:
	text "I love collecting"
	line "#MON!"

	para "But my #MON are"
	line "all too strong to"
	cont "battle the wild"
	cont "#MON in some of"
	cont "these routes."

	para "Do you have the"
	line "same problem?"
	done

LevelBallGuyEnoughMonsText:
	text "I have just the"
	line "thing for you,"
	cont "fellow collector!"
	done

LevelBallGuyNotEnoughMonsText:
	text "Hm…"

	para "I don't think you"
	line "have collected"
	cont "enough different"
	cont "kinds of #MON."

	para "When you have"
	line "caught at least"
	cont "100 #MON, come"
	cont "see me again."
	done

LevelBallGuySellText:
	text "LEVEL BALLs work"
	line "better on weaker"
	cont "#MON, the weak-"
	cont "er, the better."
	
	para "Let's see"
	line "¥900 sounds like a"
	cont "fair price, right?" 
	done

LevelBallGuyNoMoneyText:
	text "Oh… You don't have"
	line "that kind of money"
	cont "on you…"
	
	para "Did you misspeak?"
	done

LevelBallGuyNoSpaceText:
	text "I think you might"
	line "be collecting too"
	cont "many #MON. Your"
	cont "PACK is stuffed!"
	done

LevelBallGuyBuy1Text:
	text "Only one LEVEL"
	line "BALL?"
	
	para "That will be ¥900."
	line "Is that fine?"
	done

LevelBallGuyBuy10Text:
	text "You want 10 LEVEL"
	line "BALLs for ¥9000?"
	done

LevelBallGuyNo:
	text "Did you mean some-"
	line "thing else?"
	done

LevelBallGuyMoreSelection:
	text "Thank you!"
	
	para "Did you need any"
	line "more?"
	done

LevelBallGuyComeBack:
	text "You gotta show me"
	line "your collection"
	cont "some time, now"
	cont "that you're all"
	cont "stocked up on"
	cont "supplies!"

	para "I hope you find"
	line "some cool stuff to"
	cont "show me!"
	done

PavonaOasis_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 14, 23, PAVONA_OASIS_CAVE_1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 30, 11, BGEVENT_ITEM, PavonaOasisHiddenXSpAtk

	db 4 ; object events
	object_event 30, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaOasisLevelBallGuy, -1
	object_event  9, 34, SPRITE_BUSH, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaOasisItemBush, -1
	object_event 24, 35, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PavonaOasisWaterStone, EVENT_PAVONA_OASIS_WATER_STONE
	object_event  4,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PavonaOasisMysticWater, EVENT_PAVONA_OASIS_MYSTIC_WATER
