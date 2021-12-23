	const_def 2 ; object constants

PectiniaComicStore_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PectiniaComicStore_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8,  7, PECTINIA_MALL, 7
	warp_event  9,  7, PECTINIA_MALL, 7

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  9,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Find a new OW sprite for this guy probably.
	object_event  6,  1, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; "Sorry kid, this room is for employees only."
	object_event  3,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Gawking at all of the comics he can't afford?
	object_event  5,  3, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Mentions how she normally doesn't come here, and is shopping for her boyfriend.
	object_event  0,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Talking about Amber
	object_event  1,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Talking about Amber
