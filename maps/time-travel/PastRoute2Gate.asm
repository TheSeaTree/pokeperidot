	const_def 2 ; object constants

PastRoute2Gate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .RemoveComputer

.RemoveComputer
	changeblock 6, 2, $0d
	return

PastRoute2GateOfficer:
	jumptextfaceplayer PastRoute2GateOfficerText

PastRoute2GateOfficerText:
	text "This is such a"
	line "relaxing position."

	para "I can read my"
	line "book all day beca-"
	cont "use people rarely"
	cont "use this gate."
	done

PastRoute2Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, PAST_ROUTE_2, 1
	warp_event  0,  5, PAST_ROUTE_2, 2
	warp_event  9,  4, PAST_PECTINIA_CITY, 2
	warp_event  9,  5, PAST_PECTINIA_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastRoute2GateOfficer, -1
