	const_def 2 ; object constants

BoreasCompound2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Doors

.Doors
	checkevent EVENT_BOREAS_COMPOUND_2F_DOOR_OPENED
	iffalse .NoChange
	changeblock 6, 10, $07
.NoChange
	return

BoreasCompound2FShutterButton:
	opentext
	checkflag ENGINE_FLASH
	iffalse .NoPower
	writetext BoreasCompoundShutterButtonAskText
	yesorno
	iffalse .Decline
	writetext BoreasCompoundShutterActivateButtonText
	waitbutton
	checkevent EVENT_BOREAS_COMPOUND_2F_DOOR_OPENED
	iftrue .AlreadyOpened
	closetext
	changeblock 6, 10, $07
	playsound SFX_ENTER_DOOR
	reloadmappart
	opentext
	writetext BoreasCompoundShutterOpenedText
	waitbutton
	setevent EVENT_BOREAS_COMPOUND_2F_DOOR_OPENED
.Decline:
	closetext
	end

.NoPower:
	writetext BoreasCompoundUnresponsiveButtonsText
	waitbutton
	closetext
	end

.AlreadyOpened:
	writetext BoreasCompoundShutterDoorAlreadyOpenedText
	waitbutton
	closetext
	end

BoreasCompound2FPokeDoll:
	itemball POKE_DOLL

BoreasCompound2FUltraBall:
	itemball ULTRA_BALL

BoreasCompound2FOldSeaMap:
	itemball OLD_SEA_MAP

BoreasCompound1FHiddenXDefend:
	hiddenitem X_DEFEND, EVENT_BOREAS_COMPOUND_HIDDEN_X_DEFEND

BoreasCompound1FHiddenXSpDef:
	hiddenitem X_SP_DEF, EVENT_BOREAS_COMPOUND_HIDDEN_X_SP_DEF

BoreasCompoundUnresponsiveButtonsText:
	text "The button to open"
	line "this shutter is"
	cont "not responding."

	para "The power must"
	line "need to be turned"
	cont "on first."
	done

BoreasCompoundShutterButtonAskText:
	text "The power has been"
	line "turned on."

	para "Press the button?"
	done

BoreasCompoundShutterActivateButtonText:
	text "<PLAYER> pressed"
	line "the button."
	done

BoreasCompoundShutterOpenedText:
	text "The shutter"
	line "opened."
	done

BoreasCompoundShutterDoorAlreadyOpenedText:
	text "Nothing happened…"
	done

BoreasCompound2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  8, BOREAS_COMPOUND_1F, 7
	warp_event 14,  6, BOREAS_COMPOUND_1F, 8
	warp_event 16, 13, BOREAS_COMPOUND_1F, 9
	warp_event 29,  6, BOREAS_COMPOUND_1F, 10
	
	db 0 ; coord events

	db 3 ; bg events
	bg_event 8, 11, BGEVENT_UP, BoreasCompound2FShutterButton
	bg_event  4, 15, BGEVENT_ITEM, BoreasCompound1FHiddenXDefend
	bg_event 20,  8, BGEVENT_ITEM, BoreasCompound1FHiddenXSpDef

	db 3 ; object events
	object_event 12,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoreasCompound2FPokeDoll, EVENT_BOREAS_COMPOUND_POKE_DOLL
	object_event 28, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoreasCompound2FUltraBall, EVENT_BOREAS_COMPOUND_ULTRA_BALL
	object_event 16, 10, SPRITE_PAPER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_ITEMBALL, 0, BoreasCompound2FOldSeaMap, EVENT_FOUND_OLD_SEA_MAP
