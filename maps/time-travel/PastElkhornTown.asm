	const_def 2 ; object constants

PastElkhornTown_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PastElkhornTown_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 21,  9, PAST_ELKHORN_TOWN, 1 ; Player's Mom's House
	warp_event 15,  7, PAST_ELKHORN_TOWN, 2 ; Misc. Neighbor's House
	warp_event 14, 15, PAST_ELKHORN_TOWN, 3 ; Old Neighbors' House
	warp_event  4, 10, PAST_ILEX_FOREST, 1 ; Forest Gate
	warp_event  4, 11, PAST_ILEX_FOREST, 2 ; Forest Gate

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
