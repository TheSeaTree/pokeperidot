	const_def 2 ; object constants

Route30_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route30ItemBush:
	itembush FRUITTREE_ROUTE_30

Route30Brightpowder:
	itemball BRIGHTPOWDER

Route30_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 14, 23, ROUTE_30_CAVE_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  9, 34, SPRITE_BUSH, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30ItemBush, -1
	object_event 30, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route30Brightpowder, EVENT_ROUTE_30_BRIGHTPOWDER
