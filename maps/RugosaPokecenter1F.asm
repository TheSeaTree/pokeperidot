	const_def 2 ; object constants
	const MAHOGANYPOKECENTER1F_NURSE
	const MAHOGANYPOKECENTER1F_POKEFAN_M
	const MAHOGANYPOKECENTER1F_YOUNGSTER
	const MAHOGANYPOKECENTER1F_COOLTRAINER_F

RugosaPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RugosaPokecenter1FNurseScript:
	jumpstd pokecenternurse

RugosaPokecenter1FPokefanMScript:
	jumptext RugosaPokecenter1FPokefanMText

RugosaPokecenter1FYoungsterScript:
	jumptext RugosaPokecenter1FYoungsterText

RugosaPokecenter1FCooltrainerFScript:
	jumptextfaceplayer RugosaPokecenter1FCooltrainerFText

RugosaPokecenter1FPokefanMText:
	text "…and you should be"
	line "aware of what item"
	cont "your #MON are"
	cont "holding."
	
	para "JOEL can be really"
	line "tough because his"
	cont "#MON each have"
	cont "a held item."
	done

RugosaPokecenter1FYoungsterText:
	text "Wow! Thanks for"
	line "all of these tips."
	
	para "There's no way I"
	line "will lose to him"
	cont "again!"
	done

RugosaPokecenter1FCooltrainerFText:
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

RugosaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, RUGOSA_CITY, 4
	warp_event  4,  7, RUGOSA_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaPokecenter1FNurseScript, -1
	object_event  1,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RugosaPokecenter1FPokefanMScript, -1
	object_event  2,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RugosaPokecenter1FYoungsterScript, -1
	object_event  9,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaPokecenter1FCooltrainerFScript, -1
