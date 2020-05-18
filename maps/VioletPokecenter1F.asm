	const_def 2 ; object constants
	const VIOLETPOKECENTER1F_NURSE
	const VIOLETPOKECENTER1F_GENTLEMAN
	const VIOLETPOKECENTER1F_YOUNGSTER

VioletPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletPokecenterNurse:
	jumpstd pokecenternurse

VioletPokecenter1FGentlemanScript:
	jumptextfaceplayer VioletPokecenter1FGentlemanText

VioletPokecenter1FYoungsterScript:
	jumptextfaceplayer VioletPokecenter1FYoungsterText

VioletPokecenter1FGentlemanText:
	text "It does my heart"
	line "good to see new"
	cont "faces around here."
	
	para "I know that a love"
	line "of #MON will"
	cont "never fade away!"
	done

VioletPokecenter1FYoungsterText:
	text "I visited the MOVE"
	line "TUTOR in town. She"
	cont "taught all of my"
	cont "#MON new moves!"
	
	para "I asked if she"
	line "could show me how"
	cont "they worked, but"
	cont "she declined."
	done

VioletPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, VIOLET_CITY, 3
	warp_event  4,  7, VIOLET_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenterNurse, -1
	object_event  5,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGentlemanScript, -1
	object_event  9,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FYoungsterScript, -1
