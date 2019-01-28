Route10North_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PowerPlantSign:
	jumptext PowerPlantSignText

PowerPlantSignText:
	text "PALEROCK CAVERN"
	done

Route10North_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4,  2, ROUTE_8_ROUTE_10_GATE, 3
	warp_event  4,  3, ROUTE_8_ROUTE_10_GATE, 4
	warp_event 22, 13, PALEROCK_CAVE_1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 20, 20, BGEVENT_READ, PowerPlantSign

	db 0 ; object events
