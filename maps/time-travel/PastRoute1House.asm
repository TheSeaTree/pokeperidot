	const_def 2 ; object constants

PastRoute1House_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DirectBallMerchant:
	faceplayer
	opentext
	writetext DirectBallMerchantSellText
	jump .Start
.PurchaseMore:
	writetext DirectBallMerchantMoreSelection
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .OneBall
	ifequal 2, .TenBalls
	writetext DirectBallMerchantComeBack
	waitbutton
	closetext
	end
	
.OneBall:
	checkmoney YOUR_MONEY, 700
	ifequal HAVE_LESS, .NotEnoughMoney
	itemtotext HEAVY_BALL, MEM_BUFFER_0
	jump .AskToVend1

.TenBalls:
	checkmoney YOUR_MONEY, 7000
	ifequal HAVE_LESS, .NotEnoughMoney
	jump .AskToVend10
	
.AskToVend1:
	writetext DirectBallMerchantBuy1Text
	yesorno
	iffalse .No
	giveitem DIRECT_BALL
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 700
	jump .VendItem
.AskToVend10:
	writetext DirectBallMerchantBuy10Text
	yesorno
	iffalse .No
	giveitem DIRECT_BALL, 10
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 7000
.VendItem
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	itemnotify
	jump .PurchaseMore

.NotEnoughMoney:
	writetext DirectBallMerchantNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext DirectBallMerchantNoSpaceText
	waitbutton
	jump .PurchaseMore
	
.No:
	writetext DirectBallMerchantNo
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
	db "1   ¥700@"
	db "10 ¥7000@"
	db "CANCEL@"

PastRoute1CutKid:
	jumptextfaceplayer PastRoute1CutKidText

PastRoute1HouseEgg:
	jumptext PastRoute1HouseEggText

DirectBallMerchantSellText:
	text "Hello, young one."

	para "You look like a"
	line "trainer, would you"
	cont "be interested in"
	cont "my special kind of"
	cont "# BALL?"

	para "I can sell them"
	line "for ¥700 each."
	done

DirectBallMerchantNoMoneyText:
	text "This is my own"
	line "special design."

	para "I couldn't part"
	line "with any of these"
	cont "for free…"
	done

DirectBallMerchantNoSpaceText:
	text "You haven't any"
	line "space to carry"
	cont "more items."

	para "Come back when you"
	line "can carry more."
	done
	
DirectBallMerchantBuy1Text:
	text "One @"
	text_from_ram wStringBuffer3
	text_start
	line "for ¥700, correct?"
	done	

DirectBallMerchantBuy10Text:
	text "10 DIRECT BALLs"
	line "will come to"
	cont "¥7000, okay?"
	done

DirectBallMerchantNo:
	text "Do you want a"
	line "different amount?"
	done

DirectBallMerchantMoreSelection:
	text "Would you like to"
	line "buy more of them?"
	done

DirectBallMerchantComeBack:
	text "My # BALL will"
	line "ignore how healthy"
	cont "a #MON is when"
	cont "it is thrown."

	para "An invaluable tool"
	line "for a strong"
	cont "trainer such as"
	cont "yourself."
	done

PastRoute1CutKidText:
	text "GRANDPA has taught"
	line "me lots about"
	cont "being direct."

	para "That's why I want"
	line "to raise #MON"
	cont "to make new"
	cont "paths for me!"
	done

PastRoute1HouseEggText:
	text "It's a #MON EGG!"

	para "Wonder what's"
	line "inside? It needs"
	cont "more time, though."
	done

PastRoute1House_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_ROUTE_1, 1
	warp_event 3,  7, PAST_ROUTE_1, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DirectBallMerchant, -1
	object_event  1,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PastRoute1CutKid, -1
	object_event  2,  1, SPRITE_EGG, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PastRoute1HouseEgg, -1
