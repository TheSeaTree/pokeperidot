	const_def 2 ; object constants

Route8HiddenCave_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	
.OpenCave
	setevent EVENT_ROUTE_8_HIDDEN_CAVE_OPEN
	return

Route8HiddenCaveXAttack:
	itemball X_ATTACK

Route8HiddenCaveXSpAtk:
	itemball X_SP_ATK

Route8HiddenCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 5, 11, ROUTE_8, 7

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route8HiddenCaveXAttack, EVENT_ROUTE_8_HIDDEN_CAVE_X_ATTACK
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route8HiddenCaveXSpAtk, EVENT_ROUTE_8_HIDDEN_CAVE_X_SP_ATK
