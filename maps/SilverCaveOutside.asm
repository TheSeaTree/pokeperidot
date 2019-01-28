SilverCaveOutside_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_INDIGO_PLATEAU
	return

SilverCaveOutside_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 23, 19, SILVER_CAVE_POKECENTER_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
