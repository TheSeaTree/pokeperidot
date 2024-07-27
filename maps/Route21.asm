	const_def 2 ; object constants
	const ROUTE21_BIKER1
	const ROUTE21_BIKER2
	const ROUTE21_BURGLAR1
	const ROUTE21_BURGLAR2
	const ROUTE21_BURGLAR3
	const ROUTE21_BIKER3

Route21_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route21Biker:
	jumptext Route21BikerText
	
Route21Burglars:
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
	end
	
Route21Burglars2:
	opentext
	writetext Route21Burglar3Text
	waitbutton
	closetext
	opentext
	writetext Route21Biker2Text
	waitbutton
	closetext
	opentext
	writetext Route21Burglar3BeginStoryText
	waitbutton
	closetext
	opentext
	writetext Route21Biker2ConcernedText
	waitbutton
	closetext
	opentext 
	writetext Route21Burglar3ConfideText
	wait 4
	closetext
	faceplayer
	opentext
	writetext Route21Burglar3NoticeText
	waitbutton
	closetext
	turnobject ROUTE21_BURGLAR3, DOWN
	turnobject ROUTE21_BIKER3, UP
	end
	
TrainerBikerFlynn:
	trainer BIKER, FLYNN, EVENT_BEAT_BIKER_FLYNN, BikerFlynnText, BikerFlynnWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerFlynnAfterText
	waitbutton
	closetext
	end
	
Route21ItemBush:
	itembush FRUITTREE_ROUTE_17

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
	cont "back from HEPATICA"
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
	
Route21Burglar3Text:
	text "You ever wonder"
	line "why we're here?"
	done
	
Route21Biker2Text:
	text "What do you mean?"
	
	para "We're guards."
	
	para "We make sure this"
	line "road is blocked."
	done
	
Route21Burglar3BeginStoryText:
	text "Yeah, but is that"
	line "it? There could be"
	cont "so much more…"
	
	para "Frankly, it's a"
	line "but dull…"
	done
	
Route21Biker2ConcernedText:
	text "You feeling okay,"
	line "man? You're not"
	cont "usually like this."
	done
	
Route21Burglar3ConfideText:
	text "Yeah, it's just I"
	line "worry sometimes"
	cont "that we're only N-"
	done
	
Route21Burglar3NoticeText:
	text "Hey! Quit eaves-"
	line "dropping! This is"
	cont "a personal matter!"
	done
	
BikerFlynnText:
	text "Hey you!"
	line "Freeze!"
	
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
	cont "this house for!"
	done

Route21_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 47,  2, ROUTE_17_STAGHORN_GATE, 1
	warp_event 47,  3, ROUTE_17_STAGHORN_GATE, 2
	warp_event 13, 15, BURGLAR_HIDEOUT_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event 31, 11, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route21Biker, EVENT_FLUTE_HIDEOUT_OPEN
	object_event 18, 16, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBikerFlynn, EVENT_CLEARED_BURGLAR_HIDEOUT
	object_event 34,  5, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route21Burglars, EVENT_CLEARED_CHURCH
	object_event 33,  5, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route21Burglars, EVENT_CLEARED_CHURCH
	object_event 38,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route21Burglars2, EVENT_FLUTE_HIDEOUT_OPEN
	object_event 38,  4, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route21Burglars2, EVENT_FLUTE_HIDEOUT_OPEN
	object_event  4, 12, SPRITE_BUSH, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route21ItemBush, -1
