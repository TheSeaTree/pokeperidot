	const_def 2 ; object constants
	const FASTSHIP2FROOMS_FANGIRL

FastShip2FRooms_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_FASTSHIP2FROOMS_DEFAULT
	scene_script .DummyScene1 ; SCENE_FASTSHIP2FROOMS_FOLLOWING
	scene_script .DummyScene2 ; SCENE_FASTSHIP2FROOMS_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
	setmapscene FAST_SHIP_2F, SCENE_FASTSHIP2F_DEFAULT
	end

.DummyScene1:
.DummyScene2:
	end

Rooms2FFangirlTeleport1:
	moveobject FASTSHIP2FROOMS_FANGIRL, 2, 5
	jump Rooms2FFangirlContinueFolow
	
Rooms2FFangirlTeleport2:
	moveobject FASTSHIP2FROOMS_FANGIRL, 16, 5
	jump Rooms2FFangirlContinueFolow
	
Rooms2FFangirlTeleport3:
	moveobject FASTSHIP2FROOMS_FANGIRL, 30, 5
	jump Rooms2FFangirlContinueFolow
	
Rooms2FFangirlTeleport4:
	moveobject FASTSHIP2FROOMS_FANGIRL, 44,  7
	jump Rooms2FFangirlContinueFolow
	
Rooms2FFangirlTeleport5:
	moveobject FASTSHIP2FROOMS_FANGIRL,  4, 10
	jump Rooms2FFangirlContinueFolow
	
Rooms2FFangirlTeleport6:
	moveobject FASTSHIP2FROOMS_FANGIRL, 18, 10
	jump Rooms2FFangirlContinueFolow
	
Rooms2FFangirlTeleport7:
	moveobject FASTSHIP2FROOMS_FANGIRL, 32, 10
	jump Rooms2FFangirlContinueFolow

Rooms2FFangirlContinueFolow:
	appear FASTSHIP2FROOMS_FANGIRL
	follow PLAYER, FASTSHIP2FROOMS_FANGIRL
	setscene SCENE_FASTSHIP2FROOMS_FOLLOWING
	setmapscene FAST_SHIP_2F, SCENE_FASTSHIP2F_DEFAULT
	end

FastShip2FRooms_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event  2,  5, FAST_SHIP_2F, 2
	warp_event  3,  5, FAST_SHIP_2F, 2
	warp_event 16,  5, FAST_SHIP_2F, 3
	warp_event 17,  5, FAST_SHIP_2F, 3
	warp_event 30,  5, FAST_SHIP_2F, 4
	warp_event 31,  5, FAST_SHIP_2F, 4
	warp_event 44,  7, FAST_SHIP_2F, 5
	warp_event 45,  7, FAST_SHIP_2F, 5
	warp_event  4, 10, FAST_SHIP_2F, 6
	warp_event 18, 10, FAST_SHIP_2F, 7
	warp_event 32, 10, FAST_SHIP_2F, 8

	db 15 ; coord events
	coord_event  1,  5, SCENE_FASTSHIP2FROOMS_DEFAULT, Rooms2FFangirlTeleport1
	coord_event  2,  4, SCENE_FASTSHIP2FROOMS_DEFAULT, Rooms2FFangirlTeleport1
	coord_event  3,  5, SCENE_FASTSHIP2FROOMS_DEFAULT, Rooms2FFangirlTeleport1
	coord_event 15,  5, SCENE_FASTSHIP2FROOMS_DEFAULT, Rooms2FFangirlTeleport2
	coord_event 16,  4, SCENE_FASTSHIP2FROOMS_DEFAULT, Rooms2FFangirlTeleport2
	coord_event 17,  5, SCENE_FASTSHIP2FROOMS_DEFAULT, Rooms2FFangirlTeleport2
	coord_event 29,  5, SCENE_FASTSHIP2FROOMS_DEFAULT, Rooms2FFangirlTeleport3
	coord_event 30,  4, SCENE_FASTSHIP2FROOMS_DEFAULT, Rooms2FFangirlTeleport3
	coord_event 31,  5, SCENE_FASTSHIP2FROOMS_DEFAULT, Rooms2FFangirlTeleport3
	coord_event 43,  7, SCENE_FASTSHIP2FROOMS_DEFAULT, Rooms2FFangirlTeleport4
	coord_event 44,  6, SCENE_FASTSHIP2FROOMS_DEFAULT, Rooms2FFangirlTeleport4
	coord_event 45,  7, SCENE_FASTSHIP2FROOMS_DEFAULT, Rooms2FFangirlTeleport4
	coord_event  4, 11, SCENE_FASTSHIP2FROOMS_DEFAULT, Rooms2FFangirlTeleport5
	coord_event 18, 11, SCENE_FASTSHIP2FROOMS_DEFAULT, Rooms2FFangirlTeleport6
	coord_event 32, 11, SCENE_FASTSHIP2FROOMS_DEFAULT, Rooms2FFangirlTeleport7

	db 0 ; bg events

	db 6 ; object events
	object_event 49, 15, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 35,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Peeping trainer. "What am I looking at? Well that's none of your business!"
	object_event  3,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Trainer with journals on every trainer he's encountered. Studys them dilligently. Maybe a schoolboy? Or a teacher?
	object_event  4, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; "A trainer? Perfect! My #MON can work off all they ate!"
	object_event 30, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; "Must you interrupt me during my training? You made me miss the most important move!" Win text: "This is all wrong! I would never lose in my own movies!" After Text: "I am always watching battles on TV. Learning from others has gotten me this far!"
	object_event 14, 14, SPRITE_BUENA_SLEEPING, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Sleeping Beauty trainer. All Pokemon have resttalk.
