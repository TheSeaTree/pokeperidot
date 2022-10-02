	const_def 2 ; object constants
	const FAVIAPOKECENTER1F_NURSE
	const FAVIAPOKECENTER1F_GAMEBOY_KID
	const FAVIAPOKECENTER1F_LASS
	const FAVIAPOKECENTER1F_POKEFAN_F

FaviaPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FaviaPokecenter1FNurseScript:
	jumpstd pokecenternurse

FaviaPokecenter1FBugCatcherScript:
	jumptextfaceplayer FaviaPokecenter1FBugCatcherText
	
FaviaPokecenter1FLassScript:
	jumptextfaceplayer FaviaPokecenter1FLassText

FaviaPokecenter1FPokefanF:
	jumptextfaceplayer UnknownText_0x624e9

FaviaPokecenter1FBugCatcherText:
	text "The BUG and DARK-"
	line "type #MON I"
	cont "challenged the"
	cont "GYM with weren't"
	cont "enough."
	
	para "The trainers there"
	line "had counters for"
	cont "them all!"
	done

FaviaPokecenter1FLassText:
	text "I left my #MON"
	line "at the DAY CARE"
	cont "because it could"
	cont "not keep up in"
	cont "battles."
	
	para "When I picked it"
	line "back up, it became"
	cont "so much stronger!"
	done

UnknownText_0x624e9:
	text "There are lots of"
	line "rumors about this"
	cont "town's GYM LEADER."

	para "She doesn't really"
	line "have anything in"
	cont "common with the"
	cont "rest of the people"
	cont "here, so she keeps"
	cont "to herself."
	
	para "People will always"
	line "talk when there is"
	cont "that sort of"
	cont "mystery surround-"
	cont "ing a person."
	done

FaviaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, FAVIA_TOWN, 1
	warp_event  4,  7, FAVIA_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FaviaPokecenter1FNurseScript, -1
	object_event  6,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FaviaPokecenter1FBugCatcherScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FaviaPokecenter1FLassScript, -1
	object_event  9,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FaviaPokecenter1FPokefanF, -1
