	const_def 2 ; object constants

FactoryBack_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FactoryBack_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 15, FACTORY_1F, 5
	warp_event  4, 15, FACTORY_1F, 5
	warp_event  7,  0, EAST_FOREST, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	