	const_def 2 ; object constants
	
RemnantCaveOutside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RemnantCaveOutsideLeafStone:
	itemball LEAF_STONE

RemnantCaveOutsideBrightpowder:
	itemball BRIGHTPOWDER

RemnantCaveOutsideHiddenEnergyPowder:
	hiddenitem ENERGYPOWDER, EVENT_REMNANT_CAVE_OUTSIDE_HIDDEN_ENERGYPOWDER

RemnantCaveOutsideHiddenEnergyRoot:
	hiddenitem ENERGY_ROOT, EVENT_REMNANT_CAVE_OUTSIDE_HIDDEN_ENERGY_ROOT

RemnantCaveOutside_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 16,  7, REMNANT_CAVE_2F, 2
	warp_event 29, 11, REMNANT_CAVE_3F, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6, 13, BGEVENT_ITEM, RemnantCaveOutsideHiddenEnergyPowder
	bg_event 41, 25, BGEVENT_ITEM, RemnantCaveOutsideHiddenEnergyRoot

	db 2 ; object events
	object_event 36, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RemnantCaveOutsideLeafStone, EVENT_REMNANT_CAVE_OUTSIDE_LEAF_STONE
	object_event  2, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RemnantCaveOutsideBrightpowder, EVENT_REMNANT_CAVE_OUTSIDE_BRIGHTPOWDER
