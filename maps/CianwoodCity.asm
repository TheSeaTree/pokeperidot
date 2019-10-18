	const_def 2 ; object constants
	const CIANWOODCITY_ROCK1
	const CIANWOODCITY_BOULDER
	const CIANWOODCITY_BURGLAR1
	const CIANWOODCITY_BURGLAR2
	const CIANWOODCITY_TUTOR
	const CIANWOODCITY_ITEMBALL

CianwoodCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_CIANWOODCITY_NOTHING
	scene_script .DummyScene1 ; SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	disappear CIANWOODCITY_BURGLAR2
	end

.DummyScene1:
	disappear CIANWOODCITY_BURGLAR2
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_CIANWOOD
	return
	
ShoesGuy:
	faceplayer
	opentext
	writetext ShoesGuyText
	setflag ENGINE_POKEGEAR
	buttonsound
	closetext
	end
	
ShoesGuyText:
	text "You must have come"
	line "a long way on your"
	cont "adventure, those"
	cont "shoes look all"
	cont "worn out."
	
	para "You should take"
	line "this pair of"
	cont "RUNNING SHOES."
	
	para "It's OK, they"
	cont "don't fit me."
	done
	
CianwoodCityBurglar:
	playsound SFX_EXIT_BUILDING
	appear CIANWOODCITY_BURGLAR2
	applymovement CIANWOODCITY_BURGLAR2, CianwoodBurglarExitBuilding
	applymovement PLAYER, CianwoodShovedBack
	playsound SFX_TACKLE
	waitsfx
	showemote EMOTE_SHOCK, CIANWOODCITY_BURGLAR2, 15
	applymovement CIANWOODCITY_BURGLAR2, CianwoodBurglarRunAway
	setevent EVENT_CIANWOOD_FLY_GUY
	setscene SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE
	disappear CIANWOODCITY_BURGLAR2
	end

CianwoodCityLookout:
;	opentext
;	givepoke KANGASKHAN, 15
;	special GiftMonMoves
;	closetext
;	end
	jumptextfaceplayer CianwoodLookoutText

CianwoodCityMoveTutor:
	faceplayer
	opentext
	writetext CianwoodCityTutorText
	waitbutton
	checkitem GOLD_LEAF
	iffalse .NoLeaf
	writetext CianwoodCityTutorTeach
	yesorno
	iftrue .BodySlam
	jump .Refused
	
.BodySlam
	writetext CianwoodCityTutorWhichOne
	buttonsound
	writebyte BODY_SLAM
	special MoveTutor
	ifequal $0, .TeachMove
	jump .Refused
	
.TeachMove
	takeitem GOLD_LEAF
	writetext CianwoodCityTutorThankYou
	waitbutton
	closetext
	end
	
.Refused
	writetext CianwoodCityTutorRefused
	waitbutton
	closetext
	end
	
.NoLeaf
	writetext CianwoodCityTutorExplainGoldLeaf
	waitbutton
	turnobject LAST_TALKED, DOWN
	closetext
	end
	
CianwoodGymEvent:
	scall CianwoodGymEntrance
	iffalse .no
	warpfacing UP, GOLDENROD_GYM, 22, 39
.no
	end
	
CianwoodGymEntrance:
	jumpstd gymdoor
	end
	
CianwoodCityTMIceBeam:
	itemball TM_ICE_BEAM

CianwoodCitySign:
	jumptext CianwoodCitySignText

CianwoodGymSign:
	jumptext CianwoodGymSignText

CianwoodPharmacySign:
	jumptext CianwoodPharmacySignText

CianwoodPhotoStudioSign:
	jumptext CianwoodPhotoStudioSignText

CianwoodPokeSeerSign:
	jumptext CianwoodPokeSeerSignText

CianwoodPokecenterSign:
	jumpstd pokecentersign

CianwoodCityRock:
	jumpstd smashrock
	
CianwoodCityBoulder:
	jumpstd strengthboulder
	
CianwoodCityFruitTree:
	fruittree FRUITTREE_CIANWOOD_CITY
	
CianwoodGymMovement:
	step UP
	step_end
	
CianwoodBurglarRunAway:
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
	
CianwoodBurglarExitBuilding:
	run_step DOWN
	step_end

CianwoodShovedBack:
	turn_step UP
	fix_facing
	run_step DOWN
	remove_fixed_facing
	step_end
	
CianwoodLookoutText:
	text "Scram, kid!"
	
	para "There's no reason"
	line "for you to be"
	cont "snooping around up"
	cont "here."
	done
	
ChucksWifeEasierToFlyText:
	text "You crossed the"
	line "sea to get here?"

	para "That must have"
	line "been hard."

	para "It would be much"
	line "easier if your"

	para "#MON knew how"
	line "to FLY…"
	done

ChucksWifeBeatChuckText:
	text "But you can't use"
	line "FLY without this"
	cont "city's GYM BADGE."

	para "If you beat the"
	line "GYM LEADER here,"
	cont "come see me."

	para "I'll have a nice"
	line "gift for you."
	done

