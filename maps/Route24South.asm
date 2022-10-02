	const_def 2 ; object constants

Route24South_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route24SouthSign:
	jumptext Route24SouthSignText

Route24NorthBigMushroom:
	itemball BIG_MUSHROOM

Route24NorthMaxRepel:
	itemball MAX_REPEL

Route24SouthFruitTree1:
	fruittree FRUITTREE_ROUTE_24_SOUTH_1
	
Route24SouthFruitTree2:
	fruittree FRUITTREE_ROUTE_24_SOUTH_2

Route24SouthHiddenTinyMushroom:
	hiddenitem TINYMUSHROOM, EVENT_ROUTE_24_HIDDEN_TINYMUSHROOM

Route24SouthHiddenHeatCharm:
	hiddenitem HEAT_CHARM, EVENT_ROUTE_24_HIDDEN_HEAT_CHARM

Route24SouthHiddenXDefend:
	hiddenitem X_DEFEND, EVENT_ROUTE_24_HIDDEN_X_DEFEND

Route24SouthSignText:
	text "ROUTE 18"
	
	para "ACROPORA CITY -"
	line "ROUTE 19"
	done

Route24South_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 23, 13, ROUTE_25_GATE, 1
	warp_event 24, 13, ROUTE_25_GATE, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 11,  9, BGEVENT_ITEM, Route24SouthHiddenTinyMushroom
	bg_event 29,  8, BGEVENT_ITEM, Route24SouthHiddenHeatCharm
	bg_event  3,  3, BGEVENT_ITEM, Route24SouthHiddenXDefend
	bg_event  3,  3, BGEVENT_READ, Route24SouthSign

	db 4 ; object events
	object_event  0, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route24NorthBigMushroom, EVENT_ROUTE_24_BIG_MUSHROOM
	object_event 33, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route24NorthMaxRepel, EVENT_ROUTE_24_MAX_REPEL
	object_event 47, 14, SPRITE_BUSH, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24SouthFruitTree1, -1
	object_event 48, 14, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24SouthFruitTree2, -1
