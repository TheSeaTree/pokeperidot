	const_def 2 ; object constants

BlackthornCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlackthornCaveB1FBoulder:
	jumpstd strengthboulder
	
BlackthornCaveB1FTrainerText:
	text "I am a"
	line "#MON trainer!"
	done
	
BlackthornCaveB1FTrainerWinText:
	text "I lost."
	done
	
BlackthornCaveB1FTrainerAfterText:
	text "I lost."
	done

BlackthornCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11, 19, BLACKTHORN_CAVE_1F, 4
	warp_event 21, 13, BLACKTHORN_CAVE_1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 25,  6, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornCave2FBoulder, -1
	object_event 22,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornCave2FBoulder, -1
	object_event  5, 19, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornCave2FBoulder, -1
	object_event 27, 21, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornCave2FBoulder, -1
	object_event 15, 11, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornCave2FBoulder, -1
