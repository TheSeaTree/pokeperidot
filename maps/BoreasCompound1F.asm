	const_def 2 ; object constants
	const BOREASCOMPOUND_MEWTWO

BoreasCompound1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Doors

.Doors:
	checkevent EVENT_BOREAS_COMPOUND_1F_DOOR_OPENED
	iffalse .CheckMewtwoDoor
	changeblock 30, 14, $07
.CheckMewtwoDoor:
	checkevent EVENT_USED_LAB_KEY
	iffalse .CheckExitDoor
	changeblock 16, 8, $67 ; open shutter
	changeblock 18, 8, $B9 ; open shutter
.CheckExitDoor:
	checkevent EVENT_BOREAS_COMPOUND_EXIT_DOOR_OPENED
	iffalse .NoChange
	changeblock  2, 14, $36
	changeblock  2, 16, $24
.NoChange:
	return

Mewtwo:
	opentext
	writetext MewtwoText
	cry MEWTWO
	waitsfx
	closetext
	special LegendaryEvent_SetBattleType
	loadwildmon MEWTWO, 70
	startbattle
	reloadmapafterbattle
	disappear BOREASCOMPOUND_MEWTWO
	setevent EVENT_FOUGHT_MEWTWO
	special CheckCaughtCelebi
	iffalse .FailedCapture
	setevent EVENT_CAUGHT_MEWTWO
.FailedCapture
	end

BoreasCompound1FShutterButton:
	opentext
	checkflag ENGINE_FLASH
	iffalse .NoPower
	writetext BoreasCompoundShutterButtonAskText
	yesorno
	iffalse .Decline
	writetext BoreasCompoundShutterActivateButtonText
	waitbutton
	checkevent EVENT_BOREAS_COMPOUND_1F_DOOR_OPENED
	iftrue .AlreadyOpened
	closetext
	changeblock 30, 14, $07
	playsound SFX_ENTER_DOOR
	reloadmappart
	opentext
	writetext BoreasCompoundShutterOpenedText
	waitbutton
	setevent EVENT_BOREAS_COMPOUND_1F_DOOR_OPENED
.Decline
	closetext
	end

.NoPower
	writetext BoreasCompoundUnresponsiveButtonsText
	waitbutton
	closetext
	end

.AlreadyOpened:
	writetext BoreasCompoundShutterDoorAlreadyOpenedText
	waitbutton
	closetext
	end

BoreasCompoundExitShutter:
	opentext
	checkflag ENGINE_FLASH
	iffalse .NoPower
	writetext BoreasCompoundShutterButtonAskText
	yesorno
	iffalse .Decline
	writetext BoreasCompoundShutterActivateButtonText
	waitbutton
	checkevent EVENT_BOREAS_COMPOUND_EXIT_DOOR_OPENED
	iftrue .AlreadyOpened
	closetext
	changeblock  2, 14, $36
	changeblock  2, 16, $24
	playsound SFX_ENTER_DOOR
	reloadmappart
	opentext
	writetext BoreasCompoundShutterOpenedText
	waitbutton
	setevent EVENT_BOREAS_COMPOUND_EXIT_DOOR_OPENED
.Decline
	closetext
	end

.NoPower
	writetext BoreasCompoundUnresponsiveButtonsText
	waitbutton
	closetext
	end

.AlreadyOpened:
	writetext BoreasCompoundShutterDoorAlreadyOpenedText
	waitbutton
	closetext
	end

BoreasCompoundDoor:
	opentext
	checkevent EVENT_USED_LAB_KEY
	iftrue .used
	writetext LabKeySlotText
	waitbutton
	checkitem LAB_KEY
	iffalse .nope
	writetext OpenLabDoorText
	waitbutton
	checkflag ENGINE_FLASH
	iffalse .nopower
	closetext
	setevent EVENT_USED_LAB_KEY
	changeblock  16, 8, $67 ; open shutter
	changeblock  18, 8, $B9 ; open shutter
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	opentext
	writetext LabDoorOpenedText
	waitbutton
	closetext
	end

.used
	writetext UsedTheLabKeyText
	waitbutton
.nope
	closetext
	end

.nopower
	writetext LabKeyNoPowerText
	waitbutton
	closetext
	end

BoreasCompound1FLabKey:
	itemball LAB_KEY

BoreasCompound1FCarbos:
	itemball CARBOS

BoreasCompound1FTwistedSpoon:
	itemball TWISTEDSPOON

BoreasCompoundHiddenBerserkGene:
	hiddenitem BERSERK_GENE, EVENT_BOREAS_COMPOUND_HIDDEN_BERSERK_GENE

BoreasCompound1FHiddenXSpeed:
	hiddenitem X_SPEED, EVENT_BOREAS_COMPOUND_HIDDEN_X_SPEED

BoreasCompound1FHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_BOREAS_COMPOUND_HIDDEN_FULL_RESTORE

MewtwoText:
	text "Mew!"
	done

LabKeySlotText:
	text "It looks like a"
	line "slot for a KEY."
	done

OpenLabDoorText:
	text "<PLAYER> swiped"
	line "the LAB KEY!"
	done

LabDoorOpenedText:
	text "The door opened."
	done

UsedTheLabKeyText:
	text "This door is"
	line "already open."
	done

LabKeyNoPowerText:
	text "…But nothing"
	line "happened."

	para "It must need power"
	line "to activate."
	done

BoreasCompound1F_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event 16, 25, BOREAS_FOREST, 3
	warp_event 17, 25, BOREAS_FOREST, 4
	warp_event 35, 25, BOREAS_COMPOUND_B1F, 1
	warp_event 22, 18, BOREAS_COMPOUND_B1F, 2
	warp_event 14, 14, BOREAS_COMPOUND_B1F, 3
	warp_event  3, 10, BOREAS_COMPOUND_B1F, 4
	warp_event  0, 18, BOREAS_COMPOUND_2F, 1
	warp_event 14, 16, BOREAS_COMPOUND_2F, 2
	warp_event 16, 23, BOREAS_COMPOUND_2F, 3
	warp_event 29, 16, BOREAS_COMPOUND_2F, 4
	warp_event 27, 16, BOREAS_COMPOUND_B1F, 5
	warp_event 30, 17, BOREAS_COMPOUND_B1F, 6
	warp_event 28, 20, BOREAS_COMPOUND_B1F, 7
	
	db 0 ; coord events

	db 6 ; bg events
	bg_event 18,  4, BGEVENT_ITEM, BoreasCompoundHiddenBerserkGene
	bg_event 32, 14, BGEVENT_READ, BoreasCompound1FShutterButton
	bg_event 19,  8, BGEVENT_UP, BoreasCompoundDoor
	bg_event  4, 14, BGEVENT_UP, BoreasCompoundExitShutter
	bg_event 26, 12, BGEVENT_ITEM, BoreasCompound1FHiddenXSpeed
	bg_event 24, 23, BGEVENT_ITEM, BoreasCompound1FHiddenFullRestore

	db 4 ; object events
	object_event 18,  4, SPRITE_MEWTWO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Mewtwo, EVENT_FOUGHT_MEWTWO
	object_event 31,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoreasCompound1FLabKey, EVENT_BOREAS_COMPOUND_LAB_KEY
	object_event  0, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoreasCompound1FCarbos, EVENT_BOREAS_COMPOUND_CARBOS
	object_event  8,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoreasCompound1FTwistedSpoon, EVENT_BOREAS_COMPOUND_TWISTEDSPOON
