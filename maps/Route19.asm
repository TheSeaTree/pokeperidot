	const_def 2 ; object constants

Route19_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route19FruitTree:
	fruittree FRUITTREE_ROUTE_19

Route19Nugget:
	itemball NUGGET

Route19Sign:
	jumptext Route19SignText

Route19SignText:
	text "R OU E  1-  h   nd"
	line "of t e r  nb  ."

	para "…This sign is"
	line "completely worn"
	cont "and illegible."
	done

Route19_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 18,  5, HO_OH_CASTLE_1F_CENTER_ROOM, 1 ; Entei Cave
	warp_event 19,  5, HO_OH_CASTLE_1F_CENTER_ROOM, 2 ; Hidden Cave
	warp_event 53, 15, ROUTE_19_GATE, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 39, 17, BGEVENT_READ, Route19Sign

	db 2 ; object events
	object_event 46, 27, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route19FruitTree, -1
	object_event 43, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route19Nugget, EVENT_ROUTE_19_NUGGET
