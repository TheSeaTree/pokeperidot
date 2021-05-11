	const_def 2 ; object constants
	const FASTSHIP1FROOMS_FANGIRL

FastShip1FRooms_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_FASTSHIP1FROOMS_DEFAULT
	scene_script .DummyScene1 ; SCENE_FASTSHIP1FROOMS_FOLLOWING
	scene_script .DummyScene2 ; SCENE_FASTSHIP1FROOMS_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_DEFAULT
	end

.DummyScene1:
.DummyScene2:
	end

RoomsFangirlTeleport1:
	moveobject FASTSHIP1FROOMS_FANGIRL, 1, 0
	jump RoomsFangirlContinueFolow
	
RoomsFangirlTeleport2:
	moveobject FASTSHIP1FROOMS_FANGIRL, 10, 0
	jump RoomsFangirlContinueFolow
	
RoomsFangirlTeleport3:
	moveobject FASTSHIP1FROOMS_FANGIRL, 20, 0
	jump RoomsFangirlContinueFolow
	
RoomsFangirlTeleport4:
	moveobject FASTSHIP1FROOMS_FANGIRL, 0, 15
	jump RoomsFangirlContinueFolow
	
RoomsFangirlTeleport5:
	moveobject FASTSHIP1FROOMS_FANGIRL, 10, 15
	jump RoomsFangirlContinueFolow
	
RoomsFangirlTeleport6:
	moveobject FASTSHIP1FROOMS_FANGIRL, 20, 15
	jump RoomsFangirlContinueFolow

RoomsFangirlContinueFolow:
	appear FASTSHIP1FROOMS_FANGIRL
	follow PLAYER, FASTSHIP1FROOMS_FANGIRL
	setscene SCENE_FASTSHIP1FROOMS_FOLLOWING
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_DEFAULT
	end

FastShip1FRooms_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  1,  0, FAST_SHIP_1F, 3
	warp_event 10,  0, FAST_SHIP_1F, 4
	warp_event 20,  0, FAST_SHIP_1F, 5
	warp_event  0, 15, FAST_SHIP_1F, 6
	warp_event 10, 15, FAST_SHIP_1F, 7
	warp_event 20, 15, FAST_SHIP_1F, 8
	warp_event  1, 15, FAST_SHIP_1F, 6
	warp_event 11, 15, FAST_SHIP_1F, 7
	warp_event 21, 15, FAST_SHIP_1F, 8

	db 9 ; coord events
	coord_event  1,  1, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport1
	coord_event 10,  1, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport2
	coord_event 20,  1, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport3
	coord_event  0, 14, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport4
	coord_event 10, 14, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport5
	coord_event 20, 14, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport6
	coord_event  1, 15, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport4
	coord_event 11, 15, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport5
	coord_event 21, 15, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport6

	db 0 ; bg events

	db 1 ; object events
	object_event -5, -4, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
