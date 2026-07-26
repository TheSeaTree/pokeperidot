	const_def 2 ; object constants

AbandonedFactoryBack_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall

.SmashWall:
	checkevent EVENT_ABANDONED_FACTORY_BACK_ROOM_SMASH_WALL
	iffalse .skip
	changeblock  6, 0, $62
.skip
	return

AbandonedFactoryBackVendingMachine:
	opentext
	checkevent EVENT_ABANDONED_FACTORY_BACK_ULTRA_BALL
	iftrue .NothingThere
	writetext AbandonedFactoryVendingMachineText
	yesorno
	iffalse .Decline
	itemtotext ULTRA_BALL, MEM_BUFFER_0
	writebyte 10
	writetext AbandonedFactoryVendingMachineFoundMultipleItemText
	waitbutton
	giveitem ULTRA_BALL, 10
	iffalse .NoRoom
	writetext AbandonedFactoryVendingMachineTakeMultipleItemText
	specialsound
	waitbutton
	setevent EVENT_ABANDONED_FACTORY_BACK_ULTRA_BALL
.Decline
	closetext
	end

.NoRoom
	writetext AbandonedFactoryVendingMachineNoRoomMultipleText
	waitbutton
	closetext
	end

.NothingThere
	writetext AbandonedFactoryVendingMachineEmptyText
	waitbutton
	closetext
	end

AbandonedFactoryBackHiddenLureBall:
	hiddenitem LURE_BALL, EVENT_ABANDONED_FACTORY_HIDDEN_LURE_BALL

AbandonedFactoryBack_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 15, ABANDONED_FACTORY_1F, 8
	warp_event  4, 15, ABANDONED_FACTORY_1F, 9
	warp_event  7,  0, ORIENTEM_FOREST, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  1, BGEVENT_UP, AbandonedFactoryBackVendingMachine
	bg_event  8, 14, BGEVENT_ITEM, AbandonedFactoryBackHiddenLureBall

	db 0 ; object events
	