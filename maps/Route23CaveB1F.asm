	const_def 2 ; object constants
	const ROUTE23CAVEB1F_BOULDER1
	const ROUTE23CAVEB1F_BOULDER2
	const ROUTE23CAVEB1F_ROCK1
	const ROUTE23CAVEB1F_ROCK2
	const ROUTE23CAVEB1F_ROCK3
	const ROUTE23CAVEB1F_ROCK4
	const ROUTE23CAVEB1F_ROCK5
	const ROUTE23CAVEB1F_ROCK6
	const ROUTE23CAVEB1F_ROCK7
	const ROUTE23CAVEB1F_ROCK8

Route23CaveB1F_MapScripts:
	db 0 ; scene scripts

	db 3 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable
	callback MAPCALLBACK_OBJECTS, .PressedButton
	callback MAPCALLBACK_TILES, .OpenGate

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 3, ROUTE23CAVEB1F_BOULDER1, .Boulder1
	db -1 ; end

.Boulder1:
	moveobject ROUTE23CAVEB1F_BOULDER2, 26, 10
	appear ROUTE23CAVEB1F_BOULDER2
	changeblock 6, 8, $03 ; open door
	setevent EVENT_ROUTE_23_CAVE_BOULDER
	disappear ROUTE23CAVEB1F_BOULDER1

	earthquake 10
	playsound SFX_STRENGTH
	pause 10
	playsound SFX_WALL_OPEN
	waitsfx
	opentext
	writetext Route23CaveB1FDoorOpenedText
	waitbutton
	closetext
	end

.PressedButton:
	checkevent EVENT_ROUTE_23_CAVE_BOULDER
	iffalse .skip
	moveobject ROUTE23CAVEB1F_BOULDER2, 26, 10
	appear ROUTE23CAVEB1F_BOULDER2
	return

.OpenGate:
	checkevent EVENT_ROUTE_23_CAVE_BOULDER
	iffalse .skip
	changeblock 6, 8, $cf ; open door
.skip
	return

Route23CaveB1FHiddenCoarseCharm:
	hiddenitem COARSE_CHARM, EVENT_ROUTE_23_CAVE_HIDDEN_COARSE_CHARM

Route23CaveB1FHiddenStarPiece:
	hiddenitem STAR_PIECE, EVENT_ROUTE_23_CAVE_HIDDEN_STAR_PIECE

Route23CaveB1FHiddenMetalCoat:
	hiddenitem METAL_COAT, EVENT_ROUTE_23_CAVE_HIDDEN_METAL_COAT

Route23CaveB1FStuckBoulder:
	jumptext Route23CaveB1FStuckBoulderText

Route23CaveB1FBoulder:
	jumpstd strengthboulder

Route23CaveB1FRock:
	jumpstd smashrock

Route23CaveB1FStuckBoulderText:
	text "This boulder won't"
	line "budge!"
	done

Route23CaveB1FDoorOpenedText:
	text "A door opened up!"
	done

Route23CaveB1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 11, ROUTE_23_CAVE_1F, 3
	warp_event 21,  3, ROUTE_23_CAVE_1F, 4
	warp_event 26, 10, ROUTE_23_CAVE_B1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  9, 16, BGEVENT_ITEM, Route23CaveB1FHiddenCoarseCharm
	bg_event  8,  8, BGEVENT_ITEM, Route23CaveB1FHiddenStarPiece
	bg_event  6,  4, BGEVENT_ITEM, Route23CaveB1FHiddenMetalCoat

	db 10 ; object events
	object_event 14, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23CaveB1FBoulder, EVENT_ROUTE_23_CAVE_BOULDER
	object_event  0,  0, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23CaveB1FStuckBoulder, -1
	object_event 17, 12, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23CaveB1FRock, -1
	object_event  7,  4, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23CaveB1FRock, -1
	object_event 16, 10, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23CaveB1FRock, -1
	object_event 25, 14, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23CaveB1FRock, -1
	object_event  6, 12, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23CaveB1FRock, -1
	object_event 18,  3, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23CaveB1FRock, -1
	object_event 19,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23CaveB1FRock, -1
	object_event 10, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23CaveB1FRock, -1
