	const_def 2 ; object constants
	const ROUTE_14_TUTOR
	const ROUTE_14_ODDISH

Route14_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route14MoveTutor:
	applymovement ROUTE_14_ODDISH, Route14TutorDance
	faceplayer
	opentext
	writetext Route14TutorText
	waitbutton
	applymovement ROUTE_14_ODDISH, Route14TutorDance
	faceplayer
	writetext Route14TutorDanceText
	waitbutton
	checkitem GOLD_LEAF
	iffalse .NoLeaf
	applymovement ROUTE_14_ODDISH, Route14TutorDance
	faceplayer
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
	applymovement ROUTE_14_ODDISH, Route14TutorDance
	faceplayer
	applymovement PLAYER, Route14TutorDance
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
	
Route14CaveGuard:
	jumptextfaceplayer Route14CaveGuardText
	
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
	text "Hello there."
	
	para "I'm sorry, you"
	line "caught me right in"
	cont "the middle of my"
	cont "dance routine."
	done
	
Route14TutorDanceText:
	text "The dance's name?"
	
	para "Why it's no other"
	line "than PETAL DANCE!"
	
	para "If you would like"
	line "to give me a GOLD"
	cont "LEAF, I would be"
	cont "delighted to teach"
	cont "your #MON such"
	cont "a dance."
	done
	
Route14TutorTeach:
	text "Would you like to"
	line "teach your #MON"
	cont "PETAL DANCE?"
	done

Route14TutorRefused:
	text "No matter. You may"
	line "always find me"
	cont "right here."
	done

Route14TutorExplainSilverLeaf:
	text "Oh. You don't seem"
	line "to have a GOLD"
	cont "LEAF."
	
	para "No matter! I won't"
	cont "be going anywhere."
	done
	
Route14TutorWhichOne:
	text "Which #MON"
	line "should I tutor?"
	done
	
Route14TutorThankYou:
	text "Thank you!"
	
	para "Please, won't you"
	line "dance with me too?"
	done
	
Route14CaveGuardText:
	text "I'm sorry, I can't"
	line "let you into this"
	cont "cave right now."
	done

Route14_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  24,  7, ROUTE_14_CAVE_1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 10,  7, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route14MoveTutor, -1
	object_event 24,  8, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route14CaveGuard, EVENT_HEARD_ROUTE_12_LEADER
	