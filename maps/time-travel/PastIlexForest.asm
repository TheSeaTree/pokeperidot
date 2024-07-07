	const_def 2 ; object constants
	const PASTILEXFOREST_CELEBI

PastIlexForest_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Restless

.Restless
	setflag ENGINE_FOREST_IS_RESTLESS
	return

PastCelebiTest:
	moveobject PASTILEXFOREST_CELEBI, 47, 3
	special CelebiShrineEvent
	appear PASTILEXFOREST_CELEBI
	turnobject PLAYER, LEFT
	setlasttalked PASTILEXFOREST_CELEBI
	loadwildmon CELEBI, 60
	startbattle
	reloadmapafterbattle
	end

.PitchBlack
	jumpstd darkenroom
	end

.OldShrine
	writetext PastForestShrineText
	waitbutton
	closetext
	end

CelebiBoss4:
	scall CelebiBoss4Intro
	loadwildmon CELEBI, 23
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	scall CelebiBoss4Battle
	setevent EVENT_HIDE_AND_SEEK_CELEBI_2

CelebiBoss4Intro:
	jumpstd bosscelebiintro
	end

CelebiBoss4Battle:
	jumpstd bosscelebibattle
	end

PastIlexForestBarbedSpear:
	itemball BARBED_SPEAR

PastIlexForestRock:
	jumpstd smashrock

PastCelebiEnergyText:
	text "CELEBI unleashed"
	line "a huge amount of"
	cont "PSYCHIC power!"
	done

PastForestShrineText:
	text "It looks like an"
	line "old shrine."
	done

PastIlexForest_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 67, 34, PAST_ELKHORN_TOWN, 4 ; Forest Gate
	warp_event 67, 35, PAST_ELKHORN_TOWN, 5 ; Forest Gate
	warp_event 48,  3, ROUTE_24_NORTH, 1 ; Test Point

	db 0 ; coord events

	db 1 ; bg events
	bg_event 48,  2, BGEVENT_UP, CelebiBoss4

	db 5 ; object events
	object_event -1, -1, SPRITE_CELEBI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastIlexForestBarbedSpear, EVENT_ILEX_FOREST_PAST_BARBED_SPEAR
	object_event 26, 31, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastIlexForestRock, -1
	object_event 24, 34, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastIlexForestRock, -1
	object_event 23, 32, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastIlexForestRock, -1
