	const_def 2 ; object constants

CarnationFlowerShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CarnationFlowerShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CARNATION_TOWN, 7
	warp_event  3,  7, CARNATION_TOWN, 7

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
