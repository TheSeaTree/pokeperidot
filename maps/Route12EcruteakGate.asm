	const_def 2 ; object constants

Route12EcruteakGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route12EcruteakGateOfficerScript:
	opentext
	checkevent EVENT_ECRUTEAK_GYM_ACCESS
	iftrue .After
	writetext Route12EcruteakGateOfficerText
	waitbutton
	closetext
	end

.After
	writetext Route12EcruteakGateOfficerAfterText
	waitbutton
	closetext
	end
	
Route12EcruteakGateYoungsterScript:
	jumptextfaceplayer Route12EcruteakGateYoungsterText
	
Route12EcruteakGateOfficerText:
	text "You look like a"
	line "trainer. Were you"
	cont "looking for LEADER"
	cont "POSEY?"
	
	para "She passed by here"
	line "not long ago."
	
	para "Likely visiting"
	line "the SHELTER she"
	cont "runs on ROUTE 12."
	
	para "Just keep going in"
	line "this direction,"
	cont "and you'll be"
	cont "there in no time!"
	done
	
Route12EcruteakGateOfficerAfterText:
	text "The STAGHORN GYM"
	line "has reopened to"
	cont "challengers!"
	done
	
Route12EcruteakGateYoungsterText:
	text "Some day I hope to"
	line "care for #MON"
	cont "just like POSEY!"
	done
	
Route12EcruteakGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ECRUTEAK_CITY, 5
	warp_event  0,  5, ECRUTEAK_CITY, 6
	warp_event  9,  4, ROUTE_12, 1
	warp_event  9,  5, ROUTE_12, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route12EcruteakGateOfficerScript, -1
	object_event  4,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route12EcruteakGateYoungsterScript, -1
