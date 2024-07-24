	const_def 2 ; object constants

PastPavonaHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPavonaHouse1Rocker:
	jumptextfaceplayer PastPavonaHouse1RockerText

PastPavonaHouse1RockerText:
	text "I need to catch a"
	line "#MON so I can"
	cont "make it through"
	cont "ROUTE 2."

	para "I need something"
	line "to do, I'm going"
	cont "crazy being cooped"
	cont "up inside all day!"
	done

PastPavonaHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_PAVONA_VILLAGE, 2
	warp_event 3,  7, PAST_PAVONA_VILLAGE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 5,  6, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPavonaHouse1Rocker, -1