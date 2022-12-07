	const_def 2 ; object constants

PectiniaCarpetStore_MapScripts:
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
	jump .ComeAgain

.Red
	checkevent EVENT_DECO_CARPET_1
	iftrue .AlreadyHave
	changeblock  4,  0, $3e
	changeblock  0,  2, $6a
	changeblock  2,  2, $6b
	changeblock  4,  2, $09
	changeblock  6,  2, $46
	changeblock  0,  4, $6e
	changeblock  2,  4, $6f
	changeblock  6,  4, $09
	changeblock  8,  2, $47
	changeblock  8,  4, $09
	changeblock  4,  4, $3f
	reloadmappart
	writetext CarpetSalesmanAskBuyText
	special PlaceMoneyTopRight
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 6000
	ifequal HAVE_LESS, .NotEnoughMoney
	setevent EVENT_DECO_CARPET_1
	jump .BuyAnother

.Blue
	checkevent EVENT_DECO_CARPET_2
	iftrue .AlreadyHave
	changeblock  4,  0, $40
	changeblock  0,  2, $6c
	changeblock  2,  2, $6d
	changeblock  4,  2, $0c
	changeblock  4,  2, $0c
	changeblock  6,  2, $48
	changeblock  0,  4, $70
	changeblock  2,  4, $71
	changeblock  6,  4, $0c
	changeblock  8,  2, $49
	changeblock  8,  4, $0c
	changeblock  4,  4, $41
	reloadmappart
	writetext CarpetSalesmanAskBuyText
	special PlaceMoneyTopRight
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 6000
	ifequal HAVE_LESS, .NotEnoughMoney
	setevent EVENT_DECO_CARPET_2
	jump .BuyAnother

.Yellow
	checkevent EVENT_DECO_CARPET_3
	iftrue .AlreadyHave
	changeblock  4,  0, $42
	changeblock  0,  2, $72
	changeblock  2,  2, $73
	changeblock  4,  2, $0f
	changeblock  6,  2, $4a
	changeblock  0,  4, $76
	changeblock  2,  4, $77
	changeblock  6,  4, $0f
	changeblock  8,  2, $4b
	changeblock  8,  4, $0f
	changeblock  4,  4, $43
	reloadmappart
	writetext CarpetSalesmanAskBuyText
	special PlaceMoneyTopRight
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 6000
	ifequal HAVE_LESS, .NotEnoughMoney
	setevent EVENT_DECO_CARPET_3
	jump .BuyAnother

.Green
	checkevent EVENT_DECO_CARPET_4
	iftrue .AlreadyHave
	changeblock  4,  0, $44
	changeblock  0,  2, $74
	changeblock  2,  2, $75
	changeblock  4,  2, $12
	changeblock  6,  2, $4c
	changeblock  0,  4, $78
	changeblock  2,  4, $79
	changeblock  6,  4, $12
	changeblock  8,  2, $4d
	changeblock  8,  4, $12
	changeblock  4,  4, $45
	reloadmappart
	writetext CarpetSalesmanAskBuyText
	special PlaceMoneyTopRight
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 6000
	ifequal HAVE_LESS, .NotEnoughMoney
	setevent EVENT_DECO_CARPET_4
	jump .BuyAnother
	
.SomethingElse	
	writetext CarpetSalesmanDeclineText
	waitbutton
	jump .Start

.BuyAnother
	takemoney YOUR_MONEY, 6000
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	writetext CarpetSalesmanBoughtText
	waitbutton
	special FadeOutPalettes
	pause 5
;	playsound SFX_WARP_TO
	changeblock  4,  0, $67
	changeblock  0,  2, $4e
	changeblock  2,  2, $68
	changeblock  4,  2, $2e
	changeblock  6,  2, $34
	changeblock  0,  4, $50
	changeblock  2,  4, $51
	changeblock  6,  4, $2e
	changeblock  8,  2, $35
	changeblock  8,  4, $2e
	changeblock  4,  4, $2d
	reloadmappart
;	waitsfx
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

PectiniaCarpetStoreBeauty:
	jumptextfaceplayer PectiniaCarpetStoreBeautyText

PectiniaCarpetStoreCooltrainerM:
	jumptextfaceplayer PectiniaCarpetStoreCooltrainerMText

PectiniaCarpetStoreSamples:
	jumptext PectiniaCarpetStoreSamplesText

PectiniaCarpetStorePaintShelf:
	jumptext PectiniaCarpetStorePaintShelfText

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

CarpetSalesmanBoughtText:
	text "Allow me to"
	line "package that up"
	cont "for you."
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

CarpetSalesmanComeAgainText:
	text "Please see me for"
	line "any of your"
	cont "flooring needs."
	done

CarpetSalesmanNotEnoughMoneyText:
	text "…Oh, sorry!"

	para "You can't afford"
	line "that CARPET."

	para "Please come back"
	line "later."
	done
	
CarpetSalesmanAlreadyOwnText:
	text "You bought that"
	line "CARPET already,"
	cont "didn't you?"
	
	para "Did you mean a"
	line "different one?"
	done

PectiniaCarpetStoreBeautyText:
	text "My boyfriend just"
	line "doesn't get inter-"
	cont "ior design!"

	para "The shades he"
	line "picks out are"
	cont "never the right"
	cont "ones for our home!"
	done

PectiniaCarpetStoreCooltrainerMText:
	text "My girlfriend"
	line "always disagrees"
	cont "with the CARPET I"
	cont "pick out."
	
	para "She can be so"
	line "stubborn!"
	done

PectiniaCarpetStoreSamplesText:
	text "This rack has all"
	line "kinds of CARPET"
	cont "samples on it."
	done

PectiniaCarpetStorePaintShelfText:
	text "The shelves are"
	line "lined with all"
	cont "different shades"
	cont "of paint cans."
	done

PectiniaCarpetStore_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  5, PECTINIA_MALL, 6
	warp_event  5,  5, PECTINIA_MALL, 6

	db 0 ; coord events

	db 7 ; bg events
	bg_event  0,  1, BGEVENT_UP, PectiniaCarpetStoreSamples
	bg_event  1,  1, BGEVENT_UP, PectiniaCarpetStoreSamples
	bg_event  3,  1, BGEVENT_UP, PectiniaCarpetStoreSamples
	bg_event  4,  1, BGEVENT_UP, PectiniaCarpetStoreSamples
	bg_event  2,  1, BGEVENT_UP, PectiniaCarpetStorePaintShelf
	bg_event  1,  4, BGEVENT_UP, PectiniaCarpetStorePaintShelf
	bg_event  2,  4, BGEVENT_UP, PectiniaCarpetStorePaintShelf

	db 3 ; object events
	object_event  7,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CarpetGuy, -1
	object_event  8,  4, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaCarpetStoreBeauty, -1
	object_event  9,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaCarpetStoreCooltrainerM, -1
