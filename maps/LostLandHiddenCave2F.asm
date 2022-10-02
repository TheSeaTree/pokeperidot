	const_def 2 ; object constants
	const LOSTLANDHIDDENCAVE2F_BOULDER1
	const LOSTLANDHIDDENCAVE2F_BOULDER2
	const LOSTLANDHIDDENCAVE2F_BOULDER3
	const LOSTLANDHIDDENCAVE2F_BOULDER4
	const LOSTLANDHIDDENCAVE2F_BOULDER5
	const LOSTLANDHIDDENCAVE2F_ROCK
	const LOSTLANDHIDDENCAVE2F_ITEMBALL
	
LostLandHiddenCave2F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable
	callback MAPCALLBACK_OBJECTS, .PressedButton

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 2, LOSTLANDHIDDENCAVE2F_BOULDER1, .Boulder1
	db -1 ; end
	
.Boulder1:
	moveobject LOSTLANDHIDDENCAVE2F_BOULDER5, 10, 2
	appear LOSTLANDHIDDENCAVE2F_BOULDER5

	earthquake 20
	playsound SFX_STRENGTH
	pause 10
	playsound SFX_WALL_OPEN
	waitsfx
	opentext
	writetext LostLandHiddenCave2FFarAwaySound
	waitbutton
	closetext
	setevent EVENT_SEA_ROUTE_5_HIDDEN_CAVE_OPEN
	disappear LOSTLANDHIDDENCAVE2F_BOULDER1
	end

.PressedButton:
	checkevent EVENT_SEA_ROUTE_5_HIDDEN_CAVE_OPEN
	iffalse .skip
	moveobject LOSTLANDHIDDENCAVE2F_BOULDER5, 10, 2
	appear LOSTLANDHIDDENCAVE2F_BOULDER5
.skip
	return

LostLandHiddenCave2FTwistedSpoon:
	itemball TWISTEDSPOON

LostLandHiddenCave2FHiddenXSpDef:
	hiddenitem X_SP_DEF, EVENT_LOST_LAND_HIDDEN_CAVE_2F_X_SP_DEF

LostLandHiddenCave2FBoulder:
	jumpstd strengthboulder

LostLandHiddenCave2FRock:
	jumpstd smashrock

LostLandHiddenCave2FStuckBoulder:
	jumptext LostLandHiddenCave2FStuckBoulderText

LostLandHiddenCave2FStuckBoulderText:
	text "This boulder won't"
	line "budge!"
	done

LostLandHiddenCave2FFarAwaySound:
	text "It sounded as if a"
	line "door opened some-"
	cont "where far away."
	done

LostLandHiddenCave2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9, 13, LOST_LAND_HIDDEN_CAVE_1F, 2
	warp_event 10,  2, LOST_LAND_HIDDEN_CAVE_2F, -1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 13,  5, BGEVENT_ITEM, LostLandHiddenCave2FHiddenXSpDef

	db 7 ; object events
	object_event  9,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LostLandHiddenCave2FBoulder, EVENT_SEA_ROUTE_5_HIDDEN_CAVE_OPEN
	object_event 11,  6, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LostLandHiddenCave2FBoulder, -1
	object_event 12,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LostLandHiddenCave2FBoulder, -1
	object_event  8,  4, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LostLandHiddenCave2FBoulder, -1
	object_event  0,  0, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LostLandHiddenCave2FStuckBoulder, -1
	object_event  9,  4, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LostLandHiddenCave2FRock, -1
	object_event  5,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LostLandHiddenCave2FTwistedSpoon, EVENT_LOST_LAND_HIDDEN_CAVE_2F_TWISTEDSPOON
