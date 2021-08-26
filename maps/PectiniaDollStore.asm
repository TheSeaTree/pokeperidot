	const_def 2 ; object constants

PectiniaDollStore_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CarpetGuy:
	faceplayer
	opentext
	writetext CarpetSalesmanIntroText
.Start
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Red
	ifequal 2, .Blue
	ifequal 3, .Yellow
	ifequal 4, .Green
	jump .ChangeBack

.Red
	checkevent EVENT_DECO_CARPET_1
	iftrue .AlreadyHave
	changeblock  4,  0, $3e
	changeblock  6,  0, $3e
	changeblock  8,  0, $3e
	changeblock  4,  2, $3f
	changeblock  6,  2, $3f
	changeblock  8,  2, $3f
	changeblock  8,  4, $3f
	changeblock  6,  4, $3f
	changeblock  4,  4, $40
	reloadmappart
	writetext CarpetSalesmanAskBuyText
	special PlaceMoneyTopRight
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 6000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 6000
	setevent EVENT_DECO_CARPET_1
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	jump .BuyAnother

.Blue
	checkevent EVENT_DECO_CARPET_2
	iftrue .AlreadyHave
	changeblock  4,  0, $41
	changeblock  6,  0, $41
	changeblock  8,  0, $41
	changeblock  4,  2, $42
	changeblock  6,  2, $42
	changeblock  8,  2, $42
	changeblock  8,  4, $42
	changeblock  6,  4, $42
	changeblock  4,  4, $43
	reloadmappart
	writetext CarpetSalesmanAskBuyText
	special PlaceMoneyTopRight
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 6000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 6000
	setevent EVENT_DECO_CARPET_2
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	jump .BuyAnother

.Yellow
	checkevent EVENT_DECO_CARPET_3
	iftrue .AlreadyHave
	changeblock  4,  0, $44
	changeblock  6,  0, $44
	changeblock  8,  0, $44
	changeblock  4,  2, $45
	changeblock  6,  2, $45
	changeblock  8,  2, $45
	changeblock  8,  4, $45
	changeblock  6,  4, $45
	changeblock  4,  4, $46
	reloadmappart
	writetext CarpetSalesmanAskBuyText
	special PlaceMoneyTopRight
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 6000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 6000
	setevent EVENT_DECO_CARPET_3
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	jump .BuyAnother

.Green
	checkevent EVENT_DECO_CARPET_4
	iftrue .AlreadyHave
	changeblock  4,  0, $47
	changeblock  6,  0, $47
	changeblock  8,  0, $47
	changeblock  4,  2, $48
	changeblock  6,  2, $48
	changeblock  8,  2, $48
	changeblock  8,  4, $48
	changeblock  6,  4, $48
	changeblock  4,  4, $49
	reloadmappart
	writetext CarpetSalesmanAskBuyText
	special PlaceMoneyTopRight
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 6000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 6000
	setevent EVENT_DECO_CARPET_4
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	jump .BuyAnother
	
.SomethingElse	
	writetext CarpetSalesmanDeclineText
	waitbutton
	jump .Start
	
.BuyAnother
	special FadeOutPalettes
	changeblock  4,  0, $2f
	changeblock  6,  0, $2f
	changeblock  8,  0, $2f
	changeblock  4,  2, $2e
	changeblock  6,  2, $2e
	changeblock  8,  2, $2e
	changeblock  8,  4, $2e
	changeblock  6,  4, $2e
	changeblock  4,  4, $2d
	reloadmappart
	special FadeInPalettes
	writetext CarpetSalesmanBuyAnotherText
	waitbutton
	jump .Start
	
.ComeAgain
	writetext CarpetSalesmanComeAgainText
	waitbutton
	jump .ChangeBack
	
.NotEnoughMoney
	writetext CarpetSalesmanNotEnoughMoneyText
	waitbutton
.ChangeBack
	special FadeOutPalettes
	changeblock  4,  0, $2f
	changeblock  6,  0, $2f
	changeblock  8,  0, $2f
	changeblock  4,  2, $2e
	changeblock  6,  2, $2e
	changeblock  8,  2, $2e
	changeblock  8,  4, $2e
	changeblock  6,  4, $2e
	changeblock  4,  4, $2d
	special FadeInPalettes
.no
	closetext
	end
	
.AlreadyHave
	writetext CarpetSalesmanAlreadyOwnText
	jump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 8, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 5 ; items
	db "RED@"
	db "BLUE@"
	db "YELLOW@"
	db "GREEN@"
	db "CANCEL@"

BigDollSalesmanIntroText:
	text "Hello!"
	
	para "If you would like"
	line "to purchase a BIG"
	cont "DOLL, please let"
	cont "me know."
	done
	
BigDollSalesmanAlreadyHaveText:
	text "Are you sure you"
	line "have the space for"
	cont "another one of"
	cont "those?"
	done
	
BigDollSalesmanBuyText:
	text "Would you like the"
	line "BIG @"
	text_ram wStringBuffer3
	text " DOLL?"
	
	para "It costs ¥12000."
	done

BigDollSalesmanDeclineText:
	text "You're welcome to"
	line "browse as much as"
	cont "you like."
	done

CarpetSalesmanIntroText:
	text "Welcome!"
	
	para "Would you like to"
	line "see our selection"
	cont "of CARPETs?"
	done

CarpetSalesmanAskBuyText:
	text "Would you like to"
	line "take this one"
	cont "home with you?"
	
	para "It only costs"
	line "¥6000."
	done
	
CarpetSalesmanBuyAnotherText:
	text "Here you go!"
	
	para "Would you like to"
	line "see other CARPETs?"
	done
	
CarpetSalesmanDeclineText:
	text "That's okay!"
	
	para "Would you like to"
	line "see another?"
	done 

CarpetSalesmanNotEnoughMoneyText:
	text "…Oh, sorry!"
	
	para "You can't afford"
	line "that CARPET."
	
	para "Please come back later."
	done
	
CarpetSalesmanAlreadyOwnText:
	text "You bought that"
	line "CARPET already,"
	cont "didn't you?"
	
	para "Did you mean a"
	line "different one?"
	done

CarpetSalesmanComeAgainText:
	text "Come again!"
	done

PectiniaDollStore_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  5, PECTINIA_TRAIN_STATION, 5
	warp_event  5,  5, PECTINIA_TRAIN_STATION, 5

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  9,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CarpetGuy, -1
	object_event  6,  1, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  4, SPRITE_BIG_ONIX, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
