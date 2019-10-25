	const_def 2 ; object constants

Route30CaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route30CaveB1FBoulder:
	jumpstd strengthboulder

Route30CaveB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 15, 33, ROUTE_30_CAVE_1F, 2
	warp_event  5,  3, ROUTE_9_CAVE_1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 14, 29, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30Cave1FBoulder, -1
	object_event 11, 26, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30Cave1FBoulder, -1
	object_event 20, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30Cave1FBoulder, -1
	object_event 19, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30Cave1FBoulder, -1
	object_event 21, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30Cave1FBoulder, -1
