	const_def 2 ; object constants
	const GENESISISLAND_MEW

GenesisIslandInside_MapScripts:
	db 7 ; scene scripts
	scene_script .Intro ; SCENE_GENESIS_ISLAND_INTRO
	scene_script .DummyScene ; SCENE_GENESIS_ISLAND_SPOT_1
	scene_script .DummyScene ; SCENE_GENESIS_ISLAND_SPOT_2
	scene_script .DummyScene ; SCENE_GENESIS_ISLAND_SPOT_3
	scene_script .DummyScene ; SCENE_GENESIS_ISLAND_SPOT_4
	scene_script .DummyScene ; SCENE_GENESIS_ISLAND_SPOT_5
	scene_script .DummyScene ; SCENE_GENESIS_ISLAND_NOTHING

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .MapMusic
	callback MAPCALLBACK_OBJECTS, .MewCallback

.Intro
	scall MewTeleportCommon
	disappear GENESISISLAND_MEW
	moveobject GENESISISLAND_MEW,  4, 21
	loadvar wMewPosition, 1
	appear GENESISISLAND_MEW
	setscene SCENE_GENESIS_ISLAND_SPOT_1
	setflag ENGINE_ROCKETS_IN_RADIO_TOWER
	playmusic MUSIC_EVOLUTION
.DummyScene
	end

.MapMusic
	checkevent EVENT_FOUGHT_MEW
	iffalse .Disappear
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	return

.MewCallback:
	checkevent EVENT_FOUGHT_MEW
	iftrue .Disappear
	copybytetovar wMewPosition
	ifequal  1, .PositionOne
	ifequal  2, .PositionTwo
	ifequal  3, .PositionThree
	ifequal  4, .PositionFour
	ifequal  5, .PositionFive

.Disappear:
	return

.PositionOne:
	moveobject GENESISISLAND_MEW,  4, 21
	appear GENESISISLAND_MEW
	return
	
.PositionTwo:
	moveobject GENESISISLAND_MEW,  5,  3
	appear GENESISISLAND_MEW
	return
	
.PositionThree:
	moveobject GENESISISLAND_MEW, 25,  6
	appear GENESISISLAND_MEW
	return	
	
.PositionFour:
	moveobject GENESISISLAND_MEW, 27, 22
	appear GENESISISLAND_MEW
	return
	
.PositionFive:
	moveobject GENESISISLAND_MEW, 15, 14
	appear GENESISISLAND_MEW
	return

MewTeleportSight:
	scall MewTeleportCommon
	disappear GENESISISLAND_MEW
	copybytetovar wMewPosition
	ifequal  1, .Position1
	ifequal  2, .Position2
	ifequal  3, .Position3
	ifequal  4, .Position4
	ifequal  5, .Position5

.Position1:
	moveobject GENESISISLAND_MEW, 15, 14
	appear GENESISISLAND_MEW
	loadvar wMewPosition, 5
	setscene SCENE_GENESIS_ISLAND_SPOT_5
	end

.Position2:
	moveobject GENESISISLAND_MEW,  4, 21
	appear GENESISISLAND_MEW
	loadvar wMewPosition, 1
	setscene SCENE_GENESIS_ISLAND_SPOT_1
	end

.Position3:

	moveobject GENESISISLAND_MEW,  5,  3
	appear GENESISISLAND_MEW
	loadvar wMewPosition, 2
	setscene SCENE_GENESIS_ISLAND_SPOT_2
	end

.Position4:
	moveobject GENESISISLAND_MEW, 15, 14
	appear GENESISISLAND_MEW
	loadvar wMewPosition, 5
	setscene SCENE_GENESIS_ISLAND_SPOT_5
	end

.Position5:
	moveobject GENESISISLAND_MEW, 27, 22
	appear GENESISISLAND_MEW
	loadvar wMewPosition, 4
	setscene SCENE_GENESIS_ISLAND_SPOT_4
	end

MewTeleportLedge:
	scall MewTeleportCommon
	disappear GENESISISLAND_MEW
	copybytetovar wMewPosition
	ifequal  1, .Position1
	ifequal  2, .Position2
	ifequal  3, .Position3
	ifequal  4, .Position4

