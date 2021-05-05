	const_def 2 ; object constants
	const HEPATICATOWN_ROCK1
	const HEPATICATOWN_BOULDER
	const HEPATICATOWN_BURGLAR1
	const HEPATICATOWN_BURGLAR2
	const HEPATICATOWN_TUTOR
	const HEPATICATOWN_ITEMBALL

HepaticaTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene ; SCENE_HEPATICATOWN_NOTHING
	scene_script .DummyScene ; SCENE_HEPATICATOWN_SUICUNE_AND_EUSINE

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_HEPATICA
	return
	
HepaticaTownBurglar:
	playsound SFX_EXIT_BUILDING
	moveobject HEPATICATOWN_BURGLAR2, 19, 21
	appear HEPATICATOWN_BURGLAR2
	applymovement HEPATICATOWN_BURGLAR2, HepaticaBurglarExitBuilding
	applymovement PLAYER, HepaticaShovedBack
	playsound SFX_TACKLE
	waitsfx
	showemote EMOTE_SHOCK, HEPATICATOWN_BURGLAR2, 15
	applymovement HEPATICATOWN_BURGLAR2, HepaticaBurglarRunAway
	setevent EVENT_CIANWOOD_FLY_GUY
	setscene SCENE_HEPATICATOWN_SUICUNE_AND_EUSINE
	disappear HEPATICATOWN_BURGLAR2
	end

HepaticaTownLookout:
	jumptextfaceplayer HepaticaLookoutText

HepaticaTownMoveTutor:
	faceplayer
	opentext
	writetext HepaticaTownTutorText
	waitbutton
	checkitem GOLD_LEAF
	iffalse .NoLeaf
	writetext HepaticaTownTutorTeach
	yesorno
	iftrue .BodySlam
	jump .Refused
	
.BodySlam
	writetext HepaticaTownTutorWhichOne
	buttonsound
	writebyte BODY_SLAM
	special MoveTutor
	ifequal $0, .TeachMove
	jump .Refused
	
.TeachMove
	takeitem GOLD_LEAF
	writetext HepaticaTownTutorThankYou
	waitbutton
	closetext
	end
	
.Refused
	writetext HepaticaTownTutorRefused
	waitbutton
	closetext
	end
	
.NoLeaf
	writetext HepaticaTownTutorExplainGoldLeaf
	waitbutton
	turnobject LAST_TALKED, DOWN
	closetext
	end

HepaticaGymEvent:
	checkflag ENGINE_SKULLBADGE
	iftrue .havebadge
	clearevent GOLDENROD_GYM_DOOR_1
	clearevent EVENT_BEAT_GUITARIST_ANDY
	clearevent EVENT_BEAT_GUITARIST_LEE
	clearevent EVENT_BEAT_GUITARIST_COLIN
	clearevent EVENT_BEAT_GUITARIST_TREVOR
	clearevent EVENT_BEAT_BIKER_JERRY
	clearevent EVENT_BEAT_GUITARIST_MARCEL
	clearevent EVENT_BEAT_GUITARIST_IVAN
	clearevent EVENT_BEAT_GUITARIST_CONRAD
	clearevent EVENT_BEAT_GUITARIST_BOBBY
	clearevent EVENT_BEAT_POKEMANIAC_CHARLIE
	clearevent GOLDENROD_LEADER_DOOR_1
	clearevent GOLDENROD_LEADER_DOOR_2
	clearevent GOLDENROD_LEADER_DOOR_3
	scall HepaticaGymEntrance
	iffalse .no
.warp
	warpfacing UP, HEPATICA_GYM, 8, 17
.no
	end
	
.havebadge
	scall HepaticaEnterGym
	jump .warp
	
HepaticaGymEntrance:
	jumpstd gymdoor
	end
	
HepaticaEnterGym:
	jumpstd entergym
	end
	
HepaticaTownTMIceBeam:
	itemball TM_ICE_BEAM

HepaticaTownSign:
	jumptext HepaticaTownSignText

HepaticaChurchSign:
	jumptext HepaticaChurchSignText

HepaticaPharmacySign:
	jumpstd martsign

HepaticaPokecenterSign:
	jumpstd pokecentersign

HepaticaTownRock:
	jumpstd smashrock
	
HepaticaTownBoulder:
	jumpstd strengthboulder
	
HepaticaTownFruitTree:
	fruittree FRUITTREE_CIANWOOD_CITY
	
