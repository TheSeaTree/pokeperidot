	const_def 2 ; object constants
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F

GoldenrodPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodPokecenter1FNurseScript:
	jumpstd pokecenternurse

GoldenrodPokecenter1FBugCatcherScript:
;	opentext
;	givepoke GYARADOS, 20
	jumptextfaceplayer GoldenrodPokecenter1FBugCatcherText
;	closetext
;	end
	
GoldenrodPokecenter1FLassScript:
;	writebyte GYARADOS
;	special FindPartyMonThatSpecies
;	iffalse .no
;	writebyte DREAD_STORM
;	opentext
;	special MoveTutor
;	closetext
;	end
;	
;.no
	jumptextfaceplayer GoldenrodPokecenter1FLassText

GoldenrodPokecenter1FPokefanF:
	jumptextfaceplayer UnknownText_0x624e9

GoldenrodPokecenter1FBugCatcherText:
	text "The BUG and DARK-"
	line "type #MON I"
	cont "challenged the"
	cont "GYM with weren't"
	cont "enough."
	
	para "The trainers there"
	line "had counters for"
	cont "them all!"
	done

GoldenrodPokecenter1FLassText:
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

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, GOLDENROD_CITY, 1
	warp_event  4,  7, GOLDENROD_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event  4,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FBugCatcherScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
	object_event  9,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
