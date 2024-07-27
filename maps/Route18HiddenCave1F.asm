	const_def 2 ; object constants

Route18HiddenCave1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	
.OpenCave
	checkcode VAR_XCOORD
	ifequal 30, .Entrance2
	setevent EVENT_ROUTE_18_HIDDEN_CAVE_1_OPEN
	return
.Entrance2
	setevent EVENT_ROUTE_18_HIDDEN_CAVE_2_OPEN
	return

Route18HiddenCave1FCarbos:
	itemball CARBOS

Route18HiddenCave1FSuperPotion:
	itemball SUPER_POTION

Route18HiddenCave1FHiddenHpUp:
	hiddenitem HP_UP, EVENT_ROUTE_18_CAVE_1F_HIDDEN_HP_UP

Route18HiddenCave1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_ROUTE_18_CAVE_1F_HIDDEN_MAX_POTION

Route18HiddenCave1FHiddenMaxRepel:
	hiddenitem MAX_REPEL, EVENT_ROUTE_18_CAVE_1F_HIDDEN_MAX_REPEL

Route18HiddenCave1FHiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_18_CAVE_1F_HIDDEN_REVIVE

Route18HiddenCave1FHiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_18_CAVE_1F_HIDDEN_NUGGET

Route18HiddenCave1FHiddenProtein:
	hiddenitem PROTEIN, EVENT_ROUTE_18_CAVE_1F_HIDDEN_PROTEIN

Route18HiddenCave1FBoulder:
	jumpstd strengthboulder

Route18HiddenCave1FSmashRock:
	jumpstd smashrock

Route18HiddenCave1F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 20, 27, ROUTE_18_NORTH, 1
	warp_event 30, 23, ROUTE_18_NORTH, 2
	warp_event 25, 11, DUGTRIOS_DEN, 1
	warp_event  3, 13, ROUTE_18_HIDDEN_CAVE_B1F, 1
	warp_event 31,  3, ROUTE_18_HIDDEN_CAVE_B1F, 2
	warp_event 19, 11, ROUTE_18_HIDDEN_CAVE_B1F, 3
	warp_event 20,  5, ROUTE_18_HIDDEN_CAVE_B1F, 4

	db 0 ; coord events

	db 6 ; bg events
	bg_event  7,  2, BGEVENT_ITEM, Route18HiddenCave1FHiddenHpUp
	bg_event 16, 15, BGEVENT_ITEM, Route18HiddenCave1FHiddenMaxPotion
	bg_event 31,  1, BGEVENT_ITEM, Route18HiddenCave1FHiddenMaxRepel
	bg_event 36, 13, BGEVENT_ITEM, Route18HiddenCave1FHiddenRevive
	bg_event  3, 20, BGEVENT_ITEM, Route18HiddenCave1FHiddenNugget
	bg_event 28, 16, BGEVENT_ITEM, Route18HiddenCave1FHiddenProtein

	db 15 ; object events
	object_event 12, 22, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18HiddenCave1FBoulder, -1
	object_event 15, 14, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18HiddenCave1FBoulder, -1
	object_event 14, 15, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18HiddenCave1FBoulder, -1
	object_event  9, 17, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18HiddenCave1FBoulder, -1
	object_event 13, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18HiddenCave1FBoulder, -1
	object_event 14, 18, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18HiddenCave1FBoulder, -1
	object_event 35,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18HiddenCave1FBoulder, -1
	object_event 32,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18HiddenCave1FBoulder, -1
	object_event 36,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18HiddenCave1FBoulder, -1
	object_event 36,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18HiddenCave1FBoulder, -1
	object_event 37,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18HiddenCave1FBoulder, -1
	object_event 35,  6, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18HiddenCave1FBoulder, -1
	object_event 37,  7, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18HiddenCave1FSmashRock, -1
	object_event 25, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route18HiddenCave1FSuperPotion, EVENT_ROUTE_18_CAVE_1F_SUPER_POTION
	object_event  4,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route18HiddenCave1FCarbos, EVENT_ROUTE_18_CAVE_1F_CARBOS
