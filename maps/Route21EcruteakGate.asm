	const_def 2 ; object constants

Route21EcruteakGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route21EcruteakGateOfficerScript:
	opentext
	checkevent EVENT_FLUTE_HIDEOUT_OPEN
	iftrue .After
	writetext Route21EcruteakGateOfficerText
	waitbutton
	end
.After
	writetext Route21EcruteakGateOfficerAfterText
	waitbutton
	end
	
Route21EcruteakGateOfficerText:
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
	
Route21EcruteakGateOfficerAfterText:
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


Route21EcruteakGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_21, 1
	warp_event  0,  5, ROUTE_21, 2
	warp_event  9,  4, ECRUTEAK_CITY, 10
	warp_event  9,  5, ECRUTEAK_CITY, 11

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route21EcruteakGateOfficerScript, -1
