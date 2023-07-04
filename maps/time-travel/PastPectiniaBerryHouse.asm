	const_def 2 ; object constants

PastPectiniaBerryHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPectiniaBerryHouseCooltrainer:
	jumptextfaceplayer PastPectiniaBerryHouseCooltrainerText

PastPectiniaBerryHouseCooltrainerText:
	text "Some day I hope to"
	line "grow an entire"
	cont "orchard!"

	para "It's satisfying to"
	line "only need to rely"
	cont "on myself."
	done

PastPectiniaBerryHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_PECTINIA_CITY, 7
	warp_event 3,  7, PAST_PECTINIA_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPectiniaBerryHouseCooltrainer, -1
