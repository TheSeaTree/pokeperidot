	const_def 2 ; object constants

CarnationZooGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CarnationZooGateOfficerScript:
	jumptextfaceplayer CarnationZooGateOfficerText
	
CarnationZooGateOfficerText:
	text "You're a trainer,"
	line "right?"
	
	para "I recommend you go"
	line "check out the"
	cont "SAFARI ZONE."
	
	para "You can catch rare"
	line "#MON that can't"
	cont "be found anywhere"
	cont "else."
	done

CarnationZooGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, CARNATION_ZOO, 1
	warp_event  0,  5, CARNATION_ZOO, 2
	warp_event  9,  4, CARNATION_TOWN, 3
	warp_event  9,  5, CARNATION_TOWN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CarnationZooGateOfficerScript, -1
