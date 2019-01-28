	const_def 2 ; object constants

Route10South_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route10Sign:
	jumptext Route10SignText

Route10SignText:
	text "ROUTE 10"

	para "CERULEAN CITY -"
	line "LAVENDER TOWN"
	done

Route10South_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  6,  1, PALEROCK_CAVE_1F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  3, BGEVENT_READ, Route10Sign

	db 0 ; object events
