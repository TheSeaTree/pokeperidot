	const_def 2 ; object constants
	const FACTORY1F_BOULDER1
	const FACTORY1F_BOULDER2
	const FACTORY1F_ITEM_BALL

Factory1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Factory1FBoulder:
	jumpstd strengthboulder
	
FactoryBasementKey:
	itemball BASEMENT_KEY

Factory1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 16, 21, EAST_FOREST, 3
	warp_event 17, 21, EAST_FOREST, 4
	warp_event  5, 16, FACTORY_B1, 1
	warp_event  3,  4, FACTORY_B1, 2
	warp_event 11,  0, FACTORY_BACK, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 16,  6, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Factory1FBoulder, -1
	object_event 17,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Factory1FBoulder, -1
	object_event 18,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FactoryBasementKey, EVENT_RECEIVED_BASEMENT_KEY
