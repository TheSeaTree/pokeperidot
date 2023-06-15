	const_def 2 ; object constants

PastRoute11House4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastRoute11House4Fisher:
	jumptextfaceplayer PastRoute11House4FisherText

PastRoute11House4FisherText:
	text "Be careful around"
	line "these parts, kid."

	para "With the new kinds"
	line "of #MON being"
	cont "discovered, you"
	cont "need to be aware"
	cont "of what lurks out"
	cont "in the wild."

	para "People claim they"
	line "have seen a new"
	cont "kind of #MON"
	cont "that is a GHOST."

	para "…I would never"
	line "mess with those"
	cont "types of #MON."

	para "Who knows what"
	line "kind of wickedness"
	cont "they may bring…"
	done
	
PastRoute11House4_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_ROUTE_11, 9
	warp_event 3,  7, PAST_ROUTE_11, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PastRoute11House4Fisher, -1
