	const_def 2 ; object constants
	const FASTSHIPBASEMENT_FANGIRL

FastShipB1F_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_FASTSHIPB1F_DEFAULT
	scene_script .DummyScene1 ; SCENE_FASTSHIPB1F_FOLLOWING
	scene_script .DummyScene2 ; SCENE_FASTSHIPB1F_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
.DummyScene1:
.DummyScene2:
	end
	
	db 0 ; callbacks

FangirlBasementTeleport1:
	moveobject FASTSHIPBASEMENT_FANGIRL, 39, 11
	appear FASTSHIPBASEMENT_FANGIRL
	follow PLAYER, FASTSHIPBASEMENT_FANGIRL
	setscene SCENE_FASTSHIPB1F_FOLLOWING
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_DEFAULT
	end

FangirlBasementTeleport2:
	moveobject FASTSHIPBASEMENT_FANGIRL, 4, 6
	appear FASTSHIPBASEMENT_FANGIRL
	follow PLAYER, FASTSHIPBASEMENT_FANGIRL
	setscene SCENE_FASTSHIPB1F_FOLLOWING
	setmapscene FAST_SHIP_B1F_CABIN, SCENE_FASTSHIPB1FCABIN_DEFAULT
	end

FastShipB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 39, 11, FAST_SHIP_1F, 2
	warp_event  4,  6, FAST_SHIP_B1F_CABIN, 1

	db 3 ; coord events
	coord_event 38, 11, SCENE_FASTSHIPB1F_DEFAULT, FangirlBasementTeleport1
	coord_event 39, 10, SCENE_FASTSHIPB1F_DEFAULT, FangirlBasementTeleport1
	coord_event  4,  7, SCENE_FASTSHIPB1F_DEFAULT, FangirlBasementTeleport2

	db 0 ; bg events

	db 11 ; object events
	object_event  0,  0, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 36,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 22, 12, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 42,  5, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  4, 13, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 28, 13, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  9,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 41, 12, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 12, 12, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 23,  9, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 13,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
