	const_def 2 ; object constants
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUY

StaghornPokecenter1F_MapScripts:
	db 2 ; scene scripts
	scene_script .MeetBill ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.MeetBill:
	end

.DummyScene:
	end

StaghornPokecenter1FNurseScript:
	jumpstd pokecenternurse

StaghornPokecenter1FCooltrainerFScript:
	jumptextfaceplayer StaghornPokecenter1FCooltrainerFText

StaghornPokecenter1FPokefanMScript:
	jumptextfaceplayer StaghornPokecenter1FPokefanMText

StaghornPokecenter1FPokefanMText:
	text "Going through a"
	line "forest with only"
	cont "ROCK-type #MON"
	cont "was a tough job."
	
	para "I made it through"
	line "by the skin of my"
	cont "teeth."
	
	para "I think I deserve"
	line "to rest here for a"
	cont "while."
	done

StaghornPokecenter1FCooltrainerFText:
	text "Did you know that"
	line "GYM LEADERs have"
	cont "lots of #MON?"
	
	para "They select a team"
	line "that is best suit-"
	cont "ed to their chall-"
	cont "enger."
	done

StaghornPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, STAGHORN_TOWN, 3
	warp_event  4,  7, STAGHORN_TOWN, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StaghornPokecenter1FNurseScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StaghornPokecenter1FCooltrainerFScript, -1
	object_event  9,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, StaghornPokecenter1FPokefanMScript, -1
