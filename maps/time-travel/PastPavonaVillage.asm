	const_def 2 ; object constants

PastPavonaVillage_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPavonaVillageHiker:
	jumptextfaceplayer PastPavonaVillageHikerText

PastPavonaVillageSmashRock:
	jumpstd smashrock

PastPavonaVillageHikerText:
	text "I've always been"
	line "curious about what"
	cont "these rocks are"
	cont "blocking."

	para "I even tried to"
	line "climb them once."

	para "…I didn't get very"
	line "far because I'm"
	line "afraid of heights."
	done

PastPavonaVillage_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 19,  5, PAST_PAVONA_INN, 1 ; Maple's Lab
	warp_event 23, 13, PAST_PAVONA_HOUSE_1, 1 ; The Vidya Guy
	warp_event 13, 11, PAST_PAVONA_HOUSE_2, 1 ; Inn

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  7, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPavonaVillageHiker, -1
	object_event  4,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPavonaVillageSmashRock, -1
	object_event  5, 10, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPavonaVillageSmashRock, -1
	object_event  6,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPavonaVillageSmashRock, -1
	object_event  7, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPavonaVillageSmashRock, -1
