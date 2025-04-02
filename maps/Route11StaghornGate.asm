	const_def 2 ; object constants

Route11StaghornGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route11StaghornGateOfficerScript:
	opentext
	checkevent EVENT_ECRUTEAK_GYM_ACCESS
	iftrue .After
	writetext Route11StaghornGateOfficerText
	waitbutton
	closetext
	end

.After
	writetext Route11StaghornGateOfficerAfterText
	waitbutton
	closetext
	end
	
Route11StaghornGateYoungsterScript:
	jumptextfaceplayer Route11StaghornGateYoungsterText
	
Route11StaghornGateOfficerText:
	text "You look like a"
	line "trainer."

	para "Were you looking"
	line "for LEADER POSEY?"
	
	para "She passed by here"
	line "not long ago."
	
	para "Likely visiting"
	line "the SHELTER she"
	cont "runs on ROUTE 11."
	
	para "Just keep going in"
	line "this direction,"
	cont "and you'll be"
	cont "there in no time!"
	done
	
Route11StaghornGateOfficerAfterText:
	text "The STAGHORN GYM"
	line "has reopened to"
	cont "challengers!"
	done
	
Route11StaghornGateYoungsterText:
	text "Some day I hope to"
	line "care for #MON"
	cont "just like POSEY!"
	done
	
Route11StaghornGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, STAGHORN_TOWN, 5
	warp_event  0,  5, STAGHORN_TOWN, 6
	warp_event  9,  4, ROUTE_11, 1
	warp_event  9,  5, ROUTE_11, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route11StaghornGateOfficerScript, -1
	object_event  4,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route11StaghornGateYoungsterScript, -1
