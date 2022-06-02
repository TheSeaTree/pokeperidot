	const_def 2 ; object constants
	const ROUTE26CAVE2F_BOULDER1
	const ROUTE26CAVE2F_BOULDER2
	const ROUTE26CAVE2F_ROCK1
	const ROUTE26CAVE2F_ROCK2
	const ROUTE26CAVE2F_ROCK3
	const ROUTE26CAVE2F_ROCK4
	const ROUTE26CAVE2F_ROCK5
	const ROUTE26CAVE2F_ROCK6
	const ROUTE26CAVE2F_ROCK7
	const ROUTE26CAVE2F_ROCK8

Route26Cave2F_MapScripts:
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
	stonetable 3, ROUTE26CAVE2F_BOULDER1, .Boulder1
	db -1 ; end
	
.Boulder1:
	moveobject ROUTE26CAVE2F_BOULDER2, 26, 10
	appear ROUTE26CAVE2F_BOULDER2
	changeblock 6, 8, $cf ; open door
	setevent EVENT_ROUTE_26_CAVE_BOULDER
	disappear ROUTE26CAVE2F_BOULDER1

	earthquake 10
	playsound SFX_STRENGTH
	pause 10
	playsound SFX_WALL_OPEN
	waitsfx
	opentext
	writetext Route26Cave2FDoorOpenedText
	waitbutton
	closetext
	end

.PressedButton:
	checkevent EVENT_ROUTE_26_CAVE_BOULDER
	iffalse .skip
	moveobject ROUTE26CAVE2F_BOULDER2, 26, 10
	appear ROUTE26CAVE2F_BOULDER2
	return

.OpenGate:
	checkevent EVENT_ROUTE_26_CAVE_BOULDER
	iffalse .skip
	changeblock 6, 8, $cf ; open door
.skip
	return

Route26Cave2FStuckBoulder:
	jumptext Route26Cave2FStuckBoulderText

Route26Cave2FBoulder:
	jumpstd strengthboulder

Route26Cave2FRock:
	jumpstd smashrock

Route26Cave2FStuckBoulderText:
	text "This boulder won't"
	line "budge!"
	done

Route26Cave2FDoorOpenedText:
	text "A door opened up!"
	done

Route26Cave2F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 11, ROUTE_26_CAVE_1F, 3
	warp_event 21,  3, ROUTE_26_CAVE_1F, 4
	warp_event 26, 10, ROUTE_26_CAVE_2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	object_event 14, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26Cave2FBoulder, EVENT_ROUTE_26_CAVE_BOULDER
	object_event  0,  0, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26Cave2FStuckBoulder, -1
	object_event 17, 12, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26Cave2FRock, -1
	object_event  7,  4, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26Cave2FRock, -1
	object_event 16, 10, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26Cave2FRock, -1
	object_event 25, 14, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26Cave2FRock, -1
	object_event  6, 12, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26Cave2FRock, -1
	object_event 18,  3, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26Cave2FRock, -1
	object_event 19,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26Cave2FRock, -1
	object_event 10, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26Cave2FRock, -1