ChucksWifeGiveHMText:
	text "That's CIANWOOD's"
	line "GYM BADGE!"

	para "Then you should"
	line "take this HM."
	done

ChucksWifeFlySpeechText:
	text "Teach FLY to your"
	line "#MON."

	para "You will be able"
	line "to FLY instantly"

	para "to anywhere you "
	line "have visited."
	done

ChucksWifeChubbyText:
	text "My husband lost to"
	line "you, so he needs"
	cont "to train harder."

	para "That's good, since"
	line "he was getting a"
	cont "little chubby."
	done

CianwoodCityYoungsterText:
	text "If you use FLY,"
	line "you can get back"

	para "to OLIVINE in-"
	line "stantly."
	done

CianwoodCityPokefanMText:
	text "Boulders to the"
	line "north of town can"
	cont "be crushed."

	para "They may be hiding"
	line "something."

	para "Your #MON could"
	line "use ROCK SMASH to"
	cont "break them."
	done

CianwoodCityLassText:
	text "CHUCK, the GYM"
	line "LEADER, spars with"

	para "his fighting #-"
	line "MON."
	done

CianwoodCityTutorText:
	text "I'm a MOVE TUTOR."
	
	para "I can teach your"
	line "#MON a new move"
	cont "in exchange for a"
	cont "GOLD LEAF."
	done
	
CianwoodCityTutorTeach:
	text "Would you like to"
	line "teach BODY SLAM to"
	cont "your #MON?"
	done

CianwoodCityTutorRefused:
	text "Are you sure? This"
	line "move will flatten"
	cont "the competition!"
	done

CianwoodCityTutorExplainGoldLeaf:
	text "You don't have a"
	line "GOLD LEAF?"
	
	para "Well it hurts my"
	line "belly too much to"
	cont "teach this move"
	cont "for free."
	
	para "Come back later"
	line "with a GOLD LEAF."
	done

CianwoodCityTutorWhichOne:
	text "Which #MON"
	line "should I tutor?"
	done

CianwoodCityTutorThankYou:
	text "There we go!"
	
	para "Your #MON can now"
	line "use BODY SLAM!"
	
	para "That move has a"
	line "high chance to"
	cont "PARALYZE its"
	cont "target."
	done

CianwoodCitySignText:
	text "CIANWOOD CITY"

	para "A Port Surrounded"
	line "by Rough Seas"
	done

CianwoodGymSignText:
	text "CIANWOOD CITY"
	line "#MON GYM"

	para "LEADER: CHUCK"

	para "His Roaring Fists"
	line "Do the Talking"
	done

CianwoodPharmacySignText:
	text "500 Years of"
	line "Tradition"

	para "CIANWOOD CITY"
	line "PHARMACY"

	para "We Await Your"
	line "Medicinal Queries"
	done

CianwoodPhotoStudioSignText:
	text "CIANWOOD CITY"
	line "PHOTO STUDIO"

	para "Take a Snapshot as"
	line "a Keepsake!"
	done

CianwoodPokeSeerSignText:
	text "THE # SEER"
	line "AHEAD"
	done

CianwoodCity_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event  9, 31, MANIAS_HOUSE, 1
	warp_event 20, 15, GOLDENROD_GYM, 1
	warp_event 11, 19, CIANWOOD_POKECENTER_1F, 1
	warp_event 19, 21, CIANWOOD_MART, 1
	warp_event  9,  5, CIANWOOD_PHOTO_STUDIO, 1
	warp_event  5, 31, CIANWOOD_LUGIA_SPEECH_HOUSE, 1
	warp_event 27, 23, POKE_SEERS_HOUSE, 1
	warp_event  4, 21, PALEROCK_MOUNTAIN_3F, 2
	warp_event 18,  7, CIANWOOD_CHURCH, 1
	warp_event  8,  3, CIANWOOD_CAVE_1F, 1

	db 1 ; coord events
	coord_event 19, 22, SCENE_CIANWOODCITY_NOTHING, CianwoodCityBurglar
	
	db 5 ; bg events
	bg_event 16, 22, BGEVENT_READ, CianwoodCitySign
	bg_event 12, 19, BGEVENT_READ, CianwoodPokecenterSign
	bg_event 20, 21, BGEVENT_READ, CianwoodPharmacySign
	bg_event  7, 27, BGEVENT_READ, CianwoodPokeSeerSign
	bg_event 20, 15, BGEVENT_UP,   CianwoodGymEvent

	db 7 ; object events
	object_event  9, 10, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 21,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityBoulder, -1
	object_event 16, 10, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodCityLookout, EVENT_EXPLAINED_BURGLAR
	object_event 19, 21, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BURGLAR_IN_CIANWOOD ; burglar, runs away when talked to
	object_event 26, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodCityMoveTutor, -1
	object_event 27, 41, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_ITEMBALL, 0, CianwoodCityTMIceBeam, EVENT_GOT_TM_ICE_BEAM
	object_event 15, 38, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityFruitTree, -1
