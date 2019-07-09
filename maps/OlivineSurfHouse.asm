	const_def 2 ; object constants
	const SURF_HOUSE_SURF_GUY
	const SURF_HOUSE_FISHER_1
	const SURF_HOUSE_FISHER_2

OlivineSurfHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivineSurfGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM_SURF
	iftrue .GotSurf
	checkevent EVENT_EXPLAINED_POWER_PLANT
	iffalse .Hostile
	writetext OlivineSurfGuyGiveSurf
	waitbutton
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM_SURF
.GotSurf
	writetext OlivineSurfGuyExplain
	waitbutton
	closetext
	end
.Hostile
	writetext OlivineSurfGuyText
	waitbutton
	closetext
	turnobject SURF_HOUSE_SURF_GUY, RIGHT
	end

OlivineSurfHouseFishers:
	applymovement SURF_HOUSE_FISHER_1, OlivineSurfHouseMovement1
	opentext
	writetext OlivineSurfHouseFisher1
	waitbutton
	closetext
	applymovement SURF_HOUSE_FISHER_2, OlivineSurfHouseMovement2
	opentext
	writetext OlivineSurfHouseFisher2
	waitbutton
	closetext
	end

OlivineSurfHouseMovement1:
	turn_step DOWN
	step_resume

OlivineSurfHouseMovement2:
	turn_step UP
	step_resume

OlivineSurfGuyText:
	text "Woah, bro. Can't"
	line "you read? The sign"
	cont "says members only."
	
	para "Outsiders and"
	line "tourists aren't"
	cont "welcome to join"
	cont "our club!"
	done

OlivineSurfGuyGiveSurf:
	text "Sorry for the"
	line "hostility earlier,"
	cont "little man."
	
	para "We're not too fond"
	line "of outsiders"
	cont "moving in on our"
	cont "turf."
	
	para "The ADMIN of the"
	line "POWER PLANT told"
	cont "me all about the"
	cont "little errand he"
	cont "has you on."
	
	para "You need to cross"
	line "a body of water,"
	cont "and I know better"
	cont "than anyone on how"
	cont "to get that done."

	para "Try taking this HM"
	line "and teach it to"
	cont "your #MON."
	done
	
OlivineSurfGuyExplain:
	text "That HM contains"
	line "the move SURF."
	
	para "It will let your"
	line "#MON carry you"
	cont "across most bodies"
	cont "of water."
	
	para "The POWER PLANT's"
	line "ADMIN is an old"
	cont "friend of mine, we"
	cont "go way back."
	
	para "As far as I care,"
	line "if he says you're"
	cont "alright, you must"
	cont "be alright."
	
	para "Don't go making me"
	line "regret giving you"
	cont "that move."
	done
	
OlivineSurfHouseFisher1:
	text "Tourists are"
	line "always coming to"
	cont "our beach, making"
	cont "lots of noise and"
	cont "leaving trash all"
	cont "over the place."
	
	para "They'd be better"
	line "off staying home!"
	done
	
OlivineSurfHouseFisher2:
	text "Yeah! That kind of"
	line "thing really gets"
	cont "me steamed!"
	
	para "They don't even"
	line "try to fit in,"
	cont "either!"
	done

OlivineSurfHouseFisher3:
	text "Who let you in"
	line "here?"
	
	para "Quit eaves-"
	line "dropping!"
	done

OlivineSurfHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, OLIVINE_CITY, 4
	warp_event  4,  7, OLIVINE_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OlivineSurfGuy, -1
	object_event  5,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OlivineSurfHouseFishers, -1
	object_event  5,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OlivineSurfHouseFishers, -1
