	const_def 2 ; object constants

SeaRoute6_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall

.SmashWall:
	checkevent EVENT_UNOWN_CHAMBER_VZ_OPEN
	iffalse .skip
	changeblock  4, 12, $73
.skip
	return

SeaRoute6_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4, 13, UNOWN_CHAMBER_VZ, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 22, 13, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerSwimmerGlenn, -1
	object_event 13,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerSwimmerGlenn, -1
	object_event 10, 25, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerSwimmerGlenn, -1
	object_event 12, 16, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerSwimmerGlenn, -1
