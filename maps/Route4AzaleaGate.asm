	const_def 2 ; object constants
	const Route4AzaleaGATE_OFFICER
	const Route4AzaleaGATE_COOLTRAINER_F

Route4AzaleaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route4AzaleaGateOfficerScript:
	jumptextfaceplayer Route4AzaleaGateOfficerText

Route4AzaleaGateOfficerText:
	text "I hope you can"
	line "swim, kid."
	
	para "Otherwise there is"
	line "no point going to"
	cont "ROUTE 4 through"
	cont "this gate."
	done

Route4AzaleaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, AZALEA_TOWN, 8
	warp_event  0,  5, AZALEA_TOWN, 9
	warp_event  9,  4, ROUTE_4, 5
	warp_event  9,  5, ROUTE_4, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route4AzaleaGateOfficerScript, -1
