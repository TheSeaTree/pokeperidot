	const_def 2 ; object constants

Route24HiddenCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route24HiddenCaveB1FPPUp:
	itemball PP_UP

Route24HiddenCaveB1FMetalCoat:
	itemball METAL_COAT

Route24HiddenCaveB1FFullRestore:
	itemball FULL_RESTORE

Route24HiddenCaveB1FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_24_CAVE_B1F_HIDDEN_ULTRA_BALL

Route24HiddenCaveB1FHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ROUTE_24_CAVE_B1F_HIDDEN_RARE_CANDY

Route24HiddenCaveB1FHiddenElixer:
	hiddenitem ELIXER, EVENT_ROUTE_24_CAVE_B1F_HIDDEN_ELIXER

Route24HiddenCaveB1FHiddenStardust:
	hiddenitem STARDUST, EVENT_ROUTE_24_CAVE_B1F_HIDDEN_STARDUST

Route24HiddenCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3, 17, ROUTE_24_HIDDEN_CAVE_1F, 4
	warp_event 31,  7, ROUTE_24_HIDDEN_CAVE_1F, 5
	warp_event 19, 15, ROUTE_24_HIDDEN_CAVE_1F, 6
	warp_event 20,  9, ROUTE_24_HIDDEN_CAVE_1F, 7

	db 0 ; coord events

	db 4 ; bg events
	bg_event 20,  5, BGEVENT_ITEM, Route24HiddenCaveB1FHiddenUltraBall
	bg_event 35,  7, BGEVENT_ITEM, Route24HiddenCaveB1FHiddenRareCandy
	bg_event 11, 16, BGEVENT_ITEM, Route24HiddenCaveB1FHiddenElixer
	bg_event 13,  9, BGEVENT_ITEM, Route24HiddenCaveB1FHiddenStardust

	db 3 ; object events
	object_event 33, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route24HiddenCaveB1FPPUp, EVENT_ROUTE_24_CAVE_B1F_PP_UP
	object_event 37, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route24HiddenCaveB1FMetalCoat, EVENT_ROUTE_24_CAVE_B1F_METAL_COAT
	object_event  4,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route24HiddenCaveB1FFullRestore, EVENT_ROUTE_24_CAVE_B1F_FULL_RESTORE
