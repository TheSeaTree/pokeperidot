Route6SurfersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route6LureBallGuy:
	faceplayer
	opentext
	checkevent EVENT_LURE_BALLS_FOR_SALE
	iftrue .SellBalls
	writetext LureBallGuyIntro
	waitbutton
	writebyte SLOWBRO
	special FindPartyMonThatSpecies
	iffalse .NotSlowbro
	writetext LureBallGuyYesSlowbroText
	waitbutton
	setevent EVENT_LURE_BALLS_FOR_SALE
	jump .SellBalls
	
.NotSlowbro
	writetext LureBallGuyNoSlowbroText
	waitbutton
	turnobject LAST_TALKED, RIGHT
	closetext
	end
	
.SellBalls
	writetext LureBallGuySellText
	jump .Start
.PurchaseMore:
	writetext LureBallGuyMoreSelection
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .OneBall
	ifequal 2, .TenBalls
	writetext LureBallGuyComeBack
	waitbutton
	closetext
	end
	
.OneBall:
	checkmoney YOUR_MONEY, 800
	ifequal HAVE_LESS, .NotEnoughMoney
	itemtotext LURE_BALL, MEM_BUFFER_0
	jump .AskToVend1

.TenBalls:
	checkmoney YOUR_MONEY, 8000
	ifequal HAVE_LESS, .NotEnoughMoney
	jump .AskToVend10
	
.AskToVend1:
	writetext LureBallGuyBuy1Text
	yesorno
	iffalse .No
	giveitem LURE_BALL
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 800
	jump .VendItem
.AskToVend10:
	writetext LureBallGuyBuy10Text
	yesorno
	iffalse .No
	giveitem LURE_BALL, 10
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 8000
.VendItem
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	itemnotify
	jump .PurchaseMore

.NotEnoughMoney:
	writetext LureBallGuyNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext LureBallGuyNoSpaceText
	waitbutton
	jump .PurchaseMore
	
.No:
	writetext LureBallGuyNo
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
	db "1   ¥800@"
	db "10 ¥8000@"
	db "CANCEL@"

LureBallGuyIntro:
	text "Have you ever"
	line "heard of a #MON"
	cont "that fishes with"
	cont "its tail?"
	
	para "Some people say"
	line "SLOWPOKE will do"
	cont "that."
	
	para "Some people even"
	line "say that if a"
	cont "SHELLDER clamps"
	cont "onto a SLOWPOKE's"
	cont "tail, something"
	cont "miraculous will"
	cont "happen!"
	
	para "I'm skeptical as"
	line "to whether or not"
	cont "this is true, but"
	cont "if someone showed"
	cont "me a SLOWBRO in"
	cont "person, I would be"
	cont "grateful."
	done
	
LureBallGuyNoSlowbroText:
	text "Nah, doesn't look"
	line "like you have a"
	cont "SLOWBRO."
	
	para "They look like"
	line "SLOWPOKE, but with"
	cont "a big shell"
	cont "holding onto its"
	cont "tail."
	done

LureBallGuyYesSlowbroText:
	text "Well what do you"
	line "know? A #MON"
	cont "that is a fisher-"
	cont "man just like me!"
	
	para "Since you're its"
	line "trainer, you might"
	cont "find some use in"
	cont "some LURE BALLs."
	
	para "They are great for"
	line "catching any"
	cont "#MON you fished"
	cont "out of the water."
	done
	
LureBallGuySellText:
	text "The going rate for"
	line "my LURE BALLs is"
	cont "¥800 apiece."
	done
	
LureBallGuyNoMoneyText:
	text "Hey kid, you can't"
	line "afford that many!"
	done

LureBallGuyNoSpaceText:
	text "You won't have any"
	line "space for those."
	done
	
LureBallGuyBuy1Text:
	text "A @"
	text_from_ram wStringBuffer3
	text_start
	line "will cost ¥800,"
	cont "okay?"
	done	

LureBallGuyBuy10Text:
	text "10 LURE BALLs will"
	line "cost ¥8000, okay?"
	done
	
LureBallGuyNo:
	text "Do you want a"
	line "different amount?"
	done
	
LureBallGuyMoreSelection:
	text "You wanna buy any"
	line "more?"
	done
	
LureBallGuyComeBack:
	text "I can tell you and"
	line "your SLOWBRO are"
	cont "going to make it"
	cont "big in the fishing"
	cont "world, kid."
	
	para "Especially with"
	line "the help of my"
	cont "LURE BALLs!"
	done

Route6SurfersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_6, 2
	warp_event  3,  7, ROUTE_6, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route6LureBallGuy, -1
