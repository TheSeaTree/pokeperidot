	const_def 2 ; object constants

Route7CaveB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall

.SmashWall:
	checkevent EVENT_KINGERS_DEN_OPEN
	iffalse .skip
	changeblock 6, 20, $37
.skip
	return

Route7CaveB1FStrengthBoulder:
	jumpstd strengthboulder

Route7CaveB1FLightClay:
	itemball LIGHT_CLAY

Route7CaveB1FDragonScale:
	itemball DRAGON_SCALE

Route7CaveB1FHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ROUTE_7_CAVE_B1F_HIDDEN_RARE_CANDY

Route7CaveB1FHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ROUTE_7_CAVE_B1F_HIDDEN_HYPER_POTION

Route7CaveB1FHiddenProtein:
	hiddenitem PROTEIN, EVENT_ROUTE_7_CAVE_B1F_HIDDEN_PROTEIN

Route7CaveB1FHiddenFocusSash:
	hiddenitem FOCUS_SASH, EVENT_ROUTE_7_CAVE_B1F_HIDDEN_FOCUS_SASH

Route7CaveB1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 17,  5, ROUTE_7_CAVE_1F, 3
	warp_event 35, 17, ROUTE_7_CAVE_1F, 4
	warp_event  9, 13, ROUTE_7_CAVE_B1F, 4
	warp_event 17, 31, ROUTE_7_CAVE_B1F, 3
	warp_event  7, 21, TENTACRUELS_DEN, 1
	
	db 0 ; coord events

	db 4 ; bg events
	bg_event  8, 36, BGEVENT_ITEM, Route7CaveB1FHiddenRareCandy
	bg_event 16,  3, BGEVENT_ITEM, Route7CaveB1FHiddenHyperPotion
	bg_event 38, 17, BGEVENT_ITEM, Route7CaveB1FHiddenProtein
	bg_event 31, 32, BGEVENT_ITEM, Route7CaveB1FHiddenFocusSash

	db 6 ; object events
	object_event 22, 14, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route7CaveB1FStrengthBoulder, -1
	object_event 22, 15, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route7CaveB1FStrengthBoulder, -1
	object_event 23, 14, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route7CaveB1FStrengthBoulder, -1
	object_event 21, 15, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route7CaveB1FStrengthBoulder, -1
	object_event 16, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route7CaveB1FLightClay, EVENT_ROUTE_7_CAVE_B1F_LIGHT_CLAY
	object_event 30, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route7CaveB1FDragonScale, EVENT_ROUTE_7_CAVE_B1F_DRAGON_SCALE
