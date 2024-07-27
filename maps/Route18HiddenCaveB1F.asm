	const_def 2 ; object constants

Route18HiddenCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route18HiddenCaveB1FPPUp:
	itemball PP_UP

Route18HiddenCaveB1FMetalCoat:
	itemball METAL_COAT

Route18HiddenCaveB1FFullRestore:
	itemball FULL_RESTORE

Route18HiddenCaveB1FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_18_CAVE_B1F_HIDDEN_ULTRA_BALL

Route18HiddenCaveB1FHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ROUTE_18_CAVE_B1F_HIDDEN_RARE_CANDY

Route18HiddenCaveB1FHiddenElixer:
	hiddenitem ELIXER, EVENT_ROUTE_18_CAVE_B1F_HIDDEN_ELIXER

Route18HiddenCaveB1FHiddenStardust:
	hiddenitem STARDUST, EVENT_ROUTE_18_CAVE_B1F_HIDDEN_STARDUST

Route18HiddenCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3, 17, ROUTE_18_HIDDEN_CAVE_1F, 4
	warp_event 31,  7, ROUTE_18_HIDDEN_CAVE_1F, 5
	warp_event 19, 15, ROUTE_18_HIDDEN_CAVE_1F, 6
	warp_event 20,  9, ROUTE_18_HIDDEN_CAVE_1F, 7

	db 0 ; coord events

	db 4 ; bg events
	bg_event 20,  5, BGEVENT_ITEM, Route18HiddenCaveB1FHiddenUltraBall
	bg_event 35,  7, BGEVENT_ITEM, Route18HiddenCaveB1FHiddenRareCandy
	bg_event 11, 16, BGEVENT_ITEM, Route18HiddenCaveB1FHiddenElixer
	bg_event 13,  9, BGEVENT_ITEM, Route18HiddenCaveB1FHiddenStardust

	db 3 ; object events
	object_event 33, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route18HiddenCaveB1FPPUp, EVENT_ROUTE_18_CAVE_B1F_PP_UP
	object_event 37, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route18HiddenCaveB1FMetalCoat, EVENT_ROUTE_18_CAVE_B1F_METAL_COAT
	object_event  4,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route18HiddenCaveB1FFullRestore, EVENT_ROUTE_18_CAVE_B1F_FULL_RESTORE
