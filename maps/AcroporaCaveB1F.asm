	const_def 2 ; object constants

AcroporaCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AcroporaCaveB1FBoulder:
	jumpstd strengthboulder

AcroporaCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11, 19, ACROPORA_CAVE_1F, 4
	warp_event 21, 13, ACROPORA_CAVE_1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 25,  6, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcroporaCave2FBoulder, -1
	object_event 22,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcroporaCave2FBoulder, -1
	object_event  5, 19, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcroporaCave2FBoulder, -1
	object_event 27, 21, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcroporaCave2FBoulder, -1
	object_event 15, 11, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcroporaCave2FBoulder, -1
