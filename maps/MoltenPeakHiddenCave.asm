	const_def 2 ; object constants

MoltenPeakHiddenCave_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	
.OpenCave
	setevent EVENT_MOLTEN_PEAK_HIDDEN_CAVE_OPEN
	return

MoltenPeakSouthSabreFossil:
	itemball SABRE_FOSSIL

MoltenPeakHiddenCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7, 13, MOLTEN_PEAK_OUTSIDE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MoltenPeakSouthSabreFossil, EVENT_MOLTEN_PEAK_SABRE_FOSSIL
