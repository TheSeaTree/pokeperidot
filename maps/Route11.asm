	const_def 2 ; object constants

Route11_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route11MoveTutor:
	faceplayer
	opentext
	writetext Route11TutorText
	waitbutton
	checkitem SILVER_LEAF
	iffalse .NoLeaf
	writetext Route11TutorTeach
	yesorno
	iftrue .Bubblebeam
	jump .Refused
	
.Bubblebeam
	writetext Route11TutorWhichOne
	buttonsound
	writebyte BUBBLEBEAM
	special MoveTutor
	ifequal $0, .TeachMove
	jump .Refused
	
.TeachMove
	takeitem SILVER_LEAF
	writetext Route11TutorThankYou
	waitbutton
	closetext
	end
	
.Refused
	writetext Route11TutorRefused
	waitbutton
	closetext
	end
	
.NoLeaf
	writetext Route11TutorExplainSilverLeaf
	waitbutton
	closetext
	end

Route11TMGigaDrain:
	itemball TM_GIGA_DRAIN
	
Route11TutorText:
	text "Blub, blub, blub."

	para "So many #MON"
	line "can learn to blow"
	cont "bubbles. Even ones"
	cont "that aren't WATER-"
	cont "type! I find that"
	cont "so interesting!"
	
	para "I can teach your"
	line "#MON to blow"
	cont "bubbles too. I"
	cont "just need one"
	cont "SILVER LEAF to do"
	cont "it."
	done

Route11TutorTeach:
	text "Would you like to"
	line "teach BUBBLEBEAM"
	cont "to one of your"
	cont "#MON?"
	done
	
Route11TutorWhichOne:
	text "Which #MON will"
	line "I tutor?"
	done
	
Route11TutorThankYou:
	text "Blub, blub, blub."
	line "Thank you!"
	
	para "It's amazing how"
	line "many #MON can"
	cont "learn BUBBLEBEAM."
	done
	
Route11TutorRefused:
	text "Wow, you must have"
	line "the only #MON"
	cont "that can't learn"
	cont "my move!"
	done
	
Route11TutorExplainSilverLeaf:
	text "You don't have"
	line "one?"
	
	para "That's okay, lots"
	line "of people don't!"
	
	para "If you ever do"
	line "find a SILVER"
	cont "LEAF, you can come"
	cont "back here."
	done

Route11_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 29, 27, ROUTE_11_GOLDENROD_GATE, 1
	warp_event 30, 27, ROUTE_11_GOLDENROD_GATE, 2
	warp_event 21,  3, ROUTE_11_ROUTE_12_GATE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 41, 20, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route11MoveTutor, -1
	object_event 53,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_ITEMBALL, 0, Route11TMGigaDrain, EVENT_GOT_TM_GIGA_DRAIN