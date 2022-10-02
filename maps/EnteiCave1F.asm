	const_def 2 ; object constants
	const ENTEI_CAVE_1F_BOULDER1
	const ENTEI_CAVE_1F_BOULDER2
	const ENTEI_CAVE_1F_BOULDER3
	const ENTEI_CAVE_1F_BOULDER4
	const ENTEI_CAVE_1F_BOULDER5
	const ENTEI_CAVE_1F_BOULDER6

EnteiCave1F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .OpenDoors
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable

.OpenDoors:
	checkevent EVENT_ENTEI_CAVE_GATES_OPEN
	iffalse .end
	changeblock 12, 28, $cf
.end
	return

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return
	
.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 4, ENTEI_CAVE_1F_BOULDER1, .Boulder1
	stonetable 5, ENTEI_CAVE_1F_BOULDER3, .Boulder3
	stonetable 6, ENTEI_CAVE_1F_BOULDER2, .Boulder2
	stonetable 6, ENTEI_CAVE_1F_BOULDER5, .Boulder5
	stonetable 7, ENTEI_CAVE_1F_BOULDER4, .Boulder4
	db -1 ; end
	
.Boulder1:
	disappear ENTEI_CAVE_1F_BOULDER1
	setevent EVENT_ENTEI_CAVE_1F_BOULDER_1
	jump .Fall

.Boulder2:
	disappear ENTEI_CAVE_1F_BOULDER2
	setevent EVENT_ENTEI_CAVE_1F_BOULDER_2
	jump .Fall

.Boulder3:
	disappear ENTEI_CAVE_1F_BOULDER3
	setevent EVENT_ENTEI_CAVE_1F_BOULDER_3
	jump .Fall

.Boulder4:
	disappear ENTEI_CAVE_1F_BOULDER4
	setevent EVENT_ENTEI_CAVE_1F_BOULDER_4	
	jump .Fall

.Boulder5:
	disappear ENTEI_CAVE_1F_BOULDER5
	setevent EVENT_ENTEI_CAVE_1F_BOULDER_2
.Fall:
	pause 30
	scall .FX
	opentext
	writetext EnteiCave1FBoulderFellText
	waitbutton
	closetext
	end

.FX:
	playsound SFX_STRENGTH
	earthquake 80
	end

EnteiCave1FDoor:
	conditional_event EVENT_ENTEI_CAVE_GATES_OPEN, .Script

.Script
	opentext
	writetext EnteiCave1FDoorText
	waitbutton
	checkitem GUARDIAN_KEY
	iffalse .NoKey
	writetext EnteiCave1FAskUseKeyText
	yesorno
	iffalse .NoKey
	closetext
	takeitem GUARDIAN_KEY
	changeblock 12, 28, $cf
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	opentext
	writetext EnteiCave1FShrineKeyBrokeText
	waitbutton
	setevent EVENT_ENTEI_CAVE_GATES_OPEN
.NoKey
	closetext
	end

EnteiCave1FBoulder:
	jumpstd strengthboulder
	
EnteiCave1FHiddenXAccuracy:
	hiddenitem X_ACCURACY, EVENT_ENTEI_CAVE_1F_HIDDEN_X_ACCURACY
	
EnteiCave1FHiddenPPUp:
	hiddenitem PP_UP, EVENT_ENTEI_CAVE_1F_HIDDEN_PP_UP
	
EnteiCave1FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ENTEI_CAVE_1F_HIDDEN_ULTRA_BALL

EnteiCave1FHiddenNugget:
	hiddenitem NUGGET, EVENT_ENTEI_CAVE_1F_HIDDEN_NUGGET

EnteiCave1FDoorText:
	text "This door is"
	line "locked up tight."
	done

EnteiCave1FAskUseKeyText:
	text "Use the GUARDIAN"
	line "KEY?"
	done

EnteiCave1FPlayerUsedKeyText:
	text "<PLAYER> used the"
	line "GUARDIAN KEY."
	done

EnteiCave1FShrineKeyBrokeText:
	text "The door opened!"

	para "…But the KEY broke"
	line "off inside."
	done

EnteiCave1FBoulderFellText:
	text "The boulder fell"
	line "through!"
	done

EnteiCave1F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  8, 27, ENTEI_CAVE_B1F, 1
	warp_event 13, 33, MOLTEN_PEAK_B2F, 7
	warp_event 23, 15, ENTEI_CAVE_B1F, 3
	warp_event 21, 23, ENTEI_CAVE_B1F, 4 ; Pit
	warp_event 13, 13, ENTEI_CAVE_B1F, 5 ; Pit
	warp_event 23, 11, ENTEI_CAVE_B1F, 6 ; Item Pit
	warp_event  7, 19, ENTEI_CAVE_B1F, 7 ; Item Pit

	db 0 ; coord events

	db 6 ; bg events
	bg_event 12, 29, BGEVENT_IFNOTSET, EnteiCave1FDoor
	bg_event 13, 29, BGEVENT_IFNOTSET, EnteiCave1FDoor
	bg_event 22, 26, BGEVENT_ITEM, EnteiCave1FHiddenXAccuracy
	bg_event  7, 11, BGEVENT_ITEM, EnteiCave1FHiddenPPUp
	bg_event  8, 22, BGEVENT_ITEM, EnteiCave1FHiddenUltraBall
	bg_event 18, 13, BGEVENT_ITEM, EnteiCave1FHiddenNugget

	db 6 ; object events
	object_event 17, 22, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EnteiCave1FBoulder, EVENT_ENTEI_CAVE_1F_BOULDER_1
	object_event 23, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EnteiCave1FBoulder, EVENT_ENTEI_CAVE_1F_BOULDER_2
	object_event  8,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EnteiCave1FBoulder, EVENT_ENTEI_CAVE_1F_BOULDER_3
	object_event  5, 18, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EnteiCave1FBoulder, EVENT_ENTEI_CAVE_1F_BOULDER_4
	object_event 24, 15, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EnteiCave1FBoulder, EVENT_ENTEI_CAVE_1F_BOULDER_2
	object_event  3, 14, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EnteiCave1FBoulder, -1
