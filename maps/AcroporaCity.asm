	const_def 2 ; object constants

AcroporaCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .Ledge
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.Ledge
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .Nothing
	changeblock 16, 10, $c7
.Nothing
	return

.FlyPoint:
	setflag ENGINE_FLYPOINT_ACROPORA
	return
	
AcroporaFisherScript:
	jumptextfaceplayer AcroporaFisherText

AcroporaPokefanMScript:
	jumptextfaceplayer AcroporaPokefanMText

AcroporaBuenaScript:
	jumptextfaceplayer AcroporaBuenaText

AcroporaLassScript:
	checkevent EVENT_CLEARED_BURGLAR_HIDEOUT
	iftrue .ClearedHideout
	jumptextfaceplayer AcroporaLassText
.ClearedHideout
	jumptextfaceplayer AcroporaLassClearedHideoutText

AcroporaRockerScript:
	jumptextfaceplayer AcroporaRockerText

AcroporaBikerScript:
	jumptextfaceplayer AcroporaBikerText

AcroporaGymEvent:
	checkflag ENGINE_GLACIERBADGE
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

AcroporaPokefanMText:
	text "There's someone in"
	line "the cave that is"
	cont "blocking the way"
	cont "to MOLTEN PEAK."

	para "I heard that's"
	line "where the best"
	cont "FIRE #MON can"
	cont "be found."

	para "It's also where the"
	line "red-hot LEADER"
	cont "ENYA trains!"
	done

AcroporaBuenaText:
	text "When I was little,"
	line "I used to look at"
	cont "MOLTEN PEAK from"
	cont "my window before"
	cont "I went to sleep."

	para "The shining lava"
	line "looks so beautiful"
	cont "at night."
	done

AcroporaLassText:
	text "A group of loud"
	line "BIKERs showed up"
	cont "in town recently."

	para "I wish someone"
	line "would do something"
	cont "about all the"
	cont "noise they make."

	para "It's so rude!"
	done

AcroporaLassClearedHideoutText:
	text "I haven't seen the"
	line "BIKERs in a while."

	para "We can finally"
	line "enjoy some peace"
	cont "and quiet again!"

	para "I wonder what made"
	line "them leave here"
	cont "so suddenly."
	done

AcroporaRockerText:
	text "Have you ever"
	line "heard the FLUTE"
	cont "MASTER's music?"

	para "It's truly life-"
	line "changing."

	para "I'm going to write"
	line "music like his"
	cont "some day."

	para "Aha! Maybe they'll"
	line "call me the GUITAR"
	cont "MASTER!"
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

	db 10 ; warp events
	warp_event 33, 13, ROUTE_20_ACROPORA_GATE, 3
	warp_event 27, 17, ACROPORA_POKECENTER_1F, 1
	warp_event 13, 21, ACROPORA_MART, 1
	warp_event 21, 21, ACROPORA_REST_TALK_HOUSE, 1
	warp_event 47, 17, FLUTE_MASTER_HOUSE, 1
	warp_event  6, 13, ACROPORA_CAVE_1F, 1
	warp_event 22,  5, ACROPORA_CAVE_1F, 6
	warp_event 29, 23, ACROPORA_LASS_HOUSE, 1
	warp_event  5, 25, ACROPORA_CASTLE_HOUSE, 1
	warp_event 14,  7, ACROPORA_GYM, 1

	db 0 ; coord events

	db 9 ; bg events
	bg_event 28, 17, BGEVENT_READ, AcroporaCityPokecenterSign
	bg_event 14, 21, BGEVENT_READ, AcroporaCityMartSign
	bg_event  3, 25, BGEVENT_UP,   AcroporaCityMailbox
	bg_event 27, 23, BGEVENT_UP,   AcroporaCityMailbox
	bg_event 19, 21, BGEVENT_UP,   AcroporaCityMailbox
	bg_event 30, 17, BGEVENT_READ, AcroporaCitySign
	bg_event 40, 23, BGEVENT_READ, AcroporaCityGoAwaySign
	bg_event 46, 18, BGEVENT_READ, FluteMasterSign
	bg_event  5, 15, BGEVENT_READ, AcroporaCityGymSign

	db 7 ; object events
	object_event 38, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 4, AcroporaFisherScript, -1
	object_event  8, 19, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 4, AcroporaPokefanMScript, -1
	object_event 17, 24, SPRITE_BUENA, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 4, AcroporaBuenaScript, -1
	object_event 33, 20, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 4, AcroporaLassScript, -1
	object_event 21, 18, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 4, AcroporaRockerScript, -1
	object_event 30, 27, SPRITE_BIKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 4, AcroporaBikerScript, EVENT_CLEARED_BURGLAR_HIDEOUT
	object_event -4, 20, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 4, ObjectEvent, -1
