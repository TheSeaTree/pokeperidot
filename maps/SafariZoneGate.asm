	const_def 2 ; object constants
	const SAFARI_ZONE_GATE_OFFICER
	const SAFARI_ZONE_GATE_RECEPTIONIST

SafariZoneGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SafariAskEnterLeft:
	turnobject PLAYER, RIGHT
	opentext
	writetext SafariZoneWelcomeText
	waitbutton
	writetext SafariZoneComeHere
	waitbutton
	closetext
	applymovement PLAYER, SafariApproachCounter
	opentext
	jump SafariZoneContinue
	
SafariAskEnterRight:
	turnobject PLAYER, RIGHT
	opentext
	writetext SafariZoneWelcomeText
	waitbutton
	jump SafariZoneContinue

SafariZoneContinue:
	writetext SafariZoneAskText
	yesorno
	iffalse .decline
	writetext SafariZoneYes
	waitbutton
	closetext
	applymovement PLAYER, SafariEnter
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	special GiveParkBalls
	setflag ENGINE_BUG_CONTEST_TIMER
	special HealParty
	warpfacing UP, SAFARI_ZONE_AREA_1, 16, 29
	end

.decline
	writetext SafariZoneNo
	waitbutton
	closetext
	applymovement PLAYER, SafariExit
	end
	
LeaveSafariZone:
	applymovement PLAYER, SafariExit
	turnobject PLAYER, RIGHT
	opentext
	writetext SafariGoodHaulText
	waitbutton
	closetext
	applymovement PLAYER, SafariExit
	clearflag ENGINE_BUG_CONTEST_TIMER
	end
	
SafariApproachCounter:
	step RIGHT
	step_resume
	
SafariEnter:
	step UP
	step UP
	step_resume
	
SafariExit:
	step DOWN
	step_resume
	
SafariZoneWelcomeText:
	text "Welcome to the"
	line "SAFARI ZONE!"
	done
	
SafariZoneComeHere:
	text "Please come up to"
	line "the counter."
	done

SafariZoneAskText:
	text "Would you like to"
	line "participate in our"
	cont "SAFARI game?"
	
	para "You will have 20"
	line "minutes to capture"
	cont "any #MON you"
	cont "like for y500"
	done
	
SafariZoneYes:
	text "Happy hunting,"
	line "trainer!"
	done
	
SafariZoneNo:
	text "I will have to ask"
	line "you to please step"
	cont "away from the"
	cont "counter, then."
	done
	
SafariGoodHaulText:
	text "I hope you had"
	line "good luck on your"
	cont "SAFARI game."
	
	para "Try again any time"
	line "you like."
	done

SafariZoneGate_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, ROUTE_18, 3
	warp_event  3,  7, ROUTE_18, 3
	warp_event  5,  0, SAFARI_ZONE_GATE, 3

	db 3 ; coord events
	coord_event  4,  2, -1, SafariAskEnterLeft
	coord_event  5,  2, -1, SafariAskEnterRight
	coord_event  5,  1, -1, LeaveSafariZone

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
