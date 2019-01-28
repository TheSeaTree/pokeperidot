	const_def 2 ; object constants

LakeOfRageHiddenPowerHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LakeOfRageHiddenPowerHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAKE_OF_RAGE, 1
	warp_event  3,  7, LAKE_OF_RAGE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
