	const_def 2 ; object constants

Route21StaghornGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route21StaghornGateOfficerScript:
	opentext
	checkevent EVENT_FLUTE_HIDEOUT_OPEN
	iftrue .After
	writetext Route21StaghornGateOfficerText
	waitbutton
	closetext
	end
.After
	writetext Route21StaghornGateOfficerAfterText
	waitbutton
	closetext
	end
	
Route21StaghornGateOfficerText:
	text "A girl came in"
	line "earlier telling me"
	cont "about some hoolig-"
	cont "ans blocking the"
	cont "road up ahead."
	
	para "There's nothing I"
	line "can do. ROUTE 18"
	cont "is not in my" 
	cont "jurisdiction."
	done
	
Route21StaghornGateOfficerAfterText:
	text "Did you clear out"
	line "the punks blocking"
	cont "ROUTE 18?"
	
	para "Wow kid, you're"
	line "good!"
	
	para "When I tried to"
	line "battle them, my"
	cont "#MON got"	
	cont "creamed!"
	done


Route21StaghornGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_21, 1
	warp_event  0,  5, ROUTE_21, 2
	warp_event  9,  4, STAGHORN_TOWN, 10
	warp_event  9,  5, STAGHORN_TOWN, 11

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route21StaghornGateOfficerScript, -1
