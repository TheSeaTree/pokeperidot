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
	
EnterGymEvent:
	opentext
	writetext AskEnterGymText
	yesorno
	iffalse .no
	closetext
	applymovement PLAYER, EcruteakGymMovement
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	special FadeOutMusic
	waitsfx
	warpfacing UP, ECRUTEAK_GYM, 10, 21
	end	
.no
	closetext
	end

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
	
AskEnterGymText:
	text "You will be unable"
	line "to leave this GYM"
	cont "without its BADGE."
	
	para "Would you like to"
	line "enter?"
	done

EcruteakCity_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 15, 25, ECRUTEAK_FOREST_GATE, 4
	warp_event 16, 25, ECRUTEAK_FOREST_GATE, 3
	warp_event  9, 19, ECRUTEAK_POKECENTER_1F, 1
	warp_event 25,  9, ECRUTEAK_MART, 1
	warp_event 33,  8, ROUTE_12_ECRUTEAK_GATE, 1
	warp_event 33,  9, ROUTE_12_ECRUTEAK_GATE, 2
	warp_event  1,  7, ECRUTEAK_THIEF_HOUSE, 1
	warp_event 27, 15, FRIEND_BALL_HOUSE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event 18, 22, BGEVENT_READ, EcruteakCitySign
	bg_event 16, 14, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event 10, 19, BGEVENT_READ, EcruteakCityPokecenterSign
	bg_event 26,  9, BGEVENT_READ, EcruteakCityMartSign
	bg_event 25, 15, BGEVENT_UP,   EcruteakMailbox
	bg_event 21, 19, BGEVENT_UP,   EcruteakMailbox
	bg_event  8, 11, BGEVENT_UP,   EnterGymEvent

	db 3 ; object events
	object_event  8, 12, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_ACCESS
	object_event  0,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityFruitTree, -1
	object_event  32, 0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_ITEMBALL, 0, EcruteakCityEndure, EVENT_GOT_TM_ENDURE
