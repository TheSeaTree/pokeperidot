	const_def 2 ; object constants
	const ROUTE14BARN_TAUROS1
	const ROUTE14BARN_TAUROS2
	const ROUTE14BARN_TAUROS3
	const ROUTE14BARN_COOLTRAINER

Route14Barn_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route14BarnCooltrainerScript:
	checkevent EVENT_MARIE_GONE_HOME
	iftrue .AfterMarie
	opentext
	checkevent EVENT_TALKED_TO_MARIES_SISTER
	iftrue .FindMarie
	writetext Route14BarnCooltrainerText
	waitbutton
	closetext
	showemote EMOTE_QUESTION, LAST_TALKED, 15
	faceplayer
	opentext
	writetext Route14BarnCooltrainerContinueText
	waitbutton
.continue
	writetext Route14BarnCooltrainerFindMarieText
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
	writetext Route14BarnCooltrainerAfterMarieText
	waitbutton
	closetext
	end

Route14BarnMiltankScript:
	opentext
	writetext Route14BarnMiltankText
	cry MILTANK
	waitbutton
	closetext
	end
	
Route14BarnHiddenMoomooMilk:
	hiddenitem MOOMOO_MILK, EVENT_ROUTE_14_BARN_HIDDEN_MOOMOO_MILK

Route14BarnCooltrainerText:
	text "…Where could she"
	line "have run off to"
	cont "this time?"
	done
	
Route14BarnCooltrainerContinueText:
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
	
Route14BarnCooltrainerFindMarieText:
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
	
Route14BarnCooltrainerAfterMarieText:
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

Route14BarnMiltankText:
	text "MILTANK: Moo!"
	done

Route14Barn_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  5, ROUTE_14, 5
	warp_event  6,  5, ROUTE_14, 5

	db 0 ; coord events

	db 1 ; bg events
	bg_event 20, 19, BGEVENT_ITEM, Route14BarnHiddenMoomooMilk

	db 4 ; object events 
	object_event  2,  1, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route14BarnMiltankScript, -1
	object_event  9,  1, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route14BarnMiltankScript, -1
	object_event 11,  1, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route14BarnMiltankScript, -1
	object_event  9,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route14BarnCooltrainerScript, -1
