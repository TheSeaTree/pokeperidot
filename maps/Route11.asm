	const_def 2 ; object constants

Route11_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route11_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  29, 27, ROUTE_11_GOLDENROD_GATE, 1
	warp_event  30, 27, ROUTE_11_GOLDENROD_GATE, 2
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
