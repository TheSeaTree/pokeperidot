	const_def 2 ; object constants

Route30_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route30ItemBush:
	itembush FRUITTREE_ROUTE_30

Route30WaterStone:
	itemball WATER_STONE

Route30MysticWater:
	itemball MYSTIC_WATER
	
Route30HiddenXSpAtk:
	hiddenitem X_SP_ATK, EVENT_ROUTE_30_HIDDEN_X_SP_ATK

Route30_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 14, 23, ROUTE_30_CAVE_1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 30, 11, BGEVENT_ITEM, Route30HiddenXSpAtk

	db 2 ; object events
	object_event  9, 34, SPRITE_BUSH, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30ItemBush, -1
	object_event  5,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route30WaterStone, EVENT_ROUTE_30_WATER_STONE
	object_event  5,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route30MysticWater, EVENT_ROUTE_30_MYSTIC_WATER
