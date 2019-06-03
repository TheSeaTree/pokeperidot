	const_def 2 ; object constants
	const ROUTE_14_CAVE_1F_BOULDER1
	const ROUTE_14_CAVE_1F_BOULDER2
	const ROUTE_14_CAVE_1F_BOULDER3

Route14Cave1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable
	
.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return
	
.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 5, ROUTE_14_CAVE_1F_BOULDER3, .Boulder3
	stonetable 3, ROUTE_14_CAVE_1F_BOULDER1, .Boulder1
	stonetable 4, ROUTE_14_CAVE_1F_BOULDER2, .Boulder2
	db -1 ; end
	
.Boulder1:
	disappear ROUTE_14_CAVE_1F_BOULDER1
	clearevent EVENT_ROUTE_14_CAVE_B1F_BOULDER_1
	jump .Fall

.Boulder2:
	disappear ROUTE_14_CAVE_1F_BOULDER2
	clearevent EVENT_ROUTE_14_CAVE_B1F_BOULDER_2
	jump .Fall

.Boulder3:
	disappear ROUTE_14_CAVE_1F_BOULDER3
	clearevent EVENT_ROUTE_14_CAVE_B1F_BOULDER_3
	jump .Fall
	
.Fall:
	pause 30
	scall .FX
	opentext
	writetext Route14Cave1FBoulderFellText
	waitbutton
	closetext
	end
	
.FX:
	playsound SFX_STRENGTH
	earthquake 10
	end

Route14Cave1FBoulder:
	jumpstd strengthboulder
	
Route14Cave1FBoulderFellText:
	text "The boulder fell"
	line "through!"
	done
	
Route14Cave1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  5, 19, ROUTE_14, 1
	warp_event 13, 17, ROUTE_14_CAVE_B1F, 1
	warp_event  8,  9, ROUTE_14_CAVE_B1F, 2 ; hole
	warp_event  4, 11, ROUTE_14_CAVE_B1F, 4 ; hole
	warp_event  8, 15, ROUTE_14_CAVE_B1F, 3 ; hole

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 15,  6, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route14Cave1FBoulder, EVENT_ROUTE_14_CAVE_1F_BOULDER_1
	object_event  3, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route14Cave1FBoulder, EVENT_ROUTE_14_CAVE_1F_BOULDER_2
	object_event  8, 11, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route14Cave1FBoulder, EVENT_ROUTE_14_CAVE_1F_BOULDER_3
