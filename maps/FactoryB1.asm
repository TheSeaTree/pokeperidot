	const_def 2 ; object constants

FactoryB1_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CardKeyShutterCallback

.CardKeyShutterCallback:
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .Change
	return

.Change:
	changeblock  4,12, $07 ; open shutter
	return

FactoryBasementDoor:
	opentext
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .used
	writetext KeySlotText
	waitbutton
	checkitem BASEMENT_KEY
	iffalse .nope
	writetext OpenDoorText
	waitbutton
	closetext
	setevent EVENT_USED_BASEMENT_KEY
	changeblock  4,12, $07 ; open shutter
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	takeitem BASEMENT_KEY
	end

.used
	writetext UsedTheKeyText
	waitbutton
.nope
	closetext
	end
	
FactoryBasementLockedDoor:
	conditional_event EVENT_USED_BASEMENT_KEY, .Script

.Script:
	opentext
	writetext NeedsAKeyText
	waitbutton
	closetext
	end
	
KeySlotText:
	text "It looks like a"
	line "KEY would go here."
	done
	
NeedsAKeyText:
	text "This door needs a"
	line "KEY to open."
	done
	
OpenDoorText:
	text "<PLAYER> used"
	line "the BASEMENT KEY!"
	done
	
UsedTheKeyText:
	text "The door is"
	line "already open."
	done
	
FactoryB1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7, 14, FACTORY_1F, 3
	warp_event  5,  2, FACTORY_1F, 4

	db 0 ; coord events
	
	db 3 ; bg events
	bg_event  6, 11, BGEVENT_UP, FactoryBasementDoor
	bg_event  5, 12, BGEVENT_IFNOTSET, FactoryBasementLockedDoor
	bg_event  5, 13, BGEVENT_IFNOTSET, FactoryBasementLockedDoor

	db 0 ; object events
	