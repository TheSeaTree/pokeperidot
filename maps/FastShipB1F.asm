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

FangirlBasementTeleport:
	moveobject FASTSHIPBASEMENT_FANGIRL, 27, 11
	appear FASTSHIPBASEMENT_FANGIRL
	follow PLAYER, FASTSHIPBASEMENT_FANGIRL
	setscene SCENE_FASTSHIPB1F_FOLLOWING
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_DEFAULT
	end

FastShipB1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 27, 11, FAST_SHIP_1F, 2

	db 3 ; coord events
	coord_event 26, 11, SCENE_FASTSHIPB1F_DEFAULT, FangirlBasementTeleport
	coord_event 27, 10, SCENE_FASTSHIPB1F_DEFAULT, FangirlBasementTeleport
	coord_event 27, 12, SCENE_FASTSHIPB1F_DEFAULT, FangirlBasementTeleport

	db 0 ; bg events

	db 1 ; object events
	object_event -4, -4, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
