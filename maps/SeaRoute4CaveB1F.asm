	const_def 2 ; object constants

SeaRoute4CaveB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall

.SmashWall:
	checkevent EVENT_TENTACRUELS_DEN_OPEN
	iffalse .skip
	changeblock 6, 20, $37
.skip
	return

SeaRoute4CaveB1FStrengthBoulder:
	jumpstd strengthboulder

SeaRoute4CaveB1FLightClay:
	itemball LIGHT_CLAY

SeaRoute4CaveB1FDragonScale:
	itemball DRAGON_SCALE

SeaRoute4CaveB1FHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_SEA_ROUTE_4_CAVE_B1F_HIDDEN_RARE_CANDY

SeaRoute4CaveB1FHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_SEA_ROUTE_4_CAVE_B1F_HIDDEN_HYPER_POTION

SeaRoute4CaveB1FHiddenProtein:
	hiddenitem PROTEIN, EVENT_SEA_ROUTE_4_CAVE_B1F_HIDDEN_PROTEIN

SeaRoute4CaveB1FHiddenFocusSash:
	hiddenitem FOCUS_SASH, EVENT_SEA_ROUTE_4_CAVE_B1F_HIDDEN_FOCUS_SASH

SeaRoute4CaveB1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 17,  5, SEA_ROUTE_4_CAVE_1F, 3
	warp_event 35, 17, SEA_ROUTE_4_CAVE_1F, 4
	warp_event  9, 13, SEA_ROUTE_4_CAVE_B1F, 4
	warp_event 17, 31, SEA_ROUTE_4_CAVE_B1F, 3
	warp_event  7, 21, TENTACRUELS_DEN, 1
	
	db 0 ; coord events

	db 4 ; bg events
	bg_event  8, 36, BGEVENT_ITEM, SeaRoute4CaveB1FHiddenRareCandy
	bg_event 16,  3, BGEVENT_ITEM, SeaRoute4CaveB1FHiddenHyperPotion
	bg_event 38, 17, BGEVENT_ITEM, SeaRoute4CaveB1FHiddenProtein
	bg_event 31, 32, BGEVENT_ITEM, SeaRoute4CaveB1FHiddenFocusSash

	db 6 ; object events
	object_event 22, 14, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeaRoute4CaveB1FStrengthBoulder, -1
	object_event 22, 15, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeaRoute4CaveB1FStrengthBoulder, -1
	object_event 23, 14, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeaRoute4CaveB1FStrengthBoulder, -1
	object_event 21, 15, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeaRoute4CaveB1FStrengthBoulder, -1
	object_event 16, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeaRoute4CaveB1FLightClay, EVENT_SEA_ROUTE_4_CAVE_B1F_LIGHT_CLAY
	object_event 30, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeaRoute4CaveB1FDragonScale, EVENT_SEA_ROUTE_4_CAVE_B1F_DRAGON_SCALE
