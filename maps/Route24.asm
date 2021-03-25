	const_def 2 ; object constants

Route24_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route24_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 16,  5, ROUTE_24, 1 ; Entei Cave
	warp_event  6,  9, ROUTE_24, 2 ; Hidden Cave
	warp_event 11, 37, ROUTE_25, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 30, 18, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 4, ObjectEvent, -1 ; Burnt Berry?
	object_event 27, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 4, ObjectEvent, -1
