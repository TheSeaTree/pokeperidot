	const_def 2 ; object constants

PaintersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Painter:
	faceplayer
	opentext
	checkevent EVENT_MET_PAINTER
	iftrue .AlreadyMet
	writetext PainterIntroText
	waitbutton
	writebyte SMEARGLE
	special FindPartyMonThatSpecies
	iffalse .NoSmeargle
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	writetext PainterHaveSmeargleMaleText
	jump .Continue
.Girl
	writetext PainterHaveSmeargleFemaleText
.Continue
	waitbutton
	writetext PainterSellingPaintingsText
	waitbutton
.Start
	writetext WhichPaintingText
.BuyAnother
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Pikachu
	ifequal 2, .Clefairy
	ifequal 3, .Jigglypuff
.Goodbye
	writetext PainterGoodbyeText
	waitbutton
	closetext
	setevent EVENT_MET_PAINTER
	end
	
.Pikachu
	pokenamemem PIKACHU, MEM_BUFFER_0
	writetext PainterConfirmText
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 15000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_POSTER_1
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 15000
	special PlaceMoneyTopRight
	setevent EVENT_DECO_POSTER_1
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	jump .Confirm

.Clefairy
	pokenamemem CLEFAIRY, MEM_BUFFER_0
	writetext PainterConfirmText
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 15000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_POSTER_2
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 15000
	special PlaceMoneyTopRight
	setevent EVENT_DECO_POSTER_2
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	jump .Confirm

.Jigglypuff
	pokenamemem JIGGLYPUFF, MEM_BUFFER_0
	writetext PainterConfirmText
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 15000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_POSTER_3
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 15000
	special PlaceMoneyTopRight
	setevent EVENT_DECO_POSTER_3
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	jump .Confirm
	
.Confirm
	writetext PainterShippedToHomeText
	waitbutton
	jump .AnythingElse
	
.NotEnoughMoney:
	writetext PainterNotEnoughMoneyText
	waitbutton
	jump .AnythingElse
	
.AlreadyHave:
	writetext PainterAlreadyHaveText
	waitbutton
	
.AnythingElse:
	writetext PainterAnythingElseText
	waitbutton
	jump .BuyAnother

.SomethingElse:
	writetext PainterSomethingElseText
	waitbutton
	jump .BuyAnother

.AlreadyMet:
	writetext PainterAlreadyMetText
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
	db "PIKACHU    ¥15000@"
	db "CLEFAIRY   ¥15000@"
	db "JIGGLYPUFF ¥15000@"
	db "CANCEL@"

.NoSmeargle
	writetext PainterNoSmeargleText
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end
	
PainterIntroText:
	text "Hello, there."
	
	para "I have been paint-"
	line "ing portraits my"
	cont "entire life."
	done
	
PainterAlreadyMetText:
	text "Ah, my favorite"
	line "young art connois-"
	cont "seur. Welcome!"
	
	para "Have you come to"
	line "browse through my"
	cont "art once more?"
	done

PainterHaveSmeargleMaleText:
	text "I can tell by the"
	line "look on your face"
	cont "that you are a man"
	cont "of refined taste."
	done
	
PainterHaveSmeargleFemaleText:
	text "You seem to be a"
	line "lady of impeccable"
	cont "taste in the arts."
	done
	
PainterSellingPaintingsText:
	text "Would you care to"
	line "buy any of my por-"
	cont "traits? They would"
	cont "look lovely hang-"
	cont "ing in your home."
	done

PainterNoSmeargleText:
	text "I do like to sell"
	line "my works, but you"
	cont "do not seem like"
	cont "the kind of person"
	cont "to truly enjoy"
	cont "them."
	
	para "It would be a"
	line "waste of effort,"
	cont "honestly."
	done

PainterGoodbyeText:
	text "Nothing today?"
	
	para "Well if you find"
	line "yourself around"
	cont "these parts again,"
	cont "you are more than"
	cont "welcome to pay me"
	cont "a visit."
	done
	
WhichPaintingText:
	text "Which PAINTING"
	line "would you like?"
	done

PainterConfirmText:
	text "You would like the"
	line "PAINTING of a"
	cont "@"
	text_ram wStringBuffer3
	text "?"
	done
	
PainterShippedToHomeText:
	text "I wouldn't want"
	line "this to get dama-"
	cont "ged in your PACK."
	
	para "I will send it"
	line "straight to your"
	cont "home, okay?"
	done
	
PainterNotEnoughMoneyText:
	text "I think that one"
	line "might be outside"
	cont "of your budget…"
	done
	
PainterAlreadyHaveText:
	text "I believe I alrea-"
	line "dy sold you one of"
	cont "those. No need for"
	cont "another, right?"
	done

PainterSomethingElseText:
	text "Did something else"
	line "catch your eye?"
	done
	
PainterAnythingElseText:
	text "Does anything else"
	line "catch your eye?"
	done

PaintersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, PAINTERS_FOREST, 1
	warp_event  4,  7, PAINTERS_FOREST, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Painter, -1
