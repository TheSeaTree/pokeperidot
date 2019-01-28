	const_def 2 ; object constants


CherrygroveEvolutionSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CherrygroveEvolutionSpeechHouseBookshelf:
	jumpstd magazinebookshelf

CherrygroveEvolutionSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CHERRYGROVE_CITY, 6
	warp_event  3,  7, CHERRYGROVE_CITY, 6

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CherrygroveEvolutionSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CherrygroveEvolutionSpeechHouseBookshelf

	db 0 ; object events
