	const_def 2 ; object constants

StaghornItemfinderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

StaghornItemfinderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, STAGHORN_TOWN, 11
	warp_event  4,  7, STAGHORN_TOWN, 11

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
