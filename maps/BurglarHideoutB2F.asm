	const_def 2 ; object constants

BurglarHideoutB2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CardKeyShutterCallback

.CardKeyShutterCallback:
	checkevent EVENT_HIDEOUT_SWITCH_5
	iftrue .Open5
	checkevent EVENT_HIDEOUT_SWITCH_4
	iftrue .Open4
	checkevent EVENT_HIDEOUT_SWITCH_3
	iftrue .Open3
	checkevent EVENT_HIDEOUT_SWITCH_2
	iftrue .Open2
	checkevent EVENT_HIDEOUT_SWITCH_1
	iftrue .Open1
	checkevent EVENT_USED_CARD_KEY_B2F
	iftrue .Change
	return

.Change:
	changeblock  24, 12, $09 ; open shutter
	changeblock  24, 14, $51 ; open shutter
	return

.Open5:
	changeblock  14, 12, $0d ; open shutter
	changeblock  30, 14, $1e ; open shutter
	changeblock  32, 14, $1c ; open shutter
	changeblock  22,  8, $0d ; open shutter
	changeblock   2,  6, $1e ; open shutter
	changeblock   4,  6, $1c ; open shutter
.Open4:
	changeblock  14, 12, $0d ; open shutter
.Open3:
	changeblock  30, 14, $1e ; open shutter
	changeblock  32, 14, $1c ; open shutter
.Open2:
	changeblock  22,  8, $0d ; open shutter
.Open1:
	changeblock   2,  6, $1e ; open shutter
	changeblock   4,  6, $1c ; open shutter
	return
	
BurglarHideoutB2FKeyDoor:
	opentext
	checkevent EVENT_USED_CARD_KEY_B2F
	iftrue .used
	farwritetext KeySlotText
	waitbutton
	checkitem CARD_KEY
	iffalse .nope
	farwritetext OpenDoorText
	waitbutton
	closetext
	setevent EVENT_USED_CARD_KEY_B2F
	changeblock  24, 12, $09 ; open shutter
	changeblock  24, 14, $51 ; open shutter
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	end

.used
	farwritetext UsedTheKeyText
	waitbutton
.nope
	closetext
	end

BurglarHideoutB2FDoor1:
	opentext
	changeblock  2, 6, $1e ; open shutter
	changeblock  4, 6, $1c ; open shutter
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	closetext
	setevent EVENT_HIDEOUT_SWITCH_1
	end

BurglarHideoutB2FDoor2:
	opentext
	changeblock  12, 6, $0d ; open shutter
	changeblock  22, 8, $0d ; open shutter
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	closetext
	setevent EVENT_HIDEOUT_SWITCH_2
	end

BurglarHideoutB2FDoor3:
	opentext
	changeblock  12,  6, $47 ; open shutter
	changeblock  30, 14, $1e ; open shutter
	changeblock  32, 14, $1c ; open shutter
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	closetext
	setevent EVENT_HIDEOUT_SWITCH_3
	end

BurglarHideoutB2FDoor4:
	opentext
	changeblock  14, 12, $0d ; open shutter
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	closetext
	setevent EVENT_HIDEOUT_SWITCH_4
	end

BurglarHideoutB2FDoor5:
	opentext
	changeblock  14, 12, $0d ; open shutter
	changeblock  30, 14, $1e ; open shutter
	changeblock  32, 14, $1c ; open shutter
	changeblock  22,  8, $0d ; open shutter
	changeblock  2, 6, $1e ; open shutter
	changeblock  4, 6, $1c ; open shutter
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	closetext
	setevent EVENT_HIDEOUT_SWITCH_5
	end
	
TrainerBurglarDuke2:
	trainer SCHOOLBOY, TIMMY, EVENT_BEAT_BURGLAR_DUKE2, BurglarDuke2Text, BurglarDuke2WinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarDuke2AfterText
	waitbutton
	closetext
	end
	
TrainerSageCaleb2:
	trainer SCHOOLBOY, TIMMY, EVENT_BEAT_SAGE_CALEB2, SageCaleb2Text, SageCaleb2WinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageCaleb2AfterText
	waitbutton
	closetext
	end
	
