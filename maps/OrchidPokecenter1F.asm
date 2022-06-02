	const_def 2 ; object constants
	const ORCHIDPOKECENTER1F_NURSE

OrchidPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OrchidPokecenter1FNurseScript:
	jumpstd pokecenternurse

OrchidPokecenter1FLass:
	jumptextfaceplayer OrchidPokecenter1FLassText

OrchidPokecenter1FRocker:
	jumptextfaceplayer OrchidPokecenter1FRockerText

OrchidPokecenter1FLassText:
	text "Phew!"
	
	para "Don't you find it"
	line "to be so hot here?"

	para "It's nothing like"
	line "HEPATICA TOWN."

	para "I'm just glad this"
	line "#MON CENTER is"
	cont "air-conditioned!"
	done

OrchidPokecenter1FRockerText:
	text "Seeing all of the"
	line "lava outside has"
	cont "given me inspira-"
	cont "tion to become a"
	cont "FIREBREATHER when"
	cont "I grow up!"
	done

OrchidPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ORCHID_CITY, 1
	warp_event  4,  7, ORCHID_CITY, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OrchidPokecenter1FNurseScript, -1
	object_event  9,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OrchidPokecenter1FLass, -1
	object_event  1,  5, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OrchidPokecenter1FRocker, -1
