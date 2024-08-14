	const_def 2 ; object constants

HepaticaPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

HepaticaPokecenter1FNurseScript:
	jumpstd pokecenternurse

HepaticaPokecenter1FLassScript:
	jumptextfaceplayer HepaticaPokecenter1FLassText

HepaticaPokecenter1FSuperNerdScript:
	jumptextfaceplayer HepaticaPokecenter1FSuperNerdText

HepaticaPokecenter1FLassText:
	text "Have you met the"
	line "# SEER?"

	para "She will tell you"
	line "all about your"
	cont "#MON."
	done

HepaticaPokecenter1FSuperNerdText:
	text "I love showing off"
	line "the #MON that"

	para "I've raised."
	line "Don't you?"

	para "I'm going to get"
	line "into a bunch of"

	para "battles, and show"
	line "off my #MON!"
	done

HepaticaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, HEPATICA_TOWN, 1
	warp_event  4,  7, HEPATICA_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HepaticaPokecenter1FNurseScript, -1
	object_event  8,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, HepaticaPokecenter1FSuperNerdScript, -1
