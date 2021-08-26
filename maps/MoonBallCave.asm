MoonBallCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MoonBallLady:
	faceplayer
	opentext
	writetext MoonBallLadySellText
	jump .Start
.PurchaseMore:
	writetext MoonBallLadyMoreSelection
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .OneBall
	ifequal 2, .TenBalls
	writetext MoonBallLadyComeBack
	waitbutton
	closetext
	end
	
.OneBall:
	checkmoney YOUR_MONEY, 800
	ifequal HAVE_LESS, .NotEnoughMoney
	jump .AskToVend1

.TenBalls:
	checkmoney YOUR_MONEY, 8000
	ifequal HAVE_LESS, .NotEnoughMoney
	jump .AskToVend10

.AskToVend1:
	writetext MoonBallLadyBuy1Text
	yesorno
	iffalse .No
	giveitem MOON_BALL
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 800
	jump .VendItem
.AskToVend10:
	writetext MoonBallLadyBuy10Text
	yesorno
	iffalse .No
	giveitem MOON_BALL, 10
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 8000
.VendItem
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	itemnotify
	jump .PurchaseMore

.NotEnoughMoney:
	writetext MoonBallLadyNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext MoonBallLadyNoSpaceText
	waitbutton
	jump .PurchaseMore
	
.No:
	writetext MoonBallLadyNo
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
	db "1   ¥500@"
	db "10 ¥5000@"
	db "CANCEL@"
	
MoonBallCaveClefairy:
	opentext
	writetext MoonBallCaveClefairyText
	cry CLEFAIRY
	waitbutton
	closetext
	end

MoonBallCaveJigglypuff:
	opentext
	writetext MoonBallCaveJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

MoonBallLadySellText:
	text "Do you like my"
	line "CLEFAIRY and"
	cont "JIGGLYPUFF?"
	
	para "I caught them all"
	line "using a special"
	cont "kind of # BALL."
	
	para "I have lots if you"
	line "want to buy them."
	
	para "One MOON BALL will"
	line "cost you ¥500."
	done

MoonBallLadyNoMoneyText:
	text "I have a lot of"
	line "MOON BALLs, but"
	cont "not enough to"
	cont "give them away."
	
	para "Sorry."
	done

MoonBallLadyNoSpaceText:
	text "You will need to"
	line "make more space in"
	cont "your PACK to buy"
	cont "those."
	done
	
MoonBallLadyBuy1Text:
	text "One MOON BALL will"
	line "be ¥500. Alright?"
	done	

MoonBallLadyBuy10Text:
	text "10 MOON BALLs will"
	line "cost ¥5000, okay?"
	done
	
MoonBallLadyNo:
	text "Do you want a"
	line "different amount?"
	done

MoonBallLadyMoreSelection:
	text "Do you need any"
	line "more?"
	done

MoonBallLadyComeBack:
	text "Come back any time"
	line "you want."
	
	para "Even if it's just"
	line "to admire my FAIRY"
	cont "#MON."
	done

MoonBallCaveClefairyText:
	text "CLEFAIRY: Pippi!"
	done
	
MoonBallCaveJigglypuffText:
	text "JIGGLYPUFF: Puu"
	line "pupuu!"
	done

MoonBallCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 17, 11, ILEX_FOREST, 6

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	object_event  8, 10, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoonBallLady, -1
	object_event  6,  8, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoonBallCaveClefairy, -1
	object_event 14,  9, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoonBallCaveClefairy, -1
	object_event  5,  3, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoonBallCaveClefairy, -1
	object_event  7, 12, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoonBallCaveClefairy, -1
	object_event  3, 14, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoonBallCaveJigglypuff, -1
	object_event  9,  8, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoonBallCaveJigglypuff, -1
	object_event 11,  2, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoonBallCaveJigglypuff, -1
