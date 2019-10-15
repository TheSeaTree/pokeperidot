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
	
GiveCardKey:
	itemball CARD_KEY
	
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

BurglarHideoutB2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 23, 20, BURGLAR_HIDEOUT_B1F, 3
	warp_event 15, 16, BURGLAR_HIDEOUT_B1F, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 26, 14, BGEVENT_UP, BurglarHideoutB2FDoor

	db 2 ; object events
	object_event 28, 24, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerBurglarDuke2, -1
	object_event  9, 20, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 30, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, GiveCardKey, -1
