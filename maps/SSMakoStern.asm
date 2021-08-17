	const_def 2 ; object constants
	const SSMAKOSTERN_FANGIRL

SSMakoStern_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SSMAKOSTERN_DEFAULT
	scene_script .DummyScene1 ; SCENE_SSMAKOSTERN_FOLLOWING
	scene_script .DummyScene2 ; SCENE_SSMAKOSTERN_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
	setmapscene SS_MAKO_2F, SCENE_SSMAKO2F_DEFAULT

.DummyScene1:
.DummyScene2:
	end
	
	db 0 ; callbacks

FangirlSternTeleport1:
	moveobject SSMAKOSTERN_FANGIRL, 13, 4
	jump FangirlSternTeleportContinue
FangirlSternTeleport2:
	moveobject SSMAKOSTERN_FANGIRL, 13, 5
FangirlSternTeleportContinue:
	appear SSMAKOSTERN_FANGIRL
	follow PLAYER, SSMAKOSTERN_FANGIRL
	setscene SCENE_SSMAKOSTERN_FOLLOWING
	setmapscene SS_MAKO_2F, SCENE_SSMAKO2F_DEFAULT
	end

SSMakoSternFangirl:
	jumpstd emilycompanion

; Defeat every trainer inside before the crowd disperses.

SSMakoStern_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 13,  4, SS_MAKO_2F, 9
	warp_event 13,  5, SS_MAKO_2F, 10

	db 4 ; coord events
	coord_event 13,  5, SCENE_SSMAKOSTERN_DEFAULT, FangirlSternTeleport1
	coord_event 12,  5, SCENE_SSMAKOSTERN_DEFAULT, FangirlSternTeleport2
	coord_event 12,  4, SCENE_SSMAKOSTERN_DEFAULT, FangirlSternTeleport1
	coord_event 13,  4, SCENE_SSMAKOSTERN_DEFAULT, FangirlSternTeleport2

	db 0 ; bg events

	db 8 ; object events
	object_event  0, 13, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoSternFangirl, -1
	object_event  4,  4, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  9,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 10,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 10,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  9,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 11,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 11,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
