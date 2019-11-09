	const_def 2 ; object constants
	const ROUTE21_BIKER
	const ROUTE21_BURGLAR1
	const ROUTE21_BURGLAR2

Route21_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route21Biker:
	jumptext Route21BikerText
	
Route21Burglar:
	turnobject ROUTE21_BURGLAR1, LEFT
	opentext
	writetext Route21Burglar1Text
	waitbutton
	closetext
	turnobject ROUTE21_BURGLAR2, RIGHT
	opentext
	writetext Route21Burglar2Text
	waitbutton
	closetext
	done
	
TrainerBikerFlynn:
	trainer BIKER, FLYNN, EVENT_BEAT_BIKER_FLYNN, BikerFlynnText, BikerFlynnWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerFlynnAfterText
	waitbutton
	closetext
	end	
	
Route21BikerText:
	text "Bet you'd like to"
	line "check out the path"
	cont "I'm blocking, huh?"
	
	para "Well too bad! I'm"
	line "not getting paid"
	cont "to let people"
	cont "past here."
	done
	
Route21Burglar1Text:
	text "When are they"
	line "supposed to get"
	cont "back from HELIO"
	cont "TOWN?"
	
	para "They've been up"
	line "there for such a"
	cont "long time."
	done
	
Route21Burglar2Text:
	text "I dunno, man."
	
	para "I just hope they"
	line "keep up their end"
	cont "of the deal while"
	cont "we scope this"
	cont "place out."
	done
	
BikerFlynnText:
	text "Hey you!"
	
	para "I'm standing guard"
	line "by this house for"
	cont "a reason."
	
	para "No, you may not"
	line "know why!"
	done

BikerFlynnWinText:
	text "No way! You're"
	line "just a kid!"
	done

BikerFlynnAfterText:
	text "I'm no traitor."
	
	para "I will never say"
	line "what I'm guarding"
	cont "this house for."
	done

Route21_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 47,  2, ROUTE_21_ECRUTEAK_GATE, 1
	warp_event 47,  3, ROUTE_21_ECRUTEAK_GATE, 2
	warp_event 13, 15, BURGLAR_HIDEOUT_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 31, 11, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route21Biker, EVENT_FLUTE_HIDEOUT_OPEN
	object_event 18, 16, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBikerFlynn, EVENT_CLEARED_BURGLAR_HIDEOUT
	object_event 34,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route21Burglar, EVENT_CLEARED_CHURCH
	object_event 35,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route21Burglar, EVENT_CLEARED_CHURCH
