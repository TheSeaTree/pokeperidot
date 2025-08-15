	const_def 2 ; object constants

VictoryCoast_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VictoryCoastSailor:
	jumptextfaceplayer VictoryCoastSailorText

VictoryCoastCooltrainerF:
	jumptextfaceplayer VictoryCoastCooltrainerFText

VictoryCoastSwimmerM:
	jumptextfaceplayer VictoryCoastSwimmerMText

VictoryPortSign:
	jumptext VictoryPortSignText

VictoryCoastSailorText:
	text "I can only relax"
	line "on this beach,"
	cont "the sound of the"
	cont "wind helps me"
	cont "achieve zen."

	para "It beats all the"
	line "noisy machinery on"
	cont "the ship!"
	done

VictoryCoastCooltrainerFText:
	text "The ELITE FOUR are"
	line "much stronger than"
	cont "any trainer on the"
	cont "mainland."

	para "ROUTE 22 has"
	line "become a popular"
	cont "training spot for"
	cont "that reason."
	done

VictoryCoastSwimmerMText:
	text "Swimming in the"
	line "ocean keeps my"
	cont "body prepared for"
	cont "any challenge I"
	cont "must face!"
	done

VictoryPortSignText:
	text "VICTORY PORT"

	para "#MON LEAGUE"
	line "ahead."
	done

VictoryCoast_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  8, 19, VICTORY_PORT, 1
	warp_event 16,  7, POKEMON_LEAGUE_GATE_1F, 3
	warp_event 39, 14, ROUTE_22_GATE, 1
	warp_event 39, 15, ROUTE_22_GATE, 2
	warp_event 29, 13, VICTORY_COAST_OFFICERS_HOUSE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 13, 19, BGEVENT_READ, VictoryPortSign

	db 3 ; object events
	object_event 21, 17, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 3, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryCoastSailor, -1
	object_event 29, 18, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 3, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, PAL_NPC_RED, VictoryCoastCooltrainerF, -1
	object_event 23, 25, SPRITE_SWIMMER_GUY_LAND, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryCoastSwimmerM, -1
