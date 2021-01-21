	const_def 2 ; object constants

RidgePokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RidgePokecenterNurse:
	jumpstd pokecenternurse

RidgePokecenter1FGentlemanScript:
	jumptextfaceplayer RidgePokecenter1FGentlemanText

RidgePokecenter1FYoungsterScript:
	jumptextfaceplayer RidgePokecenter1FYoungsterText

RidgePokecenter1FGentlemanText:
	text "It does my heart"
	line "good to see new"
	cont "faces around here."
	
	para "I know that a love"
	line "of #MON will"
	cont "never fade away!"
	done

RidgePokecenter1FYoungsterText:
	text "I visited the MOVE"
	line "TUTOR in town. She"
	cont "taught all of my"
	cont "#MON new moves!"
	
	para "I asked if she"
	line "could show me how"
	cont "they worked, but"
	cont "she declined."
	done

RidgePokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, RIDGE_VILLAGE, 3
	warp_event  4,  7, RIDGE_VILLAGE, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RidgePokecenterNurse, -1
	object_event  5,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RidgePokecenter1FGentlemanScript, -1
	object_event  9,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RidgePokecenter1FYoungsterScript, -1
