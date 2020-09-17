	const_def 2 ; object constants
	const MAHOGANYPOKECENTER1F_NURSE
	const MAHOGANYPOKECENTER1F_POKEFAN_M
	const MAHOGANYPOKECENTER1F_YOUNGSTER
	const MAHOGANYPOKECENTER1F_COOLTRAINER_F

MahoganyPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyPokecenter1FNurseScript:
	jumpstd pokecenternurse

MahoganyPokecenter1FPokefanMScript:
	jumptext MahoganyPokecenter1FPokefanMText

MahoganyPokecenter1FYoungsterScript:
	jumptext MahoganyPokecenter1FYoungsterText

MahoganyPokecenter1FCooltrainerFScript:
	jumptextfaceplayer MahoganyPokecenter1FCooltrainerFText

MahoganyPokecenter1FPokefanMText:
	text "…and you should be"
	line "aware of what item"
	cont "your #MON are"
	cont "holding."
	
	para "JOEL can be really"
	line "tough because his"
	cont "#MON each have"
	cont "a held item."
	done

MahoganyPokecenter1FYoungsterText:
	text "Wow! Thanks for"
	line "all of these tips."
	
	para "There's no way I"
	line "will lose to him"
	cont "again!"
	done

MahoganyPokecenter1FCooltrainerFText:
	text "I'm letting the"
	line "NURSE go over my"
	cont "#MON very care-"
	cont "fully."
	
	para "My biggest fear is"
	line "losing a battle"
	cont "because my #MON"
	cont "weren't in the best"
	cont "shape."
	done

MahoganyPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, MAHOGANY_TOWN, 4
	warp_event  4,  7, MAHOGANY_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FNurseScript, -1
	object_event  1,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FPokefanMScript, -1
	object_event  2,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FYoungsterScript, -1
	object_event  9,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FCooltrainerFScript, -1
