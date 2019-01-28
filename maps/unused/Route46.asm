	const_def 2 ; object constants
	const ROUTE46_FRUIT_TREE1
	const ROUTE46_FRUIT_TREE2
	const ROUTE46_POKE_BALL

Route46_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route46Sign:
	jumptext Route46SignText

Route46XSpeed:
	itemball X_SPEED

Route46FruitTree1:
	fruittree FRUITTREE_ROUTE_46_1

Route46FruitTree2:
	fruittree FRUITTREE_ROUTE_46_2

Route46SignText:
	text "ROUTE 46"
	line "MOUNTAIN RD. AHEAD"
	done

Route46_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 14,  5, DARK_CAVE_VIOLET_ENTRANCE, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9, 27, BGEVENT_READ, Route46Sign

	db 3 ; object events
	object_event  7,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route46FruitTree1, -1
	object_event  8,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route46FruitTree2, -1
	object_event  1, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route46XSpeed, EVENT_ROUTE_46_X_SPEED
