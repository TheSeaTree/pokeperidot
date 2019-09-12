	const_def 2 ; object constants

BlackthornCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	return
	
BlackthornCitySign:
	jumptext BlackthornCitySignText
	
BlackthornCityGymSign:
	jumptext BlackthornCityGymSignText
	
BlackthornCityPokecenterSign:
	jumpstd pokecentersign

BlackthornCityMartSign:
	jumpstd martsign

BlackthornCityMailbox:
	jumpstd mailbox
	
BlackthornBikerText:
	text "VROOM!"
	
	para "VROOM!"
	line "VROOM!"
	
	para "BADABADABADABADA!"
	
	para "If this guy don't"
	line "like our bikes'"
	cont "music, he can just"
	cont "GIT OUT!"
	
	para "VROOM!"
	line "BADABADABADABADA!"
	done
	
BlackthornCitySignText:
	text "ACROPORA CITY"
	done
	
BlackthornCityGymSignText:
	text "ACROPORA CAVE-"
	
	para "ACROPORA GYM"
	line "access."
	done

BlackthornCity_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 39, 13, ROUTE_20, 1
	warp_event 33, 17, BLACKTHORN_POKECENTER_1F, 1
	warp_event 19, 21, BLACKTHORN_MART, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event 34, 17, BGEVENT_READ, BlackthornCityPokecenterSign
	bg_event 20, 21, BGEVENT_READ, BlackthornCityMartSign
	bg_event  9, 25, BGEVENT_UP, BlackthornCityMailbox
	bg_event 33, 23, BGEVENT_UP, BlackthornCityMailbox
	bg_event 25, 21, BGEVENT_UP, BlackthornCityMailbox
	bg_event 36, 17, BGEVENT_READ, BlackthornCitySign
	bg_event 11, 15, BGEVENT_READ, BlackthornCityGymSign

	db 1 ; object events
	object_event  0,  0, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 4, ObjectEvent, -1
