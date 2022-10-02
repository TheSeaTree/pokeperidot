	const_def 2 ; object constants

PalerockCaveB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PalerockCaveB2FCalcium:
	itemball CALCIUM

PalerockCaveB2FNugget:
	itemball NUGGET

PalerockCaveB2FPPUp:
	itemball PP_UP

PalerockCaveB2FBindingBand:
	itemball BINDING_BAND

PalerockCaveB2FHiddenNugget:
	hiddenitem NUGGET, EVENT_PALEROCK_CAVE_HIDDEN_NUGGET

PalerockCaveB2FHiddenCalcium:
	hiddenitem CALCIUM, EVENT_PALEROCK_CAVE_HIDDEN_CALCIUM

PalerockCaveB2FHiddenProtein:
	hiddenitem PROTEIN, EVENT_PALEROCK_CAVE_HIDDEN_PROTEIN

PalerockCaveB2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17, 11, PALEROCK_MOUNTAIN_B2, 1
	warp_event 11, 13, PALEROCK_CAVE_B1F, 5

	db 0 ; coord events

	db 3 ; bg events
	bg_event 25, 17, BGEVENT_ITEM, PalerockCaveB2FHiddenNugget
	bg_event  4, 19, BGEVENT_ITEM, PalerockCaveB2FHiddenCalcium
	bg_event 14, 11, BGEVENT_ITEM, PalerockCaveB2FHiddenProtein

	db 2 ; object events
	object_event 27, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalerockCaveB2FPPUp, EVENT_PALEROCK_CAVE_PP_UP
	object_event  5,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalerockCaveB2FBindingBand, EVENT_PALEROCK_CAVE_BINDING_BAND
