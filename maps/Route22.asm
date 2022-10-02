	const_def 2 ; object constants

Route22_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route22Sign:
	jumptext Route22SignText

Route22SignText:
	text "ROUTE 22"
	
	para "ORCHID CITY"
	line "ahead."
	done

Route22_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 29,  5, MOLTEN_PEAK_1F, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event 17,  4, BGEVENT_READ, Route22Sign
	
	db 0 ; object events
