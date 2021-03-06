	const_def 2 ; object constants
	const ROUTE18BARN_TAUROS1
	const ROUTE18BARN_TAUROS2
	const ROUTE18BARN_TAUROS3
	const ROUTE18BARN_COOLTRAINER

Route18Barn_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route18BarnCooltrainerScript:
	opentext
	checkevent EVENT_MARIE_GONE_HOME
	iftrue .AfterMarie
	checkevent EVENT_TALKED_TO_MARIES_SISTER
	iftrue .FindMarie
	writetext Route18BarnCooltrainerText
	waitbutton
	closetext
	showemote EMOTE_QUESTION, LAST_TALKED, 15
	faceplayer
	opentext
	writetext Route18BarnCooltrainerContinueText
	waitbutton
.continue
	writetext Route18BarnCooltrainerFindMarieText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	setevent EVENT_TALKED_TO_MARIES_SISTER
	end
	
.FindMarie
	faceplayer
	jump .continue
	
.AfterMarie
	faceplayer
	opentext
	writetext Route18BarnCooltrainerAfterMarieText
	waitbutton
	closetext
	end

Route18BarnMiltankScript:
	opentext
	writetext Route18BarnMiltankText
	cry MILTANK
	waitbutton
	closetext
	end
	
Route18BarnHiddenMoomooMilk:
	hiddenitem MOOMOO_MILK, EVENT_ROUTE_18_BARN_HIDDEN_MOOMOO_MILK

Route18BarnCooltrainerText:
	text "…Where could she"
	line "have run off to"
	cont "this time?"
	done
	
Route18BarnCooltrainerContinueText:
	text "Pardon, I didn't"
	line "see you there."
	
	para "I was just wond-"
	line "derin' where my"
	cont "sister coulda'"
	cont "gotten off ta'."
	
	para "She took off with"
	line "our family's best"
	cont "MILTANK again."
	
	para "I love the girl,"
	line "but she's gotta"
	cont "learn that this"
	cont "ain't a movie."

	para "She can't just"
	line "drop her responsi-"
	cont "bilities to be a"
	cont "TRAINER like the"
	cont "ones on TV."
	done
	
Route18BarnCooltrainerFindMarieText:
	text "You're a trainer,"
	line "ain't ya?"
	
	para "If you see her,"
	line "could ya' try"
	cont "talkin' some sense"
	cont "into her for me?"
	
	para "We really need all"
	line "the hands we can"
	cont "get around here."
	done
	
Route18BarnCooltrainerAfterMarieText:
	text "Thanks for gettin'"
	line "MARIE to come home"
	cont "for us."
	
	para "I feel for the"
	line "girl, really."
	
	para "I wish I could go"
	line "out on an advent-"
	cont "ure, too."
	
	para "But family always"
	line "comes first!"
	done

Route18BarnMiltankText:
	text "MILTANK: Moo!"
	done

Route18Barn_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  5, ROUTE_18, 5
	warp_event  6,  5, ROUTE_18, 5

	db 0 ; coord events

	db 1 ; bg events
	bg_event 20, 19, BGEVENT_ITEM, Route18BarnHiddenMoomooMilk

	db 4 ; object events 
	object_event  2,  1, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18BarnMiltankScript, -1
	object_event  9,  1, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18BarnMiltankScript, -1
	object_event 11,  1, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18BarnMiltankScript, -1
	object_event  9,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route18BarnCooltrainerScript, -1
