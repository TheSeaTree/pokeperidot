	const_def 2 ; object constants
	
LostLandCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
LostLandCave1FBoulder:
	jumpstd strengthboulder

LostLandCaveB1FMaxEther:
	itemball MAX_ETHER

LostLandCaveB1FStarPiece:
	itemball STAR_PIECE
	
LostLandCaveB1FHiddenIron:
	hiddenitem IRON, EVENT_LOST_LAND_CAVE_B1F_IRON
	
LostLandCaveB1FHiddenProtein:
	hiddenitem PROTEIN, EVENT_LOST_LAND_CAVE_B1F_PROTEIN
	
LostLandCaveB1FHiddenCoarseCharm:
	hiddenitem COARSE_CHARM, EVENT_LOST_LAND_CAVE_B1F_COARSE_CHARM
	
LostLandCaveB1FHiddenPPUp:
	hiddenitem PP_UP, EVENT_LOST_LAND_CAVE_B1F_PP_UP

LostLandCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 41,  7, LOST_LAND_CAVE_1F, 3
	warp_event  3, 11, LOST_LAND_CAVE_1F, 4

	db 0 ; coord events

	db 4 ; bg events
	bg_event 14, 14, BGEVENT_ITEM, LostLandCaveB1FHiddenIron
	bg_event  9, 10, BGEVENT_ITEM, LostLandCaveB1FHiddenProtein
	bg_event  6, 23, BGEVENT_ITEM, LostLandCaveB1FHiddenCoarseCharm
	bg_event 29,  4, BGEVENT_ITEM, LostLandCaveB1FHiddenPPUp

	db 9 ; object events
	object_event 26,  4, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LostLandCave1FBoulder, -1
	object_event 19,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LostLandCave1FBoulder, -1
	object_event 20, 11, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LostLandCave1FBoulder, -1
	object_event 18, 11, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LostLandCave1FBoulder, -1
	object_event 11, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LostLandCave1FBoulder, -1
	object_event 16, 20, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LostLandCave1FBoulder, -1
	object_event 17, 19, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LostLandCave1FBoulder, -1
	object_event 32, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LostLandCaveB1FMaxEther, EVENT_LOST_LAND_CAVE_B1F_MAX_ETHER
	object_event 12,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LostLandCaveB1FStarPiece, EVENT_LOST_LAND_CAVE_B1F_STAR_PIECE
