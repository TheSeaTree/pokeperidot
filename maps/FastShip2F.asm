	const_def 2 ; object constants
	const FASTSHIP2F_FANGIRL
	const FASTSHIP2F_RECEPTIONIST

FastShip2F_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_FASTSHIP2F_DEFAULT
	scene_script .DummyScene1 ; SCENE_FASTSHIP2F_FOLLOWING
	scene_script .DummyScene2 ; SCENE_FASTSHIP2F_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
	setmapscene FAST_SHIP_2F_ROOMS, SCENE_FASTSHIP2FROOMS_DEFAULT
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_DEFAULT
	end

.DummyScene1:
.DummyScene2:
	end
	
Fangirl2FTeleport1:
	moveobject FASTSHIP2F_FANGIRL, 17, 11
	jump Fangirl2FContinueFolow
	
Fangirl2FTeleport2:
	moveobject FASTSHIP2F_FANGIRL,  5,  1
	jump Fangirl2FContinueFolow
	
Fangirl2FTeleport3:
	moveobject FASTSHIP2F_FANGIRL,  9,  1
	jump Fangirl2FContinueFolow
	
Fangirl2FTeleport4:
	moveobject FASTSHIP2F_FANGIRL, 13,  1
	jump Fangirl2FContinueFolow
	
Fangirl2FTeleport5:
	moveobject FASTSHIP2F_FANGIRL, 17,  1
	jump Fangirl2FContinueFolow

Fangirl2FTeleport6:
	moveobject FASTSHIP2F_FANGIRL,  5,  8
	jump Fangirl2FContinueFolow
	
Fangirl2FTeleport7:
	moveobject FASTSHIP2F_FANGIRL,  9,  8
	jump Fangirl2FContinueFolow
	
Fangirl2FTeleport8:
	moveobject FASTSHIP2F_FANGIRL, 13,  8
	jump Fangirl2FContinueFolow
	
Fangirl2FTeleport9:
	moveobject FASTSHIP2F_FANGIRL,  2,  4
	jump Fangirl2FContinueFolow
	
Fangirl2FTeleport10:
	moveobject FASTSHIP2F_FANGIRL,  2,  5

Fangirl2FContinueFolow:
	appear FASTSHIP2F_FANGIRL
	follow PLAYER, FASTSHIP2F_FANGIRL
	setscene SCENE_FASTSHIP2F_FOLLOWING
	setmapscene FAST_SHIP_1F_ROOMS, SCENE_FASTSHIP1FROOMS_DEFAULT
	setmapscene FAST_SHIP_B1F, SCENE_FASTSHIPB1F_DEFAULT
	end

FastShip2F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 17, 11, FAST_SHIP_1F, 9
	warp_event  5,  1, FAST_SHIP_2F_ROOMS, 1
	warp_event  9,  1, FAST_SHIP_2F_ROOMS, 3
	warp_event 13,  1, FAST_SHIP_2F_ROOMS, 5
	warp_event 17,  1, FAST_SHIP_2F_ROOMS, 7
	warp_event  5,  8, FAST_SHIP_2F_ROOMS, 9
	warp_event  9,  8, FAST_SHIP_2F_ROOMS, 10
	warp_event 13,  8, FAST_SHIP_2F_ROOMS, 11
;	warp_event  2,  4, FAST_SHIP_DECK, 1
;	warp_event  2,  5, FAST_SHIP_DECK, 2

	db 15 ; coord events
	coord_event 17, 10, SCENE_FASTSHIP2F_DEFAULT, Fangirl2FTeleport1
	coord_event 16, 11, SCENE_FASTSHIP2F_DEFAULT, Fangirl2FTeleport1
	coord_event  5,  2, SCENE_FASTSHIP2F_DEFAULT, Fangirl2FTeleport2
	coord_event  9,  2, SCENE_FASTSHIP2F_DEFAULT, Fangirl2FTeleport3
	coord_event 13,  2, SCENE_FASTSHIP2F_DEFAULT, Fangirl2FTeleport4
	coord_event 17,  2, SCENE_FASTSHIP2F_DEFAULT, Fangirl2FTeleport5
	coord_event  5,  7, SCENE_FASTSHIP2F_DEFAULT, Fangirl2FTeleport6
	coord_event  9,  7, SCENE_FASTSHIP2F_DEFAULT, Fangirl2FTeleport7
	coord_event 13,  7, SCENE_FASTSHIP2F_DEFAULT, Fangirl2FTeleport8
	coord_event  2,  3, SCENE_FASTSHIP2F_DEFAULT, Fangirl2FTeleport9
	coord_event  3,  4, SCENE_FASTSHIP2F_DEFAULT, Fangirl2FTeleport9
	coord_event  2,  5, SCENE_FASTSHIP2F_DEFAULT, Fangirl2FTeleport9
	coord_event  2,  4, SCENE_FASTSHIP2F_DEFAULT, Fangirl2FTeleport10
	coord_event  3,  5, SCENE_FASTSHIP2F_DEFAULT, Fangirl2FTeleport10
	coord_event  2,  6, SCENE_FASTSHIP2F_DEFAULT, Fangirl2FTeleport10

	db 0 ; bg events

	db 2 ; object events
	object_event  0, 13, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 15,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
