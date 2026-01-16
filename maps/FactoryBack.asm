	const_def 2 ; object constants

FactoryBack_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall

.SmashWall:
	checkevent EVENT_FACTORY_BACK_ROOM_SMASH_WALL
	iffalse .skip
	changeblock  6, 0, $62
.skip
	return

FactoryBackVendingMachine:
	opentext
	checkevent EVENT_FACTORY_BACK_ULTRA_BALL
	iftrue .NothingThere
	writetext FactoryVendingMachineText
	yesorno
	iffalse .Decline
	itemtotext ULTRA_BALL, MEM_BUFFER_0
	writebyte 10
	writetext FactoryVendingMachineFoundMultipleItemText
	waitbutton
	giveitem ULTRA_BALL, 10
	iffalse .NoRoom
	writetext FactoryVendingMachineTakeMultipleItemText
	specialsound
	waitbutton
	setevent EVENT_FACTORY_BACK_ULTRA_BALL
.Decline
	closetext
	end

.NoRoom
	writetext FactoryVendingMachineNoRoomMultipleText
	waitbutton
	closetext
	end

.NothingThere
	writetext FactoryVendingMachineEmptyText
	waitbutton
	closetext
	end

FactoryBackHiddenLureBall:
	hiddenitem LURE_BALL, EVENT_FACTORY_HIDDEN_LURE_BALL

FactoryBack_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 15, FACTORY_1F, 8
	warp_event  4, 15, FACTORY_1F, 9
	warp_event  7,  0, ORIENTEM_FOREST, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  1, BGEVENT_UP, FactoryBackVendingMachine
	bg_event  8, 14, BGEVENT_ITEM, FactoryBackHiddenLureBall

	db 0 ; object events
	