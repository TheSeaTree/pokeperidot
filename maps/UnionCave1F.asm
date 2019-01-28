	const_def 2 ; object constants
	const UNIONCAVE1F_POKE_BALL1
	const UNIONCAVE1F_ROCK1
	const UNIONCAVE1F_ROCK2
	const UNIONCAVE1F_ROCK3
	const UNIONCAVE1F_BOULDER1
	const UNIONCAVE1F_BOULDER2

UnionCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

UnionCave1FGreatBall:
	itemball GREAT_BALL

UnionCave1FRock:
	jumpstd smashrock
	
UnionCave1FBoulder:
	jumpstd strengthboulder

UnionCave1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 41, 15, CHERRYGROVE_CITY, 4
	warp_event 27,  7, UNION_CAVE_B1F, 1
	warp_event 17,  7, UNION_CAVE_B1F, 2
	warp_event  5,  9, ROUTE_9, 1

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 41,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FGreatBall, EVENT_UNION_CAVE_1F_GREAT_BALL
	object_event 38,  5, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnionCave1FRock, -1
	object_event 38,  7, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnionCave1FRock, -1
	object_event 32,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnionCave1FRock, -1
	object_event 39,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnionCave1FBoulder, -1
	object_event 36,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnionCave1FBoulder, -1
