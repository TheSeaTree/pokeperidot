	const_def 2 ; object constants

Route20AcroporaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route20AcroporaGuardScript:
	jumptextfaceplayer Route20AcroporaGuardText

Route20AcroporaGuardText:
	text "Hey, shut the door"
	line "behind you!"
	
	para "I don't want any"
	line "#MON coming in-"
	cont "side here."
	
	para "Especially not any"
	line "BUG-types."
	
	para "Those give me the"
	line "creeps!"
	
	para "I don't even want"
	line "to think about"
	cont "them crawling all"
	cont "over the place…"
	
	para "YUCK!"
	done

Route20AcroporaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_20, 1
	warp_event  5,  0, ROUTE_20, 2
	warp_event  4,  7, ACROPORA_CITY, 1
	warp_event  5,  7, ACROPORA_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route20AcroporaGuardScript, -1