HepaticaTownHiddenWaterStone:
	hiddenitem WATER_STONE, EVENT_CIANWOOD_CITY_HIDDEN_WATER_STONE
	
HepaticaGymMovement:
	step UP
	step_end
	
HepaticaBurglarRunAway:
	run_step LEFT
	run_step LEFT
	fix_facing
	jump_step RIGHT
	step_sleep 8
	step_sleep 8
	remove_fixed_facing
	step LEFT
	step LEFT
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	step_end
	
HepaticaBurglarExitBuilding:
	run_step DOWN
	step_end

HepaticaShovedBack:
	turn_step UP
	fix_facing
	run_step DOWN
	remove_fixed_facing
	step_end
	
HepaticaLookoutText:
	text "Scram, kid!"
	
	para "There's no reason"
	line "for you to be"
	cont "snooping around up"
	cont "here."
	done

HepaticaTownTutorText:
	text "I'm a MOVE TUTOR."
	
	para "I can teach your"
	line "#MON a new move"
	cont "in exchange for a"
	cont "GOLD LEAF."
	done
	
HepaticaTownTutorTeach:
	text "Would you like to"
	line "teach BODY SLAM to"
	cont "your #MON?"
	done

HepaticaTownTutorRefused:
	text "Are you sure? This"
	line "move will flatten"
	cont "the competition!"
	done

HepaticaTownTutorExplainGoldLeaf:
	text "You don't have a"
	line "GOLD LEAF?"
	
	para "Well it hurts my"
	line "belly too much to"
	cont "teach this move"
	cont "for free."
	
	para "Come back later"
	line "with a GOLD LEAF."
	done

HepaticaTownTutorWhichOne:
	text "Which #MON"
	line "should I tutor?"
	done

HepaticaTownTutorThankYou:
	text "There we go!"
	
	para "Your #MON can"
	line "now use BODY SLAM!"
	
	para "That move has a"
	line "high chance to"
	cont "PARALYZE its"
	cont "target."
	done

HepaticaTownSignText:
	text "HEPATICA TOWN"

	para "The quiet town on"
	line "top of the world."
	done
	
HepaticaChurchSignText:
	text "No tresspassing"
	line "beyond this point!"
	done

HepaticaPharmacySignText:
	text "500 Years of"
	line "Tradition"

	para "CIANWOOD CITY"
	line "PHARMACY"

	para "We Await Your"
	line "Medicinal Queries"
	done

HepaticaPokeSeerSignText:
	text "THE # SEER"
	line "AHEAD"
	done

HepaticaTown_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 11, 19, HEPATICA_POKECENTER_1F, 1
	warp_event 19, 21, HEPATICA_MART, 1
	warp_event 27, 23, HEPATICA_LUGIA_SPEECH_HOUSE, 1
	warp_event  5, 31, POKE_SEERS_HOUSE, 1
	warp_event  4, 21, PALEROCK_MOUNTAIN_3F, 2
	warp_event 18,  7, HEPATICA_CHURCH, 1
	warp_event  8,  3, HEPATICA_CAVE_1F, 1

	db 1 ; coord events
	coord_event 19, 22, SCENE_HEPATICATOWN_NOTHING, HepaticaTownBurglar
	
	db 6 ; bg events
	bg_event 16, 22, BGEVENT_READ, HepaticaTownSign
	bg_event 14,  9, BGEVENT_READ, HepaticaChurchSign
	bg_event 12, 19, BGEVENT_READ, HepaticaPokecenterSign
	bg_event 20, 21, BGEVENT_READ, HepaticaPharmacySign
	bg_event 20, 15, BGEVENT_UP,   HepaticaGymEvent
	bg_event  5, 10, BGEVENT_ITEM, HepaticaTownHiddenWaterStone

	db 7 ; object events
	object_event  9, 10, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HepaticaTownRock, -1
	object_event 21,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HepaticaTownBoulder, -1
	object_event 16, 10, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, HepaticaTownLookout, EVENT_EXPLAINED_BURGLAR
	object_event  0,  0, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BURGLAR_IN_CIANWOOD ; burglar, runs away when talked to
	object_event 26, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HepaticaTownMoveTutor, -1
	object_event 27, 41, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_ITEMBALL, 0, HepaticaTownTMIceBeam, EVENT_GOT_TM_ICE_BEAM
	object_event 15, 38, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HepaticaTownFruitTree, -1
