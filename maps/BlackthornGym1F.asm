	const_def 2 ; object constants
	const BLACKTHORNGYM_CANNONBALL
	const BLACKTHORNGYM_EXPLOSION
	const BLACKTHORNGYM_CHRIS
	const BLACKTHORNGYM_KRIS

BlackthornGym1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


BlackthornGym1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 11, 20, BLACKTHORN_GYM_2F, 1 ; Stairs
	warp_event 13, 16, BLACKTHORN_GYM_1F, 1 ; SE Hole
	warp_event 15, 13, BLACKTHORN_GYM_1F, 1 ; NE Hole
	warp_event  4, 14, BLACKTHORN_GYM_1F, 1 ; SW Hole

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  9,  6, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
