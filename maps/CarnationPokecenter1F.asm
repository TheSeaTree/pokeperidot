	const_def 2 ; object constants
	const CARNATIONPOKECENTER1F_NURSE

CarnationPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CarnationPokecenter1FNurseScript:
	jumpstd pokecenternurse

CarnationPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CARNATION_TOWN, 6
	warp_event  4,  7, CARNATION_TOWN, 6
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CarnationPokecenter1FNurseScript, -1
