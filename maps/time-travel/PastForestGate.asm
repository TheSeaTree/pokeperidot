	const_def 2 ; object constants

PastForestGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .RemoveComputer

.RemoveComputer
	changeblock 6, 2, $0d
	return

PastForestGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, PAST_ILEX_FOREST, 1
	warp_event  0,  5, PAST_ILEX_FOREST, 2
	warp_event  9,  4, PAST_ELKHORN_TOWN, 3
	warp_event  9,  5, PAST_ELKHORN_TOWN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
