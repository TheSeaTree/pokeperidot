	const_def 2 ; object constants
	const DIGLETTSCAVE_POKEFAN_M
	const DIGLETTSCAVE_ROCK

DiglettsCave_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall
	
.SmashWall:
	checkevent EVENT_DRAIN_PUNCH_CHAMBER_OPEN
	iffalse .skip
	changeblock 18, 2, $13
.skip
	return
	
TrainerBlackbeltAxel:
	trainer BLACKBELT_T, AXEL, EVENT_BEAT_BLACKBELT_AXEL, BlackbeltAxelText, BlackbeltAxelWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltAzelAfterText
	waitbutton
	closetext
	end	
	
TrainerHikerAdam:
	trainer HIKER, ADAM, EVENT_BEAT_HIKER_ADAM, HikerAdamText, HikerAdamWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerAdamAfterText
	waitbutton
	closetext
	end	

TrainerBeautyBlaze:
	trainer BEAUTY, BLAZE, EVENT_BEAT_BEAUTY_BLAZE, BeautyBlazeText, BeautyBlazeWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyBlazeAfterText
	waitbutton
	closetext
	end	

DiglettsCaveBoulder:
	jumpstd strengthboulder	
	
DiglettsCaveHiddenEverstone:
	hiddenitem EVERSTONE, EVENT_DIGLETTS_CAVE_HIDDEN_EVERSTONE
	
Route3BlackBelt:
	itemball BLACKBELT

BeautyBlazeText:
	text "Are you good"
	line "enough to win our"
	cont "BLACKBELT?"
	done
	
BeautyBlazeWinText:
	text "My, my! You are"
	line "good at this!"
	done
	
BeautyBlazeAfterText:
	text "A BLACKBELT will"
	line "make any FIGHTING-"
	cont "type move more"
	cont "powerful. Even if"
	cont "the holder is not"
	cont "FIGHTING-type."
	done
	
BlackbeltAxelText:
	text "We've all trained"
	line "with MURPHY, and"
	cont "have learned his"
	cont "special move."
	done

BlackbeltAxelWinText:
	text "I have failed my"
	line "FIGHTING #MON."
	done
	
BlackbeltAzelAfterText:
	text "There is one more"
	line "trainer to defeat"
	cont "before you win our"
	cont "prize."
	done
	
HikerAdamText:
	text "Welcome to the"
	line "MACHOP's DEN."
	
	para "If you can defeat"
	line "us all, you will"
	cont "win a prize."
	done

HikerAdamWinText:
	text "My ROCK-type has"
	line "been smashed!"
	done

HikerAdamAfterText:
	text "I used to be a cop"
	line "for PECTINIA CITY."
	
	para "MURPHY trained me"
	line "himself, but that"
	cont "life wasn't for"
	cont "me."
	done
	
DiglettsCave_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 21,  11, ROUTE_3, 3
	warp_event  3,  13, ROUTE_3, 4
	warp_event 19,   3, DRAIN_PUNCH_CHAMBER, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 20,  7, BGEVENT_ITEM, DiglettsCaveHiddenEverstone

	db 5 ; object events
	object_event 13,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltAxel, -1
	object_event  8, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerAdam, -1
	object_event 14, 14, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerBeautyBlaze, -1
	object_event 11, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route3BlackBelt, EVENT_ROUTE_3_BLACKBELT
	object_event  6, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DiglettsCaveBoulder, -1
