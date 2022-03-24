	const_def 2 ; object constants

Route7Cave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route7Cave1FXSpAtk:
	itemball X_SP_ATK

Route7Cave1FBigPearl:
	itemball BIG_PEARL

Route7Cave1FHiddenDampCharm:
	hiddenitem DAMP_CHARM, EVENT_ROUTE_7_CAVE_1F_HIDDEN_DAMP_CHARM

Route7Cave1FHiddenPearl:
	hiddenitem PEARL, EVENT_ROUTE_7_CAVE_1F_HIDDEN_PEARL

Route7Cave1FHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_ROUTE_7_CAVE_1F_HIDDEN_FULL_RESTORE

Route7Cave1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 15, 17, ROUTE_6, 5
	warp_event  7, 11, SEA_ROUTE_4, 1
	warp_event  9,  7, ROUTE_7_CAVE_B1F, 1
	warp_event 19,  3, ROUTE_7_CAVE_B1F, 2
	
	db 0 ; coord events

	db 3 ; bg events
	bg_event  3, 13, BGEVENT_ITEM, Route7Cave1FHiddenDampCharm
	bg_event 10,  4, BGEVENT_ITEM, Route7Cave1FHiddenPearl
	bg_event 11, 11, BGEVENT_ITEM, Route7Cave1FHiddenFullRestore

	db 2 ; object events
	object_event 12,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route7Cave1FXSpAtk, EVENT_ROUTE_7_CAVE_1F_X_SP_ATK
	object_event  2,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route7Cave1FBigPearl, EVENT_ROUTE_7_CAVE_1F_BIG_PEARL
