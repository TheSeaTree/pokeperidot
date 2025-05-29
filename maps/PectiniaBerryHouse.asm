	const_def 2 ; object constants
	const AZALEABERRYHOUSE_POKEFAN_M

PectiniaBerryHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PectiniaBerryHousePokefanMScript:
	jumptextfaceplayer PectiniaBerrySpeechHouseCheckTreesText

PectiniaBerryHouseBookshelf:
	jumpstd magazinebookshelf

PectiniaBerrySpeechHouseCheckTreesText:
	text "BERRIES will grow"
	line "back every once in"
	cont "a while."
	
	para "If you find a good"
	line "one, remember"
	cont "where you picked"
	cont "it from!"
	done

PectiniaBerryHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PECTINIA_CITY, 4
	warp_event  3,  7, PECTINIA_CITY, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, PectiniaBerryHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, PectiniaBerryHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PectiniaBerryHousePokefanMScript, -1
