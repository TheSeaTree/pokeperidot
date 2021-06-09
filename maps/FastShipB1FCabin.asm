	const_def 2 ; object constants
	const FASTSHIPBASEMENTCABIN_FANGIRL

FastShipB1FCabin_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_FASTSHIPB1FCABIN_DEFAULT
	scene_script .DummyScene1 ; SCENE_FASTSHIPB1FCABIN_FOLLOWING
	scene_script .DummyScene2 ; SCENE_FASTSHIPB1FCABIN_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
.DummyScene1:
.DummyScene2:
	end
	
	db 0 ; callbacks

FangirlBasementCabinTeleport:
	moveobject FASTSHIPBASEMENTCABIN_FANGIRL, 6, 7
	appear FASTSHIPBASEMENTCABIN_FANGIRL
	follow PLAYER, FASTSHIPBASEMENTCABIN_FANGIRL
	setscene SCENE_FASTSHIPB1FCABIN_FOLLOWING
	setmapscene FAST_SHIP_B1F, SCENE_FASTSHIPB1F_DEFAULT
	end

FastShipB1FCabin_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 6, 7, FAST_SHIP_B1F, 2
	warp_event 7, 7, FAST_SHIP_B1F, 2

	db 3 ; coord events
	coord_event  5,  7, SCENE_FASTSHIPB1FCABIN_DEFAULT, FangirlBasementCabinTeleport
	coord_event  6,  6, SCENE_FASTSHIPB1FCABIN_DEFAULT, FangirlBasementCabinTeleport
	coord_event  7,  7, SCENE_FASTSHIPB1FCABIN_DEFAULT, FangirlBasementCabinTeleport

	db 0 ; bg events

	db 2 ; object events
	object_event -3, -1, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
