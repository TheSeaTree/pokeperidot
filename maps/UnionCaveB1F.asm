	const_def 2 ; object constants
	const UNIONCAVEB1F_BOULDER
	const UNIONCAVEB1F_POKE_BALL2

UnionCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

UnionCaveB1FXDefend:
	itemball X_DEFEND

UnionCaveB1FBoulder:
	jumpstd strengthboulder

UnionCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 19,  3, UNION_CAVE_1F, 2
	warp_event  7,  3, UNION_CAVE_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  7, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnionCaveB1FBoulder, -1
	object_event 17, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB1FXDefend, EVENT_UNION_CAVE_B1F_X_DEFEND
