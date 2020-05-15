	const_def 2 ; object constants
	const AZALEAPOKECENTER1F_NURSE
	const AZALEAPOKECENTER1F_GENTLEMAN
	const AZALEAPOKECENTER1F_POKEFAN_M
	const AZALEAPOKECENTER1F_POKEFAN_F

AzaleaPokecenter1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

AzaleaPokecenter1FNurseScript:
	jumpstd pokecenternurse
	
AzaleaPokecenter1FGentleman:
	jumptextfaceplayer AzaleaPokecenter1FGentlemanText

AzaleaPokecenter1FPokefanM:
	jumptextfaceplayer AzaleaPokecenter1FPokefanMText

AzaleaPokecenter1FPokefanF:
	jumptextfaceplayer AzaleaPokecenter1FPokefanFText
	
AzaleaPokecenter1FGentlemanText:
	text "#MON CENTERs"
	line "are free to use"
	cont "for all trainers."
	
	para "They are funded by"
	line "trainers who fail"
	cont "at their GYM"
	cont "CHALLENGE."
	done
	
AzaleaPokecenter1FPokefanMText:
	text "I am resting after"
	line "hiking on ROUTE 3."
	
	para "I'll make it to"
	line "the peak of that"
	cont "mountain some day!"
	done
	
AzaleaPokecenter1FPokefanFText:
	text "When I caught a"
	line "new #MON, its"
	cont "#BALL changed"
	cont "color!"
	done

AzaleaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, AZALEA_TOWN, 1
	warp_event  4,  7, AZALEA_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FGentleman, -1
	object_event  6,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FPokefanM, -1
	object_event  8,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FPokefanF, -1
