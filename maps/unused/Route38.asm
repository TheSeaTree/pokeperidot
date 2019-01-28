	const_def 2 ; object constants
	const ROUTE38_FRUIT_TREE

Route38_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route38Sign:
	jumptext Route38SignText

Route38TrainerTips:
	jumptext Route38TrainerTipsText

Route38FruitTree:
	fruittree FRUITTREE_ROUTE_38

Route38SignText:
	text "ROUTE 38"

	para "OLIVINE CITY -"
	line "ECRUTEAK CITY"
	done

Route38TrainerTipsText:
	text "TRAINER TIPS"

	para "If a #MON is"
	line "trying to evolve,"
	cont "you can stop it."

	para "Press the B But-"
	line "ton during evolu-"
	cont "tion."

	para "That startles the"
	line "#MON and stops"
	cont "its evolution."
	done

Route38_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 35,  8, ROUTE_38_ECRUTEAK_GATE, 1
	warp_event 35,  9, ROUTE_38_ECRUTEAK_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 33,  7, BGEVENT_READ, Route38Sign
	bg_event  5, 13, BGEVENT_READ, Route38TrainerTips

	db 1 ; object events
	object_event 12, 10, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route38FruitTree, -1
