	const_def 2 ; object constants
	const LUGIA_CAVE_B1F_BOULDER1
	const LUGIA_CAVE_B1F_BOULDER2
	const LUGIA_CAVE_B1F_BOULDER3
	const LUGIA_CAVE_B1F_BOULDER4 ; dummy
	const LUGIA_CAVE_B1F_BOULDER5 ; dummy
	const LUGIA_CAVE_B1F_BOULDER6 ; dummy
	const LUGIA_CAVE_B1F_BOULDER7 ; dummy
	const LUGIA_CAVE_B1F_BOULDER8 ; dummy
	const LUGIA_CAVE_B1F_BOULDER9 ; dummy

LugiaCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return
	
.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 1, LUGIA_CAVE_B1F_BOULDER1, .Boulder1
	stonetable 2, LUGIA_CAVE_B1F_BOULDER2, .Boulder2
	stonetable 3, LUGIA_CAVE_B1F_BOULDER3, .Boulder3
	db -1 ; end
	
.Boulder1:
	disappear LUGIA_CAVE_B1F_BOULDER1
	clearevent EVENT_LUGIA_CAVE_B2F_BOULDER_1
	jump .Fall

.Boulder2:
	disappear LUGIA_CAVE_B1F_BOULDER2
	clearevent EVENT_LUGIA_CAVE_B2F_BOULDER_2
	jump .Fall

.Boulder3:
	disappear LUGIA_CAVE_B1F_BOULDER3
	clearevent EVENT_LUGIA_CAVE_B2F_BOULDER_3
	jump .Fall
	
.Fall:
	pause 30
	scall .FX
	opentext
	writetext LugiaCaveB1FBoulderFellText
	waitbutton
	closetext
	end
	
.FX:
	playsound SFX_STRENGTH
	earthquake 80
	end
	
LugiaCaveB1FBoulder:
	jumpstd strengthboulder
	
LugiaCaveB1FBoulderFellText:
	text "The boulder fell"
	line "through!"
	done

LugiaCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  6,  3, LUGIA_CAVE_B2F, 4 ; hole
	warp_event 26, 19, LUGIA_CAVE_B2F, 5 ; hole
	warp_event 20,  8, LUGIA_CAVE_B2F, 6 ; hole
	warp_event 19, 15, LUGIA_CAVE_1F,  2
	warp_event 13, 13, LUGIA_CAVE_B2F, 7
	warp_event 29, 11, LUGIA_CAVE_B2F, 8

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	object_event  9,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, LugiaCaveB1FBoulder, EVENT_LUGIA_CAVE_B1F_BOULDER_1
	object_event 24, 17, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, LugiaCaveB1FBoulder, EVENT_LUGIA_CAVE_B1F_BOULDER_2
	object_event 26,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, LugiaCaveB1FBoulder, EVENT_LUGIA_CAVE_B1F_BOULDER_3
	object_event  2,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, LugiaCaveB1FBoulder, -1
	object_event  3,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, LugiaCaveB1FBoulder, -1
	object_event  4,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, LugiaCaveB1FBoulder, -1
	object_event  7, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, LugiaCaveB1FBoulder, -1
	object_event  6, 14, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, LugiaCaveB1FBoulder, -1
	object_event 23, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, LugiaCaveB1FBoulder, -1
