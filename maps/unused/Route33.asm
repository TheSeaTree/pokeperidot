	const_def 2 ; object constants
	const ROUTE33_LASS
	const ROUTE33_FRUIT_TREE

Route33_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route33LassScript:
	jumptextfaceplayer Route33LassText

Route33Sign:
	jumptext Route33SignText

Route33FruitTree:
	fruittree FRUITTREE_ROUTE_33

Route33LassText:
	text "Pant, pant…"

	para "It was much bigger"
	line "than I'd expected."

	para "I got too tired to"
	line "explore the whole"

	para "thing, so I came"
	line "outside."
	done

Route33SignText:
	text "ROUTE 33"
	done

Route33_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11,  9, UNION_CAVE_1F, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11, 11, BGEVENT_READ, Route33Sign

	db 2 ; object events
	object_event 13, 16, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route33LassScript, -1
	object_event 14, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route33FruitTree, -1
