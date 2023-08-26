	const_def 2 ; object constants

PastPectiniaCity_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPectiniaCityWorker:
	jumptextfaceplayer PastPectiniaCityWorkerText

PastPectiniaCityLicensePlate:
	jumptext PastPectiniaCityLicensePlateText

PastPectiniaFruitTree:
	jumptext PastPectiniaFruitTreeText

PastPectiniaCityWorkerText:
	text "PECTINIA CITY is"
	line "growing at such a"
	cont "rate that we will"
	cont "need a new"
	cont "apartment complex"
	cont "just to house the"
	cont "influx of people"
	cont "moving here."

	para "My crew is helping"
	line "build this city"
	cont "into something"
	cont "real big."

	para "Maybe we will even"
	line "rival RUGOSA."
	done

PastPectiniaCityLicensePlateText:
	text "The license plate"
	line "this truck says"
	cont "“OUTATIME”"
	done

PastPectiniaFruitTreeText:
	text "It's a fruit-"
	line "bearing tree."

	para "…But it would be"
	line "best to leave it"
	cont "undisturbed."
	done

PastPectiniaCity_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 31, 11, PAST_PECTINIA_MART,  1 ; Mart
	warp_event  4, 26, PAST_ROUTE_2_GATE,   2 ; Route 2 Gate
	warp_event  4, 27, PAST_ROUTE_2_GATE,   3 ; Route 2 Gate
	warp_event  9,  5, PAST_PECTINIA_GATE,	3 ; Route 3 Gate
	warp_event 11, 25, PAST_PECTINIA_GYM_SPEECH_HOUSE,  1 ; Gym Guy's House
	warp_event 17, 25, PAST_PECTINIA_CITY,  6 ; Bike House
	warp_event 51, 25, PAST_PECTINIA_BERRY_HOUSE, 1 ; Berry House
	warp_event 40, 17, PAST_PECTINIA_GYM,   1 ; Police Station
	warp_event 37, 11, PAST_PECTINIA_CITY,  9 ; Evolution House
	warp_event 23, 11, PAST_PECTINIA_APARTMENT_1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 20, 10, BGEVENT_RIGHT, PastPectiniaCityLicensePlate

	db 8 ; object events
	object_event 18, 20, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPectiniaCityWorker, -1
	object_event 12, 16, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 19, 17, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 14, 17, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 49, 22, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, PastPectiniaFruitTree, -1
	object_event 50, 20, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, PastPectiniaFruitTree, -1
	object_event 53, 21, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, PastPectiniaFruitTree, -1
	object_event 52, 19, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, PastPectiniaFruitTree, -1
