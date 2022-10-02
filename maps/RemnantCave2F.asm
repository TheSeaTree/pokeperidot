	const_def 2 ; object constants
	
RemnantCave2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RemnantCave2FBoulder:
	jumpstd strengthboulder

RemnantCave2FHiddenBrickPiece:
	hiddenitem BRICK_PIECE, EVENT_REMNANT_CAVE_2F_HIDDEN_BRICK_PIECE

RemnantCave2FHiddenThickClub:
	hiddenitem THICK_CLUB, EVENT_REMNANT_CAVE_2F_HIDDEN_THICK_CLUB

RemnantCave2FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_REMNANT_CAVE_2F_HIDDEN_MAX_REVIVE

RemnantCave2FHiddenFreshWater:
	hiddenitem FRESH_WATER, EVENT_REMNANT_CAVE_2F_HIDDEN_FRESH_WATER

RemnantCave2FHiddenXAccuracy:
	hiddenitem X_ACCURACY, EVENT_REMNANT_CAVE_2F_HIDDEN_X_ACCURACY

RemnantCave2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 27, REMNANT_CAVE_1F, 2
	warp_event 33, 13, REMNANT_CAVE_OUTSIDE, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 18, 24, BGEVENT_ITEM, RemnantCave2FHiddenBrickPiece
	bg_event 16, 19, BGEVENT_ITEM, RemnantCave2FHiddenThickClub
	bg_event 23, 20, BGEVENT_ITEM, RemnantCave2FHiddenMaxRevive
	bg_event 24, 23, BGEVENT_ITEM, RemnantCave2FHiddenFreshWater
	bg_event 12, 21, BGEVENT_ITEM, RemnantCave2FHiddenXAccuracy

	db 1 ; object events
	object_event 26, 20, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RemnantCave2FBoulder, -1
