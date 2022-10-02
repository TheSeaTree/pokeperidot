	const_def 2 ; object constants
	const CARNATIONPOKECENTER1F_NURSE

CarnationPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CarnationPokecenter1FNurseScript:
	jumpstd pokecenternurse
	
CarnationPokecenter1FSuperNerd:
	jumptextfaceplayer CarnationPokecenter1FSuperNerdText
	
CarnationPokecenter1FCooltrainerM:
	jumptextfaceplayer CarnationPokecenter1FCooltrainerMText
	
CarnationPokecenter1FSuperNerdText:
	text "My luck in the"
	line "SAFARI ZONE is"
	cont "terrible."
	
	para "I blew all of my"
	line "money trying to"
	cont "find some rare"
	cont "#MON."
	done
	
CarnationPokecenter1FCooltrainerMText:
	text "Did you come here"
	line "from RUGOSA COAST"
	cont "too?"
	
	para "That path took a"
	line "lot out of me."
	
	para "At least my"
	line "#MON grew a lot"
	cont "stronger from it."
	done

CarnationPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CARNATION_TOWN, 6
	warp_event  4,  7, CARNATION_TOWN, 6
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CarnationPokecenter1FNurseScript, -1
	object_event  8,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CarnationPokecenter1FSuperNerd, -1
	object_event  1,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CarnationPokecenter1FCooltrainerM, -1
