Route20HeavyBallHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route20HeavyBallGuy:
	faceplayer
	opentext
	checkevent EVENT_HEAVY_BALLS_FOR_SALE
	iftrue .SellBalls
	writetext HeavyBallGuyIntro
	waitbutton
	setevent EVENT_HEAVY_BALLS_FOR_SALE
.SellBalls
	writetext HeavyBallGuySellText
	jump .Start
.PurchaseMore:
	writetext HeavyBallGuyMoreSelection
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .OneBall
	ifequal 2, .TenBalls
	writetext HeavyBallGuyComeBack
	waitbutton
	closetext
	end
	
.OneBall:
	checkmoney YOUR_MONEY, 600
	ifequal HAVE_LESS, .NotEnoughMoney
	itemtotext HEAVY_BALL, MEM_BUFFER_0
	jump .AskToVend1

.TenBalls:
	checkmoney YOUR_MONEY, 6000
	ifequal HAVE_LESS, .NotEnoughMoney
	jump .AskToVend10
	
.AskToVend1:
	writetext HeavyBallGuyBuy1Text
	yesorno
	iffalse .No
	giveitem HEAVY_BALL
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 600
	jump .VendItem
.AskToVend10:
	writetext HeavyBallGuyBuy10Text
	yesorno
	iffalse .No
	giveitem HEAVY_BALL, 10
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 6000
.VendItem
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	itemnotify
	jump .PurchaseMore

.NotEnoughMoney:
	writetext HeavyBallGuyNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext HeavyBallGuyNoSpaceText
	waitbutton
	jump .PurchaseMore
	
.No:
	writetext HeavyBallGuyNo
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
	db "1   ¥600@"
	db "10 ¥6000@"
	db "CANCEL@"

HeavyBallGuyIntro:
	text "How did you get"
	line "here? Did SNORLAX"
	cont "move out of the"
	cont "way?"

	para "Darn! I wanted to"
	line "test out my HEAVY"
	cont "BALL against it!"

	para "Well, I have no"
	line "need for these any"
	cont "more, but they"
	cont "were kind of expe-"
	cont "nsive."
	done

HeavyBallGuySellText:
	text "Would you like to"
	line "buy off some of my"
	cont "HEAVY BALL stock?"

	para "You can have them"
	line "for ¥600 each."
	done
	
HeavyBallGuyNoMoneyText:
	text "I don't think you"
	line "understand how"
	cont "much money I spent"
	cont "on these!"
	
	para "I'm already"
	line "selling them at a"
	cont "loss!"
	done

HeavyBallGuyNoSpaceText:
	text "I think your BAG"
	line "is full. You can't"
	cont "carry any more."
	done
	
HeavyBallGuyBuy1Text:
	text "So one @"
	text_from_ram wStringBuffer3
	text_start
	line "for ¥600, right?"
	done	

HeavyBallGuyBuy10Text:
	text "10 HEAVY BALLS?"
	
	para "That will cost you"
	line "¥6000, okay?"
	done
	
HeavyBallGuyNo:
	text "Do you want a"
	line "different amount?"
	done
	
HeavyBallGuyMoreSelection:
	text "You wanna buy any"
	line "more?"
	done
	
HeavyBallGuyComeBack:
	text "SNORLAX is the"
	line "heaviest #MON"
	cont "known to man."
	
	para "You probably won't"
	line "see another one"
	cont "out in the wild,"
	cont "but a HEAVY BALL"
	cont "will work on other"
	cont "heavy #MON."
	done

Route20HeavyBallHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_16, 3
	warp_event  3,  7, ROUTE_16, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route20HeavyBallGuy, -1
