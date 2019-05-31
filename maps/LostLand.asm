	const_def 2 ; object constants

LostLand_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LostLand_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  8, 31, CHARCOAL_KILN, 1 ;Entrance
	warp_event 44,  9, CHARCOAL_KILN, 1 ;Puzzle Chamber
	warp_event  6, 11, CHARCOAL_KILN, 1 ;Unown Chamber, Change the block here to a cave entrance when the Unown are unlocked.

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  29,  9, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
