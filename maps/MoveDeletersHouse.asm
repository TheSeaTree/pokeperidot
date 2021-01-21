	const_def 2 ; object constants
	const MOVEDELETERSHOUSE_GRAMPS
	const MOVEDELETERSHOUSE_SUPER_NERD

MoveDeletersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MoveDeleter:
	faceplayer
	opentext
	special MoveDeletion
	waitbutton
	closetext
	end
	
MoveReminder:
	faceplayer
	opentext
	special SpecialMoveRelearner
	waitbutton
	closetext
	end

MoveDeletersHouseBookshelf:
	jumptext BookOfMovesText
	
BookOfMovesText:
	text "There are so many"
	line "notebooks…"
	
	para "They show detailed"
	line "lists of all the"
	cont "moves each #MON"
	cont "can learn!"
	done

MoveDeletersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, RUGOSA_CITY, 7
	warp_event  3,  7, RUGOSA_CITY, 7

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, MoveDeletersHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MoveDeletersHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, MoveDeletersHouseBookshelf

	db 2 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoveDeleter, -1
	object_event  5,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoveReminder, -1
