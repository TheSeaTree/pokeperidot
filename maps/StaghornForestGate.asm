	const_def 2 ; object constants

StaghornForestGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

StaghornForestGateBerryVendor:
	opentext
	writetext BerryVendorText
	waitbutton
	writetext BerryVendorSelection
	jump .Start
.PurchaseMore:
	writetext BerryVendorMoreSelection
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .MintBerry
	ifequal 2, .PrzCureBerry
	ifequal 3, .PsnCureBerry
	writetext BerryVendorComeBack
	waitbutton
	closetext
	end

.MintBerry:
	checkmoney YOUR_MONEY, 650
	ifequal HAVE_LESS, .NotEnoughMoney
	itemtotext MINT_BERRY, MEM_BUFFER_0
	writetext BerryVendorYesNoText
	yesorno
	iffalse .No
	giveitem MINT_BERRY
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 650
	jump .VendItem
	
.PrzCureBerry:
	checkmoney YOUR_MONEY, 650
	ifequal HAVE_LESS, .NotEnoughMoney
	itemtotext PRZCUREBERRY, MEM_BUFFER_0
	writetext BerryVendorYesNoText
	yesorno
	iffalse .No
	giveitem PRZCUREBERRY
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 650
	jump .VendItem

.PsnCureBerry:
	checkmoney YOUR_MONEY, 650
	ifequal HAVE_LESS, .NotEnoughMoney
	itemtotext PSNCUREBERRY, MEM_BUFFER_0
	writetext BerryVendorYesNoText
	yesorno
	iffalse .No
	giveitem PSNCUREBERRY
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 650

.VendItem
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
;	writetext PlayerBoughtBerry
;	buttonsound
	itemnotify
	jump .PurchaseMore

.NotEnoughMoney:
	writetext BerryVendorNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext BerryVendorNoSpaceText
	waitbutton
	jump .PurchaseMore
	
.No:
	writetext BerryVendorNo
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
	db "MINT BERRY   ¥650@"
	db "PRZCUREBERRY ¥650@"
	db "PSNCUREBERRY ¥650@"
	db "CANCEL@"

StaghornForestGateOfficerScript:
	jumptext StaghornForestGateOfficerText

StaghornForestGateTeacher:
	jumptextfaceplayer StaghornForestGateTeacherText

BerryVendorText:
	text "Hello there!"
	
	para "I'm selling"
	line "BERRIES."
	
	para "They are all fresh"
	line "off the vine, and"
	cont "have medicinal"
	cont "benefits as well."
	done
	
BerryVendorSelection:
	text "Would you like to"
	line "purchase any?"
	done
	
BerryVendorMoreSelection:
	text "Would you like to"
	line "purchase any more?"
	done
	
BerryVendorNoMoneyText:
	text "I'm sorry, dearie,"
	line "but you don't have"
	cont "enough money for"
	cont "that."
	done

BerryVendorNoSpaceText:
	text "It seems like you"
	line "can't carry any"
	cont "more of that item."
	done
	
BerryVendorYesNoText:
	text "A @"
	text_from_ram wStringBuffer3
	text_start
	line "will cost ¥650,"
	cont "okay?"
	done
	
PlayerBoughtBerry:
	text "<PLAYER> bought"
	line "a @"
	text_from_ram wStringBuffer3
	text_start
	done
	
BerryVendorNo:
	text "You don't want"
	line "that BERRY?"

	para "Would you like any"
	line "other BERRIES?"
	done
	
BerryVendorComeBack:
	text "Take care, dearie."
	
	para "And come back"
	line "soon."
	done
	
StaghornForestGateOfficerText:
	text "You must be going"
	line "to STAGHORN TOWN."
	
	para "Or perhaps you are"
	line "going to visit the"
	cont "#MON SHELTER on"
	cont "ROUTE 12?"
	done
	
StaghornForestGateTeacherText:
	text "The BERRIES that"
	line "lady behind the"
	cont "counter is selling"
	cont "are kind of"
	cont "expensive."
	
	para "I guess that is"
	line "the price you pay"
	cont "for not finding"
	cont "them yourself."
	done

StaghornForestGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 3, 7, OCCIDENT_FOREST, 3
	warp_event 4, 7, OCCIDENT_FOREST, 3
	warp_event 2, 0, STAGHORN_TOWN, 1
	warp_event 3, 0, STAGHORN_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, StaghornForestGateOfficerScript, -1
	object_event  8,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StaghornForestGateBerryVendor, -1
	object_event  8,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StaghornForestGateTeacher, -1
