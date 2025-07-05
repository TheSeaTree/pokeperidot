	const_def 2 ; object constants
	const SURF_HOUSE_SURF_GUY
	const SURF_HOUSE_FISHER_1
	const SURF_HOUSE_FISHER_2

RugosaSurfHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RugosaSurfGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM_SURF
	iftrue .GotSurf
	checkcode VAR_BADGES
	ifless 6, .Hostile
	writetext RugosaSurfGuyGiveSurf
	waitbutton
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM_SURF
.GotSurf
	writetext RugosaSurfGuyExplain
	waitbutton
	closetext
	end
.Hostile
	writetext RugosaSurfGuyText
	waitbutton
	closetext
	turnobject SURF_HOUSE_SURF_GUY, RIGHT
	end

RugosaSurfHouseFishers:
	applymovement SURF_HOUSE_FISHER_1, RugosaSurfHouseMovement1
	opentext
	writetext RugosaSurfHouseFisher1
	waitbutton
	closetext
	applymovement SURF_HOUSE_FISHER_2, RugosaSurfHouseMovement2
	opentext
	writetext RugosaSurfHouseFisher2
	waitbutton
	closetext
	end

RugosaSurfHouseMovement1:
	turn_step DOWN
	step_resume

RugosaSurfHouseMovement2:
	turn_step UP
	step_resume

RugosaSurfGuyText:
	text "Woah, bro. Can't"
	line "you read? The sign"
	cont "says members only."
	
	para "Outsiders and"
	line "tourists aren't"
	cont "welcome to join"
	cont "our club!"
	done

RugosaSurfGuyGiveSurf:
	text "Hey man, I thought"
	line "I told you no-"

	para "…Hang on, you have"
	line "how many BADGEs?"

	para "6? That's more than"
	line "me!"

	para "I'm sorry for the"
	line "hostility."

	para "I can't let you"
	line "join the club,"
	cont "but I can give you"
	cont "this HM."
	done

RugosaSurfGuyExplain:
	text "SURF will let your"
	line "#MON carry you"
	cont "across most bodies"
	cont "of water."

	para "While you can go"
	line "explore the ocean,"
	cont "you won't find any"
	cont "GYMs out there."

	para "Head back west if"
	line "you want to coll-"
	cont "ect more BADGEs."
	done
	
RugosaSurfHouseFisher1:
	text "Tourists are"
	line "always coming to"
	cont "our beach, making"
	cont "lots of noise and"
	cont "leaving trash all"
	cont "over the place."
	
	para "They'd be better"
	line "off staying home!"
	done
	
RugosaSurfHouseFisher2:
	text "Yeah! That kind of"
	line "thing really gets"
	cont "me steamed!"
	
	para "They don't even"
	line "try to fit in,"
	cont "either!"
	done

RugosaSurfHouseFisher3:
	text "Who let you in"
	line "here?"
	
	para "Quit eaves-"
	line "dropping!"
	done

RugosaSurfHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, RUGOSA_COAST, 4
	warp_event  4,  7, RUGOSA_COAST, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RugosaSurfGuy, -1
	object_event  5,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RugosaSurfHouseFishers, -1
	object_event  5,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RugosaSurfHouseFishers, -1
