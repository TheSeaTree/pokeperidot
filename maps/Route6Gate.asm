	const_def 2 ; object constants
	const ROUTE6SAFFRONGATE_OFFICER

Route6Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route6GateGuardScript:
	jumptextfaceplayer Route6GuardText

Route6GuardText:
	text "I thought there"
	line "was a mistake when"
	cont "I was assigned to"
	cont "this gate."
	
	para "Who would ever ex-"
	line "pect to see one on"
	cont "such a small is-"
	cont "land? It's crazy."
	
	para "But hey, I don't"
	line "make the rules. I"
	cont "only follow them."
	done

Route6Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, SEA_ROUTE_5, 1
	warp_event  5,  0, SEA_ROUTE_5, 2
	warp_event  4,  7, ROUTE_6, 3
	warp_event  5,  7, ROUTE_6, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route6GateGuardScript, -1
