	const_def 2 ; object constants
	const SAFARI_ZONE_GATE_OFFICER
	const SAFARI_ZONE_GATE_RECEPTIONIST

SafariZoneGate1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
	
SafariReceptionistScript:
	opentext
	writetext SafariZoneReceptionistText
.ReceptionistMenu
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .ExplainBalls
	ifequal 2, .ExplainRocks
	ifequal 3, .ExplainBait
	writetext SafariZoneReceptionistCancel
	waitbutton
	closetext
	end
	
.ExplainBalls:
	writetext SafariZoneBallText
	waitbutton
	jump .AnythingElse

.ExplainBait:
	writetext SafariZoneBaitRockText
	waitbutton
	jump .AnythingElse
	
.ExplainRocks:
	writetext SafariZoneBaitRockText
	waitbutton
	
.AnythingElse
	writetext SafariZoneAnythingElseText
	jump .ReceptionistMenu
	
.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 11, 0, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "BALLS@"
	db "ROCKS@"
	db "BAIT@"
	db "CANCEL@"

SafariGuardScript:
	opentext
	writetext SafariZoneWelcomeText
	special PlaceMoneyTopRight
	yesorno
	iffalse .decline
	checkmoney YOUR_MONEY, 1000
	ifequal HAVE_LESS, .NotEnoughMoney
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 1000
	waitsfx
	special PlaceMoneyTopRight
	writetext ExplainSafariBalls
	waitbutton
	playsound SFX_GOT_SAFARI_BALLS
	writetext PlayerReceivedSafariBalls
	wait 8
	writetext SafariZoneYes
	waitbutton
	closetext
	applymovement SAFARI_ZONE_GATE_OFFICER, SafariGuardEnter
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
	jump .StepAway
	
.NotEnoughMoney:
	writetext SafariZoneNoMoneyText

.StepAway	
	waitbutton
	closetext
	end

LeaveSafariZone:
	applymovement SAFARI_ZONE_GATE_OFFICER, SafariGuardEnter
	applymovement PLAYER, SafariExit
	applymovement SAFARI_ZONE_GATE_OFFICER, SafariGuardExit
	opentext
	writetext SafariGoodHaulText
	waitbutton
	closetext
	clearflag ENGINE_BUG_CONTEST_TIMER
	end
	
SafariEnter:
	step UP
	step UP
	step UP
	step UP
	step_resume
	
SafariGuardEnter:
	step UP
	step RIGHT
	turn_head LEFT
	step_resume
	
SafariGuardExit:
	step LEFT
	step DOWN
	step_resume
	
SafariExit:
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
	step_resume
	
SafariZoneReceptionistText:
	text "Welcome to the"
	line "SAFARI ZONE!"
	
	para "How may I help"
	line "you?"
	done
	
SafariZoneBallText:
	text "Safari Ball text."
	done
	
SafariZoneBaitRockText:
	text "Rocks make guys"
	line "easier to catch."
	
	para "Bait makes them"
	line "harder."
	done
	
SafariZoneAnythingElseText:
	text "Is there anything"
	line "else you want to"
	cont "know?"
	done
	
SafariZoneReceptionistCancel:
	text "I'm happy to help"
	line "with any questions"
	cont "you may have."
	done
	
SafariZoneWelcomeText:
	text "Welcome to the"
	line "SAFARI ZONE!"

	para "Would you like to"
	line "participate in our"
	cont "SAFARI game?"
	
	para "You will have 20"
	line "minutes to capture"
	cont "any #MON in the"
	cont "park for ¥1000"
	done

ExplainSafariBalls:
	text "Thank you!"
	
	para "You may not battle"
	line "any #MON during"
	cont "your SAFARI game,"
	cont "and you must use"
	cont "our special SAFARI"
	cont "BALLs."
	
	para "If you run out of"
	line "time or SAFARI"
	cont "BALLs, I will call"
	cont "you back on the PA"
	cont "system."
	
	para "Here are your"
	line "SAFARI BALLs."
	done
	
PlayerReceivedSafariBalls:
	text "<PLAYER> received"
	line "30 SAFARI BALLs."
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
	
SafariZoneNoMoneyText:
	text "I'm sorry, but the"
	line "SAFARI ZONE relies"
	cont "on an entry fee to"
	cont "stay open to the"
	cont "public."
	
	para "We can't let you"
	line "in for free."
	done
	
SafariGoodHaulText:
	text "I hope you had"
	line "good luck on your"
	cont "SAFARI game."
	
	para "We appreciate your"
	line "patronage."
	done

SafariZoneGate1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  7, ROUTE_18, 3
	warp_event  5,  7, ROUTE_18, 3
	warp_event  8,  0, SAFARI_ZONE_GATE_1F, 3
	warp_event  0,  7, SAFARI_ZONE_GATE_2F, 1

	db 1 ; coord events
	coord_event  8,  1, -1, LeaveSafariZone

	db 0 ; bg events

	db 2 ; object events
	object_event  8,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariGuardScript, -1
	object_event  4,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariReceptionistScript, -1
