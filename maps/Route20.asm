	const_def 2 ; object constants

Route20_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route20Sign:
	jumptext Route20SignText

Route20SignText:
	text "ROUTE 20"
	
	para "ORCHID CITY"
	line "ahead."
	done

Route20_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 29,  5, MOLTEN_PEAK_1F, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event 17,  4, BGEVENT_READ, Route20Sign
	
	db 0 ; object events
