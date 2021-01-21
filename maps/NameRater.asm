	const_def 2 ; object constants

NameRater_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NameRater:
	faceplayer
	opentext
	special NameRater
	waitbutton
	closetext
	end

NameRaterBookshelf:
	jumpstd difficultbookshelf

INCLUDE "data/text/unused_sweet_honey.asm"

NameRater_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, RIDGE_VILLAGE, 5
	warp_event  3,  7, RIDGE_VILLAGE, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, NameRaterBookshelf
	bg_event  1,  1, BGEVENT_READ, NameRaterBookshelf

	db 1 ; object events
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NameRater, -1
