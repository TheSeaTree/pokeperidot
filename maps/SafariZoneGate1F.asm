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
	ifequal 1, .ExplainZone
	ifequal 2, .ExplainBalls
	ifequal 3, .ExplainRocks
	ifequal 4, .ExplainBait
	writetext SafariZoneReceptionistCancel
	waitbutton
	closetext
	end
	
.ExplainZone:
	writetext ExplainSafariZoneText
	waitbutton
	jump .AnythingElse
	
.ExplainBalls:
	writetext SafariZoneBallText
	waitbutton
	jump .AnythingElse

.ExplainBait:
	writetext SafariZoneBaitText
	waitbutton
	jump .AnythingElse
	
.ExplainRocks:
	writetext SafariZoneRockText
	waitbutton
	
.AnythingElse
	writetext SafariZoneAnythingElseText
	jump .ReceptionistMenu
	
.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 11, 0, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 7
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 5 ; items
	db "SAFARI@"
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
	checkmoney YOUR_MONEY, 2000
	ifequal HAVE_LESS, .NotEnoughMoney
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 2000
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

.StepAway:
	waitbutton
	closetext
	end

LeaveSafariZone:
	clearflag ENGINE_BUG_CONTEST_TIMER
	applymovement SAFARI_ZONE_GATE_OFFICER, SafariGuardEnter
	applymovement PLAYER, SafariExit
	applymovement SAFARI_ZONE_GATE_OFFICER, SafariGuardExit
	opentext
	writetext SafariGoodHaulText
	waitbutton
	closetext
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
	
ExplainSafariZoneText:
	text "This is the SAFARI"
	line "ZONE, a sort of"
	cont "wildlife sanctuary"
	cont "for #MON."
	
	para "Trainers are not"
	line "permitted to"
	cont "battle any wild"
	cont "#MON inhabiting"
	cont "the park, and must"
	cont "use our special"
	cont "#BALLs to"
	cont "capture them."
	
	para "Sometimes you may"
	line "find a rare"
	cont "#MON that can't"
	cont "be found anywhere"
	cont "else in this"
	cont "region!"
	done
	
SafariZoneBallText:
	text "Here in the SAFARI"
	line "ZONE, participants"
	cont "are only allowed"
	cont "to use SAFARI"
	cont "BALLs that we"
	cont "provide."
	
	para "These function"
	line "slightly better"
	cont "than normal"
	cont "#BALLs."
	
	para "All participants"
	line "must return any"
	cont "unused SAFARI"
	cont "BALLs when"
	cont "returning to the"
	cont "gate."
	done
	
SafariZoneRockText:
	text "Throwing a ROCK at"
	line "a #MON won't"
	cont "hurt it, but will"
	cont "make the #MON"
	cont "angry."
	
	para "An angered #MON"
	line "will be easier to"
	cont "catch, but much"
	cont "more likely to"
	cont "flee."
	done

SafariZoneBaitText:
	text "Included with your"
	line "SAFARI BALLs is a"
	cont "special BAIT for"
	cont "keeping #MON"
	cont "from running."
	
	para "They will be less"
	line "likely to flee"
	cont "while they are"
	cont "eating, but won't"
	cont "be as easy to"
	cont "capture."
	done
	
SafariZoneAnythingElseText:
	text "Would you like to"
	line "know more?"
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
	
	para "You will have 10"
	line "minutes to capture"
	cont "any #MON in the"
	cont "park for ¥2000"
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
	line "20 SAFARI BALLs."
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
	warp_event  4,  7, CARNATION_ZOO, 3
	warp_event  5,  7, CARNATION_ZOO, 3
	warp_event  8,  0, SAFARI_ZONE_GATE_1F, 3
	warp_event  0,  7, SAFARI_ZONE_GATE_2F, 1

	db 1 ; coord events
	coord_event  8,  1, -1, LeaveSafariZone

	db 0 ; bg events

	db 2 ; object events
	object_event  8,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariGuardScript, -1
	object_event  4,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariReceptionistScript, -1
