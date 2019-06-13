	const_def 2 ; object constants

MahoganyTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_MAHOGANY
	return

MahoganyTown_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 25, 33, OLIVINE_CITY, 3
	warp_event 26, 33, OLIVINE_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 30, 19, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 28, 17, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 27, 20, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
