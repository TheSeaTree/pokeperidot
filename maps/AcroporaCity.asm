	const_def 2 ; object constants

AcroporaCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_ACROPORA
	return
	
AcroporaFisherScript:
	jumptextfaceplayer AcroporaFisherText
	
AcroporaGymEvent:
	checkflag ENGINE_COGBADGE
	iftrue .havebadge
	scall AcroporaGymEntrance
	iffalse .no
.warp
	warpfacing UP, ACROPORA_GYM,  4, 11
.no
	end
	
.havebadge
	scall AcroporaEnterGym
	jump .warp

AcroporaGymEntrance:
	jumpstd gymdoor
	end
	
AcroporaEnterGym:
	jumpstd entergym
	end
	
AcroporaCitySign:
	jumptext AcroporaCitySignText

AcroporaCityGoAwaySign:
	jumptext AcroporaCityGoAwaySignText
	
AcroporaCityGymSign:
	jumptext AcroporaCityGymSignText

FluteMasterSign:
	jumptext FluteMasterText
	
AcroporaCityPokecenterSign:
	jumpstd pokecentersign

AcroporaCityMartSign:
	jumpstd martsign

AcroporaCityMailbox:
	jumpstd mailbox
	
AcroporaFisherText:
	text "Hey, check out"
	line "the sign the FLUTE"
	cont "MASTER put up now."
	
	para "He already moved"
	line "so far away from"
	cont "the rest of the"
	cont "town. What could"
	cont "he be working on?"
	done
	
AcroporaBikerText:
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
	
AcroporaCityGoAwaySignText:
	text "TRAINER TIPS-"
	
	para "GO AWAY!"
	done
	
FluteMasterText:
	text "FLUTE MASTER's"
	line "HOUSE"
	done
	
AcroporaCitySignText:
	text "ACROPORA CITY"
	done
	
AcroporaCityGymSignText:
	text "ACROPORA CAVE-"
	
	para "ACROPORA GYM"
	line "access."
	done

AcroporaCity_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 33, 13, ROUTE_20_ACROPORA_GATE, 3
	warp_event 27, 17, ACROPORA_POKECENTER_1F, 1
	warp_event 13, 21, ACROPORA_MART, 1
	warp_event 21, 21, ACROPORA_REST_TALK_HOUSE, 1
	warp_event 47, 17, FLUTE_MASTER_HOUSE, 1
	warp_event  6, 13, ACROPORA_CAVE_1F, 1
	warp_event 22,  5, ACROPORA_CAVE_1F, 6
	warp_event 29, 23, ACROPORA_LASS_HOUSE, 1
	warp_event  5, 25, ACROPORA_CASTLE_HOUSE, 1

	db 0 ; coord events

	db 10 ; bg events
	bg_event 28, 17, BGEVENT_READ, AcroporaCityPokecenterSign
	bg_event 14, 21, BGEVENT_READ, AcroporaCityMartSign
	bg_event  3, 25, BGEVENT_UP,   AcroporaCityMailbox
	bg_event 27, 23, BGEVENT_UP,   AcroporaCityMailbox
	bg_event 19, 21, BGEVENT_UP,   AcroporaCityMailbox
	bg_event 30, 17, BGEVENT_READ, AcroporaCitySign
	bg_event 40, 23, BGEVENT_READ, AcroporaCityGoAwaySign
	bg_event 46, 18, BGEVENT_READ, FluteMasterSign
	bg_event 14,  7, BGEVENT_UP,   AcroporaGymEvent
	bg_event  5, 15, BGEVENT_READ, AcroporaCityGymSign

	db 6 ; object events
	object_event 38, 22, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 4, AcroporaFisherScript, -1
	object_event  8, 19, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 4, ObjectEvent, -1
	object_event 17, 24, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 3, -1, -1, 0, OBJECTTYPE_SCRIPT, 4, ObjectEvent, -1
	object_event 33, 20, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 4, ObjectEvent, -1
	object_event 21, 18, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 4, ObjectEvent, -1
	object_event -4, 20, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 4, ObjectEvent, -1
