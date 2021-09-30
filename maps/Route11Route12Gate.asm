	const_def 2 ; object constants

Route11Route12Gate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Route11Ledge
	
.Route11Ledge
	setevent EVENT_ROUTE_11_LEDGE
	return

Route11Route12GateOfficerScript:
	jumptextfaceplayer Route11Route12GateOfficerText
	
Route11GateHikerScript:
	jumptextfaceplayer Route11GateHikerText

Route11GateHikerText:
	text "Huff… Puff…"
	line "I have done it!"
	
	para "I have created a"
	line "path from FAVIA"
	cont "TOWN!"
	
	para "I feel totally"
	line "unstoppable!"
	done
	
Route11Route12GateOfficerText:
	text "I don't see a lot"
	line "of trainers pass"
	cont "through here."
	
	para "I wonder why…"
	done

Route11Route12Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  7, ROUTE_11, 3
	warp_event  5,  7, ROUTE_11, 3
	warp_event  4,  0, ROUTE_12, 4
	warp_event  5,  0, ROUTE_12, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route11Route12GateOfficerScript, -1
	object_event  6,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route11GateHikerScript, -1
