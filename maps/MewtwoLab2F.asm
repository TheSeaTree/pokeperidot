	const_def 2 ; object constants

MewtwoLab2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Doors

.Doors
	checkevent EVENT_MEWTWO_LAB_2F_DOOR_OPENED
	iffalse .NoChange
	changeblock 6, 10, $07
.NoChange
	return

MewtwoLab2FShutterButton:
	opentext
	checkflag ENGINE_FLASH
	iffalse .NoPower
	writetext MewtwoLabShutterButtonAskText
	yesorno
	iffalse .Decline
	writetext MewtwoLabShutterActivateButtonText
	waitbutton
	checkevent EVENT_MEWTWO_LAB_2F_DOOR_OPENED
	iftrue .AlreadyOpened
	closetext
	changeblock 6, 10, $07
	playsound SFX_ENTER_DOOR
	reloadmappart
	opentext
	writetext MewtwoLabShutterOpenedText
	waitbutton
	setevent EVENT_MEWTWO_LAB_2F_DOOR_OPENED
.Decline:
	closetext
	end

.NoPower:
	writetext MewtwoLabUnresponsiveButtonsText
	waitbutton
	closetext
	end

.AlreadyOpened:
	writetext MewtwoLabShutterDoorAlreadyOpenedText
	waitbutton
	closetext
	end

MewtwoLab2FPokeDoll:
	itemball POKE_DOLL

MewtwoLab2FUltraBall:
	itemball ULTRA_BALL

MewtwoLab1FHiddenXDefend:
	hiddenitem X_DEFEND, EVENT_MEWTWO_LAB_HIDDEN_X_DEFEND

MewtwoLab1FHiddenXSpDef:
	hiddenitem X_SP_DEF, EVENT_MEWTWO_LAB_HIDDEN_X_SP_DEF

MewtwoLabUnresponsiveButtonsText:
	text "The button to open"
	line "this shutter is"
	cont "not responding."

	para "The power must"
	line "need to be turned"
	cont "on first."
	done

MewtwoLabShutterButtonAskText:
	text "The power has been"
	line "turned on."

	para "Press the button?"
	done

MewtwoLabShutterActivateButtonText:
	text "<PLAYER> pressed"
	line "the button."
	done

MewtwoLabShutterOpenedText:
	text "The shutter"
	line "opened."
	done

MewtwoLabShutterDoorAlreadyOpenedText:
	text "Nothing happened…"
	done

MewtwoLab2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  8, MEWTWO_LAB_1F, 7
	warp_event 14,  6, MEWTWO_LAB_1F, 8
	warp_event 16, 13, MEWTWO_LAB_1F, 9
	warp_event 24,  8, MEWTWO_LAB_1F, 10
	
	db 0 ; coord events

	db 3 ; bg events
	bg_event 8, 11, BGEVENT_UP, MewtwoLab2FShutterButton
	bg_event  4, 15, BGEVENT_ITEM, MewtwoLab1FHiddenXDefend
	bg_event 25,  1, BGEVENT_ITEM, MewtwoLab1FHiddenXSpDef

	db 2 ; object events
	object_event 16, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MewtwoLab2FPokeDoll, EVENT_MEWTWO_LAB_POKE_DOLL
	object_event 25, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MewtwoLab2FUltraBall, EVENT_MEWTWO_LAB_ULTRA_BALL
