	const_def 2 ; object constants

SeaRoute6_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall

.SmashWall:
	checkevent EVENT_UNOWN_CHAMBER_VZ_OPEN
	iffalse .skip
	changeblock  28, 2, $73
.skip
	return

SeaRoute6_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 28,  3, UNOWN_CHAMBER_VZ, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
