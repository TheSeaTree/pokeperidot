	const_def 2 ; object constants

Route7_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route7Rock:
	jumpstd smashrock

Route7UndergroundPathSign:
	jumptext Route7UndergroundPathSignText

Route7UndergroundPathSignText:
	text "UNDERGROUND PATH"
	
	para "ROUTE 7-"
	line "ROUTE 8"
	done

Route7_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 45, 21, ROUTE_7_UNDERGROUND, 1
	
	db 0 ; coord events

	db 1 ; bg events
	bg_event  46, 22, BGEVENT_READ, Route7UndergroundPathSign

	db 5 ; object events
	object_event 47, 23, SPRITE_ROCK, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route7Rock, EVENT_GOT_TM_TELEPORT
	object_event 48, 20, SPRITE_ROCK, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route7Rock, -1
	object_event 50, 16, SPRITE_ROCK, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route7Rock, -1
	object_event 45, 17, SPRITE_ROCK, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route7Rock, -1
	object_event 42, 23, SPRITE_ROCK, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route7Rock, -1