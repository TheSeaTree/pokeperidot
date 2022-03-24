	const_def 2 ; object constants
	
RemnantCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RemnantCave1FLightClay:
	itemball LIGHT_CLAY

RemnantCave1FHiddenStarPiece:
	hiddenitem STAR_PIECE, EVENT_REMNANT_CAVE_1F_HIDDEN_STAR_PIECE

RemnantCave1FHiddenCoarseCharm:
	hiddenitem COARSE_CHARM, EVENT_REMNANT_CAVE_1F_HIDDEN_COARSE_CHARM

RemnantCave1FHiddenXDefend:
	hiddenitem X_DEFEND, EVENT_REMNANT_CAVE_1F_HIDDEN_X_DEFEND

RemnantCave1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 11, SEA_ROUTE_2, 1
	warp_event 29, 15, REMNANT_CAVE_2F, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event 24,  6, BGEVENT_ITEM, RemnantCave1FHiddenStarPiece
	bg_event 16, 19, BGEVENT_ITEM, RemnantCave1FHiddenCoarseCharm
	bg_event 26, 18, BGEVENT_ITEM, RemnantCave1FHiddenXDefend

	db 1 ; object events
	object_event 31, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RemnantCave1FLightClay, EVENT_ROUTE_7_CAVE_B1F_LIGHT_CLAY
