UndergroundPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

UndergroundPath_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  2, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, 3
	warp_event  3, 24, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 3

	db 0 ; coord events

	db 0 ; bg events
	
	db 0 ; object events
