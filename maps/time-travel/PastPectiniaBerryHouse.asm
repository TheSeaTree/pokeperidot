	const_def 2 ; object constants

PastPectiniaBerryHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPectiniaBerryHouseCooltrainer:
	checkevent EVENT_BOSS_CELEBI_AVAILABLE
	iffalse .no_fruit
	jumptextfaceplayer PastPectiniaBerryHouseCooltrainerText

.no_fruit
	jumptextfaceplayer PastPectiniaBerryHouseCooltrainerNoFruitText

PastPectiniaBerryHouseCooltrainerNoFruitText:
	text "I don't get it."

	para "Nothing I plant"
	line "will grow, no"
	cont "matter how hard I"
	cont "tend to the crops…"

	para "Maybe I'm not cut"
	line "out for this kind"
	cont "of thing…"
	done

PastPectiniaBerryHouseCooltrainerText:
	text "Some day I hope to"
	line "grow an entire"
	cont "orchard!"

	para "I'll work so hard"
	line "to make sure the"
	cont "flowers and trees"
	cont "last for as long"
	cont "as possible!"
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
