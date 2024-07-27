	const_def 2 ; object constants

PavonaOasisCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PavonaOasisCaveB1FBoulder:
	jumpstd strengthboulder
	
PavonaOasisCaveKingsRock:
	itemball KINGS_ROCK
	
PavonaOasisCaveEscapeRope:
	itemball ESCAPE_ROPE
	
PavonaOasisCaveCalcium:
	itemball CALCIUM

PavonaOasisCaveHiddenPearl:
	hiddenitem PEARL, EVENT_PAVONA_OASIS_CAVE_HIDDEN_PEARL

PavonaOasisCaveHiddenDampRock:
	hiddenitem DAMP_CHARM, EVENT_PAVONA_OASIS_CAVE_HIDDEN_DAMP_CHARM
	
PavonaOasisCaveHiddenMaxRepel:
	hiddenitem MAX_REPEL, EVENT_PAVONA_OASIS_CAVE_HIDDEN_MAX_REPEL

PavonaOasisCaveHiddenFastBall:
	hiddenitem FAST_BALL, EVENT_PAVONA_OASIS_CAVE_HIDDEN_FAST_BALL

PavonaOasisCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 15, 33, PAVONA_OASIS_CAVE_1F, 2
	warp_event  5,  3, ROUTE_9_CAVE_1F, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event 14, 16, BGEVENT_ITEM, PavonaOasisCaveHiddenPearl
	bg_event 24, 14, BGEVENT_ITEM, PavonaOasisCaveHiddenDampRock
	bg_event 21,  2, BGEVENT_ITEM, PavonaOasisCaveHiddenMaxRepel
	bg_event  4, 10, BGEVENT_ITEM, PavonaOasisCaveHiddenFastBall

	db 8 ; object events
	object_event 14, 29, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaOasisCave1FBoulder, -1
	object_event 11, 26, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaOasisCave1FBoulder, -1
	object_event 20, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaOasisCave1FBoulder, -1
	object_event 19, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaOasisCave1FBoulder, -1
	object_event 21, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaOasisCave1FBoulder, -1
	object_event  4, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PavonaOasisCaveKingsRock, EVENT_PAVONA_OASIS_CAVE_KINGS_ROCK
	object_event 17, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PavonaOasisCaveEscapeRope, EVENT_PAVONA_OASIS_CAVE_ESCAPE_ROPE
	object_event 18, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PavonaOasisCaveCalcium, EVENT_PAVONA_OASIS_CAVE_CALCIUM
