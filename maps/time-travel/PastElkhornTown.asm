	const_def 2 ; object constants

PastElkhornTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .VariableSprites

.VariableSprites
	variablesprite SPRITE_PAST_MOM, SPRITE_RED_PAST_MOM
	checkflag ENGINE_PLAYER_IS_FEMALE
	iffalse .Done
	variablesprite SPRITE_PAST_MOM, SPRITE_BLUE_PAST_MOM
.Done
	return
	
PastElkhornTown_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 21,  9, PAST_ELKHORN_MOMS_HOUSE, 1 ; Player's Mom's House
	warp_event 15,  7, PAST_ELKHORN_LAKESIDE_HOUSE, 1 ; Misc. Neighbor's House
	warp_event 14, 15, PAST_ELKHORN_RICHARDS_HOUSE, 1 ; Old Neighbors' House
	warp_event  4, 10, PAST_FOREST_GATE, 3 ; Forest Gate
	warp_event  4, 11, PAST_FOREST_GATE, 4 ; Forest Gate

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
