	const_def 2 ; object constants
	const VIRIDIANPOKECENTER1F_NURSE
	const VIRIDIANPOKECENTER1F_COOLTRAINER_M
	const VIRIDIANPOKECENTER1F_COOLTRAINER_F
	const VIRIDIANPOKECENTER1F_BUG_CATCHER

ViridianPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianPokecenter1FNurseScript:
	jumpstd pokecenternurse

ViridianPokecenter1FCooltrainerMScript:
	jumptextfaceplayer ViridianPokecenter1FCooltrainerMText_BlueReturned

ViridianPokecenter1FCooltrainerFScript:
	faceplayer
	opentext
	writetext ViridianPokecenter1FCooltrainerFText
	waitbutton
	closetext
	turnobject VIRIDIANPOKECENTER1F_COOLTRAINER_F, UP
	end

ViridianPokecenter1FBugCatcherScript:
	jumptextfaceplayer ViridianPokecenter1FBugCatcherText

ViridianPokecenter1FCooltrainerMText_BlueReturned:
	text "The #MON CENTER"
	line "in this town was"
	cont "built for trainers"
	cont "crossing ROUTE 10."
	
	para "That's where I"
	line "came from!"
	done

ViridianPokecenter1FCooltrainerFText:
	text "I'm sorry, my"
	line "#MON were badly"
	cont "hurt."

	para "I'm letting the"
	line "NURSE heal them."
	done

ViridianPokecenter1FBugCatcherText:
	text "My dream is to be-"
	line "come a GYM LEADER."
	
	para "…I just need to"
	line "catch a #MON"
	cont "first…"
	done


ViridianPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ELKHORN_TOWN, 4
	warp_event  4,  7, ELKHORN_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FNurseScript, -1
	object_event  9,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FCooltrainerMScript, -1
	object_event  3,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FCooltrainerFScript, EVENT_GOT_A_POKEMON_FROM_MAPLE
	object_event  1,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FBugCatcherScript, -1
