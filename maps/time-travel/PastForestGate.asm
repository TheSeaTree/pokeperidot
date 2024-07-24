	const_def 2 ; object constants

PastForestGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .RemoveComputer

.RemoveComputer
	changeblock 6, 2, $0d
	return

PastForestGateOfficer:
	jumptext PastForestGateOfficerText

PastForestGateElder:
	jumptextfaceplayer PastForestGateElderText

PastForestGateOfficerText:
	text "Careful you don't"
	line "get lost, kid."

	para "OCCIDENT FOREST is"
	line "rather large, and"
	cont "has many dead ends"
	cont "among the trees."
	done

PastForestGateElderText:
	text "There was once a"
	line "GUARDIAN who would"
	cont "act as a protector"
	cont "of the FOREST."

	para "It has not been"
	line "seen since I was a"
	cont "boy, but a shrine"
	cont "still stands in"
	cont "its honor."
	done

PastForestGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, PAST_ILEX_FOREST, 1
	warp_event  0,  5, PAST_ILEX_FOREST, 2
	warp_event  9,  4, PAST_ELKHORN_TOWN, 4
	warp_event  9,  5, PAST_ELKHORN_TOWN, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastForestGateOfficer, -1
	object_event  8,  7, SPRITE_ELDER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastForestGateElder, -1
