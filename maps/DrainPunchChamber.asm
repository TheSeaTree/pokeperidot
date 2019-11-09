	const_def 2 ; object constants

DrainPunchChamber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
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
	
DrainPunchChamber_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  5, DIGLETTS_CAVE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DrainPunchTutor, -1
