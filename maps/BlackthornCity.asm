	const_def 2 ; object constants

BlackthornCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	return
	
BlackthornFisherScript:
	jumptextfaceplayer BlackthornFisherText
	
BlackthornGymEvent:
	scall BlackthornGymEntrance
	iffalse .no
;	warpfacing UP, ROUTE_22_CAVE_B1F,  34, 12
	warpfacing UP, OLIVINE_GYM,  4, 11
.no
	end	
	
BlackthornGymEntrance:
	jumpstd gymdoor
	end
	
BlackthornCitySign:
	jumptext BlackthornCitySignText

BlackthornCityGoAwaySign:
	jumptext BlackthornCityGoAwaySignText
	
BlackthornCityGymSign:
	jumptext BlackthornCityGymSignText

FluteMasterSign:
	jumptext FluteMasterText
	
BlackthornCityPokecenterSign:
	jumpstd pokecentersign

BlackthornCityMartSign:
	jumpstd martsign

BlackthornCityMailbox:
	jumpstd mailbox
	
BlackthornFisherText:
	text "Hey, check out"
	line "the sign the FLUTE"
	cont "MASTER put up now."
	
	para "He already moved"
	line "so far away from"
	cont "the rest of the"
	cont "town. What could"
	cont "he be working on?"
	done
	
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
	
BlackthornCityGoAwaySignText:
	text "TRAINER TIPS-"
	
	para "GO AWAY!"
	done
	
FluteMasterText:
	text "FLUTE MASTER's"
	line "HOUSE"
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

	db 8 ; warp events
	warp_event 39, 13, ROUTE_20, 1
	warp_event 33, 17, BLACKTHORN_POKECENTER_1F, 1
	warp_event 19, 21, BLACKTHORN_MART, 1
	warp_event 27, 21, BLACKTHORN_REST_TALK_HOUSE, 1
	warp_event 53, 17, FLUTE_MASTER_HOUSE, 1
	warp_event 12, 13, BLACKTHORN_CAVE_1F, 1
	warp_event 28,  5, BLACKTHORN_CAVE_1F, 6
	warp_event 35, 23, BLACKTHORN_LASS_HOUSE, 1

	db 0 ; coord events

	db 10 ; bg events
	bg_event 34, 17, BGEVENT_READ, BlackthornCityPokecenterSign
	bg_event 20, 21, BGEVENT_READ, BlackthornCityMartSign
	bg_event  9, 25, BGEVENT_UP,   BlackthornCityMailbox
	bg_event 33, 23, BGEVENT_UP,   BlackthornCityMailbox
	bg_event 25, 21, BGEVENT_UP,   BlackthornCityMailbox
	bg_event 36, 17, BGEVENT_READ, BlackthornCitySign
	bg_event 46, 23, BGEVENT_READ, BlackthornCityGoAwaySign
	bg_event 52, 18, BGEVENT_READ, FluteMasterSign
	bg_event 20,  7, BGEVENT_UP,   BlackthornGymEvent
	bg_event 11, 15, BGEVENT_READ, BlackthornCityGymSign

	db 1 ; object events
	object_event 44, 22, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 4, BlackthornFisherScript, -1
