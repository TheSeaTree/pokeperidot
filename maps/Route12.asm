	const_def 2 ; object constants

Route12_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route12ShelterSign:
	jumptext ShelterSignText
	
ShelterSignText:
	text "#MON SHELTER-"
	
	para "Pledging to take"
	line "care of any"
	cont "#MON in need."
	done

Route12_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4, 12, ROUTE_12_ECRUTEAK_GATE, 3
	warp_event  4, 13, ROUTE_12_ECRUTEAK_GATE, 4
	warp_event 51,  5, ROUTE_12_SHELTER, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event   50,  6, BGEVENT_READ, Route12ShelterSign

	db 0 ; object events
