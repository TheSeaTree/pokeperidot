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
	checkflag ENGINE_STORMBADGE
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
.havebadge
	warpfacing UP, ECRUTEAK_GYM, 10, 21
.no
	end
	
EcruteakGymEntrance:
	jumpstd gymdoor
	end
	
EcruteakCityLass:
	jumptextfaceplayer EcruteakCityLassText
	
EcruteakGymGuy:
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
	cont "there is a ledge"
	cont "blocking the way."
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

EcruteakCityGramps1Text:
	text "ECRUTEAK used to"
	line "have two towers:"

	para "one each in the"
	line "east and west."
	done

EcruteakCityGramps2Text:
	text "Ah, child."
	line "Have you learned"

	para "to dance like the"
	line "KIMONO GIRLS?"

	para "If you go to their"
	line "DANCE THEATER, an"

	para "odd old man will"
	line "give you something"
	cont "nice, I hear."
	done

EcruteakCityLass1Text:
	text "I'm going to prac-"
	line "tice at the DANCE"

	para "THEATER. Care to"
	line "join me?"
	done

EcruteakCityLass2Text:
	text "The tower that"
	line "used to be here…"

	para "My grandma told me"
	line "it used to be much"
	cont "taller."
	done

EcruteakCityLass2Text_ReleasedBeasts:
	text "Three big #MON"
	line "ran off in differ-"
	cont "ent directions."
	cont "What were they?"
	done

EcruteakCityFisherText:
	text "I heard a rumor"
	line "about OLIVINE"
	cont "LIGHTHOUSE."

	para "The #MON that"
	line "serves as the"

	para "beacon fell ill."
	line "Sounds like they"
	cont "are in trouble."
	done

EcruteakCityYoungsterText:
	text "I hear #MON are"
	line "rampaging at the"

	para "LAKE OF RAGE. I'd"
	line "like to see that."
	done

EcruteakCityGramps3Text:
	text "In the distant"
	line "past…"

	para "This tower burned"
	line "in a fire. Three"

	para "nameless #MON"
	line "perished in it."

	para "A rainbow-colored"
	line "#MON descended"

	para "from the sky and"
	line "resurrected them…"

	para "It's a legend that"
	line "has been passed"

	para "down by ECRUTEAK"
	line "GYM LEADERS."

	para "Me?"

	para "I was a trainer"
	line "way back when."
	cont "Hohoho!"
	done

EcruteakCitySignText:
	text "ECRUTEAK CITY"
	line "A Historical City"

	para "Where the Past"
	line "Meets the Present"
	done

TinTowerSignText:
	text "TIN TOWER"

	para "A legendary #-"
	line "MON is said to"
	cont "roost here."
	done

EcruteakGymSignText:
	text "ECRUTEAK CITY"
	line "#MON GYM"
	cont "LEADER: MORTY"

	para "The Mystic Seer of"
	line "the Future"
	done

EcruteakDanceTheaterSignText:
	text "ECRUTEAK DANCE"
	line "THEATER"
	done

BurnedTowerSignText:
	text "BURNED TOWER"

	para "It was destroyed"
	line "by a mysterious"
	cont "fire."

	para "Please stay away,"
	line "as it is unsafe."
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
	object_event  7, 21, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass, -1
	object_event 12, 12, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuy, EVENT_ECRUTEAK_GYM_ACCESS
	object_event  2,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityFruitTree, -1
	object_event 36,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_ITEMBALL, 0, EcruteakCityEndure, EVENT_GOT_TM_ENDURE
