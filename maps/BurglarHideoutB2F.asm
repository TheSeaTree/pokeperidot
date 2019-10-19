	const_def 2 ; object constants

BurglarHideoutB2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CardKeyShutterCallback

.CardKeyShutterCallback:
	checkevent EVENT_USED_CARD_KEY_B2F
	iftrue .Change
	return

.Change:
	changeblock  24, 14, $09 ; open shutter
	changeblock  24, 16, $51 ; open shutter
	return
	
BurglarHideoutB2FDoor:
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
	changeblock  24, 14, $09 ; open shutter
	changeblock  24, 16, $51 ; open shutter
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
	
TrainerBurglarDuke2:
	trainer BURGLAR, DUKE2, EVENT_BEAT_BURGLAR_DUKE2, BurglarDuke2Text, BurglarDuke2WinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarDuke2AfterText
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
	
BurglarDuke2Text:
	text "You again?"

	para "Hehe!"
	line "Piece of cake!"
	done

BurglarDuke2WinText:
	text "The boss wanted me"
	line "prepared for a"
	cont "threat like you!"
	
BurglarDuke2AfterText:
	text "My only duty was"
	line "to guard the CARD"
	cont "KEY."
	
	para "I have failed"
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
	warp_event 23, 20, BURGLAR_HIDEOUT_B1F, 3
	warp_event 15, 16, BURGLAR_HIDEOUT_B1F, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 26, 14, BGEVENT_UP, BurglarHideoutB2FDoor

	db 4 ; object events
	object_event 28, 24, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerBurglarDuke2, EVENT_CLEARED_BURGLAR_HIDEOUT
	object_event  9, 20, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BurglarHideoutB2FScientist, -1
	object_event 30, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, HideoutCardKey, EVENT_GOT_CARD_KEY
	object_event 17, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BurglarHideoutB2FNugget, EVENT_HIDEOUT_NUGGET
