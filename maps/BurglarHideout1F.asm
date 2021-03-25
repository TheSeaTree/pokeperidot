	const_def 2 ; object constants

BurglarHideout1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CardKeyShutterCallback

.CardKeyShutterCallback:
	checkevent EVENT_USED_CARD_KEY_1F
	iftrue .Change
	return

.Change:
	changeblock   4,  0, $09 ; open shutter
	changeblock   4,  2, $51 ; open shutter
	return
	
BurglarHideout1FDoor:
	opentext
	checkevent EVENT_USED_CARD_KEY_1F
	iftrue .used
	farwritetext KeySlotText
	waitbutton
	checkitem CARD_KEY
	iffalse .nope
	farwritetext UsedCardKeyText
	waitbutton
	closetext
	setevent EVENT_USED_CARD_KEY_1F
	changeblock   4,  0, $09 ; open shutter
	changeblock   4,  2, $51 ; open shutter
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

BurglarHideout1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  9, ROUTE_21, 3
	warp_event  5,  9, ROUTE_21, 3
	warp_event  9,  2, BURGLAR_HIDEOUT_B1F, 1
	warp_event  3,  2, BURGLAR_HIDEOUT_B1F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  0, BGEVENT_UP, BurglarHideout1FDoor

	db 0 ; object events
