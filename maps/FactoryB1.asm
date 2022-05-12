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
	changeblock  6, 12, $07 ; open shutter
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
	changeblock  6, 12, $07 ; open shutter
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

FactoryB1Lemonade:
	itemball LEMONADE

FactoryBasementHiddenFastBall:
	hiddenitem FAST_BALL, EVENT_FACTORY_HIDDEN_FAST_BALL

FactoryBasementHiddenHPUp:
	hiddenitem HP_UP, EVENT_FACTORY_HIDDEN_HP_UP

FactoryBasementHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_FACTORY_HIDDEN_RARE_CANDY

FactoryBasementHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_FACTORY_HIDDEN_FULL_RESTORE

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
	warp_event 12, 10, FACTORY_1F, 3
	warp_event  7,  0, FACTORY_1F, 4

	db 0 ; coord events
	
	db 7 ; bg events
	bg_event  8, 11, BGEVENT_UP, FactoryBasementDoor
	bg_event  7, 12, BGEVENT_IFNOTSET, FactoryBasementLockedDoor
	bg_event  7, 13, BGEVENT_IFNOTSET, FactoryBasementLockedDoor
	bg_event 10,  1, BGEVENT_ITEM, FactoryBasementHiddenFastBall
	bg_event  3,  5, BGEVENT_ITEM, FactoryBasementHiddenHPUp
	bg_event 12, 15, BGEVENT_ITEM, FactoryBasementHiddenRareCandy
	bg_event 13,  8, BGEVENT_ITEM, FactoryBasementHiddenFullRestore

	db 1 ; object events
	object_event  9,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FactoryB1Lemonade, EVENT_FACTORY_B1_LEMONADE
	