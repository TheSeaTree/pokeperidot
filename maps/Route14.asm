	const_def 2 ; object constants
	const ROUTE_14_TUTOR
	const ROUTe_14_ODDISH

Route14_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route14MoveTutor:
	applymovement ROUTE_14_TUTOR, Route14TutorDance
	faceplayer
	opentext
	writetext Route14TutorText
	waitbutton
	checkitem SILVER_LEAF
	iffalse .NoLeaf
	writetext Route14TutorTeach
	yesorno
	iftrue .PetalDance
	jump .Refused
	
.PetalDance
	writetext Route14TutorWhichOne
	buttonsound
	writebyte PETAL_DANCE
	special MoveTutor
	ifequal $0, .TeachMove
	jump .Refused
	
.TeachMove
	takeitem SILVER_LEAF
	writetext Route14TutorThankYou
	waitbutton
	turnobject LAST_TALKED, RIGHT
	closetext
	end
	
.Refused
	writetext Route14TutorRefused
	waitbutton
	closetext
	end
	
.NoLeaf
	writetext Route14TutorExplainSilverLeaf
	waitbutton
	turnobject LAST_TALKED, DOWN
	closetext
	end
	
Route14TutorDance:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end
	
Route14TutorText:
	text "Howdy, stranger!"
	
	para "I'm a MOVE TUTOR."
	
	para "For the price of a"
	line "SILVER LEAF, I can"
	cont "teach one of your"
	cont "#MON a move"
	cont "called GROWTH."
	done
	
Route14TutorTeach:
	text "Would you like to"
	line "teach your #MON"
	cont "GROWTH?"
	done

Route14TutorRefused:
	text "I understand."

	para "It can be hard to"
	line "come by a SILVER"
	cont "LEAF."
	done

Route14TutorExplainSilverLeaf:
	text "When you find a"
	line "SILVER LEAF, feel"
	cont "free to find me"
	cont "again. You'll know"
	cont "where I'll be."
	done
	
Route14TutorWhichOne:
	text "Which #MON"
	line "should I tutor?"
	done
	
Route14TutorThankYou:
	text "Thanks a bunch!"
	
	para "Come see me again"
	line "if you find"
	cont "another SILVER"
	cont "LEAF."
	done

Route14_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 10, 7, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route14MoveTutor, -1
	