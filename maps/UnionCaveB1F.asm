	const_def 2 ; object constants

UnionCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

UnionCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 37, 23, UNION_CAVE_1F, 2
	warp_event 25, 23, UNION_CAVE_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