.Position1:
	moveobject GENESISISLAND_MEW, 27, 22
	appear GENESISISLAND_MEW
	loadvar wMewPosition, 4
	setscene SCENE_GENESIS_ISLAND_SPOT_4
	end

.Position2:
	moveobject GENESISISLAND_MEW, 15, 14
	appear GENESISISLAND_MEW
	loadvar wMewPosition, 5
	setscene SCENE_GENESIS_ISLAND_SPOT_5
	end

.Position3:
	moveobject GENESISISLAND_MEW, 15, 14
	appear GENESISISLAND_MEW
	loadvar wMewPosition, 5
	setscene SCENE_GENESIS_ISLAND_SPOT_5
	end

.Position4:
	moveobject GENESISISLAND_MEW, 25,  6
	appear GENESISISLAND_MEW
	loadvar wMewPosition, 3
	setscene SCENE_GENESIS_ISLAND_SPOT_3
	end

MewTeleportCommon:
	showemote EMOTE_SHOCK, GENESISISLAND_MEW, 15
	cry MEW
	waitsfx
	playsound SFX_WARP_TO
	applymovement GENESISISLAND_MEW, MewTeleportMovement
	end

MewTeleportMovement:
	hide_person
	step_sleep 2
	show_person
	step_sleep 2
	hide_person
	step_sleep 2
	show_person
	step_sleep 2
	hide_person
	step_sleep 2
	show_person
	step_sleep 2
	hide_person
	step_end

Mew:
	opentext
	writetext MewText
	cry MEW
	waitsfx
	closetext
	special LegendaryEvent_SetBattleType
	loadwildmon MEW, 70
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	disappear GENESISISLAND_MEW
	setscene SCENE_GENESIS_ISLAND_NOTHING
	setevent EVENT_FOUGHT_MEW
	special CheckCaughtCelebi
	iffalse .FailedCapture
	setevent EVENT_CAUGHT_MEW
.FailedCapture
	end

MewText:
	text "Mew!"
	done

GenesisIslandInside_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 14, 25, GENESIS_ISLAND, 2
	warp_event 15, 25, GENESIS_ISLAND, 3

	db 15 ; coord events
	coord_event  4, 18, SCENE_GENESIS_ISLAND_SPOT_1, MewTeleportLedge
	coord_event  5, 18, SCENE_GENESIS_ISLAND_SPOT_1, MewTeleportLedge
	coord_event  6, 23, SCENE_GENESIS_ISLAND_SPOT_1, MewTeleportSight
	coord_event  6, 20, SCENE_GENESIS_ISLAND_SPOT_1, MewTeleportSight
	coord_event  9,  3, SCENE_GENESIS_ISLAND_SPOT_2, MewTeleportLedge
	coord_event  9,  2, SCENE_GENESIS_ISLAND_SPOT_2, MewTeleportLedge
	coord_event  5,  6, SCENE_GENESIS_ISLAND_SPOT_2, MewTeleportSight
	coord_event 24,  9, SCENE_GENESIS_ISLAND_SPOT_3, MewTeleportSight
	coord_event 22,  5, SCENE_GENESIS_ISLAND_SPOT_3, MewTeleportLedge
	coord_event 22,  4, SCENE_GENESIS_ISLAND_SPOT_3, MewTeleportLedge
	coord_event 24, 22, SCENE_GENESIS_ISLAND_SPOT_4, MewTeleportSight
	coord_event 28, 18, SCENE_GENESIS_ISLAND_SPOT_4, MewTeleportLedge
	coord_event 29, 18, SCENE_GENESIS_ISLAND_SPOT_4, MewTeleportLedge
	coord_event 14, 17, SCENE_GENESIS_ISLAND_SPOT_5, MewTeleportSight
	coord_event 15, 17, SCENE_GENESIS_ISLAND_SPOT_5, MewTeleportSight

	db 0 ; bg events

	db 1 ; object events
	object_event 15, 23, SPRITE_MEW, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, Mew, EVENT_FOUGHT_MEW
