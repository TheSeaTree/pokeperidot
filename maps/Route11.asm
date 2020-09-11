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
	
Route11CooltrainerFScript:
	jumptextfaceplayer Route11CooltrainerFText

Route11SpellTag:
	itemball SPELL_TAG

Route11LeafStone:
	itemball LEAF_STONE

Route11TMGigaDrain:
	itemball TM_GIGA_DRAIN
	
Route11GoldenrodSign:
	jumptext Route11GoldenrodSignText

Route11Route12Sign:
	jumptext Route11Route12SignText
	
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
	
Route11CooltrainerFText:
	text "Rumor has it that"
	line "an evil spirit"
	cont "dwells on this"
	cont "ROUTE."
	
	para "But the only other"
	line "person I've seen"
	cont "is a nice old man."
	done
	
Route11GoldenrodSignText:
	text "ROUTE 11 -"
	line "FAVIA TOWN"
	done
	
Route11Route12SignText:
	text "ROUTE 11 -"
	line "ROUTE 12"
	done

Route11_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 29, 27, ROUTE_11_GOLDENROD_GATE, 1
	warp_event 30, 27, ROUTE_11_GOLDENROD_GATE, 2
	warp_event 21,  3, ROUTE_11_ROUTE_12_GATE, 1
	warp_event 51, 21, ROUTE_11_CURSE_HOUSE, 1
	warp_event  9, 11, ROUTE_11_CLEANSE_TAG_HOUSE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 32, 23, BGEVENT_READ, Route11GoldenrodSign
	bg_event 18,  9, BGEVENT_READ, Route11Route12Sign

	db 5 ; object events
	object_event 41, 20, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route11MoveTutor, -1
	object_event 23, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route11CooltrainerFScript, -1
	object_event 53,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_ITEMBALL, 0, Route11TMGigaDrain, EVENT_GOT_TM_GIGA_DRAIN
	object_event  0, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route11SpellTag, EVENT_ROUTE_11_SPELL_TAG
	object_event 44,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route11LeafStone, EVENT_ROUTE_11_LEAF_STONE
