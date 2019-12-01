	const_def 2 ; object constants
	const ORCHIDPOKECENTER1F_NURSE

OrchidPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OrchidPokecenter1FNurseScript:
	jumpstd pokecenternurse

OrchidPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ORCHID_CITY, 1
	warp_event  4,  7, ORCHID_CITY, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OrchidPokecenter1FNurseScript, -1
