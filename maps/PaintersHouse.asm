	const_def 2 ; object constants

PaintersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Painter:
	faceplayer
	opentext
	checkevent EVENT_DECO_POSTER_6
	iftrue .HaveMewPoster
	checkflag ENGINE_DAILY_PAINTING
	iftrue .AlreadyBoughtToday
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
	jump .Start
.Girl
	writetext PainterHaveSmeargleFemaleText
.Start
	waitbutton
	writetext WhichPaintingText
.BuyAnother
	special PlaceMoneyTopRight
	yesorno
	iffalse .Goodbye
	checkmoney YOUR_MONEY, 15000
	ifequal HAVE_LESS, .NotEnoughMoney
.Roll
	random 5
	ifequal 0, .Pikachu
	ifequal 1, .Clefairy
	ifequal 2, .Jigglypuff
	ifequal 3, .Tangela
	ifequal 4, .Shuckle

.Goodbye
	writetext PainterGoodbyeText
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	setevent EVENT_MET_PAINTER
	end
	
.Pikachu
	checkevent EVENT_DECO_POSTER_1
	iftrue .Roll
	setevent EVENT_DECO_POSTER_1
	pokenamemem PIKACHU, MEM_BUFFER_0
	jump .BuyPoster

.Clefairy
	checkevent EVENT_DECO_POSTER_2
	iftrue .Roll
	setevent EVENT_DECO_POSTER_2
	pokenamemem CLEFAIRY, MEM_BUFFER_0
	jump .BuyPoster

.Jigglypuff
	checkevent EVENT_DECO_POSTER_3
	iftrue .Roll
	setevent EVENT_DECO_POSTER_3
	pokenamemem JIGGLYPUFF, MEM_BUFFER_0
	jump .BuyPoster
	
.Tangela
	checkevent EVENT_DECO_POSTER_4
	iftrue .Roll
	setevent EVENT_DECO_POSTER_4
	pokenamemem TANGELA, MEM_BUFFER_0
	jump .BuyPoster
	
.Shuckle
	checkevent EVENT_DECO_POSTER_5
	iftrue .Roll
	setevent EVENT_DECO_POSTER_5
	pokenamemem SHUCKLE, MEM_BUFFER_0

.BuyPoster
	writetext PainterConfirmText
	takemoney YOUR_MONEY, 15000
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	writetext PainterShippedToHomeText
	waitbutton
	setevent EVENT_MET_PAINTER
	setflag ENGINE_DAILY_PAINTING
.AlreadyBoughtToday:
	writetext PainterComeBackTomorrowText
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end
	
.NotEnoughMoney:
	writetext PainterNotEnoughMoneyText
	waitbutton
	closetext
	end

.AlreadyMet:
	writetext PainterAlreadyMetText
	checkevent EVENT_DECO_POSTER_1
	iffalse .Start
	checkevent EVENT_DECO_POSTER_2
	iffalse .Start
	checkevent EVENT_DECO_POSTER_3
	iffalse .Start
	checkevent EVENT_DECO_POSTER_4
	iffalse .Start
	checkevent EVENT_DECO_POSTER_5
	iffalse .Start
	
	waitbutton
	writetext GiveMewPosterText
	waitbutton
	setevent EVENT_DECO_POSTER_6
	writetext PainterShippedToHomeText
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end

.HaveMewPoster:
	writetext HaveMewPosterText
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end

.NoSmeargle:
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
	
	para "I'm actually work-"
	line "ing on a a master-"
	cont "piece as we speak."
	
	para "And it is just"
	line "about… Finished!"
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
	text "Not today?"
	
	para "Well if you find"
	line "yourself around"
	cont "these parts again,"
	cont "you are more than"
	cont "welcome to pay me"
	cont "a visit."
	done

WhichPaintingText:
	text "Would you like to"
	line "purchase my work?"
	
	para "It can be yours"
	line "for ¥15000. How"
	cont "does that sound?"
	done

PainterConfirmText:
	text "Excellent!"
	
	para "Here you are. A"
	line "PAINTING of a fine"
	cont "@"
	text_ram wStringBuffer3
	text "!"
	done
	
PainterShippedToHomeText:
	text "I wouldn't want"
	line "this to get dama-"
	cont "ged in your PACK."
	
	para "I will send it"
	line "straight to your"
	cont "home, okay?"
	done
	
PainterComeBackTomorrowText:
	text "That is all I have"
	line "done today."
	
	para "Come back tomorrow"
	line "and I will have a"
	cont "new portrait"
	cont "finished for sure!"	
	done
	
PainterNotEnoughMoneyText:
	text "I think my works"
	line "might be outside"
	cont "of your budget…"

	para "Sorry, but I can't"
	line "give these away"
	cont "for free."
	done
	
GiveMewPosterText:
	text "This #MON came"
	line "to me in a dream"
	cont "last night."
	
	para "I couldn't help but"
	line "recreate what I"
	cont "saw in this dream."
	
	para "I'm not even sure"
	line "if it's a real"
	cont "#MON either."
	
	para "I could never sell"
	line "this piece. Please"
	cont "take it, for free."	
	done

HaveMewPosterText:
	text "I'm afraid to say"
	line "that I don't think"
	cont "I could ever top"
	cont "the MYTHIC POSTER"
	cont "I painted. I feel"
	cont "I must retire for"
	cont "the time being…"
	
	para "But who knows?"
	
	para "Maybe a new #-"
	line "MON will spark my"
	cont "creativity once"
	cont "more!"
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
