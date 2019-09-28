	const_def 2 ; object constants
	const DIGLETTSCAVE_POKEFAN_M
	const DIGLETTSCAVE_ROCK

DiglettsCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerBlackbeltAxel:
	trainer BLACKBELT_T, AXEL, EVENT_BEAT_BLACKBELT_AXEL, Route3CaveTrainerText, Route3CaveWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route3CaveWinText
	waitbutton
	closetext
	end	
	
TrainerHikerAdam:
	trainer HIKER, ADAM, EVENT_BEAT_HIKER_ADAM, Route3CaveTrainerText, Route3CaveWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route3CaveWinText
	waitbutton
	closetext
	end	

TrainerBeautyBlaze:
	trainer BEAUTY, BLAZE, EVENT_BEAT_BEAUTY_BLAZE, Route3CaveTrainerText, Route3CaveWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route3CaveWinText
	waitbutton
	closetext
	end	
	
DrainPunchTutor:
	faceplayer
	opentext
	writetext DrainPunchTutorText
	waitbutton
	checkitem GOLD_LEAF
	iffalse .NoLeaf
	writetext DrainPunchTutorTeach
	yesorno
	iftrue .DrainPunch
	jump .Refused
	
.DrainPunch
	writetext DrainPunchTutorWhichOne
	buttonsound
	writebyte DRAIN_PUNCH
	special MoveTutor
	ifequal $0, .TeachMove
	jump .Refused
	
.TeachMove
	takeitem GOLD_LEAF
	writetext DrainPunchTutorThankYou
	waitbutton
	closetext
	end
	
.Refused
	writetext DrainPunchTutorRefused
	waitbutton
	closetext
	end
	
.NoLeaf
	writetext DrainPunchTutorExplainGoldLeaf
	waitbutton
	closetext
	end

DiglettsCaveBoulder:
	jumpstd strengthboulder	
	
DiglettsCaveHiddenEverstone:
	hiddenitem EVERSTONE, EVENT_DIGLETTS_CAVE_HIDDEN_EVERSTONE
	
Route3BlackBelt:
	itemball BLACKBELT

Route3CaveTrainerText:
	text "I am a"
	line "#MON trainer!"
	done
	
Route3CaveWinText:
	text "I lost."
	done
	
DrainPunchTutorText:
	text "HI-YAH!"
	
	para "Our master may"
	line "have trusted you"
	cont "with ROCK SMASH,"
	cont "but I have an even"
	cont "better technique."
	
	para "Bring me a GOLD"
	line "LEAF and I will"
	cont "teach it to your"
	cont "#MON."
	done
	
DrainPunchTutorTeach:
	text "Would you like to"
	line "teach your #MON"
	cont "DRAIN PUNCH?"
	done
	
DrainPunchTutorWhichOne:
	text "Which #MON will"
	line "I tutor?"
	done
	
DrainPunchTutorThankYou:
	text "HOO HAH!"
	
	para "Your #MON looks"
	line "stronger already!"
	done
	
DrainPunchTutorRefused:
	text "WHAT?"
	
	para "You dare show"
	line "disrespect to my"
	cont "special move?"
	done
	
DrainPunchTutorExplainGoldLeaf:
	text "I refuse to teach"
	line "anything without"
	cont "the proper"
	cont "payment."
	done
	
DiglettsCave_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 21,  11, ROUTE_3, 3
	warp_event  3,  13, ROUTE_3, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  20,  7, BGEVENT_ITEM, DiglettsCaveHiddenEverstone

	db 6 ; object events
	object_event 13,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltAxel, -1
	object_event  8, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerAdam, -1
	object_event 14, 14, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerBeautyBlaze, -1
	object_event 11, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route3BlackBelt, EVENT_ROUTE_3_BLACKBELT
	object_event  6, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DiglettsCaveBoulder, -1
	object_event 19,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DrainPunchTutor, -1
