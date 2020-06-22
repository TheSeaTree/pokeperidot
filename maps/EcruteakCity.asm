	const_def 2 ; object constants
	const ECRUTEAKCITY_GYM_GUY
	const ECRUTEAKCITY_FRUIT_TREE

EcruteakCity_MapScripts:
	db 2 ; scene scripts
	scene_script .ResetGym	 ; SCENE_GYMRESET
	scene_script .DummyScene ; SCENE_DONE

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	
.DummyScene:
	end

.ResetGym:
	checkevent EVENT_ECRUTEAK_GYM_INTRO
	iffalse .end
	random 4
	ifequal 0, .Spawn1
	ifequal 1, .Spawn2
	ifequal 2, .Spawn3
	ifequal 3, .Spawn4
	return
	
.Spawn1
	setmapscene ECRUTEAK_GYM, SCENE_ECRUTEAKGYM_MON_1
	end

.Spawn2
	setmapscene ECRUTEAK_GYM, SCENE_ECRUTEAKGYM_MON_2
	end

.Spawn3
	setmapscene ECRUTEAK_GYM, SCENE_ECRUTEAKGYM_MON_3
	end
	
.Spawn4
	setmapscene ECRUTEAK_GYM, SCENE_ECRUTEAKGYM_MON_4
	end
	
.end
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	return

EcruteakGymEvent:
	checkflag ENGINE_ROOTBADGE
	iftrue .havebadge
	clearevent EVENT_ECRUTEAK_GYM_MON_1
	clearevent EVENT_ECRUTEAK_GYM_MON_2
	clearevent EVENT_ECRUTEAK_GYM_MON_3
	clearevent EVENT_ECRUTEAK_GYM_MON_4
	clearflag EVENT_BEAT_CAMPER_JEFF
	clearflag EVENT_BEAT_BUG_CATCHER_GREG
	clearflag EVENT_BEAT_PICNICKER_TERRY
	clearflag EVENT_BEAT_PICNICKER_BRITTANY
	clearflag EVENT_BEAT_POKEFANM_LESTER
	scall EcruteakGymEntrance
	iffalse .no
.warp
	warpfacing UP, ECRUTEAK_GYM, 10, 21
.no
	end

.havebadge
	scall EcruteakEnterGym
	jump .warp
	
EcruteakGymEntrance:
	jumpstd gymdoor
	end
	
EcruteakEnterGym
	jumpstd entergym
	end
	
EcruteakCityLass:
	jumptextfaceplayer EcruteakCityLassText
	
EcruteakGymGuyOutside:
	jumptextfaceplayer EcruteakGymLeaderAwayText

EcruteakCityFruitTree:
	fruittree ECRUTEAK_CITY
	
EcruteakCityEndure:
	itemball TM_ENDURE

EcruteakCitySign:
	jumptext EcruteakCitySignText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

EcruteakMailbox:
	jumpstd mailbox

EcruteakCityPokecenterSign:
	jumpstd pokecentersign

EcruteakCityMartSign:
	jumpstd martsign

EcruteakGymMovement:
	step UP
	step_resume
	
EcruteakCityLassText:
	text "No fair!"
	
	para "I wanted to visit"
	line "my friend in"
	cont "ACROPORA CITY, but"
	cont "there are some"
	cont "shady men blocking"
	cont "the path."
	done
	
EcruteakGymLeaderAwayText:
	text "Are you looking to"
	line "challenge the GYM"
	cont "LEADER of this"
	cont "town?"
	
	para "I'm sorry, but she"
	line "isn't in at the"
	cont "moment, she had"
	cont "to leave for an"
	cont "emergency."
	
	para "Maybe you could"
	line "try paying a visit"
	cont "to her #MON"
	cont "shelter, it's"
	cont "right on ROUTE 12,"
	cont "you can't miss it!"
	done

EcruteakCitySignText:
	text "STAGHORN TOWN"

	para "The link between"
	line "nature and civili-"
	cont "zation."
	done

EcruteakDanceTheaterSignText:
	text "ECRUTEAK DANCE"
	line "THEATER"
	done

EcruteakCity_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 19, 25, ECRUTEAK_FOREST_GATE, 4
	warp_event 20, 25, ECRUTEAK_FOREST_GATE, 3
	warp_event 13, 19, ECRUTEAK_POKECENTER_1F, 1
	warp_event 29,  9, ECRUTEAK_MART, 1
	warp_event 37,  8, ROUTE_12_ECRUTEAK_GATE, 1
	warp_event 37,  9, ROUTE_12_ECRUTEAK_GATE, 2
	warp_event  5,  7, ECRUTEAK_THIEF_HOUSE, 1
	warp_event 31, 15, FRIEND_BALL_HOUSE, 1
	warp_event 27, 19, RICHARDS_HOUSE, 1
	warp_event  4, 22, ROUTE_21_ECRUTEAK_GATE, 3
	warp_event  4, 23, ROUTE_21_ECRUTEAK_GATE, 4

	db 0 ; coord events

	db 7 ; bg events
	bg_event 22, 22, BGEVENT_READ, EcruteakCitySign
	bg_event 20, 14, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event 14, 19, BGEVENT_READ, EcruteakCityPokecenterSign
	bg_event 30,  9, BGEVENT_READ, EcruteakCityMartSign
	bg_event 29, 15, BGEVENT_UP,   EcruteakMailbox
	bg_event 25, 19, BGEVENT_UP,   EcruteakMailbox
	bg_event 12, 11, BGEVENT_UP,   EcruteakGymEvent

	db 4 ; object events
	object_event  7, 21, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass, EVENT_FLUTE_HIDEOUT_OPEN
	object_event 12, 12, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuyOutside, EVENT_ECRUTEAK_GYM_ACCESS
	object_event  2,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityFruitTree, -1
	object_event 36,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_ITEMBALL, 0, EcruteakCityEndure, EVENT_GOT_TM_ENDURE