BurglarHideoutB2FScientist:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_BURGLAR_HIDEOUT
	iftrue .HideoutOccupied
	checkevent EVENT_GOT_MASTER_BALL
	iftrue .GotMasterBall
	writetext BurglarHideoutB2FScientistText
	waitbutton
	closetext
	end
	
.HideoutOccupied
	writetext BurglarHideoutB2FScientistRewardText
	waitbutton
	verbosegiveitem MASTER_BALL
	waitbutton
	setevent EVENT_GOT_MASTER_BALL
.GotMasterBall
	writetext BurglarHideoutB2FScientistAfterText
	waitbutton
	closetext
	end
	
HideoutCardKey:
	itemball CARD_KEY
	
BurglarHideoutB2FNugget:
	itemball NUGGET

BurglarHideoutTMNastyPlot:
	itemball TM_NASTY_PLOT
	
BurglarHideoutB2FHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_HIDEOUT_HIDDEN_FULL_RESTORE

BurglarDuke2Text:
	text "You again?"

	para "Hehe!"
	line "Piece of cake!"
	done

BurglarDuke2WinText:
	text "The boss wanted me"
	line "prepared for a"
	cont "threat like you!"
	done
	
BurglarDuke2AfterText:
	text "My only duty was"
	line "to guard the CARD"
	cont "KEY."
	
	para "I have failed"
	done
	
SageCaleb2Text:
	text "You just can't"
	line "mind your own"
	cont "business, can you?"
	
	para "Get out of here,"
	line "child!"
	done
	
SageCaleb2WinText:
	text "You have no idea"
	line "what you are"
	cont "getting yourself"
	cont "into."
	done
	
SageCaleb2AfterText:
	text "Does this place"
	line "confuse you?"
	
	para "Good!"
	done
	
BurglarHideoutB2FScientistText:
	text "You're not one of"
	line "them, are you?"
	
	para "I'm being held"
	line "here against my"
	cont "will, but managed"
	cont "to sneak away and"
	cont "hide here."
	
	para "I managed to swipe"
	line "a valuable item"
	cont "from the BURGLARs."
	
	para "If you can take"
	line "care of them, it's"
	cont "yours."
	done

BurglarHideoutB2FScientistRewardText:
	text "Is everyone gone?"
	
	para "Phew!"
	line "What a relief!"
	
	para "As promised, here"
	line "is the item I"
	cont "promised you."
	done

BurglarHideoutB2FScientistAfterText:
	text "The MASTER BALL"
	line "can capture any"
	cont "#MON instantly!"
	
	para "Those crooks"
	line "probably wanted to"
	cont "use it on SNORLAX."
	done

BurglarHideoutB2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 23, 18, BURGLAR_HIDEOUT_B1F, 3
	warp_event 15, 14, BURGLAR_HIDEOUT_B1F, 4

	db 0 ; coord events

	db 7 ; bg events
	bg_event 26, 12, BGEVENT_UP, BurglarHideoutB2FKeyDoor
	bg_event  2,  9, BGEVENT_UP, BurglarHideoutB2FDoor1
	bg_event 28,  3, BGEVENT_UP, BurglarHideoutB2FDoor2
	bg_event 19,  9, BGEVENT_UP, BurglarHideoutB2FDoor3
	bg_event 11,  9, BGEVENT_UP, BurglarHideoutB2FDoor4
	bg_event 18, 15, BGEVENT_UP, BurglarHideoutB2FDoor5
	bg_event 34,  7, BGEVENT_ITEM, BurglarHideoutB2FHiddenFullRestore

	db 6 ; object events
	object_event 30, 15, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerBurglarDuke2, EVENT_CLEARED_BURGLAR_HIDEOUT
	object_event 21, 18, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerSageCaleb2, EVENT_CLEARED_BURGLAR_HIDEOUT
	object_event  9, 18, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BurglarHideoutB2FScientist, -1
	object_event 32, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, HideoutCardKey, EVENT_GOT_CARD_KEY
	object_event 33, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BurglarHideoutB2FNugget, EVENT_HIDEOUT_NUGGET
	object_event 15,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_ITEMBALL, 0, BurglarHideoutTMNastyPlot, EVENT_GOT_TM_NASTY_PLOT
