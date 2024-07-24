	const_def 2 ; object constants

PastPavonaVillage_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPavonaVillageLass:
	jumptextfaceplayer PastPavonaVillageLassText

PastPavonaVillageFisher:
	jumptextfaceplayer PastPavonaVillageFisherText

PastPavonaVillageHiker:
	jumptextfaceplayer PastPavonaVillageHikerText

PastPavonaVillageSign:
	jumptext PastPavonaVillageSignText

PastPavonaVillageSmashRock:
	jumpstd smashrock

PastPavonaVillageLassText:
	text "It's hard to go"
	line "anywhere fun when"
	cont "I have no #MON."
	done

PastPavonaVillageFisherText:
	text "I got a nasty"
	line "sting from a"
	cont "NIDORAN while out"
	cont "on ROUTE 2."

	para "But after a nap at"
	line "the INN, I feel as"
	cont "good as new!"
	done

PastPavonaVillageHikerText:
	text "I've always been"
	line "curious about what"
	cont "these rocks are"
	cont "blocking."

	para "I even tried to"
	line "climb them once."

	para "…I didn't get very"
	line "far because I'm"
	cont "afraid of heights."
	done

PastPavonaVillageSignText:
	text "PAVONA VILLAGE-"

	para "The oasis of"
	line "serenity."
	done

PastPavonaVillage_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 19,  5, PAST_PAVONA_INN, 1 ; Maple's Lab
	warp_event 23, 13, PAST_PAVONA_HOUSE_1, 1 ; The Vidya Guy
	warp_event 13, 11, PAST_PAVONA_HOUSE_2, 1 ; Inn

	db 0 ; coord events

	db 1 ; bg events
	bg_event 16,  5, BGEVENT_READ, PastPavonaVillageSign

	db 6 ; object events
	object_event 13,  7, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastPavonaVillageLass, -1
	object_event 23,  6, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PastPavonaVillageFisher, -1
	object_event  7, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPavonaVillageHiker, -1
	object_event  4,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPavonaVillageSmashRock, -1
	object_event  5, 10, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPavonaVillageSmashRock, -1
	object_event  6,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPavonaVillageSmashRock, -1
	object_event  7, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPavonaVillageSmashRock, -1
